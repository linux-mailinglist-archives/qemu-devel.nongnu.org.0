Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF4408C3F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:16:55 +0200 (CEST)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlpO-0002Su-HA
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPlAu-0002GL-1f
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:35:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPlAs-0005qG-8d
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:35:03 -0400
Received: by mail-wm1-x334.google.com with SMTP id g128so2098186wma.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bOf6hxd2naJm6C/KISgrDsjWiFLZ21fIUP+rvgbkHwg=;
 b=H/wCQazyuF8pGKyfI5lTDDyPFnGN4UiHm09GAbPUBcSZisdKi8yfTfxd1k5m8S7mtp
 gRAsXGYGdrac2LAP6LwdfQYWjsbXBCYCZ/Y4skWGpPM9ea2IKVyKiFETTGELxI7iG/k8
 f0S5k3NRvbzaiBG5Pi7d5+l2yPWzFgqkh9To8x9mEp7eP5g3/KqPw80Di+TjsWMRO7mV
 0+0W3Z3D2dB5ufEknCWuqjaIgfPO6+dDu3s23YJQwlREhmbZHidy0oIpL0+Mo04Dz//T
 c7vUMRSpjP6Q1DRve7nSAXAn2yCbo3/XbgdB2V/UdW31OtVT1LdqKAbbFS3jTlxqdWev
 s1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bOf6hxd2naJm6C/KISgrDsjWiFLZ21fIUP+rvgbkHwg=;
 b=VVBvg4U991+HNT/EuzgqvCAL3dEcoUq8bEmxNpXOK7meoVkIM9TuM3rZjdC8OsIHH+
 UGM8J58eP2Wt6L6nMVieamZTnlA4LMF9b1EbRNDWS+Yobu1tJ/uO041sTEwjOszCvimD
 oXFMi5MPycj90ts/a5AqDlZxA1QbvI6KNiSZFM1bHFq2zY2bjUnByMfdQ0Cs9/1wWj3t
 +XClybLITx8PAL9ARCcXDinSmPNvcjMhil4X2a32mdmZ8JxB4si0CbXiV3wfgIElcswr
 X3G3KBv2qtom2DEMfv6cTOPXHpbq+B62KWn+ONBdLuYsSQHDQqYi05qRI9mvMB+l8ugr
 NebA==
X-Gm-Message-State: AOAM532VH1hWoShgKs0T8l6MCslAgO3bgZT7JM8TMtwtoQ2goyYfrg/5
 K3PuVm6EPFIy6hh7fT2znq1PIG4TLroKdzOo5vA/JU8vbEY=
X-Google-Smtp-Source: ABdhPJwgKxzGdVIHPbykGF2viSmtQy1++JupZMEaRz1/uB2vhIIdvUmaU258XJF/fichQ/R3BOV9TsnBBWO/I1nK6o8=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4327183wmm.133.1631536500728; 
 Mon, 13 Sep 2021 05:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210901141008.17203-1-peter.maydell@linaro.org>
In-Reply-To: <20210901141008.17203-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 13:34:10 +0100
Message-ID: <CAFEAcA_Jn_y0i5W2zdM+hEFmciu-q=EK3EXQgQateU2r2uAXWw@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: Use assert() to sanity-check b1 in SSE
 decode
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping? (this has been reviewed)

thanks
-- PMM

On Wed, 1 Sept 2021 at 15:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the SSE decode function gen_sse(), we combine a byte
> 'b' and a value 'b1' which can be [0..3], and switch on them:
>    b |= (b1 << 8);
>    switch (b) {
>    ...
>    default:
>    unknown_op:
>        gen_unknown_opcode(env, s);
>        return;
>    }
>
> In three cases inside this switch, we were then also checking for
>  "if (b1 >= 2) { goto unknown_op; }".
> However, this can never happen, because the 'case' values in each place
> are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
> cases to the default already.
>
> This check was added in commit c045af25a52e9 in 2010; the added code
> was unnecessary then as well, and was apparently intended only to
> ensure that we never accidentally ended up indexing off the end
> of an sse_op_table with only 2 entries as a result of future bugs
> in the decode logic.
>
> Change the checks to assert() instead, and make sure they're always
> immediately before the array access they are protecting.
>
> Fixes: Coverity CID 1460207
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: use assert() rather than just deleting the if()s
>
>  target/i386/tcg/translate.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index aacb605eee4..a4fee5e445d 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -3521,9 +3521,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>          case 0x171: /* shift xmm, im */
>          case 0x172:
>          case 0x173:
> -            if (b1 >= 2) {
> -                goto unknown_op;
> -            }
>              val = x86_ldub_code(env, s);
>              if (is_xmm) {
>                  tcg_gen_movi_tl(s->T0, val);
> @@ -3542,6 +3539,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>                                  offsetof(CPUX86State, mmx_t0.MMX_L(1)));
>                  op1_offset = offsetof(CPUX86State,mmx_t0);
>              }
> +            assert(b1 < 2);
>              sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
>                                         (((modrm >> 3)) & 7)][b1];
>              if (!sse_fn_epp) {
> @@ -3772,10 +3770,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>              rm = modrm & 7;
>              reg = ((modrm >> 3) & 7) | REX_R(s);
>              mod = (modrm >> 6) & 3;
> -            if (b1 >= 2) {
> -                goto unknown_op;
> -            }
>
> +            assert(b1 < 2);
>              sse_fn_epp = sse_op_table6[b].op[b1];
>              if (!sse_fn_epp) {
>                  goto unknown_op;
> @@ -4202,10 +4198,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>              rm = modrm & 7;
>              reg = ((modrm >> 3) & 7) | REX_R(s);
>              mod = (modrm >> 6) & 3;
> -            if (b1 >= 2) {
> -                goto unknown_op;
> -            }
>
> +            assert(b1 < 2);
>              sse_fn_eppi = sse_op_table7[b].op[b1];
>              if (!sse_fn_eppi) {
>                  goto unknown_op;
> --
> 2.20.1

