Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196E6FC8E0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:26:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOHa-0008SQ-0G; Tue, 09 May 2023 10:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwOHY-0008Rb-53
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwOHW-0005EL-9U
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683642333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jvts4/e/iwU9oVkCNh2q3T9Tr/dPPl4ZQrsJJGk3yM8=;
 b=IsSonkGJ//+Gu5YMCAtz4W1Vt8KtUAd0wUdQfkmacyPhsFnq+0MNY2ZR4LMLoJnzCGriwq
 NFFm1ia4AM9rtuV58DkjR2pYe6/gs0KSqIC9yUTjI0T48bybtVetVCl1wlnkDMIiyD4SIc
 Pwed1+eGtMsOn0NslN8KDhD0ltmZIfg=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-0CU7_cNUMo2Y6j6XsSMHBQ-1; Tue, 09 May 2023 10:25:32 -0400
X-MC-Unique: 0CU7_cNUMo2Y6j6XsSMHBQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-43618b2c18aso146751137.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642331; x=1686234331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jvts4/e/iwU9oVkCNh2q3T9Tr/dPPl4ZQrsJJGk3yM8=;
 b=C0opYKr7qPe2W5ko1zmKBkGHAcKp/BiDJ0ZnR9HzLD8pSR9gI3cmXOUm9UcX4N1HzW
 Tpl4iOf6rIRdBRphX59NVWRMP2ESq7QmyXlgAVQLEq5aKrNfqkU2DKIiStPa002+BTop
 JN43WsCRFPflzDVkaf6ZQEcZUO6VB6VkMs7uzPf+OrM72gMhbhgDUA0bZBiwICBBlUEQ
 3ctoZe/ttV5dLRlcE/FTIH1a7b26oT3NG53j0y/K8V6n7x41ZhKi4lnDvYWXQwpfJbDd
 0xHU7l7Gtu1z8BP3WVSL/c5gzsrGHYS1RQby3Kz2GZOeI26MUuxenC79vLaA1V7ykNgH
 gy5Q==
X-Gm-Message-State: AC+VfDw1jspuxTTwYZe96RNT7MC3Q8nA042ZRATN1kH/nt6iJ7YS31cJ
 sTNjjZVbbXm7erhgScw3pd9gNXT72HJP+YNq92BYGwrwSJmtHJdnAo/oDd0qRkTKhhbS60ZZ26R
 rWnLL4lPHcj82loV5X4rLNILcOTuTMM4=
X-Received: by 2002:a05:6102:9b:b0:426:48f7:9ecd with SMTP id
 t27-20020a056102009b00b0042648f79ecdmr4858302vsp.28.1683642331319; 
 Tue, 09 May 2023 07:25:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6MtNckkaFCVVxgmv/mm1gfg844fVU2TVKKanQvMJbPllS/GWGUCN0/FHhanFQ+pjttJwUoCYz5DuDFY12N+pg=
X-Received: by 2002:a05:6102:9b:b0:426:48f7:9ecd with SMTP id
 t27-20020a056102009b00b0042648f79ecdmr4858295vsp.28.1683642331068; Tue, 09
 May 2023 07:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230501111428.95998-1-ricky@rzhou.org>
In-Reply-To: <20230501111428.95998-1-ricky@rzhou.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 May 2023 16:25:19 +0200
Message-ID: <CABgObfY548LsJdE-a8445O8iKbn6tOeKpiMeOuk-S18aadZKiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/i386: Fix and add some comments next to
 SSE/AVX instructions.
To: Ricky Zhou <ricky@rzhou.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 1, 2023 at 1:14=E2=80=AFPM Ricky Zhou <ricky@rzhou.org> wrote:
>
> Adds some comments describing what instructions correspond to decoding
> table entries and fixes some existing comments which named the wrong
> instruction.

Queued all three, thanks!

Paolo

