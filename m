Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A84B4FBD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:11:47 +0100 (CET)
Received: from localhost ([::1]:34052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaCn-0006by-Uq
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJa4S-0006xG-1t
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJa4I-0006Iw-4p
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644840177;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgqz1hoSDJpGnrmmnjqz6dgh4sZ7ORGLnMsr3ngpq8I=;
 b=MEi73QciQOwLHhnIOP17hPhkmf5k2dRwQTQjQOUkgTbHI8UilZ4WKSBoRosQPVUWelQC7T
 Z39x06jhzCHnJY03WTrhBfLeo0S2qrS/0XXM0BL0ER53UBoJcSHLYoe9zSlhZfu6MaGS36
 Fk0DyFQWrJ7OQ1gdFZad5dDU/EGDycE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-F9zb8QX5OHKUMJtMNLcWVA-1; Mon, 14 Feb 2022 07:02:51 -0500
X-MC-Unique: F9zb8QX5OHKUMJtMNLcWVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE03C801B0F
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 12:02:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3E070D24;
 Mon, 14 Feb 2022 12:02:07 +0000 (UTC)
Date: Mon, 14 Feb 2022 12:02:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] ui/clipboard: fix use-after-free regression
Message-ID: <YgpEvZW1dkbivQL2@redhat.com>
References: <20220214115917.1679568-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220214115917.1679568-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 03:59:17PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The same info may be used to update the clipboard, and may be freed
> before being ref'ed again.

Ewww, subtle.

> Fixes: 70a54b01693ed ("ui: avoid compiler warnings from unused clipboard info variable")
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/clipboard.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/clipboard.c b/ui/clipboard.c
> index 5f15cf853d07..9079ef829b51 100644
> --- a/ui/clipboard.c
> +++ b/ui/clipboard.c
> @@ -66,8 +66,10 @@ void qemu_clipboard_update(QemuClipboardInfo *info)
>  
>      notifier_list_notify(&clipboard_notifiers, &notify);
>  
> -    qemu_clipboard_info_unref(cbinfo[info->selection]);
> -    cbinfo[info->selection] = qemu_clipboard_info_ref(info);
> +    if (cbinfo[info->selection] != info) {
> +        qemu_clipboard_info_unref(cbinfo[info->selection]);
> +        cbinfo[info->selection] = qemu_clipboard_info_ref(info);
> +    }
>  }

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


