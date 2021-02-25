Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A13258C5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:37:58 +0100 (CET)
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOKb-0006In-3X
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFOHR-0004VU-EL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:34:41 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFOHO-0000mX-Nc
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:34:41 -0500
Received: by mail-pf1-x432.google.com with SMTP id t29so4482019pfg.11
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 13:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7C3FmMa8Xmw/ScaeqFc5+b7cRoMyUlLccusRrZQ1i7M=;
 b=VyK8cG31XxxxnbA4OrVSQytYZSOZ8akviWZhZOPosjQ5MUOdgj84g3ePe/19Mpi8XZ
 dDXdHcxFGPyCUp0K2Qo9E6sx4Fv2GSA1n2iO77FRIJGHaSPagn+yp3fmChHNgjpPnR5n
 x1M9wq9l47oAakPviWbJw/AV8Qao2DmDptCQMRivrLHs3CY70n7kDSOk6xmpZrU/L7/E
 HLXqOKPK6x6/Oikb+C8NfsAZwD36H0C5rtYAFzXeRXPMq2wMVbOaiOTwi52N4O5aLn0V
 jLStExvgXyQXLMb7y7nKLYDnLOMgQHLqfXsreVVSEzdxHhg68MT4pCt9IJMZfggv/Lry
 b29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7C3FmMa8Xmw/ScaeqFc5+b7cRoMyUlLccusRrZQ1i7M=;
 b=CZrgsCjLpSW8GgmDqGLRwZgx93QiWC9TeVdvHPBOxH6S48I02hvHMycbv6ukuf8JQ9
 wC8fsPqTIqpChkQ1gtFF4zaKynJBKm7UWwd0zt/69wAZrbL+Hi29ZfPRiiFaE0Q1Xi/r
 2LvDtmznvHC0XbChPXgeuOieOMLl+EjDC5ibFc8PeHr9Ep25hBgBxxZoWCY5nyP+UUDa
 rznktLUa+Dxthk3w4RiSihuBaL69RH+iTbl6OItJKYTkzH1nrZW8F9D+tqmuQZ948YoI
 ZQp0S4mJ+lgijQB5OJjI78njmSywENO6NyHSDTFF+ZkNj3PtP59+GcqsF7o1csb4FOnf
 U0Gg==
X-Gm-Message-State: AOAM533wAkS2plo0D8sSJKJ0TzcPdFjmkg8UIIgwvb2+jsrLmqOgre18
 eJ1mEDve68x0L1/vq1/ZmRezUA==
X-Google-Smtp-Source: ABdhPJxW9uSvKHw9/yFYNSE6WopZfZEnXCHvc8ghqQayrzWDMHSaneeQ0pEwIcjK+KbNxBhBBLAhSQ==
X-Received: by 2002:a63:4654:: with SMTP id v20mr4727995pgk.129.1614288875048; 
 Thu, 25 Feb 2021 13:34:35 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id p8sm6948516pff.79.2021.02.25.13.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 13:34:34 -0800 (PST)
