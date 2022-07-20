Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953557B1A1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:22:03 +0200 (CEST)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE41y-00051s-5j
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oE3tY-0006zM-63
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:13:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oE3tU-0008NH-Kf
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:13:19 -0400
Received: by mail-ej1-x632.google.com with SMTP id bp15so31454863ejb.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1FPWQmUk4Ed9gQ0Jb0N5c/DY0C5lQLYEUAkpuF0cy28=;
 b=RYa4kkA3lKsjOoODl304uMqr9CnKAdIFvAOlREQiavUf36bMGTnSq7YfENd93hRH2F
 DNRRendHp8zgxHvVwv/CwqP/e10NafenAn7Ar/iB6vGs8F7gfwBCnFbhImcQJ9q9kCgM
 WPmwjoMZFInFzudtMmOlt7PR6e1EbJUQ/LRRMTqz3TXM30+FsAcpmde7odMQASNQQ8Hz
 CZ/kJ8BfJdNHZsfGMLlQaONLBK7NsAM5j+F3w1BUZe39qxOoPIVazLM5Ew4KWIbbZnUo
 vcBSSkZgPq+m2yTLztyFZoU/8T1GCgrMWQTd10g3CqB9WLnrKz7EWVxeb9PAHIgkfVDe
 cCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1FPWQmUk4Ed9gQ0Jb0N5c/DY0C5lQLYEUAkpuF0cy28=;
 b=FJkqwhIKeIFczQSOUX/a9cpe4qblwUkeZuhlZDoyp8kV8woT5S2GAV3+zSF57CSCCb
 H/SboqJ/Aoom+TOMqOZAt44426SJChpBhkHL8HAdfXwr1rUnvdkuCMTU+C8AwZQZM4zW
 K6MDPonfP8O3eretx+L84lTSUcdqjOEGHXWnCFeeEGWZL728vFeKB3j1i0ac/Qp1yRcE
 S/SEObOgHquJjHtl2rrdH1Buy0o1eF5jAdmjAK91bMe3C4ovDFBa+KqNYduRbwxrz+Bu
 O8467rtvLNCgyfDCX/fzJt8pzRcUVC0RoHyQAc/PE0+zfGwCVD6RVItA7rcsIkiCHoc4
 fV8w==
X-Gm-Message-State: AJIora8zGWXfzB2eTex0o77U0IMKPY2kHrO9hr3TDk+20n8iSMyVd1sr
 5V+/o9vhJLQ2SxLBJjaD4Qf/N0IONgVy79Mb2tI=
X-Google-Smtp-Source: AGRyM1u75etqyvK7T/UR3yF+/0SiOo9QC1y55ZQkmTrlDTJZce/Qn/5Su6RlMc8TOPACMKKjbpcDPqkRqObWn2HRf98=
X-Received: by 2002:a17:907:7396:b0:72d:a080:86a9 with SMTP id
 er22-20020a170907739600b0072da08086a9mr31798382ejc.49.1658301194355; Wed, 20
 Jul 2022 00:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220719122334.136290-1-Jason@zx2c4.com>
In-Reply-To: <20220719122334.136290-1-Jason@zx2c4.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 20 Jul 2022 09:13:03 +0200
Message-ID: <CAJy5ezq7_F6uDrY6RuXe5ru0mAbmx-pBTQoFCtZj4DhEM7EZpw@mail.gmail.com>
Subject: Re: [PATCH] hw/microblaze: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009ec75905e437552e"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009ec75905e437552e
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 2:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This FDT node is part of the DT specification.
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/microblaze/boot.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 8b92a9801a..25ad54754e 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -30,6 +30,7 @@
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> +#include "qemu/guest-random.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/reset.h"
>  #include "hw/boards.h"
> @@ -75,6 +76,7 @@ static int microblaze_load_dtb(hwaddr addr,
>      int fdt_size;
>      void *fdt = NULL;
>      int r;
> +    uint8_t rng_seed[32];
>
>      if (dtb_filename) {
>          fdt = load_device_tree(dtb_filename, &fdt_size);
> @@ -83,6 +85,9 @@ static int microblaze_load_dtb(hwaddr addr,
>          return 0;
>      }
>
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed,
> sizeof(rng_seed));
> +
>      if (kernel_cmdline) {
>          r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>                                      kernel_cmdline);
> --
> 2.35.1
>
>

--0000000000009ec75905e437552e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 19, 2022 at 2:23 PM Jason A. =
Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If the FDT =
contains /chosen/rng-seed, then the Linux RNG will use it to<br>
initialize early. Set this using the usual guest random number<br>
generation function. This FDT node is part of the DT specification.<br></bl=
ockquote><div><br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"=
mailto:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;<br></div><div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Cc: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gmail.com" targe=
t=3D"_blank">edgar.iglesias@gmail.com</a>&gt;<br>
Signed-off-by: Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" ta=
rget=3D"_blank">Jason@zx2c4.com</a>&gt;<br>
---<br>
=C2=A0hw/microblaze/boot.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c<br>
index 8b92a9801a..25ad54754e 100644<br>
--- a/hw/microblaze/boot.c<br>
+++ b/hw/microblaze/boot.c<br>
@@ -30,6 +30,7 @@<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qemu/guest-random.h&quot;<br>
=C2=A0#include &quot;sysemu/device_tree.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
@@ -75,6 +76,7 @@ static int microblaze_load_dtb(hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0int fdt_size;<br>
=C2=A0 =C2=A0 =C2=A0void *fdt =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
+=C2=A0 =C2=A0 uint8_t rng_seed[32];<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (dtb_filename) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt =3D load_device_tree(dtb_filename, &a=
mp;fdt_size);<br>
@@ -83,6 +85,9 @@ static int microblaze_load_dtb(hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));<br>
+=C2=A0 =C2=A0 qemu_fdt_setprop(fdt, &quot;/chosen&quot;, &quot;rng-seed&qu=
ot;, rng_seed, sizeof(rng_seed));<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (kernel_cmdline) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D qemu_fdt_setprop_string(fdt, &quot;=
/chosen&quot;, &quot;bootargs&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_cmdline);=
<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div></div>

--0000000000009ec75905e437552e--

