Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4FA5E916E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 09:28:52 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocM4J-0007QP-2z
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 03:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ocM1a-0005Xc-I3
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 03:26:05 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ocM1Y-0005U5-31
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 03:26:01 -0400
Received: by mail-lj1-x22e.google.com with SMTP id b6so4274892ljr.10
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tiVGlEo2mcl8WlmJO8Bw7MMerdraNVJjp+9GMsm6Www=;
 b=l0TuLgPINf9jYbwDUuGGFwJeFZlQX7LriuTT+3EuBIgp/XNYQCHLNFT1NhoBVMxo4b
 1spg3qUuXo1HwAdXKNTvviyb1Ueslm9Hvhbq/t+1I4DpuHwydfzhri/6a7RfmQnZNopA
 43vck6XDI4G8Zchh9ff1juR4qqsodzNnoOrLbajIPfiV4H9J3ZTggffoYj5qXospDtUq
 /Z/pP8D9iEDt54XuV7uCmf14Gtu7LX5YIemUwQrk/6gXGE3A89pR0GPDmUH2utZqGF63
 so0zpy8TLlSEl8GnTZJnNwWJNqo54/JQkk8uzNIrgBY/51A09wVuLWp1F1DbC14L7kjA
 w2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tiVGlEo2mcl8WlmJO8Bw7MMerdraNVJjp+9GMsm6Www=;
 b=Ka7OtmUvzsEOEFnGHfgXndR2QowX/mZ6ckHDQQ0y2EuxFKN1M45ToViGltGcR2mVVk
 wRQHO9Z3NoPgXst5ehsc5Krm/WGGf+rDVShck/iK86ZhiXcEflCyuZR/YrqtB0yRc490
 N8z5ajrnXJF9sDhPZMiCAWysGSOQnPix48OkoziyL1mEJ/vETVPO9oWYm78Lzdgs7NKl
 cxYKz/1GakYmsoHyOH4kRME4CCAOJjO7eqgSp1t+4JHLEhWb62tJzYD6KVVkxRLD5lGD
 UAfd/VgSHjTpV3nxanbJ5hSaznU2qufhNbZNCbD2nz4ygyDVzRGKEtFSkjZhNCFmYVha
 rQNw==
X-Gm-Message-State: ACrzQf2QOrDKprXvxz2H+YU5cnx+R2NNsl4RyMdZszxjtJnufYkEkY8E
 gbZ7IjYJolaBuTLu87n9zX2yZVYTWTcICg==
X-Google-Smtp-Source: AMsMyM5qY93sgluFskaWRHT+GygUGU+3rM6hQmxdlyntMcXiV0Kc79N2tgPYRJwnH7yb71ACTP+2PA==
X-Received: by 2002:a05:651c:1241:b0:261:9313:9cb9 with SMTP id
 h1-20020a05651c124100b0026193139cb9mr5556445ljh.213.1664090757680; 
 Sun, 25 Sep 2022 00:25:57 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 o12-20020a056512052c00b0049f530939aasm2128303lfc.126.2022.09.25.00.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 00:25:57 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id i26so6340134lfp.11;
 Sun, 25 Sep 2022 00:25:56 -0700 (PDT)
X-Received: by 2002:a05:6512:2211:b0:496:7767:28b with SMTP id
 h17-20020a056512221100b004967767028bmr6903148lfu.433.1664090756165; Sun, 25
 Sep 2022 00:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
In-Reply-To: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 25 Sep 2022 15:25:44 +0800
X-Gmail-Original-Message-ID: <CANzO1D3Mif9Q7aZG_hZnJZEdr8pPQyfs43xckQ4A0Ggn=jTySA@mail.gmail.com>
Message-ID: <CANzO1D3Mif9Q7aZG_hZnJZEdr8pPQyfs43xckQ4A0Ggn=jTySA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: rvv-1.0: Simplify vfwredsum code
To: Yang Liu <liuyang22@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com, liweiwei@iscas.ac.cn
Content-Type: multipart/alternative; boundary="00000000000065372505e97b5221"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065372505e97b5221
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Wed, Aug 17, 2022 at 11:32 PM Yang Liu <liuyang22@iscas.ac.cn> wrote:

> Remove duplicate code by wrapping vfwredsum_vs's OP function.
>
> Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
> ---
>  target/riscv/vector_helper.c | 56 +++++++-----------------------------
>  1 file changed, 10 insertions(+), 46 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a96fc49c71..fd83c0b20b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4655,58 +4655,22 @@ GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t,
> H2, H2, float16_minimum_number)
>  GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4,
> float32_minimum_number)
>  GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8,
> float64_minimum_number)
>
> -/* Vector Widening Floating-Point Reduction Instructions */
> -/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> -void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
> -                            void *vs2, CPURISCVState *env, uint32_t desc)
> +/* Vector Widening Floating-Point Add Instructions */
> +static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)
>  {
> -    uint32_t vm = vext_vm(desc);
> -    uint32_t vl = env->vl;
> -    uint32_t esz = sizeof(uint32_t);
> -    uint32_t vlenb = simd_maxsz(desc);
> -    uint32_t vta = vext_vta(desc);
> -    uint32_t i;
> -    uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
> -
> -    for (i = env->vstart; i < vl; i++) {
> -        uint16_t s2 = *((uint16_t *)vs2 + H2(i));
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -        s1 = float32_add(s1, float16_to_float32(s2, true,
> &env->fp_status),
> -                         &env->fp_status);
> -    }
> -    *((uint32_t *)vd + H4(0)) = s1;
> -    env->vstart = 0;
> -    /* set tail elements to 1s */
> -    vext_set_elems_1s(vd, vta, esz, vlenb);
> +    return float32_add(a, float16_to_float32(b, true, s), s);
>  }
>
> -void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
> -                            void *vs2, CPURISCVState *env, uint32_t desc)
> +static uint64_t fwadd32(uint64_t a, uint32_t b, float_status *s)
>  {
> -    uint32_t vm = vext_vm(desc);
> -    uint32_t vl = env->vl;
> -    uint32_t esz = sizeof(uint64_t);
> -    uint32_t vlenb = simd_maxsz(desc);
> -    uint32_t vta = vext_vta(desc);
> -    uint32_t i;
> -    uint64_t s1 =  *((uint64_t *)vs1);
> -
> -    for (i = env->vstart; i < vl; i++) {
> -        uint32_t s2 = *((uint32_t *)vs2 + H4(i));
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -        s1 = float64_add(s1, float32_to_float64(s2, &env->fp_status),
> -                         &env->fp_status);
> -    }
> -    *((uint64_t *)vd) = s1;
> -    env->vstart = 0;
> -    /* set tail elements to 1s */
> -    vext_set_elems_1s(vd, vta, esz, vlenb);
> +    return float64_add(a, float32_to_float64(b, s), s);
>  }
>
> +/* Vector Widening Floating-Point Reduction Instructions */
> +/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> +GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> +GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
> +
>  /*
>   *** Vector Mask Operations
>   */
> --
> 2.30.1 (Apple Git-130)
>
>
>

--00000000000065372505e97b5221
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 17, 2022 at 11:32 PM=
 Yang Liu &lt;<a href=3D"mailto:liuyang22@iscas.ac.cn">liuyang22@iscas.ac.c=