Subject: Re: [PATCH v2 06/10] target/hexagon: prepare input for the idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-7-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6008951-1faf-8ff7-ecdd-4648ebc56f7b@linaro.org>
Date: Thu, 25 Feb 2021 13:34:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-7-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> Introduce infrastructure necessary to produce a file suitable for being
> parsed by the idef-parser.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  target/hexagon/gen_idef_parser_funcs.py | 114 ++++++++++++++++
>  target/hexagon/idef-parser/macros.inc   | 166 ++++++++++++++++++++++++
>  target/hexagon/idef-parser/prepare      |  33 +++++
>  target/hexagon/meson.build              |  18 +++
>  4 files changed, 331 insertions(+)
>  create mode 100644 target/hexagon/gen_idef_parser_funcs.py
>  create mode 100644 target/hexagon/idef-parser/macros.inc
>  create mode 100755 target/hexagon/idef-parser/prepare
> 
> diff --git a/target/hexagon/gen_idef_parser_funcs.py b/target/hexagon/gen_idef_parser_funcs.py
> new file mode 100644
> index 0000000000..6fb3659201
> --- /dev/null
> +++ b/target/hexagon/gen_idef_parser_funcs.py
> @@ -0,0 +1,114 @@
> +#!/usr/bin/env python3
> +
> +##
> +##  Copyright(c) 2019-2020 rev.ng Srls. All Rights Reserved.
> +##
> +##  This program is free software; you can redistribute it and/or modify
> +##  it under the terms of the GNU General Public License as published by
> +##  the Free Software Foundation; either version 2 of the License, or
> +##  (at your option) any later version.
> +##
> +##  This program is distributed in the hope that it will be useful,
> +##  but WITHOUT ANY WARRANTY; without even the implied warranty of
> +##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +##  GNU General Public License for more details.
> +##
> +##  You should have received a copy of the GNU General Public License
> +##  along with this program; if not, see <http://www.gnu.org/licenses/>.
> +##
> +
> +import sys
> +import re
> +import string
> +from io import StringIO
> +
> +import hex_common
> +
> +##
> +## Generate code to be fed to the idef_parser
> +##
> +## Consider A2_add:
> +##
> +##     Rd32=add(Rs32,Rt32), { RdV=RsV+RtV;}
> +##
> +## We produce:
> +##
> +##     A2_add(RdV, in RsV, in RtV) {
> +##       { RdV=RsV+RtV;}
> +##     }
> +##
> +## A2_add represents the instruction tag. Then we have a list of TCGv
> +## that the code generated by the parser can expect in input. Some of
> +## them are inputs ("in" prefix), while some others are outputs.
> +##
> +def main():
> +    hex_common.read_semantics_file(sys.argv[1])
> +    hex_common.read_attribs_file(sys.argv[2])
> +    hex_common.read_overrides_file(sys.argv[3])
> +    hex_common.calculate_attribs()
> +    tagregs = hex_common.get_tagregs()
> +    tagimms = hex_common.get_tagimms()
> +
> +    with open(sys.argv[4], 'w') as f:
> +        f.write('#include "macros.inc"\n\n')
> +
> +        for tag in hex_common.tags:
> +            ## Skip the priv instructions
> +            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
> +                continue
> +            ## Skip the guest instructions
> +            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
> +                continue
> +            ## Skip instructions using switch
> +            if ( tag in {'S4_vrcrotate_acc', 'S4_vrcrotate'} ) :
> +                continue
> +            ## Skip trap instructions
> +            if ( tag in {'J2_trap0', 'J2_trap1'} ) :
> +                continue
> +            ## Skip 128-bit instructions
> +            if ( tag in {'A7_croundd_ri', 'A7_croundd_rr'} ) :
> +                continue
> +            ## Skip other unsupported instructions
> +            if ( tag.startswith('S2_cabacdecbin') ) :
> +                continue
> +            if ( tag.startswith('Y') ) :
> +                continue
> +            if ( tag.startswith('V6_') ) :
> +                continue
> +            if ( tag.startswith('F') ) :
> +                continue
> +            if ( tag.endswith('_locked') ) :
> +                continue
> +
> +            regs = tagregs[tag]
> +            imms = tagimms[tag]
> +
> +            arguments = []
> +            if hex_common.need_ea(tag):
> +                arguments.append("EA")
> +
> +            for regtype,regid,toss,numregs in regs:
> +                prefix = "in " if hex_common.is_read(regid) else ""
> +
> +                is_pair = hex_common.is_pair(regid)
> +                is_single_old = (hex_common.is_single(regid)
> +                                 and hex_common.is_old_val(regtype, regid, tag))
> +                is_single_new = (hex_common.is_single(regid)
> +                                 and hex_common.is_new_val(regtype, regid, tag))
> +
> +                if is_pair or is_single_old:
> +                    arguments.append("%s%s%sV" % (prefix, regtype, regid))
> +                elif is_single_new:
> +                    arguments.append("%s%s%sN" % (prefix, regtype, regid))
> +                else:
> +                    print("Bad register parse: ",regtype,regid,toss,numregs)
> +
> +            for immlett,bits,immshift in imms:
> +                arguments.append(hex_common.imm_name(immlett))
> +
> +            f.write("%s(%s) {\n" % (tag, ", ".join(arguments)))
> +            f.write("    %s\n" % hex_common.semdict[tag])
> +            f.write("}\n\n")
> +
> +if __name__ == "__main__":
> +    main()
> diff --git a/target/hexagon/idef-parser/macros.inc b/target/hexagon/idef-parser/macros.inc
> new file mode 100644
> index 0000000000..719bebaee3
> --- /dev/null
> +++ b/target/hexagon/idef-parser/macros.inc
> @@ -0,0 +1,166 @@
> +/*
> + * Copyright(c) 2019-2020 rev.ng Srls. All Rights Reserved.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +/* Copy rules */
> +#define fLSBOLD(VAL) (fGETBIT(0, VAL))
> +#define fSATH(VAL) fSATN(16, VAL)
> +#define fSATUH(VAL) fSATUN(16, VAL)
> +#define fVSATH(VAL) fVSATN(16, VAL)
> +#define fVSATUH(VAL) fVSATUN(16, VAL)
> +#define fSATUB(VAL) fSATUN(8, VAL)
> +#define fSATB(VAL) fSATN(8, VAL)
> +#define fVSATUB(VAL) fVSATUN(8, VAL)
> +#define fVSATB(VAL) fVSATN(8, VAL)
> +#define fCALL(A) fWRITE_LR(fREAD_NPC()); fWRITE_NPC(A);
> +#define fCALLR(A) fWRITE_LR(fREAD_NPC()); fWRITE_NPC(A);
> +#define fCAST2_8s(A) fSXTN(16, 64, A)
> +#define fCAST2_8u(A) fZXTN(16, 64, A)
> +#define fCAST8S_16S(A) (fSXTN(64, 128, A))
> +#define fCAST16S_8S(A) (fSXTN(128, 64, A))
> +#define fVSATW(A) fVSATN(32, fCAST8_8s(A))
> +#define fSATW(A) fSATN(32, fCAST8_8s(A))
> +#define fVSAT(A) fVSATN(32, A)
> +#define fSAT(A) fSATN(32, A)
> +
> +/* Ease parsing */
> +#define f8BITSOF(VAL) ((VAL) ? 0xff : 0x00)
> +#define fREAD_GP() (Constant_extended ? (0) : GP)
> +#define fCLIP(DST, SRC, U) (DST = fMIN((1 << U) - 1, fMAX(SRC, -(1 << U))))

