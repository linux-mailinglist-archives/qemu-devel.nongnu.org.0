Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC392F68AE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:04:13 +0100 (CET)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06yi-0006hX-7H
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06VN-0007LZ-7d
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:33:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06VK-0001w2-2J
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610645629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjL9QPJqsjPv4eURqYtQQvS5J/F2+xNA0FWudFMDB9s=;
 b=H97K6aLA5PmDuSII4n2l34LhNF0sWrW09WjxWkP/RNaQAwPwbfFWu49FHVE+Aa3iY34N9d
 hQQYXmauxmlFTmQf7av/JQnfAFWeXbIb5MCXflisJb1Nuxr98aRhWZW7k+i/leMLqhcdtf
 cJ1Sy7hYe7kawXL8tYdPeOP0y5i77CU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-eQrkq_VAOPCMwLOJxlCkxQ-1; Thu, 14 Jan 2021 12:33:47 -0500
X-MC-Unique: eQrkq_VAOPCMwLOJxlCkxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B1181470B
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 17:33:46 +0000 (UTC)
Received: from redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 000166B54C;
 Thu, 14 Jan 2021 17:33:35 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:33:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 1/3] vnc: move check into vnc_cursor_define
Message-ID: <20210114173333.GT1643043@redhat.com>
References: <20210112134120.2031837-1-kraxel@redhat.com>
 <20210112134120.2031837-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210112134120.2031837-2-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 02:41:18PM +0100, Gerd Hoffmann wrote:
> Move the check whenever a cursor exists into the vnc_cursor_define()
> function so callers don't have to do it.
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 7452ac7df2ce..84c4972b895b 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -792,9 +792,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
>      QTAILQ_FOREACH(vs, &vd->clients, next) {
>          vnc_colordepth(vs);
>          vnc_desktop_resize(vs);
> -        if (vs->vd->cursor) {
> -            vnc_cursor_define(vs);
> -        }
> +        vnc_cursor_define(vs);
>          memset(vs->dirty, 0x00, sizeof(vs->dirty));
>          vnc_set_area_dirty(vs->dirty, vd, 0, 0,
>                             vnc_width(vd),
> @@ -928,6 +926,10 @@ static int vnc_cursor_define(VncState *vs)
>      QEMUCursor *c = vs->vd->cursor;
>      int isize;
>  
> +    if (!vs->vd->cursor) {
> +        return -1;
> +    }

None of the callers check the return value, so we could just
make this function void, as a future cleanup patch.

> +
>      if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {
>          vnc_lock_output(vs);
>          vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
> @@ -2137,9 +2139,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>      vnc_desktop_resize(vs);
>      check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
>      vnc_led_state_change(vs);
> -    if (vs->vd->cursor) {
> -        vnc_cursor_define(vs);
> -    }
> +    vnc_cursor_define(vs);
>  }
>  
>  static void set_pixel_conversion(VncState *vs)
> -- 
> 2.29.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


