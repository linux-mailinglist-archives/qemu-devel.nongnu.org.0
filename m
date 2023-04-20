Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845776E96A2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:07:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUwD-00067h-8f; Thu, 20 Apr 2023 10:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUw9-000661-2q
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:07:01 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUw7-0000gw-93
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:07:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f0a80b686eso4737815e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999617; x=1684591617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=57KaSNq3BOpHmfh3mzVNMuK4K5d2a4fim5hbJMoJa3g=;
 b=Rlqauy9TIzQHVLFiM1KBZAmnx54KsuxyJfp1wfxkRKJCbSQ63Keo7FQpLieDz1Pak6
 jEglsMpw9brxppXxrKfc5N6y28RCsjzrJY+vjIRVAlKwdb14TIWSJ7aQESXh1tQj+vnn
 99vo3dt+vu1ga98N5o2FUjY52YcZfzuyK8t5dsOd1wX+iTANrWkPVTm5fM9RJIrWW61N
 ysrLs5hijje4pY/stMP1U6l4s+l5KctCAWWbE+5QA9GBv1MQYwEu0Pl40BPqe+uYfRW3
 HulvV4x8D9aiH5hvCZcr/dw5qBP3a69jw3x00J77KIEaDr+yCAJQwrl+2FtI1QC4YFwC
 B23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999617; x=1684591617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57KaSNq3BOpHmfh3mzVNMuK4K5d2a4fim5hbJMoJa3g=;
 b=DfR13EOOFa5mi2PAMeJW2LPrl58wwGUWLOWoCA7cNcWdOE7K7pEMwHSAUsscSQflgI
 YKDz/JfM7Q5q6SYYdFpcKSM0i/kVDEtJYBW02izkqWxLPkrfIfOUX5E2IY5ucS7kbCIa
 OesOUcM9qgJ5kcjyD1qXN0wbT5mFHE1yyFyJSM3ywqk0T4t90TysjunVs8pGutYWCzcj
 uqdm03BY15fl8HjA6fAPpdfXjbWIBY1a58WRh9r8zI9qV/G0w9e+O50SluGjSlalpBn7
 iVQhn7qI4sUbEznIrBpJHKFWJoIANPnc37eEqLgwXHidhQOfv3r3bikWMcOGb3nF2CVs
 kA1w==
X-Gm-Message-State: AAQBX9fqEHtxiV0p0qnXhsnUkHNZOav4kzzoYu2UkhWa7TbEgOR1oi2C
 BVoMESeCoDqFAtNLT+LqKEguL3QKao4wQpvA3L6XRA==
X-Google-Smtp-Source: AKy350aXSJXxWKiKg8DhZg/tIiOBpMmSVEEZ9Q4QwUUBhmAKv3B13BKKiF5mUEKIpjS2CHhk334+fQ==
X-Received: by 2002:adf:de8f:0:b0:2fa:e2a0:808f with SMTP id
 w15-20020adfde8f000000b002fae2a0808fmr1438081wrl.23.1681999617635; 
 Thu, 20 Apr 2023 07:06:57 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c0b5200b003edf2dc7ca3sm2093377wmr.34.2023.04.20.07.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:06:57 -0700 (PDT)
Message-ID: <ac914968-c26e-c97c-640e-2b08946f819a@linaro.org>
Date: Thu, 20 Apr 2023 16:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 RESEND 4/7] Hexagon: support qRegisterInfo at gdbstub
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
 <fe3efcdaf640b55d3de3ad46d8346e36b569f8ef.1681993775.git.quic_mathbern@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fe3efcdaf640b55d3de3ad46d8346e36b569f8ef.1681993775.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 20/4/23 14:31, Matheus Tavares Bernardino wrote:
> From: Brian Cain <bcain@quicinc.com>
> 
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   target/hexagon/gdb_qreginfo.h | 124 ++++++++++++++++++++++++++++++++++
>   target/hexagon/cpu.c          |   3 +
>   2 files changed, 127 insertions(+)
>   create mode 100644 target/hexagon/gdb_qreginfo.h
> 
> diff --git a/target/hexagon/gdb_qreginfo.h b/target/hexagon/gdb_qreginfo.h
> new file mode 100644
> index 0000000000..64631ddd58
> --- /dev/null
> +++ b/target/hexagon/gdb_qreginfo.h

This should be gdb_qreginfo.h.inc

> +#ifndef HEXAGON_GDB_QREGINFO_H
> +#define HEXAGON_GDB_QREGINFO_H
> +
> +const char * const hexagon_qreg_descs[] = {

...

> +};
> +
> +#endif /* HEXAGON_GDB_QREGINFO_H */
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index ab40cfc283..aa470d9ee4 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -19,6 +19,7 @@
>   #include "qemu/qemu-print.h"
>   #include "cpu.h"
>   #include "internal.h"
> +#include "gdb_qreginfo.h"
>   #include "exec/exec-all.h"
>   #include "qapi/error.h"
>   #include "hw/qdev-properties.h"
> @@ -358,6 +359,8 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
>       cc->get_pc = hexagon_cpu_get_pc;
>       cc->gdb_read_register = hexagon_gdb_read_register;
>       cc->gdb_write_register = hexagon_gdb_write_register;
> +    cc->gdb_qreg_info_lines = (const char **)hexagon_qreg_descs;

No need to cast if fixing gdb_qreg_info_lines's prototype
(see previous patch review).

> +    cc->gdb_qreg_info_line_count = ARRAY_SIZE(hexagon_qreg_descs);
>       cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS + NUM_VREGS + NUM_QREGS;
>       cc->gdb_stop_before_watchpoint = true;
>       cc->disas_set_info = hexagon_cpu_disas_set_info;