I guess this is what's in the manual, but my reading of this expression is
"saturate", not "clip".  How does it differ from

  fSATN(U, SRC)

?

> +#define fCARRY_FROM_ADD(A, B, C)                                        \
> +    fGETUWORD(1,                                                        \
> +              fGETUWORD(1, A) +                                         \
> +              fGETUWORD(1, B) +                                         \
> +              fGETUWORD(1,                                              \
> +                        fGETUWORD(0, A) +                               \
> +                        fGETUWORD(0, B) + C))

Hmm.  FWIW, it's probably worth letting this pass through to bison so that you
can expand with tcg_gen_add2.

> +#define fADDSAT64(DST, A, B)                                            \
> +        __a = fCAST8u(A);                                               \
> +        __b = fCAST8u(B);                                               \
> +        __sum = __a + __b;                                              \
> +        __xor = __a ^ __b;                                              \
> +        __mask = 0x8000000000000000ULL;                                 \
> +        if (__xor & __mask) {                                           \
> +            DST = __sum;                                                \
> +        }                                                               \
> +        else if ((__a ^ __sum) & __mask) {                              \
> +            if (__sum & __mask) {                                       \
> +                DST = 0x7FFFFFFFFFFFFFFFLL;                             \
> +                fSET_OVERFLOW();                                        \
> +            } else {                                                    \
> +                DST = 0x8000000000000000ULL;                            \
> +                fSET_OVERFLOW();    

Why not squash some of the subexpressions?

  if ((__a ^ __b) | ~(__a ^ sum)) & __mask) {
    DST = __sum;
  } else {
    DST = ((__sum & __mask) >> 63) + __mask;
    fSET_OVERFLOW();
  }


> +/* Negation operator */
> +#define fLSBOLDNOT(VAL) (!fGETBIT(0, VAL))

  fGETBIT(0, ~VAL) ?

> +# 2. Transform
> +#
> +#        condition ? A = B : A = C
> +#
> +#    in
> +#
> +#        A = (condition ? B : C)
> +#
> +# 3. Remove comments (starting with "#")
> +cpp "$@" | sed 's/\(\s*[{;]\)\s*\([^;?]*\) ? (\([^;=]*\)=\([^;)]*\))\s*:\s*([^;=]*=\([^;)]*\));/\1 \3 = (\2) ? \4 : \5;/' | grep -v '^#'

Wow, that is a really ugly regexp.  It screams for handling this in the parser
instead.  Which honestly doesn't seem that hard.


r~

