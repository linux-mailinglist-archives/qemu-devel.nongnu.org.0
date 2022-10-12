Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804015FC848
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:20:06 +0200 (CEST)
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidWf-0002BU-Jz
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oidRK-0006LN-PM
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oidRH-00057j-JJ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665587670;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iB4fIr4Hha9Yb2jjbQbyTUos1MjZzwPEMqOC+1rJRdY=;
 b=eB/T4QnVwC4glNGpL93RUgTzWAq7a7AREDRQLSM7JmsJdbc+cWM4lfB7GzWlwkrDaRrRPI
 PNH4klnj9vhgF1PbahajuqyODSvoRChtHSyoSVzL/UWGGFEdMK0t5OtF78t1WncnCj6u8W
 XcquUYrdNBXek1GyaHbnMsES+YX9a2w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-wJ3nxfYyPvGqrPxSyn21fA-1; Wed, 12 Oct 2022 11:14:29 -0400
X-MC-Unique: wJ3nxfYyPvGqrPxSyn21fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 646073806659
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 15:14:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE0134EA52;
 Wed, 12 Oct 2022 15:14:28 +0000 (UTC)
Date: Wed, 12 Oct 2022 16:14:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/6] util: make do_send_recv work with partial send/recv
Message-ID: <Y0bZ0jrnWlfAaA2r@redhat.com>
References: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
 <20221006113657.2656108-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006113657.2656108-3-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 03:36:53PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> According to msdn documentation and Linux man pages, send() should try
> to send as much as possible in blocking mode, while recv() may return
> earlier with a smaller available amount, we should try to continue
> send/recv from there.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  util/iov.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