n</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Remove duplicate code by wrapping vfwredsum_vs&#39;s OP function.<br>
<br>
Signed-off-by: Yang Liu &lt;<a href=3D"mailto:liuyang22@iscas.ac.cn" target=
=3D"_blank">liuyang22@iscas.ac.cn</a>&gt;<br>
---<br>
=C2=A0target/riscv/vector_helper.c | 56 +++++++----------------------------=
-<br>
=C2=A01 file changed, 10 insertions(+), 46 deletions(-)<br>
<br>
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br=
>
index a96fc49c71..fd83c0b20b 100644<br>
--- a/target/riscv/vector_helper.c<br>
+++ b/target/riscv/vector_helper.c<br>
@@ -4655,58 +4655,22 @@ GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2=
, H2, float16_minimum_number)<br>
=C2=A0GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_mini=
mum_number)<br>
=C2=A0GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_mini=
mum_number)<br>
<br>
-/* Vector Widening Floating-Point Reduction Instructions */<br>
-/* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */<br>
-void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 void *vs2, CPURISCVState *env, uint32_t desc)<br>
+/* Vector Widening Floating-Point Add Instructions */<br>
+static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 uint32_t vm =3D vext_vm(desc);<br>
-=C2=A0 =C2=A0 uint32_t vl =3D env-&gt;vl;<br>
-=C2=A0 =C2=A0 uint32_t esz =3D sizeof(uint32_t);<br>
-=C2=A0 =C2=A0 uint32_t vlenb =3D simd_maxsz(desc);<br>
-=C2=A0 =C2=A0 uint32_t vta =3D vext_vta(desc);<br>
-=C2=A0 =C2=A0 uint32_t i;<br>
-=C2=A0 =C2=A0 uint32_t s1 =3D=C2=A0 *((uint32_t *)vs1 + H4(0));<br>
-<br>
-=C2=A0 =C2=A0 for (i =3D env-&gt;vstart; i &lt; vl; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t s2 =3D *((uint16_t *)vs2 + H2(i));<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vm &amp;&amp; !vext_elem_mask(v0, i)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s1 =3D float32_add(s1, float16_to_float32(s2, =
true, &amp;env-&gt;fp_status),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;env-&gt;fp_status);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 *((uint32_t *)vd + H4(0)) =3D s1;<br>
-=C2=A0 =C2=A0 env-&gt;vstart =3D 0;<br>
-=C2=A0 =C2=A0 /* set tail elements to 1s */<br>
-=C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, esz, vlenb);<br>
+=C2=A0 =C2=A0 return float32_add(a, float16_to_float32(b, true, s), s);<br=
>
=C2=A0}<br>
<br>
-void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 void *vs2, CPURISCVState *env, uint32_t desc)<br>
+static uint64_t fwadd32(uint64_t a, uint32_t b, float_status *s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 uint32_t vm =3D vext_vm(desc);<br>
-=C2=A0 =C2=A0 uint32_t vl =3D env-&gt;vl;<br>
-=C2=A0 =C2=A0 uint32_t esz =3D sizeof(uint64_t);<br>
-=C2=A0 =C2=A0 uint32_t vlenb =3D simd_maxsz(desc);<br>
-=C2=A0 =C2=A0 uint32_t vta =3D vext_vta(desc);<br>
-=C2=A0 =C2=A0 uint32_t i;<br>
-=C2=A0 =C2=A0 uint64_t s1 =3D=C2=A0 *((uint64_t *)vs1);<br>
-<br>
-=C2=A0 =C2=A0 for (i =3D env-&gt;vstart; i &lt; vl; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t s2 =3D *((uint32_t *)vs2 + H4(i));<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vm &amp;&amp; !vext_elem_mask(v0, i)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s1 =3D float64_add(s1, float32_to_float64(s2, =
&amp;env-&gt;fp_status),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;env-&gt;fp_status);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 *((uint64_t *)vd) =3D s1;<br>
-=C2=A0 =C2=A0 env-&gt;vstart =3D 0;<br>
-=C2=A0 =C2=A0 /* set tail elements to 1s */<br>
-=C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, esz, vlenb);<br>
+=C2=A0 =C2=A0 return float64_add(a, float32_to_float64(b, s), s);<br>
=C2=A0}<br>
<br>
+/* Vector Widening Floating-Point Reduction Instructions */<br>
+/* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */<br>
+GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)<br>
+GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)<br>
+<br>
=C2=A0/*<br>
=C2=A0 *** Vector Mask Operations<br>
=C2=A0 */<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
<br>
</blockquote></div>

--00000000000065372505e97b5221--

