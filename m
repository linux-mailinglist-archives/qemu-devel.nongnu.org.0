Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CA5F1F99
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 23:03:14 +0200 (CEST)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oejdg-0008JZ-7o
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 17:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oejZx-0005wY-Ax
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oejZu-0001DY-0h
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664657956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kt2glVrQyuIYxO/KwNMsBxVgOHuimh5isRFHCXW6Q3w=;
 b=JLRi4m3ajtA9E7+/Lbldsd0YnL3Gehr0TJa5W37fI/yyWufnOCrgn8uHZ1ILyzGWNTU5EQ
 okQIycKcCnMpD4+CloWDiyRmIOCPePNrBSi6P9z92bYzLsjZ11qaswaiS0+9d2HgHpIi72
 Mf0kgNfH6QAQLPvjnsVd8JKeLoIZ+TI=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-9Hm7b0BVN9Wf2LQsUT7yfw-1; Sat, 01 Oct 2022 16:59:14 -0400
X-MC-Unique: 9Hm7b0BVN9Wf2LQsUT7yfw-1
Received: by mail-ua1-f70.google.com with SMTP id
 z10-20020ab05bca000000b003d7ca721fe7so678511uae.23
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 13:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kt2glVrQyuIYxO/KwNMsBxVgOHuimh5isRFHCXW6Q3w=;
 b=Yp+tDUTaLmR/PK7a8S7CaFCJKKPrQUEgWPyRbbFcpv8aTdow0BKUf8l/NKIHtlBbNP
 40/2VYouJMS1LEshuT0RkWe0HU9j99vWOVyfhoGFB3XVWfKf4oRiYRrIpIam10NOaH0p
 u1PwRfNyrlNBfAlEURF7wN5i9lCjT3CtbXsoqfiKm4MU5FV3dL3rOg/fmGacCb7mzxeN
 Bd5Ml6WkSEEI0UuI30BFn/nTrffL2RlaNoYcHsRcMQ5mg2OrMtwXZeXk3L2Jti1ZvmWU
 kvqevAp5AsvRLHiOP/AGKl1dyQMtftSi4GWsOWwIrmRu2rBmwxHoYkxpYCyrdSHxEH5+
 l6kg==
X-Gm-Message-State: ACrzQf00ZYI4TjtEhpMqFLH1BJShhBJtTNEZLgy4L7wZ3k9oygIGBEI3
 2oygAE0a7akvd5fMCrEz+klA42johilzuZwiOtx+7gwz/H1SDUYdxLJB5PWd9sIAMkQ7Yug9LkT
 iY7iIbEJtBtDq1NHpg4gZoxbf7hs6+9c=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr6758782vks.33.1664657954236; 
 Sat, 01 Oct 2022 13:59:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4kW02TIqOzcb3rYwSwmOwUV8+FSAPhDe2iX3mXvU2qo0FIx30ZLHa6tEbpoXWJvui9umlU0yqEQJrVGN6Z7J8=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr6758777vks.33.1664657953967; Sat, 01
 Oct 2022 13:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221001140935.465607-1-richard.henderson@linaro.org>
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 1 Oct 2022 22:59:02 +0200
Message-ID: <CABgObfaCCJRSKpdYKjn4EH1Lf6JjZaBREg51USr9tLc7zvU3Mw@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] target/i386: pc-relative translation blocks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000004e8e605e9ff6222"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--00000000000004e8e605e9ff6222
Content-Type: text/plain; charset="UTF-8"

Il sab 1 ott 2022, 16:09 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> This is the x86 specific changes required to reduce the
> amount of translation for address space randomization.
> For v3, quite a few changes based on Paolo's feedback.
>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


