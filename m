Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FE254B750
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 19:07:34 +0200 (CEST)
Received: from localhost ([::1]:47284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1A0q-0007Kh-Te
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 13:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19dY-0007MP-RC
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:43:28 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19dX-0001p0-3J
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:43:28 -0400
Received: by mail-qk1-x736.google.com with SMTP id d128so6810768qkg.8
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6Clif5xHsLBqWyjVZqYvLsIAOIspNIYzghgr4qtSsI4=;
 b=ITTt+OA2bRVW/PMoTp0K1jBMUkPhsAVfpofb0VRYj1+tn3KTiYAlk5E9X4kTH9kvC7
 PGZkCddb+/N2JzLLUsjEzGTfGPJKMcWwRBYcLsy72Ns0KOXQsW8qroZqlL8kEgiHNnTM
 k17fq8U2aSDJD3lUFe3iYj/227dfbi7YBJZLz1ItkBFHsgDU/nkDXmUJ7tKp09JhmvhL
 x92WjqyqeH/VUCqEAG3GvX1vloUAmdxeYQkRnypvs0lPsU2PNLNz6lqH284uqaYsKQdT
 QWOxQn2hPfEBA9SQn2a40oLslW4VDeqrlKk5PAYy0yXKPD2EAgVEjwhB0ZQIflsKMVaK
 L/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Clif5xHsLBqWyjVZqYvLsIAOIspNIYzghgr4qtSsI4=;
 b=I/1wbbbSr/F1wtZ0VdHs9AX+TTXIttFf/TKBQbS1yn0YeBfDOUaQOyDEFrhHZHaM7r
 CMeMuhvmws0PIQXVggzM6yMRTAeoljzg+g02unE2Ns/1ClMDYbXkAWtYFGau0bQyZN5V
 eQTSxJJklDkQH5PAmDigRiQxBV9e2+tKEldpp9hlOC10JXMs5OaJcTUwHRWimeB+P3xJ
 gbcZhZGqQJvWKvxDQVm6mg+gTex9/0FcZpCUOVxuS6FJp4YMRo2qUjFfvQ5SBUIg3ATG
 7w6uvaAZCwYuqr20iwL9nIWSswotypHEYs6gIHC3W0yK6wTst3LXYyFHtrUYSeUkmrsv
 /JKA==
X-Gm-Message-State: AOAM530ubJVGv9S074fhk3fk2pIurEil0i+Ydi2i6cmMzIbleEh60Xmp
 Xw7Ny2z8v+imfcwXaVka9QBl6uxhY4s95w==
X-Google-Smtp-Source: ABdhPJw/9Y02DJ3ZyXp+CiI0GC15RYEUBx6W1PZOLeMq8ChoHCdpeEmb1lUBLTGjVUQZkwKz6J/qlA==
X-Received: by 2002:a37:a1c4:0:b0:6a6:ac4f:1d3f with SMTP id
 k187-20020a37a1c4000000b006a6ac4f1d3fmr4625658qke.666.1655225005607; 
 Tue, 14 Jun 2022 09:43:25 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:4827:adb5:6bfe:ffa:b215?
 ([2607:fb90:806a:4827:adb5:6bfe:ffa:b215])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac853d4000000b00304e38fb3dasm7412819qtq.35.2022.06.14.09.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:43:25 -0700 (PDT)
Message-ID: <a9539054-044f-7cfb-8de4-a5b821679b6f@linaro.org>
Date: Tue, 14 Jun 2022 09:43:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 7/9] target/loongarch: Adjust functions and structure
 to support user-mode
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-8-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614090536.1103616-8-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/22 02:05, Song Gao wrote:
> @@ -172,17 +173,20 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
>           update_badinstr = 0;
>           break;
>       case EXCCODE_ADEM:
> +    case EXCCODE_BCE:
>       case EXCCODE_SYS:
>       case EXCCODE_BRK:
> +    case EXCCODE_INE:
> +    case EXCCODE_IPE:
> +    case EXCCODE_FPE:
> +        env->badvaddr = env->pc;
> +        QEMU_FALLTHROUGH;

This is incorrect still.

(1) env->badaddr (in this patch renamed badvaddr) is actually unused prior to this patch 
and should go away.  It seems to have been copied from RISC-V?  The correct LoongArch 
variable is env->CSR_BADV (see raise_mmu_exception in tlb_helper.c).

(2) EXCCODE_ADEM is on the wrong side of this FALLTHROUGH.  This is the exception raised 
by TLB faults, and should retain the BADV address of the fault, not the faulting instruction.

Also, this patch is trying to do too many things at once.  Please split it into smaller 
logical changes.  Any bug fixes for the system code, for instance raising EXCCODE_BCE 
instead of EXCCODE_ADEM for helper_asrtle_d should be completely separated.


r~