> ---
>  target/i386/tcg/decode-new.c.inc | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-ne=
w.c.inc
> index 4fdd87750b..1a579451d2 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -274,9 +274,9 @@ static void decode_0F78(DisasContext *s, CPUX86State =
*env, X86OpEntry *entry, ui
>  {
>      static const X86OpEntry opcodes_0F78[4] =3D {
>          {},
> -        X86_OP_ENTRY3(EXTRQ_i,       V,x, None,None, I,w,  cpuid(SSE4A))=
,
> +        X86_OP_ENTRY3(EXTRQ_i,       V,x, None,None, I,w,  cpuid(SSE4A))=
, /* AMD extension */
>          {},
> -        X86_OP_ENTRY3(INSERTQ_i,     V,x, U,x, I,w,        cpuid(SSE4A))=
,
> +        X86_OP_ENTRY3(INSERTQ_i,     V,x, U,x, I,w,        cpuid(SSE4A))=
, /* AMD extension */
>      };
>      *entry =3D *decode_by_prefix(s, opcodes_0F78);
>  }
> @@ -284,9 +284,9 @@ static void decode_0F78(DisasContext *s, CPUX86State =
*env, X86OpEntry *entry, ui
>  static void decode_0F79(DisasContext *s, CPUX86State *env, X86OpEntry *e=
ntry, uint8_t *b)
>  {
>      if (s->prefix & PREFIX_REPNZ) {
> -        entry->gen =3D gen_INSERTQ_r;
> +        entry->gen =3D gen_INSERTQ_r; /* AMD extension */
>      } else if (s->prefix & PREFIX_DATA) {
> -        entry->gen =3D gen_EXTRQ_r;
> +        entry->gen =3D gen_EXTRQ_r; /* AMD extension */
>      } else {
>          entry->gen =3D NULL;
>      };
> @@ -660,15 +660,15 @@ static void decode_0F10(DisasContext *s, CPUX86Stat=
e *env, X86OpEntry *entry, ui
>  static void decode_0F11(DisasContext *s, CPUX86State *env, X86OpEntry *e=
ntry, uint8_t *b)
>  {
>      static const X86OpEntry opcodes_0F11_reg[4] =3D {
> -        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPS */
> -        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPD */
> +        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPS */
> +        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPD */
>          X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex4),
>          X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex4), /* MOVSD */
>      };
>
>      static const X86OpEntry opcodes_0F11_mem[4] =3D {
> -        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPS =
*/
> -        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPD =
*/
> +        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPS=
 */
> +        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPD=
 */
>          X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
>          X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD =
*/
>      };
> @@ -839,9 +839,9 @@ static const X86OpEntry opcodes_0F[256] =3D {
>      [0x17] =3D X86_OP_ENTRY3(VMOVHPx_st,  M,q, None,None, V,dq, vex4 p_0=
0_66),
>
>      [0x50] =3D X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_=
66),
> -    [0x51] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2),
> -    [0x52] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f=
3),
> -    [0x53] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f=
3),
> +    [0x51] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2), /* sqrtps */
> +    [0x52] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f=
3), /* rsqrtps */
> +    [0x53] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f=
3), /* rcpps */
>      [0x54] =3D X86_OP_ENTRY3(PAND,       V,x, H,x, W,x,  vex4 p_00_66), =
/* vand */
>      [0x55] =3D X86_OP_ENTRY3(PANDN,      V,x, H,x, W,x,  vex4 p_00_66), =
/* vandn */
>      [0x56] =3D X86_OP_ENTRY3(POR,        V,x, H,x, W,x,  vex4 p_00_66), =
/* vor */
> @@ -879,7 +879,7 @@ static const X86OpEntry opcodes_0F[256] =3D {
>
>      [0x58] =3D X86_OP_ENTRY3(VADD,       V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2),
>      [0x59] =3D X86_OP_ENTRY3(VMUL,       V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2),
> -    [0x5a] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2),
> +    [0x5a] =3D X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2), /* CVTPS2PD */
>      [0x5b] =3D X86_OP_GROUP0(0F5B),
>      [0x5c] =3D X86_OP_ENTRY3(VSUB,       V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2),
>      [0x5d] =3D X86_OP_ENTRY3(VMIN,       V,x, H,x, W,x, vex2_rep3 p_00_6=
6_f3_f2),
> --
> 2.39.2
>


