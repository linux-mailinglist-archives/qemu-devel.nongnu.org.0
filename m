Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3C58516D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 16:20:16 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQqc-000588-QL
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 10:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHQlY-0001P9-SN
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:15:00 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHQlX-00024L-5w
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:15:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z19so4741017plb.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZHvvXISPR8p1Rz7xlNIKcZnTL05gX0iYI8KEDYr+HxA=;
 b=lXMxRxpOHx4/0P2eUfByyGtnDaUr+5qKONUXeu/nrL1fiTj7XArlG3cWBHgQVOkxHb
 3LSlXatoj2ymyO74n+C0Qv+8XkLaGuFd+1lCnugdI3L/X9zZTAc5ptXZsANLBq7nMqFy
 Zr7+w9vB4OAqD1B2RMIqJ1Xk/KsvKFecVo0B22YN/QcC41Zu4TFd54qvyUvafP/S2gTB
 cFR7lupfjj47Kzrtn2+jLf7KkXX9Qc8j3zEM7qjxkYzkrSBjIimaQYyECF2RmHGPdWiA
 61UZvG4jMQEgFGkPT3UG2Zj3wPKJIIBgRMR6MO7U0OS+OGYgAjB2FHui/EutgzuBVabl
 lF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZHvvXISPR8p1Rz7xlNIKcZnTL05gX0iYI8KEDYr+HxA=;
 b=VDO6FwyFME1ROfGxbqtVU93yy7ZXeyT1kxKvUUz0qT1q6cMaryRFjnBGYbwi5JlFRb
 8UR57U9/ok4tdvhCTDwbX6iGz0VwwexrhjmT06D2I6mKnj16G8gmtRM9ThtZjzWtPON7
 uPPIR7cgvlu69s+1WwhcymYXgQxmgPfxQbPIbj3OfUojraTxiHCrhJbccILdLr5+FHYU
 Chp6W5GPCfk3zRv/9GGlQIHuNN9H4gI45ykAgyMGmZngHmE0xViEpptaKUY6IoiHz9Za
 zthQX9eHBFHps8T0nRhxv0njeldyWEKpcM4VRaJKLhG3USONCNGhW2D0lUIGw53iVSRe
 YpWg==
X-Gm-Message-State: ACgBeo3cns5kRZQ6paozl+beZPJvbRWxCUk+WidNrvUBpFuV9LkTqtYG
 rre5jf0PvL+nRxbiIbkMVwEypg==
X-Google-Smtp-Source: AA6agR5AwzEnYfyywQ5bswdRQiZakdu5GTs1zVrijT44mUluf0iW5/iUEh0zR9hAaheyjMhfgpM5fw==
X-Received: by 2002:a17:90b:33cb:b0:1f3:1219:1df4 with SMTP id
 lk11-20020a17090b33cb00b001f312191df4mr5012080pjb.61.1659104097534; 
 Fri, 29 Jul 2022 07:14:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 h26-20020aa79f5a000000b0052ab8a92496sm2907334pfr.168.2022.07.29.07.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 07:14:56 -0700 (PDT)
Message-ID: <2de87bc5-a7a5-53a9-1458-35269fd0df9c@linaro.org>
Date: Fri, 29 Jul 2022 07:14:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 06/30] softmmu/dirtylimit: Implement virtual CPU throttle
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
References: <20220720111926.107055-1-dgilbert@redhat.com>
 <20220720111926.107055-7-dgilbert@redhat.com>
 <CAFEAcA_mkeE6cKwmauTLV4c7k_=gCaPSfOM92eX6_3rnd8L+Wg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_mkeE6cKwmauTLV4c7k_=gCaPSfOM92eX6_3rnd8L+Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 7/29/22 06:31, Peter Maydell wrote:
> On Wed, 20 Jul 2022 at 12:30, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
>>
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Setup a negative feedback system when vCPU thread
>> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
>> throttle_us_per_full field in struct CPUState. Sleep
>> throttle_us_per_full microseconds to throttle vCPU
>> if dirtylimit is in service.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Message-Id: <977e808e03a1cef5151cae75984658b6821be618.1656177590.git.huangy81@chinatelecom.cn>
>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> 
> Hi; Coverity points out a problem with this code (CID 1490787):
> 
>> +static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
>> +{
>> +    static uint64_t max_dirtyrate;
>> +    uint32_t dirty_ring_size = kvm_dirty_ring_size();
>> +    uint64_t dirty_ring_size_meory_MB =
>> +        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
> 
> Because dirty_ring_size and TARGET_PAGE_SIZE are both 32 bits,
> this multiplication will be done as a 32-bit operation,
> which could overflow. You should cast one of the operands
> to uint64_t to ensure that the operation is done as a 64 bit
> multiplication.

To compute MB, you don't need multiplication:

   dirty_ring_size >> (20 - TARGET_PAGE_BITS)

In addition, why the mismatch in type?  dirty_ring_size_memory_MB can never be larger than 
dirty_ring_size.


r~

> 
> Side note: typo in the variable name: should be 'memory'.
> 
> 
>> +    if (max_dirtyrate < dirtyrate) {
>> +        max_dirtyrate = dirtyrate;
>> +    }
>> +
>> +    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
>> +}
> 
> thanks
> -- PMM
> 


