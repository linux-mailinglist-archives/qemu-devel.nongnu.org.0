Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7C5EEB96
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 04:18:43 +0200 (CEST)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odj8L-0001W8-MK
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 22:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odj6k-00009F-RZ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:17:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odj6j-0000cb-1V
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:17:02 -0400
Received: by mail-pf1-x432.google.com with SMTP id y136so202387pfb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 19:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:cc:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AW6fX97A/+VZzqUllx5Pwq1kstnxmVFXzWYYUOqwdio=;
 b=EsDcxs/dNzGCyl6ZlETFmoIcP+i1prMJbo/PcXklcpWJdTsigX2ZjZVQNv3CvdqyME
 SI49tGXlgCJJ3uhAnSqKO+kDUNNg3TSueaQJMmmwGLp2AFDf96/BXUmr4eJtLgSp05sz
 41Dxs/neTfb9lTsq+qAnNnpPJp5gQbdOs4sj1vzYVLDKVJbHwG0EgrrZUjkYJOoeKFSv
 RXPZUVR/A8mx/KDmkCVcVa1eaclgrzv6FZgOVVACphaBPFoiiYaeNkbAcQ6SYUTlOSYP
 LP42vHLn08Eo6fw4R5oegwcYPk5hjjvza3j54QJweQbrIM03xpvYEwG2MqaHeb1zYfnH
 XLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AW6fX97A/+VZzqUllx5Pwq1kstnxmVFXzWYYUOqwdio=;
 b=r+EqNuTLp03ddZIwem8POXgfxH3Ah2H07ES++KbJFcaSP24e8eYZRE5ncOQGWsZiPZ
 Y3Eo9cfmc/lewH/OYSnaunH8KJtti1lRkPiisRFWqIrdcUFa+WEo8fCnxxCZpArl1Z6H
 h3z3trs1innZQYZVe+udBCBigd00f9izl2DMT0kHw29wWOH+W2r/i415RhM64Yze8wNz
 RT7NOeT3SP0mcoUEuXFvnHkQ/1Mx7TAQQJIg1kFg0mPJ6a5JHrryMe8RqfvGWs0FYFOl
 MNeOt67MEtnXbFUf4Iw0G3TodUC2seRndkAqPAQNSqOfjBGan8tg/WaoWa6nft04HR1F
 c4+w==
X-Gm-Message-State: ACrzQf188kvYz58q/UcwnHeSKQRmYmt8+3/bmMUkhWhysqqZmjDzSWdq
 d3ibEgnHTEbGK2s4M6yDNQTjJIoJ5piOpQ==
X-Google-Smtp-Source: AMsMyM6PAgHz4V2EYvWyJ+tHqpEywRmGb5rat2bClBNgoib6PsN3+P9YaJuljyMww094oZdjFPPxAg==
X-Received: by 2002:a63:5246:0:b0:42b:e4a5:7252 with SMTP id
 s6-20020a635246000000b0042be4a57252mr766208pgl.566.1664417819574; 
 Wed, 28 Sep 2022 19:16:59 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a170902d48800b001786b712f0esm4501838plg.227.2022.09.28.19.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 19:16:59 -0700 (PDT)
Message-ID: <788dbfca-75ae-154d-f4ff-c1abeb3adef7@linaro.org>
Date: Wed, 28 Sep 2022 19:16:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 00/17] tcg: CPUTLBEntryFull and TARGET_TB_PCREL
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220925105124.82033-1-richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/22 03:51, Richard Henderson wrote:
> Smooshing these two patch sets back together for review bandwidth.
> I hope to make this the next tcg-next pull.
> 
> There are three from the first half, tlbentryfull, which are new.
> These are following a hallway conversation with Peter about bits
> in MemTxAttrs that are not actually related to memory transactions,
> and infrastructure to address a to-do in an Arm patch set.
> 
> There are a few patches from the second half, pcrel, that have not
> been reviewed.
> 
>    07-target-sparc-Use-tlb_set_page_full.patch
>    08-accel-tcg-Move-byte_swap-from-MemTxAttrs-to-CPUTL.patch
>    09-accel-tcg-Add-force_aligned-to-CPUTLBEntryFull.patch
>    10-accel-tcg-Remove-PageDesc-code_bitmap.patch
>    13-accel-tcg-Do-not-align-tb-page_addr-0.patch
>    15-accel-tcg-Introduce-tb_pc-and-tb_pc_log.patch
>    16-accel-tcg-Introduce-TARGET_TB_PCREL.patch

FWIW, the target/sparc patch fails (the peril of insufficiently tested airport updates), 
so I'm going to drop 7+8 until I have time to investigate.  I'm also going to drop patch 9 
for now, and present it alongside the Arm patch that will use it.

But otherwise, gentle ping.


r~

