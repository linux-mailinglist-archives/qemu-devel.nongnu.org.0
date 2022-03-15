Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4BA4D97A3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:29:27 +0100 (CET)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3Ub-0007aR-Fs
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:29:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nU3QU-0005Im-RS
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:25:10 -0400
Received: from [2607:f8b0:4864:20::102a] (port=53075
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nU3QR-0003BG-BI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:25:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id v4so17270686pjh.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hu1630KcC8UiBL/yt4gRTLyOBkC277DC+vMeJ8/dUqM=;
 b=Oi+H4G8U7towPE+eVXSpBejvrhyw37dBFMSGdiOe6B6Ap4FWH3F5USZBxZVdNmFldH
 tQQQD6t+EzEQN27TXQPR5Y3uIOB8LHPUAcO/HzgZdxT34eidEB2RkP5/zLRgrjk/rKXA
 6p+b0LELMdz4rVdPwTPKr92pIvDDgHQ6X2uYwjqf+HqdwQ/ZmccgqOZFwK878f7TXNFF
 Y1mDW1Y5uAuZ98H99QX+8tOA6mJlrUvREbMlkcdxpXUaut3++uq24LZaobPj4Ztkuk/0
 vJcQjxR+uQh8PkVq+l7VGOaFTBkQaTrbp9zQqcCTFPitf4K3OhgPngqkRmAKtMkaxpx8
 lofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hu1630KcC8UiBL/yt4gRTLyOBkC277DC+vMeJ8/dUqM=;
 b=j8ND2siN7kN3OlDTcOa88RtcOlKMaiH2alUK+VOunXVIk4ArR4l/VmI7AAU3kPW4GZ
 7xqucBTMu1NdECailm8nCSGIYBK6uIwKx87JsLyyo8KviI9wFc59urpTtkGWmALF9Er1
 RopMyuTnA8x9v182Q4W2teTaCGHYu9v/lxq/8Ep1PqcgAp/hKhlX+GHBZISG8bXwDbUZ
 rKaNS+eYIj7qSenE+7+MBkxHgEK8wvr0hOkQX/EPbxgO8AFifwc63gIW9NG4SrmZfTNt
 TaelmfrtCckd9469UYPlDdn2YBSK1j8D0LV5MYN+5VUt/qOX5JSusO+IGXIMCvG8NXSn
 zWUg==
X-Gm-Message-State: AOAM531FPveMZmi+I94UoiXwp7W5AAFh3Iytew2F2ZmKz6tQV2n0V2kE
 NebM88IJO41ttGmwtcHGoPn50/DaE4VRJZGi
X-Google-Smtp-Source: ABdhPJwhUms+kvkQvLphgex0IrgjBO62SzxQx9J5tMgi/a+RTUZQ8klyC5ORbSqQTK0jfh7Vv2slZQ==
X-Received: by 2002:a17:902:ea0d:b0:151:df90:779f with SMTP id
 s13-20020a170902ea0d00b00151df90779fmr27900753plg.1.1647336304806; 
 Tue, 15 Mar 2022 02:25:04 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52]) by smtp.gmail.com with ESMTPSA id
 nv4-20020a17090b1b4400b001bf64a39579sm2532156pjb.4.2022.03.15.02.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 02:25:04 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so1858955pjb.3; 
 Tue, 15 Mar 2022 02:25:03 -0700 (PDT)
X-Received: by 2002:a17:902:e88d:b0:151:ba78:3bc1 with SMTP id
 w13-20020a170902e88d00b00151ba783bc1mr26973798plg.13.1647336303220; Tue, 15
 Mar 2022 02:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220303235440.638790-1-atishp@rivosinc.com>
 <20220303235440.638790-11-atishp@rivosinc.com>
In-Reply-To: <20220303235440.638790-11-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 15 Mar 2022 17:24:52 +0800
X-Gmail-Original-Message-ID: <CANzO1D3nJmpcBCpH_ih2uDmrfKYVZ17XMvJCLGqKo-L1uy459g@mail.gmail.com>
Message-ID: <CANzO1D3nJmpcBCpH_ih2uDmrfKYVZ17XMvJCLGqKo-L1uy459g@mail.gmail.com>
Subject: Re: [PATCH v6 10/12] target/riscv: Add few cache related PMU events
To: Atish Patra <atishp@rivosinc.com>
Content-Type: multipart/alternative; boundary="0000000000002dda9605da3e5f7f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002dda9605da3e5f7f
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 8:11 AM Atish Patra <atishp@rivosinc.com> wrote:

