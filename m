Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9DD46CFD8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 10:13:46 +0100 (CET)
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mut1F-0004Y8-CF
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 04:13:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1muszI-0003l7-3w
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1muszC-0005IZ-9o
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638954697;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TDztLCqzDHd+1E5B+PK8XGvcl5VOGWawySkzn/QRMVE=;
 b=NJZvYgX9lu9etX7JLmZoPi5h0AvOmD9TmSi4efDGvrPx5/bat7Y6E6bE5Gh/oulfqWDxVa
 ojl2g4Fm0FVLBehzr9+0Rb1aNTnFP/OGTw1DJc221hiiLgtZTPGvn3oEd4FfuCbmfhgcYc
 LZUOHYQ89gH+FzN4mVDwVPamLtn005g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-UqgurkWyNR6BJTYy6NbUgA-1; Wed, 08 Dec 2021 04:11:30 -0500
X-MC-Unique: UqgurkWyNR6BJTYy6NbUgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464102F24;
 Wed,  8 Dec 2021 09:11:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B956F5C22B;
 Wed,  8 Dec 2021 09:11:07 +0000 (UTC)
Date: Wed, 8 Dec 2021 09:11:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 2/2] ui/clipboard: Don't use g_autoptr just to free a
 variable
Message-ID: <YbB2qS8bpHlYccvP@redhat.com>
References: <20211207204038.664133-1-jsnow@redhat.com>
 <20211207204038.664133-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207204038.664133-3-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 07, 2021 at 03:40:38PM -0500, John Snow wrote:
> Clang doesn't recognize that the variable is being "used" and will emit
> a warning:
> 
>   ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>       g_autoptr(QemuClipboardInfo) old = NULL;
>                                  ^
>   1 error generated.
> 
> OK, fine. Just do things the old way.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  ui/clipboard.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/ui/clipboard.c b/ui/clipboard.c
> index d7b008d62a..9ab65efefb 100644
> --- a/ui/clipboard.c
> +++ b/ui/clipboard.c
> @@ -44,12 +44,11 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
>  
>  void qemu_clipboard_update(QemuClipboardInfo *info)
>  {
> -    g_autoptr(QemuClipboardInfo) old = NULL;
>      assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
>  
>      notifier_list_notify(&clipboard_notifiers, info);
>  
> -    old = cbinfo[info->selection];
> +    g_free(cbinfo[info->selection]);

This is a ref counted data type - it can't use g_free:

  https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg04890.html

>      cbinfo[info->selection] = qemu_clipboard_info_ref(info);
>  }

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


