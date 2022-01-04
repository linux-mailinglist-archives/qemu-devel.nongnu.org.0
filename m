Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E448428C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:33:16 +0100 (CET)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jwA-0000Zs-Ud
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jtr-0007Xr-DJ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:30:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jto-0003bI-Ls
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641303047;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kr+B8846ZW7RqRJ4lgX1YcArwMdk2SzqSHBhI4L7+4U=;
 b=cFcGbhDF+sIVTCtgQQvs/yr8vskqMmPegeeYNWDshbATJcCBAC35R6pv69fTYszcdxd2AW
 AxAtAEBT8ictzZmT+Y2tGuC1Eop6y+OdlWkOKvPBi4AmtshULjnRJyF0YtGkvFBPZ+jcw6
 l96ShdP0F5BjxM6DWK6RiGVMKEsxMJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-6m_-9G7TOPe1MaCNbUDKXw-1; Tue, 04 Jan 2022 08:30:41 -0500
X-MC-Unique: 6m_-9G7TOPe1MaCNbUDKXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 300D794DC7;
 Tue,  4 Jan 2022 13:30:40 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CD957E2FF;
 Tue,  4 Jan 2022 13:30:39 +0000 (UTC)
Date: Tue, 4 Jan 2022 13:30:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dmitry Petrov <dpetroff@gmail.com>
Subject: Re: [PATCH v2 1/5] ps2: Initial horizontal scroll support
Message-ID: <YdRL/ElWwJURqkQC@redhat.com>
References: <20211222010647.1332479-1-dpetroff@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211222010647.1332479-1-dpetroff@gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 02:06:43AM +0100, Dmitry Petrov wrote:
> v2:
>   - Patch is split into a sequence
>   - value is clamped to 31 for horizontal scroll
> 
> This patch introduces horizontal scroll support for the ps/2
> mouse.
> 
> The patch is based on the previous work
> by Brad Jorsch done in 2010
> but never merge, see
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=579968

The bugs attached to that ticket don't have any Signed-off-by
from Brad. Fortunately at the time he did re-submit them on
qemu-devel with Signed-off-by present.

Can you include this link to his patches in your commit
message to get the paper trail

  https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg00223.html

> This change adds support for horizontal scroll to ps/2 mouse device
> code. The code is implemented to match the logic of linux kernel
> which is used as a reference.
> 
> Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
> ---
>  hw/input/ps2.c | 57 +++++++++++++++++++++++++++++++++++++++++++-------
>  qapi/ui.json   |  2 +-
>  2 files changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 9376a8f4ce..6236711e1b 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -123,6 +123,7 @@ typedef struct {
>      int mouse_dx; /* current values, needed for 'poll' mode */
>      int mouse_dy;
>      int mouse_dz;
> +    int mouse_dw;
>      uint8_t mouse_buttons;
>  } PS2MouseState;
>  
> @@ -715,7 +716,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>      /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */
>      const int needed = s->mouse_type ? 4 : 3;
>      unsigned int b;
> -    int dx1, dy1, dz1;
> +    int dx1, dy1, dz1, dw1;
>  
>      if (PS2_QUEUE_SIZE - s->common.queue.count < needed) {
>          return 0;
> @@ -724,6 +725,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>      dx1 = s->mouse_dx;
>      dy1 = s->mouse_dy;
>      dz1 = s->mouse_dz;
> +    dw1 = s->mouse_dw;
>      /* XXX: increase range to 8 bits ? */
>      if (dx1 > 127)
>          dx1 = 127;
> @@ -740,6 +742,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>      /* extra byte for IMPS/2 or IMEX */
>      switch(s->mouse_type) {
>      default:
> +        /* Just ignore the wheels if not supported */
> +        s->mouse_dz = 0;
> +        s->mouse_dw = 0;
>          break;
>      case 3:
>          if (dz1 > 127)
> @@ -747,13 +752,41 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>          else if (dz1 < -127)
>                  dz1 = -127;
>          ps2_queue_noirq(&s->common, dz1 & 0xff);
> +        s->mouse_dz -= dz1;
> +        s->mouse_dw = 0;
>          break;
>      case 4:
> -        if (dz1 > 7)
> -            dz1 = 7;
> -        else if (dz1 < -7)
> -            dz1 = -7;
> -        b = (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
> +        /*
> +         * This matches what the Linux kernel expects for exps/2 in
> +         * drivers/input/mouse/psmouse-base.c. Note, if you happen to
> +         * press/release the 4th or 5th buttons at the same moment as a
> +         * horizontal wheel scroll, those button presses will get lost. I'm not
> +         * sure what to do about that, since by this point we don't know
> +         * whether those buttons actually changed state.
> +         */
> +        if (dw1 != 0) {
> +            if (dw1 > 31) {
> +                dw1 = 31;
> +            } else if (dw1 < -31) {
> +                dw1 = -31;
> +            }
> +
> +            /*
> +             * linux kernel expects first 6 bits to represent the value
> +             * for horizontal scroll
> +             */
> +            b = (dw1 & 0x3f) | 0x40;
> +            s->mouse_dw -= dw1;
> +        } else {
> +            if (dz1 > 7) {
> +                dz1 = 7;
> +            } else if (dz1 < -7) {
> +                dz1 = -7;
> +            }
> +
> +            b = (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
> +            s->mouse_dz -= dz1;
> +        }
>          ps2_queue_noirq(&s->common, b);
>          break;
>      }
> @@ -764,7 +797,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
>      /* update deltas */
>      s->mouse_dx -= dx1;
>      s->mouse_dy -= dy1;
> -    s->mouse_dz -= dz1;
>  
>      return 1;
>  }
> @@ -806,6 +838,12 @@ static void ps2_mouse_event(DeviceState *dev, QemuConsole *src,
>              } else if (btn->button == INPUT_BUTTON_WHEEL_DOWN) {
>                  s->mouse_dz++;
>              }
> +
> +            if (btn->button == INPUT_BUTTON_WHEEL_RIGHT) {
> +                s->mouse_dw--;
> +            } else if (btn->button == INPUT_BUTTON_WHEEL_LEFT) {
> +                s->mouse_dw++;
> +            }
>          } else {
>              s->mouse_buttons &= ~bmap[btn->button];
>          }
> @@ -833,8 +871,10 @@ static void ps2_mouse_sync(DeviceState *dev)
>          /* if not remote, send event. Multiple events are sent if
>             too big deltas */
>          while (ps2_mouse_send_packet(s)) {
> -            if (s->mouse_dx == 0 && s->mouse_dy == 0 && s->mouse_dz == 0)
> +            if (s->mouse_dx == 0 && s->mouse_dy == 0
> +                    && s->mouse_dz == 0 && s->mouse_dw == 0) {
>                  break;
> +            }
>          }
>      }
>  }
> @@ -1036,6 +1076,7 @@ static void ps2_mouse_reset(void *opaque)
>      s->mouse_dx = 0;
>      s->mouse_dy = 0;
>      s->mouse_dz = 0;
> +    s->mouse_dw = 0;
>      s->mouse_buttons = 0;
>  }
>  
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d7567ac866..9dac1bf548 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -905,7 +905,7 @@
>  ##
>  { 'enum'  : 'InputButton',
>    'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'side',
> -  'extra' ] }
> +  'extra', 'wheel-left', 'wheel-right' ] }
>  
>  ##
>  # @InputAxis:
> -- 
> 2.32.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


