Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772765048E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 20:56:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6zk5-0002N6-2I; Sun, 18 Dec 2022 14:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6zk3-0002Mt-8h
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 14:54:35 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6zk1-0005EE-GC
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 14:54:34 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so7095220pjd.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 11:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3is4S1S5Y5qZGUpO6nVoMSs2Qt4T4n+6FNE4SjjwUP4=;
 b=otbUgw+XtW2TlCOrcvNgkjmsyZEBfgD78pXkydePlLcfDCw8ebvNmq3ivKtp6p8aQj
 +3AXDluBuv/22iTdXPskvwTN8idfXuMvdKss2zZCsh9JqRtyFq/hfiKWTTcBQMnF8jla
 b3NGdM03xO+09imKuvIi9TaaPS/qPJtiDZKu9+9i+yww/vevHql/xidxCiIHJeow6s0f
 PUVzLBXQiQrs2Fpz3cr22Wvo81eGutAiVctukJHmqEnS1nGDXj/S1Ji02TJHkjf4Nlyj
 ql3RDBD1Ev4a8OcbfRNHVuBA34ASwKN+nTk8nSgqUS443PWPlOtSZQwXQcS3dvcO9Xpa
 P2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3is4S1S5Y5qZGUpO6nVoMSs2Qt4T4n+6FNE4SjjwUP4=;
 b=khBRBQro5VPOUc4Pt6OTi6vwp9QCu7PVUzrWUxU0Q1qA0XCEsCr/FEuLhe39XUnptx
 fHfK/bLeN3KjgmNyG3qzYe5ymkXOfk4gr1P/4fiMVjmkrMpW8G/rHzS9lJ2vNRMCQwRv
 2u8wxq76j2mpmT7iMELiC5qyZkoIvDJPuAoxeVo50m5B6gnPEB8JnO+mxP2JPhstuLDK
 SATsmTSgUYVUkg8tSjfAyvQCpoiDO2Fe4bsJDB+91mf6SYWJFDRycvROWOjxKlrS3Anm
 5gCqETsj9fvQBc4NkZsa+Tk1KP746aVdwSQCzRUy4O2D+amF4gKAibuFFunmziksr46O
 2NrQ==
X-Gm-Message-State: ANoB5pmlmZzKJFP2/MUvxQ6zgIEguR49kw5qdQMafIq0XnTjp/V945uG
 /B2vtD1hrva7qVWHWyNNvlhHfA==
X-Google-Smtp-Source: AA0mqf7Z+aleLgC6i8Fe+JEyQfpdM4faEpQZEfYGn7s88w1T1y3iTTR2KIDeULDxOib1gofJJii/SQ==
X-Received: by 2002:a17:902:9b97:b0:189:9e91:762e with SMTP id
 y23-20020a1709029b9700b001899e91762emr39727689plp.57.1671393271497; 
 Sun, 18 Dec 2022 11:54:31 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a170903018e00b00186a6b63525sm5439911plg.120.2022.12.18.11.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 11:54:30 -0800 (PST)
Message-ID: <3976e8b7-3c5b-68f8-922c-ec3c182e0228@linaro.org>
Date: Sun, 18 Dec 2022 11:54:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack
 in 'g' packets.
Content-Language: en-US
To: TaiseiIto <taisei1212@outlook.jp>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/8/22 04:30, TaiseiIto wrote:
> Before this commit, when GDB attached an OS working on QEMU, order of FPU
> stack registers printed by GDB command 'info float' was wrong. There was a
> bug causing the problem in 'g' packets sent by QEMU to GDB. The packets have
> values of registers of machine emulated by QEMU containing FPU stack
> registers. There are 2 ways to specify a x87 FPU stack register. The first
> is specifying by absolute indexed register names (R0, ..., R7). The second
> is specifying by stack top relative indexed register names (ST0, ..., ST7).
> Values of the FPU stack registers should be located in 'g' packet and be
> ordered by the relative index. But QEMU had located these registers ordered
> by the absolute index. After this commit, when QEMU reads registers to make
> a 'g' packet, QEMU specifies FPU stack registers by the relative index.
> Then, the registers are ordered correctly in the packet. As a result, GDB,
> the packet receiver, can print FPU stack registers in the correct order.
> 
> Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
> ---
>   target/i386/gdbstub.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index c3a2cf6f28..6109ad166d 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -121,7 +121,9 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>               return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
>           }
>       } else if (n >= IDX_FP_REGS && n < IDX_FP_REGS + 8) {
> -        floatx80 *fp = (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
> +        int st_index = n - IDX_FP_REGS;
> +        int r_index = (st_index + env->fpstt) % 8;
> +        floatx80 *fp = (floatx80 *) &env->fpregs[r_index];

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Note that the cast can be dropped by taking the address of the ".d" union member.


r~

