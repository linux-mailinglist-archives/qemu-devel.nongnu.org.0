Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871002F680C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:48:10 +0100 (CET)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06jB-0000S8-HV
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06au-00044a-Cy
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:39:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06ao-0003x9-FG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610645968;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ymt8LcB5dxZaIV7QsCpQWkZhvRI631gZgQVJk+mmFio=;
 b=DSiFqX8T/cITG4dYul3WRWS6uQKp+71dZyusvS5mURnAg46Xp2jAbx0IXF85quMSFHrEtg
 GmPPSv0SY/5MdimGrqe/A/koOBeifqcyfo+Uz6RgviKf6cThiIbjxtQ/CQsR1Mw6BrKcLS
 FL0dqe+xk4NXhDJ+iuSHDiVaZIEw5t0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-QXgAJabNPcy6yHmQOndQsw-1; Thu, 14 Jan 2021 12:39:26 -0500
X-MC-Unique: QXgAJabNPcy6yHmQOndQsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B801D107ACF8
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 17:39:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC955D734;
 Thu, 14 Jan 2021 17:39:21 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:39:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] vnc: move initialization to
 framebuffer_update_request
Message-ID: <20210114173918.GU1643043@redhat.com>
References: <20210112134120.2031837-1-kraxel@redhat.com>
 <20210112134120.2031837-3-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210112134120.2031837-3-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 02:41:19PM +0100, Gerd Hoffmann wrote:
> qemu sends various state info like current cursor shape to newly connected
> clients in response to a set_encoding message.  This is not correct according
> to the rfb spec.  Send that information in response to a full (incremental=0)
> framebuffer update request instead.  Also send the resize information
> unconditionally, not only in case of an actual server-side change.
> 
> This makes the qemu vnc server conform to the spec and allows clients to
> request the complete vnc server state without reconnect.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 84c4972b895b..8df63b349b38 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -660,10 +660,6 @@ static void vnc_desktop_resize(VncState *vs)
>      if (vs->ioc == NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE)) {
>          return;
>      }
> -    if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
> -        vs->client_height == pixman_image_get_height(vs->vd->server)) {
> -        return;
> -    }
>  
>      assert(pixman_image_get_width(vs->vd->server) < 65536 &&
>             pixman_image_get_width(vs->vd->server) >= 0);
> @@ -2013,6 +2009,10 @@ static void framebuffer_update_request(VncState *vs, int incremental,
>      } else {
>          vs->update = VNC_STATE_UPDATE_FORCE;
>          vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
> +        vnc_colordepth(vs);
> +        vnc_desktop_resize(vs);
> +        vnc_led_state_change(vs);
> +        vnc_cursor_define(vs);

If I'm nit-picking this still isn't spec compliant as it is sending
4 separate framebuffer update messages each with 1 rectangle, in
response to 1 single framebuffer update request.

The strictly spec compliant approach would be to put these on a queue
and send them as rectangles in the frame buffer update message that's
sending the framebuffer contents. IIUC, this is the approach tigervnc
uses.  This would require a major change in the way QEMU sends FB
update messages though.

In reality I doubt there are VNC clients that really care about this
distinction, and this change is still more spec compliant
that the current impl.

>      }
>  }
>  
> @@ -2136,10 +2136,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>              break;
>          }
>      }
> -    vnc_desktop_resize(vs);
>      check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
> -    vnc_led_state_change(vs);
> -    vnc_cursor_define(vs);
>  }
>  
>  static void set_pixel_conversion(VncState *vs)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


