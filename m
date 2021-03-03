Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BD32AD00
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 03:12:23 +0100 (CET)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHGzu-0007TY-Bf
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 21:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHGyS-0006c0-SB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 21:10:52 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHGyR-0001be-8K
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 21:10:52 -0500
Received: by mail-pg1-x52b.google.com with SMTP id n10so15168424pgl.10
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 18:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Enql9yDu4Rvpi3kLJhRxKXXS/660zWOX3TfsKcH1Di8=;
 b=bfYc0oXr3NVAvxNPpsZPb7xECUWm/s66CaGiEH9sXWpFKOPouGjlZc2MzVO4Y9M2BE
 7T+fWyjgIK+rkWgGJ71guv6F8ZckOEOEhL+MCK1aInP/v2XB00K1/CN3aZCozrjUv57q
 wcc9l63sNU302pjgjsEAFDPpXG8KBQJWz1u6BK+plx9Nr4Kp2EKMe7z7UlZ8+Dq5yxpR
 gVjIPkierR6Hqfuie4r2E0342bVafnvtW5kyxP2yMflKaeFnoUN/T7L+2cmxEkzJi/n1
 QX4mPtc5XH+iM3gi4kTaOkKa+Sreqrt9/0BMAj3qBUogMearD72zzmcV5Z9ffrFb8QHF
 9PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Enql9yDu4Rvpi3kLJhRxKXXS/660zWOX3TfsKcH1Di8=;
 b=nNND5LUuDHqj+Hvb4iRLKRzKBgtwiaxgLstfwhDEUJR2/rqNBHAoDkRAj6ZEuPMOkN
 tOlrtfhsTUzBWQuTp24novkjIw1IuudXewH6a7Xx7Cm5VFJgntjJxZ+pKwGnTNf2VNwz
 F3kDr9HCfk3kcKcFmXgCvaZlMKO7ocQyWimph89LIqPQ1qxIftM2iPlOMISrcjp2aX0+
 WO0xRDXcmIIOTWhraXvXcuk4kt2Df4pJknok1/QYuiGZRaaK//Zmi1I5srOcVCylm6Xj
 bXnke+EJPqoprMcgzrTkxEPSen/8HJ7ZJYQySxU/jQrI8V0kFo60WmP67hzsdh4SvsYP
 N4dQ==
X-Gm-Message-State: AOAM533WJMgQMGHMoavGv2rbsS+pRNDN4k+2KVrX4Lb1+lNxewD0txKq
 rcdhJrMIy294pjoVtvlVspUSYA==
X-Google-Smtp-Source: ABdhPJyR2mdvezfDo+uocu7RichmZtDOvQCY11xTcOVayGK6wjk++xM785zwP/Q9PQMO5szR9uIjgQ==
X-Received: by 2002:a62:6402:0:b029:1ed:b92f:2fff with SMTP id
 y2-20020a6264020000b02901edb92f2fffmr892562pfb.16.1614737449730; 
 Tue, 02 Mar 2021 18:10:49 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x14sm22786444pfm.207.2021.03.02.18.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 18:10:49 -0800 (PST)
Subject: Re: [PATCH v2] target/s390x: Implement the MVPG condition-code-option
 bit
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210303013915.3122076-1-richard.henderson@linaro.org>
Message-ID: <5f8d0e14-e6c9-f686-0cb8-305f772381f1@linaro.org>
Date: Tue, 2 Mar 2021 18:10:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303013915.3122076-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 5:39 PM, Richard Henderson wrote:
> +    ok = probe_access_flags(env, vaddr1, access_type, mmu_idx,
> +                            nofault, &haddr1, ra);

Bah, I confused myself and remembered the wrong interface.
Expect a v3.

r~

