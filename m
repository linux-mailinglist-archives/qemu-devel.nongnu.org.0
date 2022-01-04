Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081B484995
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 21:58:47 +0100 (CET)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4qtK-0003th-AN
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 15:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4qs7-0003C4-8E
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:57:31 -0500
Received: from [2607:f8b0:4864:20::631] (port=46620
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4qs5-0007zE-P3
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:57:30 -0500
Received: by mail-pl1-x631.google.com with SMTP id w7so27336257plp.13
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 12:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7B0rvgH8OLrkVG+PLkTn1nL8es6fpDcNhwXqp1j3DII=;
 b=jfV6tbh4Z2v1lCOAUmConTN5wUEBdbnRE7p2674KZAjmICS80BTCTTdMYXWRkRlU/y
 Elqa5by6gFn39X1OYXgPwx9AmycbkQ9Oj38VknYwDOKjB3sqjk8JY/CUj+zgSZBlfBnu
 TL82nvoHOcdKeY6vEGYBh47ayrUhE+WoxFAc2uglQqVIZMZggN7rWCIRiNKXdw95/NsL
 Svk/f5AtvF5VzGPQU2R1Gmf5T/AHcO6Ihkt+PllAVmzu1K9CjbrPlznUuer/xw/1r46i
 7X7WwpAlZ6JAy/0/ASa9+udEeorRhvf3448LrshlktPhv7jMuVPQnb6Ymt2H3WFvNT6m
 3t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7B0rvgH8OLrkVG+PLkTn1nL8es6fpDcNhwXqp1j3DII=;
 b=3PBKlMbPBT8/Zqy43Nt1RLik/IJRORGSqYU8YuTBcSaPVL0CY009w3aJRg9Xgv8yxC
 U5R2ybvt4+sVj9wehDfwG0GgXDdUsWqrYfg+r+ZCmI1UUyzTxD2jheeSnsU7pDclo/Lw
 QT1KmQfhJtr7nPhgRJ9vj0M20FAOrruNFUm4/JtsqyOah0yTTxIYTT++cwUi9+wTyiWr
 AXpalI3PlMS9T1G6jrS2ylsD9+khpRHudGimkQxs3tPFHZZvVmc09NOqcOThUFb0/ZHu
 4tlmPMA85qaSWqqjn4xhZp4tNsvIDUd9P7NMWjgYbiwtHjtprhjUXzdfH/nRE7BccqLo
 boSA==
X-Gm-Message-State: AOAM530uNoh1EraN18P4v/lAoSg7fpwC9uUXgqzawqoyBvF3rseVA74e
 6QwGt9Q7iGyrSieZtdG2zeisDg==
X-Google-Smtp-Source: ABdhPJwblIZOp0402YvNbxvoG6hS53htIImd4LNVqhP7hRjTEMzq5SwEDPzqDvKfEwcse173iqJ3Xw==
X-Received: by 2002:a17:902:6908:b0:149:b26a:b9b5 with SMTP id
 j8-20020a170902690800b00149b26ab9b5mr16354042plk.169.1641329848147; 
 Tue, 04 Jan 2022 12:57:28 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y9sm30281417pfm.140.2022.01.04.12.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 12:57:27 -0800 (PST)
Subject: Re: [PATCH v2 1/5] RISC-V: larger and more consistent register set
 for 'info registers'
To: Konrad Schwarz <konrad.schwarz@siemens.com>, qemu-devel@nongnu.org
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <85d02ac883c7cf40fbd54e8747783937e0370eaa.1641309725.git.konrad.schwarz@siemens.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18d1fbb3-ddff-6d3c-55a1-cbec27ac9f1e@linaro.org>
Date: Tue, 4 Jan 2022 12:57:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <85d02ac883c7cf40fbd54e8747783937e0370eaa.1641309725.git.konrad.schwarz@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 7:51 AM, Konrad Schwarz wrote:
>           static const int dump_csrs[] = {
> +
> +#  if 0
> +            CSR_USTATUS,
> +            CSR_UIE,
> +            CSR_UTVEC,

Adding huge sections of #if 0 code is not acceptable.


r~

