Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436844FAF13
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 18:51:36 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndamk-0007Cp-52
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 12:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1ndakq-0005pG-1h; Sun, 10 Apr 2022 12:49:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1ndakn-000595-Ut; Sun, 10 Apr 2022 12:49:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id w4so19668519wrg.12;
 Sun, 10 Apr 2022 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=muAnIhR7eb0RH2qr2mDsl/dYVinFkUmyqTfAz05NBAU=;
 b=JGNagORU/gcbVO4pGuatqzAKtzStCOw+a+9eDhScXmsCwrWxcvKM8HmW6kwBdihdnX
 H9S3RHgXd75NOn/Rm70VP2S/IVTLWJMZjih/9EQH0IYL9A4df6pYFwbegJTbPNJTodVd
 VGkao30xWWMyOFRauzSwdx478LvGeVzFyZsSGh48dbLVZbH1CthciTlVCyBV4EY1AI5e
 LIBMwpXrx98Qt8PLKxmazzQNR0vNXkU57NMc7biGC3+HkTna6INAMhzGL49BUT6BNZRv
 Z3cy7Fhblb/UygLnmM+VaZUpfQ6+g44YpZATpOv9ON9uNtuX6Lu3mWQRlLBZAURFzwMQ
 i7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=muAnIhR7eb0RH2qr2mDsl/dYVinFkUmyqTfAz05NBAU=;
 b=0M7BmteTutCe/K1Xsjq8/PQAt2uegBDmPtiuim5Gi6Ouno0qJIbFrohVGrgGZcWcgZ
 yxtxi/ARMFvqsFksmaLX97exVN907YWz+X6wfXgBbMThD+l0chNp1ZCedRpTvVei/vaN
 bIdZHlBppBpLB0JDWXr2r/7MNm70sNhhTjKpSjWXPHTFKGm1YdKKbm8ewS7Fy5aMaa0n
 oRNharQ+XlABq+1UCmhRy7P05YFAw2kgzG0XwHAtBAgsmAbWtyTK540Cw20sC5YkpFWE
 bJi3/YqL299mpbyggyc8YfQpEBblybN5KkLjvXG7KgBJ2Qzpnt86CbZ+VOji+9zAz8pb
 hclg==
X-Gm-Message-State: AOAM533S8AMcOUvXdlSoFz8LROikKq++Iy11zz2MDFC531kABQybOjMF
 F4YBk5VfPJwx+0fhusmecL7KjCno6+Y=
X-Google-Smtp-Source: ABdhPJwDfS1pR4tHbwMcnhMm5c+FFoktr2FUai/5Mm4bAtsLRIVWRiQEvnQd/CJYnxD/eb0VTOSqyg==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr21296663wrp.299.1649609371724; 
 Sun, 10 Apr 2022 09:49:31 -0700 (PDT)
Received: from smtpclient.apple (201.11.75.194.dyn.plus.net. [194.75.11.201])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a5d6788000000b002060f55843csm18218409wru.19.2022.04.10.09.49.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Apr 2022 09:49:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v3 2/2] hw/display/vmware_vga: do not discard screen
 updates
From: Carwyn Ellis <carwynellis@gmail.com>
In-Reply-To: <20220206183956.10694-3-carwynellis@gmail.com>
Date: Sun, 10 Apr 2022 17:49:30 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CBB155B-88D6-42EC-9EA0-88968C3FD3B7@gmail.com>
References: <20220206183956.10694-1-carwynellis@gmail.com>
 <20220206183956.10694-3-carwynellis@gmail.com>
To: QEMU <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

=
https://patchew.org/QEMU/20220206183956.10694-1-carwynellis@gmail.com/2022=
0206183956.10694-3-carwynellis@gmail.com/

Originally submitted as one of two patches, the first patch to use trace =
events has been merged, however the patch that fixes garbled output =
hasn=E2=80=99t been reviewed yet.

Do let me know if you think there=E2=80=99s anything else that needs =
changing here and I=E2=80=99ll resubmit if so. FWIW I=E2=80=99ve been =
using this fix for a couple of months now without any issues.

Thanks
Carwyn