> From: Atish Patra <atish.patra@wdc.com>
>
> Qemu can monitor the following cache related PMU events through
> tlb_fill functions.
>
> 1. DTLB load/store miss
> 3. ITLB prefetch miss
>
> Increment the PMU counter in tlb_fill function.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1c60fb2e8057..72ae1a612ae8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -21,10 +21,13 @@
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> +#include "pmu.h"
>  #include "exec/exec-all.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
>  #include "semihosting/common-semi.h"
> +#include "cpu.h"
>

Redundant: #include "cpu.h"

Regards,
Frank Chang


> +#include "cpu_bits.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  {
> @@ -1178,6 +1181,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs,
> vaddr addr,
>      riscv_raise_exception(env, cs->exception_index, retaddr);
>  }
>
> +
> +static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType
> access_type)
> +{
> +    enum riscv_pmu_event_idx pmu_event_type;
> +
> +    switch (access_type) {
> +    case MMU_INST_FETCH:
> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
> +        break;
> +    case MMU_DATA_LOAD:
> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
> +        break;
> +    case MMU_DATA_STORE:
> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
> +        break;
> +    default:
> +        return;
> +    }
> +
> +    riscv_pmu_incr_ctr(cpu, pmu_event_type);
> +}
> +
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr)
> @@ -1274,6 +1299,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>              }
>          }
>      } else {
> +        pmu_tlb_fill_incr_ctr(cpu, access_type);
>          /* Single stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address, NULL,
>                                     access_type, mmu_idx, true, false,
> false);
> --
> 2.30.2
>
>
>

--0000000000002dda9605da3e5f7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 4, 2022 at 8:11 AM Atish Patr=
a &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">From: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com=
" target=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
<br>
Qemu can monitor the following cache related PMU events through<br>
tlb_fill functions.<br>
<br>
1. DTLB load/store miss<br>
3. ITLB prefetch miss<br>
<br>
Increment the PMU counter in tlb_fill function.<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" targe=
t=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++<br>
=C2=A01 file changed, 26 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 1c60fb2e8057..72ae1a612ae8 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -21,10 +21,13 @@<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
+#include &quot;pmu.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;tcg/tcg-op.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;semihosting/common-semi.h&quot;<br>
+#include &quot;cpu.h&quot;<br></blockquote><div><br></div><div>Redundant:=
=C2=A0#include &quot;cpu.h&quot;</div><div><br></div><div>Regards,</div><di=
v>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+#include &quot;cpu_bits.h&quot;<br>
<br>
=C2=A0int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)<br>
=C2=A0{<br>
@@ -1178,6 +1181,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vad=
dr addr,<br>
=C2=A0 =C2=A0 =C2=A0riscv_raise_exception(env, cs-&gt;exception_index, reta=
ddr);<br>
=C2=A0}<br>
<br>
+<br>
+static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type=
)<br>
+{<br>
+=C2=A0 =C2=A0 enum riscv_pmu_event_idx pmu_event_type;<br>
+<br>
+=C2=A0 =C2=A0 switch (access_type) {<br>
+=C2=A0 =C2=A0 case MMU_INST_FETCH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_event_type =3D RISCV_PMU_EVENT_CACHE_ITLB_=
PREFETCH_MISS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case MMU_DATA_LOAD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_event_type =3D RISCV_PMU_EVENT_CACHE_DTLB_=
READ_MISS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case MMU_DATA_STORE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_event_type =3D RISCV_PMU_EVENT_CACHE_DTLB_=
WRITE_MISS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 riscv_pmu_incr_ctr(cpu, pmu_event_type);<br>
+}<br>
+<br>
=C2=A0bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool probe, uintptr_t retaddr)<br>
@@ -1274,6 +1299,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_tlb_fill_incr_ctr(cpu, access_type);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Single stage lookup */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_physical_address(env, &amp;pa=
, &amp;prot, address, NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 access_type, mmu_idx, =
true, false, false);<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000002dda9605da3e5f7f--

