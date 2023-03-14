Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E409C6B9B7A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:30:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7Wx-0007uR-Hz; Tue, 14 Mar 2023 12:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc7Wv-0007uC-P8
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:29:41 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc7Wt-0007nB-Ux
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:29:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so5609757pjt.2
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678811378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6hezmHLFQaD/aL90CquQVDS2uyEMHbaT5dFq32pdgns=;
 b=dDIhlkuCrrtUMNpd1B8syb9l5YZccOak0phR+DPS7/sSkmPf7sBd9yO2Oa0O5Qdff6
 6jQlTmDsE+iPK3wRRWrsNtLV72+1/s4JlWAXeQM1sR6oGjhzb7oQ/0L9NpIJUGUgF0xw
 K7P91Qwevr2HVa92czltaSyh/Qiqe67T4rMUgqqgL4eVCKz1RDg/BLJ6LVE7EKtn9SeN
 LU8Z3t20JVZoQO2QAOLDN1C8mHhp0RIvfrgekRhLw2lGke8GJ4Tan8Ytrzfny7DVwL75
 dqfQd+MloTiIrpZzsqGiDPXn3ZhHUoKiC3Hhs7+I191axh4UH17z6R28oIEhfP5uG7A+
 nkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678811378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6hezmHLFQaD/aL90CquQVDS2uyEMHbaT5dFq32pdgns=;
 b=kLVqzsVFI05+snWDQOEoDXezJHMdtqDPUgjqr+B9yY/Zl/QZ6YRPfm7hfVFupab7s0
 svvWDaL78JjW7uKc2yY8Rg4LPDj4wquUjXZB6JUpf2BnUVZLT/j7OplZF8S3rPSmP6Hb
 1KdHj5wNE6ivSci1rCGlbqBpMfW9ujInkQZzxQsKc+XpnXf38MkxUpSnNPDX65GS82Mg
 ZCdNpS+Wo0FrlCHT2aEi/pTWisi7jcmEKSqlPD+/uYce9qNSrt4FunZdZ0sTVRr2L66g
 YE/5FY63zjnc3q438YIJwxr+WYlkma9vAN+BC+XSt2fUzD5m580/8jvWWelYvbft7Vbr
 I2Lw==
X-Gm-Message-State: AO0yUKX6hcRqhNHR0+VwZiiwAFZdCM8q5n2jOLrFQehDnpn/H0eosCoO
 7jyXuX96pm6N5ET1QPcwtxNNKg==
X-Google-Smtp-Source: AK7set8uFzE8WzH+BwgTyheBvLwngdBAsihM0GgMMNWSacvyLxn5XtJEcvx5jNYLHHaQSs23D19q9g==
X-Received: by 2002:a17:903:1208:b0:19e:e001:6a75 with SMTP id
 l8-20020a170903120800b0019ee0016a75mr29686917plh.6.1678811378240; 
 Tue, 14 Mar 2023 09:29:38 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 kx14-20020a170902f94e00b001a064cff3c5sm1912835plb.43.2023.03.14.09.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 09:29:37 -0700 (PDT)
Message-ID: <090ba4b8-5bc0-a8cf-afd9-02028d863ea3@linaro.org>
Date: Tue, 14 Mar 2023 09:29:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/s390x: Fix EXECUTE of relative long
 instructions
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230313233819.122329-1-iii@linux.ibm.com>
 <20230313233819.122329-2-iii@linux.ibm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230313233819.122329-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 3/13/23 16:38, Ilya Leoshkevich wrote:
> The code uses the wrong base for relative addressing: it should use the
> target instruction address and not the EXECUTE's address.
> 
> Fix by storing the target instruction address in the new CPUS390XState
> member and loading it from the code generated by in2_ri2().
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/cpu.h            |  1 +
>   target/s390x/tcg/mem_helper.c |  1 +
>   target/s390x/tcg/translate.c  | 10 +++++++++-
>   3 files changed, 11 insertions(+), 1 deletion(-)

Good solution, reading the value from env.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

