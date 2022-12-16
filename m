Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5831864F1AA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6GDX-0002ok-EC; Fri, 16 Dec 2022 14:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6GDS-0002mS-Fj
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 14:17:54 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6GDQ-0000Iv-TN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 14:17:54 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d82so2406874pfd.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/CpWG8IoDN8HerB68+SrTxSbuHlUrsPWghPX76fRFko=;
 b=RwDcWc/t0bH8AqKCKDmdHPhxOPgPcuK78Z4mQuenWouSVyf7f8uZKx1N7KjJhvcVzV
 asXypJnKebPCIIpoDN4VzDqSOLoin7dTpTpHEVC9mNQaYDYMhd7NpmG5+VTDd9p2hP/j
 Uu9VbgMQ7fPAPQmHIIPT1uL9weKSPfowZD5IFnx1eMHGUKnb7RZiEsAVYfzljHNVm6Yf
 J7Egeii+rN25EsnLh6A6vKgM2O0qeUMKPgvj0dnjFVi3WbPECgMsGdNTwuniMZPrHnMQ
 chb1OLDOJUafNRfpyKwvCHjIC+XyKVG7xVqKV7M5xe8KNdoXYfBugILZjGLvMT1tBhnV
 oPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CpWG8IoDN8HerB68+SrTxSbuHlUrsPWghPX76fRFko=;
 b=CXMQcV9YB8gRzWTWqjpbTyFM9q4pBAkeixC/tRKnHuJZDPOuLs6Jxfb8n1zBfJC699
 X3Imw96JmqWx2a6FoHIAKYrpYXK69SBD7svLOQJkFEy3+1TJzoz5Accg526DGwpvVyv/
 YELG3hic/LgMdQMKwemoCsva+EdXMqd1EBjAQFRXBgHNT+r9u2Z1TtTceAjI7kgfN70X
 o2WFQs59+asCKqmYpw1O5AtulOrpglUKsGeX3xWGsuprVAoYyKECF0SUCcGZviIVBK4V
 YnxBadSpRpjnhriA2kh0K3rrzo1EUGiTNpG8frXrf4RN0rnie2fdBz6BIJEN5XyEfqj0
 on9Q==
X-Gm-Message-State: ANoB5pnLNEcP5JdtpllEwm1McGgJpUHR1dOslDlvH0bhF9NT+6TyJYH8
 vAaieNvVvelcC6e034iS9TcVQQ==
X-Google-Smtp-Source: AA0mqf5MFOjEXX/syHP6HrcClW5EAHMJBp4opXxetXo6vZNQCU6GIVzzpmzKx4qUvX3tLmZlm9ZlcQ==
X-Received: by 2002:a05:6a00:813:b0:578:4efa:e3ae with SMTP id
 m19-20020a056a00081300b005784efae3aemr38805722pfk.33.1671218271193; 
 Fri, 16 Dec 2022 11:17:51 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 131-20020a621489000000b00574db8ca00fsm1818147pfu.185.2022.12.16.11.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 11:17:50 -0800 (PST)
Message-ID: <839a04e5-1d5e-4506-8beb-7fc304a3c202@linaro.org>
Date: Fri, 16 Dec 2022 11:17:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 01/10] gdbstub/internals.h: clean up include guard
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216112206.3171578-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 03:21, Alex Bennée wrote:
> Use something more specific to avoid name clashes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> ---
>   gdbstub/internals.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index eabb0341d1..b444f24ef5 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -6,12 +6,12 @@
>    * SPDX-License-Identifier: GPL-2.0-or-later
>    */
>   
> -#ifndef _INTERNALS_H_
> -#define _INTERNALS_H_
> +#ifndef GDBSTUB_INTERNALS_H
> +#define GDBSTUB_INTERNALS_H
>   
>   bool gdb_supports_guest_debug(void);
>   int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
>   int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
>   void gdb_breakpoint_remove_all(CPUState *cs);
>   
> -#endif /* _INTERNALS_H_ */
> +#endif /* GDBSTUB_INTERNALS_H */


