Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F031A537
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:19:38 +0100 (CET)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdyb-0002Nm-RN
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdhx-0004mj-2C
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:02:26 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdhs-0004jg-Dt
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:02:23 -0500
Received: by mail-pl1-x636.google.com with SMTP id d13so355665plg.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 11:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c0jW8f+uLR0EOQqwEQzfLGv/rCn+PF5svD+SH9wzQmc=;
 b=HKW5tAyHTnVkHKeWNL9whaHy1QwphsKUCzaMFy+OofIQ32wyVusldAJjYxCKj5kC67
 YOwC4GM2vlYOL5HIwwfPMlKebi5gDlyi/IDzJGEEIZUhrNzgZ4J1g/W2fIz+v49k5xk4
 w5UUIf+O+EzJJhUJhfedMiywPDkT9OPGsmPsn0XDcqGeFIRbjOPjTh9OpYE8/8BsOOXz
 sNq9lWH5a3De5CxrMOVCSvS0KF2AApvaBw5aHWTNWIH2fGkrdmSEas3fwh6Tpifmw/cU
 nyhdIStycPD6JSfTxe4Y7Oj3AwDF38AI5zMs5BB0HfKGwebxWerGDBhsx9YreaIzx10p
 3Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c0jW8f+uLR0EOQqwEQzfLGv/rCn+PF5svD+SH9wzQmc=;
 b=juhlxZZOpfS0Qtl+jX13aamM6zinNWQbmaGDmE35ok7zdj4hbkz2r/DRpouMfuKUww
 IPQgyHqcHubCHP7TkTda3BOOf4bESyrzjPMx79D5T8ZVxJ8XHDYIWmDScAyX9cYBMjCd
 PXh9KcMX0V803BKe0f/L1zcrB8nJ7SmWazQ/2/B7n1U+aMP7ZrZCOm2tujCZQ6pW57mn
 ItB3MZ1UdsWfVqAMw3Z02QvUgDEE9R4yIo3Xea43EFVRZnbq6JBrOsMbtURz8laLHqI6
 gXlLqYiMcN15cnCilyInluLQKb0eMD/dEXFfEmC+PcYQS8uyzgURBrsBNy2TavV1qjIz
 Q8/w==
X-Gm-Message-State: AOAM530lTMFDlJTe4hmtI91Y9/CIJKEviaiE+E+j1xadTcQ+hvBb0w5f
 hQV+irtb/w86iZsrap1a1x3VWw==
X-Google-Smtp-Source: ABdhPJzItrb7ZS5U1oz/h8OGIL5Q+rt0Z0cNuox7f49NezNBajLCSIr7D0Begkgxrjp3DYtyEJHcPg==
X-Received: by 2002:a17:902:e84e:b029:e2:dbb6:73f8 with SMTP id
 t14-20020a170902e84eb02900e2dbb673f8mr3912871plg.52.1613156538888; 
 Fri, 12 Feb 2021 11:02:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 w3sm8831321pjb.2.2021.02.12.11.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 11:02:18 -0800 (PST)
Subject: Re: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e459e06-7405-e01c-02c7-79dabf4ceb70@linaro.org>
Date: Fri, 12 Feb 2021 11:02:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210212150256.885-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:02 AM, LIU Zhiwei wrote:
> +static void tcg_gen_simd_add16(TCGv d, TCGv a, TCGv b)
> +{
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t1, a, ~0xffff);
> +    tcg_gen_add_tl(t2, a, b);
> +    tcg_gen_add_tl(t1, t1, b);
> +    tcg_gen_deposit_tl(d, t1, t2, 0, 16);
> +
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}

I will note that there are some helper functions, e.g. tcg_gen_vec_add16_i64
(see the end of include/tcg/tcg-op-gvec.h), but those are explicitly i64, and
you'll still need these for rv32.


r~

