Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E70589A02
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 11:41:04 +0200 (CEST)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJXLj-0004bn-Ba
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 05:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJXJ4-0002xu-J5
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 05:38:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJXJ2-000762-5j
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 05:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659605894;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+5VwKtFwBaOEJwy2YT2qwDyoMWGTeTLCoKFeji6gis=;
 b=fuEopeJ7GrzDI/zol7VrDWPm6hWNtAW3qkAYmB7K5KDsCQeulc8rWB4hUED9LWI1+raAmA
 sVe7uoO0Wg7IAei/ApzZVFS6RAE97EChNGByuPX13DT2mm/6Qfc9IleMsJ+OvQJfwNUqKZ
 HvU0DxdSycDopfPNqjDbiQurgvaMDt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-n9_KyUOIPwax6j2PmNHe6A-1; Thu, 04 Aug 2022 05:38:11 -0400
X-MC-Unique: n9_KyUOIPwax6j2PmNHe6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C054C801755
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 09:38:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC0040C124A;
 Thu,  4 Aug 2022 09:38:09 +0000 (UTC)
Date: Thu, 4 Aug 2022 10:38:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Add support for MSG_ZEROCOPY +
 IPV6
Message-ID: <YuuTf+0DQpQO0ad4@redhat.com>
References: <20220804071041.540073-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804071041.540073-1-leobras@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 04:10:43AM -0300, Leonardo Bras wrote:
> For using MSG_ZEROCOPY, there are two steps:
> 1 - io_writev() the packet, which enqueues the packet for sending, and
> 2 - io_flush(), which gets confirmation that all packets got correctly sent
> 
> Currently, if MSG_ZEROCOPY is used to send packets over IPV6, no error will
> be reported in (1), but it will fail in the first time (2) happens.
> 
> This happens because (2) currently checks for cmsg_level & cmsg_type
> associated with IPV4 only, before reporting any error.
> 
> Add checks for cmsg_level & cmsg_type associated with IPV6, and thus enable
> support for MSG_ZEROCOPY + IPV6

Oh, subtle.

> 
> Fixes: 2bc58ffc29 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  io/channel-socket.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


