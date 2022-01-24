Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FB497A67
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:33:56 +0100 (CET)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBunT-0004Sv-Pp
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:33:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuGE-0007Qw-VH
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:59:35 -0500
Received: from [2607:f8b0:4864:20::42f] (port=44851
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuGD-0001z1-EN
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:59:34 -0500
Received: by mail-pf1-x42f.google.com with SMTP id n32so6071054pfv.11
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 23:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c8U1cz0HEd9IgJCBG1xfmsD8ZQM/nuAq7+GOtah1T/A=;
 b=ekwu7BwlZTQqYnBVPfs/Wqgq9Ya+aqfGStgI9n3WDOzVCe7JZwli4/3zeywvInb/ja
 e9l1lNUrjSZq7TuTOMtvnuMXLlSHkUH/0Ilm2ut+XrzvRA2mKZnJp4ZIv6g+Y1qN+fCy
 pQ1j+Yro4vbo82E47rlBZv5oRM7+VOgOUCnozokrjj2XZo9+AC+SMei9QU9Z2Nz82w0h
 1CysKvgieQdO6Q0pSMMgJJI1oKA6bwEjLExYfincsnT37hGatT75zuSb9ISaibh+nO7W
 HX4WFE08VqidBBrKne3S3IL9m9wxhtBF4gonEMBG/tsq3OE7Rdh8XNRSy+06P6c5q937
 vVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c8U1cz0HEd9IgJCBG1xfmsD8ZQM/nuAq7+GOtah1T/A=;
 b=r0hBU4tR1lFnzrc2WmPd1vGHzqsVR1DbpMz8WI1y5W3RU1STAc5dThUtzPt4Osh0dv
 Al0MYJ/bxLWIX6ZwKQCC8YmKHHF7fUSuW410jp6ot7EW67WHNom/5dt3fieFSQ4ONwpI
 UIc3ocKhw3irO1jbTwk4cGQKdW99xkKbZN55Bx2eng+eyCAxlUXNVrHWWLJg7RnEHaaF
 ATdTLYFd5l7yOg7wAWFSilydGiSvtnGPUFxEbxEX770daKEfYzJV7kviK7aKw+3JyS0x
 50OjrpoVTiAnIRU33Q4y6nfXyoyH2rUF2QHZHa7wO/TZUHA9M3C8tssIdh5sfO4Ys77i
 e47w==
X-Gm-Message-State: AOAM5308OnYE6yfR/96j5f0cTl2qIVe77ovgNHP5eoEMuswhKbD+rN7x
 HGMnWn5kQo7AuGbt7k98jXoD69nrysIdytDl
X-Google-Smtp-Source: ABdhPJxu3VP8sqSvCYceMWOebKB3uOtdAjNMHVqyVhetUw7C28xdseVFWTUWDD+NT0Gx8iqvJpCX9g==
X-Received: by 2002:a62:7602:0:b0:4c6:864b:6400 with SMTP id
 r2-20020a627602000000b004c6864b6400mr13198064pfc.14.1643011172061; 
 Sun, 23 Jan 2022 23:59:32 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id s22sm15302896pfu.34.2022.01.23.23.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 23:59:31 -0800 (PST)
Subject: Re: [RFC 1/5] target/riscv: Add the privileged spec version 1.12.0
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-2-atishp@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc833a66-c0fe-931a-ab7e-e81917a8d786@linaro.org>
Date: Mon, 24 Jan 2022 18:59:25 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120200735.2739543-2-atishp@rivosinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 7:07 AM, Atish Patra wrote:
> Add the definition for ratified privileged specification version v1.12
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4d630867650a..671f65100b1a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -82,6 +82,7 @@ enum {
>   
>   #define PRIV_VERSION_1_10_0 0x00011000
>   #define PRIV_VERSION_1_11_0 0x00011100
> +#define PRIV_VERSION_1_12_0 0x00011200

Is there any good reason for defining things this way, as opposed to a simple enumeration?
A simple enum would eliminate the need for


> +    /* The default privilege specification version supported is 1.10 */
> +    if (!csr_min_priv) {
> +        csr_min_priv = PRIV_VERSION_1_10_0;
> +    }

in patch 5.


r~

