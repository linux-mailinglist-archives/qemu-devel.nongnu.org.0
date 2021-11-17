Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D44541A0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:09:22 +0100 (CET)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnF4L-0007Xp-GG
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnEuv-0006Me-Dm
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:59:37 -0500
Received: from [2a00:1450:4864:20::334] (port=43551
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnEut-0005hb-J2
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:59:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1279865wmz.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 22:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n6wI3TrNBEAFvbJzoYrlIV7GvTVXmn8+o2K99yRC/co=;
 b=nsnR1FWku/5aTxKEv/Qx1v8A2KnSHQmyy8ng8k/MiFjg3ZZGrs33eO5e29ACqfQkyB
 prI5lDM9t3U1lAhqzIFHHous1zLuhY2d5iUKLECUif16IFaY0k6JvHtC0YSfdLNr7FJw
 oykBKVevMQzwkyjl1h56KPOnuzWbJvFGqVh3fJ+W7kkIfOpsAmY10kFsD5fLYQKDAL6Z
 GbI++RIwmR2+gmhtJQYH2yVSSHPtx4XYlqtLl142pDE6Fa+s5QM/l94Cnqy2v8RJc6aL
 Pw9V1Obz8zcLuB3Esu38jTqJ4KHxm4JPJWaZqrHHrEBcSrnzCjiTFgrhHOTt7UhE8bfe
 TY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n6wI3TrNBEAFvbJzoYrlIV7GvTVXmn8+o2K99yRC/co=;
 b=kAhPXeeVZon4eak51KBogp8CoJCYgZsiSGMrCH4DzV7coF84hHXGrGJcgUPvSgx8VN
 7CoHv73rB8rQm+qxvROXQQImCZgAyboTKsclUaFTGW39RBdM8v4VOG5303/AwoZXP89Q
 To188a6bnwZIsJ+NEVRhAhUevUCg7uB6dDXiSfslp1Svt4loS9AIQoYcFXBoR821ZkLY
 9kUjS06xvvCcZQrhk5/rCoZmMkwW1y1eKT7cl/QtjUB+5HW0ZmjdlNc93VRQqqXJYvri
 +NmrEUGLYH1rqELUjaMA5EdgdFOtiG3/zvM8NIJWnSaka0UDZWIy60gce3tUGOgatiWu
 dmAQ==
X-Gm-Message-State: AOAM533g1ZKehQ/p/z0+Jfi7N/vEGJJ99RBxcDRwuEXZ5o8is3pHqlx5
 vjz0yy9z/KDx/XHBVHfRGHrmIA==
X-Google-Smtp-Source: ABdhPJzl+EMUNNaFdKau7r9U9H3yoq1BCFOlTHQSZhgvwaj2OBCm0kh5Lm9cPSQ3MbiiaWtjf+VOxA==
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr74815373wmj.14.1637132373374; 
 Tue, 16 Nov 2021 22:59:33 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id o26sm4526866wmc.17.2021.11.16.22.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 22:59:32 -0800 (PST)
Subject: Re: [RFC PATCH v2 07/30] target/loongarch: Add MMU support for
 LoongArch CPU.
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-8-git-send-email-yangxiaojuan@loongson.cn>
 <d7ad6fa5-8a9d-15e2-8dcb-7499309c7681@linaro.org>
 <4c351642-a783-84e0-5b08-6b8ee164b501@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b0556468-ed50-df7c-9fdf-c8d6fec1e1f2@linaro.org>
Date: Wed, 17 Nov 2021 07:59:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4c351642-a783-84e0-5b08-6b8ee164b501@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 7:37 AM, yangxiaojuan wrote:
>>> +        *physical = (tlb_ppn1 << 12) | (address & ((1 << tlb_ps) - 1));
>>
>> TARGET_PAGE_SIZE.
> 
> Maybe TARGET_PAGE_SIZE is not fit for a huge page. MAKE_64BIT_MASK(0, tlb_ps) is ok?

I meant the first << 12.  But, yes, MAKE_64BIT_MASK is a good improvement.

>> Bit of a shame to have a linear search.  I guess it's ok for a start, but you'll find that this function is critical to the emulation speed of qemu, so you should think about other ways to organize the data.
> 
> The stlb search by the set, the mtlb uses the linear search, I have no other idea, do you have some advice?

Well, stlb are all the same page size, and duplicate matches are undefined.

A hash table of the valid entries might be workable, with the virtual page and asid taken 
into account.  I'd imagine that would get you down from 2048 comparisons to just a few.

The mtlb entries may all have different page size, so I don't immediately know how to 
search them more efficiently.  But there are only 64 of them.

It might be worth having a couple of bitsets that summarize the valid entries.  This could 
be used to search less than 64 mtlb entries.  It could also be used to influence the 
"random" selection of a new tlb entry: always select an empty tlb entry first, then evict 
a random entry.


r~