>
> r~
>
> Based-on: 20220930212622.108363-1-richard.henderson@linaro.org
> ("[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL")
>
>
> Richard Henderson (26):
>   target/i386: Remove pc_start
>   target/i386: Return bool from disas_insn
>   target/i386: Remove cur_eip argument to gen_exception
>   target/i386: Remove cur_eip, next_eip arguments to gen_interrupt
>   target/i386: Create gen_update_eip_cur
>   target/i386: Create gen_update_eip_next
>   target/i386: Introduce DISAS_EOB*
>   target/i386: Use DISAS_EOB* in gen_movl_seg_T0
>   target/i386: Use DISAS_EOB_NEXT
>   target/i386: USe DISAS_EOB_ONLY
>   target/i386: Create cur_insn_len, cur_insn_len_i32
>   target/i386: Remove cur_eip, next_eip arguments to gen_repz*
>   target/i386: Introduce DISAS_JUMP
>   target/i386: Truncate values for lcall_real to i32
>   target/i386: Create eip_next_*
>   target/i386: Use DISAS_TOO_MANY to exit after gen_io_start
>   target/i386: Create gen_jmp_rel
>   target/i386: Use gen_jmp_rel for loop, repz, jecxz insns
>   target/i386: Use gen_jmp_rel for gen_jcc
>   target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
>   target/i386: Remove MemOp argument to gen_op_j*_ecx
>   target/i386: Merge gen_jmp_tb and gen_goto_tb into gen_jmp_rel
>   target/i386: Create eip_cur_tl
>   target/i386: Add cpu_eip
>   target/i386: Inline gen_jmp_im
>   target/i386: Enable TARGET_TB_PCREL
>
>  target/i386/cpu-param.h      |   4 +
>  target/i386/helper.h         |   2 +-
>  target/i386/tcg/seg_helper.c |   6 +-
>  target/i386/tcg/tcg-cpu.c    |   8 +-
>  target/i386/tcg/translate.c  | 830 ++++++++++++++++++-----------------
>  5 files changed, 448 insertions(+), 402 deletions(-)
>
> --
> 2.34.1
>
>

--00000000000004e8e605e9ff6222
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 1 ott 2022, 16:09 Richard Henderson &lt;<a href=
=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is the x86 spec=
ific changes required to reduce the<br>
amount of translation for address space randomization.<br>
For v3, quite a few changes based on Paolo&#39;s feedback.<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
r~<br>
<br>
Based-on: <a href=3D"mailto:20220930212622.108363-1-richard.henderson@linar=
o.org" target=3D"_blank" rel=3D"noreferrer">20220930212622.108363-1-richard=
.henderson@linaro.org</a><br>
(&quot;[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL&quot;)<br>
<br>
<br>
Richard Henderson (26):<br>
=C2=A0 target/i386: Remove pc_start<br>
=C2=A0 target/i386: Return bool from disas_insn<br>
=C2=A0 target/i386: Remove cur_eip argument to gen_exception<br>
=C2=A0 target/i386: Remove cur_eip, next_eip arguments to gen_interrupt<br>
=C2=A0 target/i386: Create gen_update_eip_cur<br>
=C2=A0 target/i386: Create gen_update_eip_next<br>
=C2=A0 target/i386: Introduce DISAS_EOB*<br>
=C2=A0 target/i386: Use DISAS_EOB* in gen_movl_seg_T0<br>
=C2=A0 target/i386: Use DISAS_EOB_NEXT<br>
=C2=A0 target/i386: USe DISAS_EOB_ONLY<br>
=C2=A0 target/i386: Create cur_insn_len, cur_insn_len_i32<br>
=C2=A0 target/i386: Remove cur_eip, next_eip arguments to gen_repz*<br>
=C2=A0 target/i386: Introduce DISAS_JUMP<br>
=C2=A0 target/i386: Truncate values for lcall_real to i32<br>
=C2=A0 target/i386: Create eip_next_*<br>
=C2=A0 target/i386: Use DISAS_TOO_MANY to exit after gen_io_start<br>
=C2=A0 target/i386: Create gen_jmp_rel<br>
=C2=A0 target/i386: Use gen_jmp_rel for loop, repz, jecxz insns<br>
=C2=A0 target/i386: Use gen_jmp_rel for gen_jcc<br>
=C2=A0 target/i386: Use gen_jmp_rel for DISAS_TOO_MANY<br>
=C2=A0 target/i386: Remove MemOp argument to gen_op_j*_ecx<br>
=C2=A0 target/i386: Merge gen_jmp_tb and gen_goto_tb into gen_jmp_rel<br>
=C2=A0 target/i386: Create eip_cur_tl<br>
=C2=A0 target/i386: Add cpu_eip<br>
=C2=A0 target/i386: Inline gen_jmp_im<br>
=C2=A0 target/i386: Enable TARGET_TB_PCREL<br>
<br>
=C2=A0target/i386/cpu-param.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0target/i386/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02=
 +-<br>
=C2=A0target/i386/tcg/seg_helper.c |=C2=A0 =C2=A06 +-<br>
=C2=A0target/i386/tcg/tcg-cpu.c=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0target/i386/tcg/translate.c=C2=A0 | 830 ++++++++++++++++++-----------=
------<br>
=C2=A05 files changed, 448 insertions(+), 402 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div></div>

--00000000000004e8e605e9ff6222--


