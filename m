Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF392F8E50
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 18:32:01 +0100 (CET)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0pQe-0002LD-EI
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 12:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0pOH-0001la-HT
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 12:29:33 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0pOF-0007y7-Rk
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 12:29:33 -0500
Received: by mail-pj1-x102d.google.com with SMTP id v1so6846897pjr.2
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 09:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oN0EmZZUtxQ8kdP/PJs75bmD9Luf3uqCbe74b3Faex4=;
 b=X/NFqlQGKhgZuV8XTkgqPxAkZCJqcjpe4H6zfrz10v/olKjJP1hf6PpD9hx5K+MQFG
 KqTy9nyNig2N3A5Xp9nSdG8al78BiwpbfMS63jemJdVR6NFIfEGNMwe/00OY5mEZJPNk
 mVuAIO8Vy2WilouhYj5gzFagOTpdL8wAZhIIKemYbFi2CwXh3MbL9vD7Ue0M+kNVRzY5
 4KimrDv7twGHAwUVk+vBAib5KhA+nBIb1LcBgtmp6IAIonQzW+E8nhgwO2aYJP42Wy12
 xIeO70quCxpBM96gH2PKeFrOQf7r9JdDc+XWQ4A/rjbT1irEJKhEH+YwOcCd273E3S7d
 ZzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oN0EmZZUtxQ8kdP/PJs75bmD9Luf3uqCbe74b3Faex4=;
 b=QyFh/TtaI5k8ENt4NnbQY/6pBeT/9025URTQiY5G91qGB9xTO3s8oRcMBNYPFo/vj4
 h47oLUzrkTC3AWkiQ/wiF/K7S4r59zZx5ojNCX4avDcwOjlLhVM7zjIz5Ylnr/zRRGeD
 7R30GwgQDowWyrCsYdShwFBMxNLeafj3lnLkobEA6ZVwaVvuA1yYDrKooQsfUTMe18NM
 QB3ijZgWYM1Jar0w7DqhUJZLsXH2oUXMD8vd5KJJGXd4td2ZSykt5s8oOvQQsgRnuDQ1
 yhJl14zkYZ8hvWTBgJJTHE6uX8l7dDAJlbcYguNwrbfy+sPozdJAQ681RfobXxiHPrjb
 z0kw==
X-Gm-Message-State: AOAM532tFZ9ddF9asRAMgL/pQVdUBO/vdUYx2B8VkPpao8q/eLQEP8p7
 KpBJHoUxNVOBF1avA0/0uftG+A==
X-Google-Smtp-Source: ABdhPJztThGsozKm1ntzcO74HmDebpT7pKRS510RXDW508oOlA67KGt/2Btl1yAKHcG3hPN7dP1Yhw==
X-Received: by 2002:a17:902:123:b029:dc:27b:3c62 with SMTP id
 32-20020a1709020123b02900dc027b3c62mr18221644plb.16.1610818166976; 
 Sat, 16 Jan 2021 09:29:26 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id gj1sm11057373pjb.11.2021.01.16.09.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 09:29:26 -0800 (PST)
Subject: Re: Recent TCG commit breaks PPC
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
Date: Sat, 16 Jan 2021 07:29:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.039,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 4:38 AM, BALATON Zoltan wrote:
> 
> Commit 8fe35e0444be (tcg/optimize: Use tcg_constant_internal with constant
> folding) seems to break PPC emulation for me:
> 
> Thread 3 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
> [Switching to Thread 0x7ffff51e7700 (LWP 22636)]
> 0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90, ts1=0x7fff8c001510) at
> ../tcg/optimize.c:68
> 68        return ts_info(ts)->next_copy != ts;

I don't replicate this assertion.

Interestingly, I replicate a different assertion:

qemu-system-ppc: ../qemu/tcg/tcg.c:1210: tcg_temp_alloc: Assertion `n < 512'
failed.
Aborted (core dumped)

What compiler version(s) are you guys using?


r~

