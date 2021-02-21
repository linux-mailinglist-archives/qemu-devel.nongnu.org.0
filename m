Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E4B320933
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 09:34:53 +0100 (CET)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDkCa-0004vL-07
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 03:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDkBe-0004Wg-UL
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 03:33:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDkBd-0005Ox-Lu
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 03:33:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so15716708wrz.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 00:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iM0CGfY0nD2VubWO/NZLUOFLudJ77Vh0k2/oF8p2yT4=;
 b=phBX7/+fQ0FnWk0AYmhl7He8mZ6SgWhXJUu4z2M/6O1515VcSyeljzpbUSSnz7TSme
 7vQOc0C/l6Bfh4GHlKUi7OJoRxhgcgzSteteODYo9vX9r4lyqWsMzAB6RgGaZ4mqlu+g
 6uLBP4TKyHfP3mGfo0MPOgxp141bK9JU5o54uKQMYeopfPq+CTCFHbiX+JcRqDRRbS8n
 MiVTfvuua5DPz4uH8sThTGTuCfOuoSfEg3xk/0m+u2vVXjX6eUhmU106SfZLzTzFYqAO
 Xv6OLeW0j9uDYwF2RKyYXr5Mogy0E5OkREvNf2q6OuJcKUxVxsZASHsNFqMqZ1mKvGPP
 pAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iM0CGfY0nD2VubWO/NZLUOFLudJ77Vh0k2/oF8p2yT4=;
 b=alW9rBf2a40VpF+RM5HcToIiHnbE9tC2IGbfx3FMJuC6k7rUQ0dbwihcwAIaFdFGzm
 7OZnCpoKxns9cw7FeAAGftOAQVYxAzGEs17angoDCJ5F9tC80mDoJTUMNvxaEorQABok
 NgVd2VKZ6wz/73oOuBKFjh8bUF51d88jOklhn0lTHdmz9qbRsT4Yh+9I5iljQ+xwQSCg
 zKxX1a+JD+pT8cVuvv0ZydGMwI71eg3fEhUs4QlSzti+oZCysLM7Ngv8UT/plr6UOUoo
 0vPetPahJRdP4v2PdEZVGqV6KivD4Ylwwb7KzT5Q34VWSTClp8qGgNeKlwb1N9Tj91IF
 sH6w==
X-Gm-Message-State: AOAM531eDYYoDmLuJwPPssKAyYJSHIkTYGBLiNiqi6EWQcYz4Hs4ANtt
 UF6/t4ppBeELyQc6sGH7vOI=
X-Google-Smtp-Source: ABdhPJyKCTTiBu0oU8aMZsDS6SRX7luoM33Of5x3MEeRI9H/GrmfULwUOKxDgpy4P7ASyGoNSAtwsQ==
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr16568101wrx.261.1613896431894; 
 Sun, 21 Feb 2021 00:33:51 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d65sm10903386wmc.34.2021.02.21.00.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 00:33:51 -0800 (PST)
Subject: Re: [PATCH 00/13] target/mips: Replace integer by MMUAccessType enum
 when possible
To: qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0f2e1c1d-4c78-5bc1-58de-4b3664e99075@amsat.org>
Date: Sun, 21 Feb 2021 09:33:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 3:41 PM, Philippe Mathieu-Daudé wrote:
> Taking notes while reviewing commit 671a0a1265a
> ("use MMUAccessType instead of int in mmu_translate").
> 
> Philippe Mathieu-Daudé (13):
>   target/mips: Remove access_type argument from map_address() handler
>   target/mips: Remove access_type argument from get_seg_physical_address
>   target/mips: Remove access_type arg from get_segctl_physical_address()
>   target/mips: Remove access_type argument from get_physical_address()
>   target/mips: Remove unused MMU definitions
>   target/mips: Replace magic value by MMU_DATA_LOAD definition
>   target/mips: Let page_table_walk_refill() take MMUAccessType argument
>   target/mips: Let do_translate_address() take MMUAccessType argument
>   target/mips: Let cpu_mips_translate_address() take MMUAccessType arg
>   target/mips: Let raise_mmu_exception() take MMUAccessType argument
>   target/mips: Let get_physical_address() take MMUAccessType argument
>   target/mips: Let get_seg*_physical_address() take MMUAccessType arg
>   target/mips: Let CPUMIPSTLBContext::map_address() take MMUAccessType
> 
>  target/mips/cpu.h        | 16 ---------
>  target/mips/internal.h   | 10 +++---
>  target/mips/op_helper.c  |  9 ++---
>  target/mips/tlb_helper.c | 78 +++++++++++++++++++---------------------
>  4 files changed, 47 insertions(+), 66 deletions(-)

Thanks, patches 1-6 and 8-13 applied to mips-next.

