Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6186548D87E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 14:08:48 +0100 (CET)
Received: from localhost ([::1]:59892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7zqR-000454-12
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 08:08:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7zo6-00032I-Qc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:06:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7znx-0000W8-Nw
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642079169;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BB1QsW8N1aRrJw6oW3GtDgTpl0L4bEgVQ9TGv+jw55I=;
 b=b2JlIDIPCSYdSOBh71L4S3/Mr2nociHXDV4wLIPfsiQdF1Bhk2DVeGMGR6pF1ce1FXBCH2
 QGkKXAZjy8asaQzsKD0KpwO2pJppY8u1N8TqwwNXdNU0CkVWSs5yFrnWf6/1Y/HVMgbC04
 92uqJkyZ1NFwekvBeR9EPb8IYyTvtoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-f3MM26HzPSKNLD0ZVo3yhQ-1; Thu, 13 Jan 2022 08:06:03 -0500
X-MC-Unique: f3MM26HzPSKNLD0ZVo3yhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4C26100D684
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 13:06:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09BA8105C728;
 Thu, 13 Jan 2022 13:05:50 +0000 (UTC)
Date: Thu, 13 Jan 2022 13:05:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YeAjrIrdZfgh6m1B@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-3-leobras@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> For CONFIG_LINUX, implement the new zero copy flag and the optional callback
> io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
> 
> qio_channel_socket_flush() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error occurs.
> 
> Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to call qio_channel_flush() before freeing
> or re-using the buffer.
> 
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may require
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zero_copy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zero copy as a feature, it
> requires a mechanism to disable it, so it can still be accessible to less
> privileged users.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel-socket.h |   2 +
>  io/channel-socket.c         | 107 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 105 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