> On 6 Feb 2022, at 18:39, Carwyn Ellis <carwynellis@gmail.com> wrote:
>=20
> In certain circumstances, typically when there is lots changing on the
> screen, updates will be discarded resulting in garbled output.
>=20
> This change simplifies the traversal of the display update FIFO queue
> when applying updates. We just track the queue length and iterate up =
to
> the end of the queue.
>=20
> Additionally when adding updates to the queue, if the buffer reaches
> capacity we force a flush before accepting further events.
>=20
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> ---
> hw/display/trace-events |  1 +
> hw/display/vmware_vga.c | 41 +++++++++++++++++++++++------------------
> 2 files changed, 24 insertions(+), 18 deletions(-)
>=20
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index 91efc88f04..0c0ffcbe42 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -24,6 +24,7 @@ vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) =
"%dx%d @ %d bpp"
> vmware_verify_rect_less_than_zero(const char *name, const char *param, =
int x) "%s: %s was < 0 (%d)"
> vmware_verify_rect_greater_than_bound(const char *name, const char =
*param, int bound, int x) "%s: %s was > %d (%d)"
> vmware_verify_rect_surface_bound_exceeded(const char *name, const char =
*component, int bound, const char *param1, int value1, const char =
*param2, int value2) "%s: %s > %d (%s: %d, %s: %d)"
> +vmware_update_rect_delayed_flush(void) "display update FIFO full - =
forcing flush"
>=20
> # virtio-gpu-base.c
> virtio_gpu_features(bool virgl) "virgl %d"
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index 0cc43a1f15..8a3c3cb8f0 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -80,7 +80,7 @@ struct vmsvga_state_s {
>     struct vmsvga_rect_s {
>         int x, y, w, h;
>     } redraw_fifo[REDRAW_FIFO_LEN];
> -    int redraw_fifo_first, redraw_fifo_last;
> +    int redraw_fifo_last;
> };
>=20
> #define TYPE_VMWARE_SVGA "vmware-svga"
> @@ -380,33 +380,39 @@ static inline void vmsvga_update_rect(struct =
vmsvga_state_s *s,
>     dpy_gfx_update(s->vga.con, x, y, w, h);
> }
>=20
> -static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s =
*s,
> -                int x, int y, int w, int h)
> -{
> -    struct vmsvga_rect_s *rect =3D =
&s->redraw_fifo[s->redraw_fifo_last++];
> -
> -    s->redraw_fifo_last &=3D REDRAW_FIFO_LEN - 1;
> -    rect->x =3D x;
> -    rect->y =3D y;
> -    rect->w =3D w;
> -    rect->h =3D h;
> -}
> -
> static inline void vmsvga_update_rect_flush(struct vmsvga_state_s *s)
> {
>     struct vmsvga_rect_s *rect;
>=20
>     if (s->invalidated) {
> -        s->redraw_fifo_first =3D s->redraw_fifo_last;
> +        s->redraw_fifo_last =3D 0;
>         return;
>     }
>     /* Overlapping region updates can be optimised out here - if =
someone
>      * knows a smart algorithm to do that, please share.  */
> -    while (s->redraw_fifo_first !=3D s->redraw_fifo_last) {
> -        rect =3D &s->redraw_fifo[s->redraw_fifo_first++];
> -        s->redraw_fifo_first &=3D REDRAW_FIFO_LEN - 1;
> +    for (int i =3D 0; i < s->redraw_fifo_last; i++) {
> +        rect =3D &s->redraw_fifo[i];
>         vmsvga_update_rect(s, rect->x, rect->y, rect->w, rect->h);
>     }
> +
> +    s->redraw_fifo_last =3D 0;
> +}
> +
> +static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s =
*s,
> +                int x, int y, int w, int h)
> +{
> +
> +    if (s->redraw_fifo_last >=3D REDRAW_FIFO_LEN) {
> +        trace_vmware_update_rect_delayed_flush();
> +        vmsvga_update_rect_flush(s);
> +    }
> +
> +    struct vmsvga_rect_s *rect =3D =
&s->redraw_fifo[s->redraw_fifo_last++];
> +
> +    rect->x =3D x;
> +    rect->y =3D y;
> +    rect->w =3D w;
> +    rect->h =3D h;
> }
>=20
> #ifdef HW_RECT_ACCEL
> @@ -1159,7 +1165,6 @@ static void vmsvga_reset(DeviceState *dev)
>     s->config =3D 0;
>     s->svgaid =3D SVGA_ID;
>     s->cursor.on =3D 0;
> -    s->redraw_fifo_first =3D 0;
>     s->redraw_fifo_last =3D 0;
>     s->syncing =3D 0;
>=20
> --=20
> 2.35.1
>=20


