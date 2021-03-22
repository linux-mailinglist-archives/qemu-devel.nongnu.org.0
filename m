Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDB8344C6D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:57:11 +0100 (CET)
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONra-0007d6-JE
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lONqN-0006Xp-M2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:55:57 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:42762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lONqJ-0005jd-HK
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:55:55 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l13so12824622qtu.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ET4mSXBIbU1RcRNZ9AkWbEQxIHcNFPoQ0b6J4+AMgjQ=;
 b=ReyuFOoZaiZ4GHIZBySUjBi2ihikoPp5AfO/B66V0q3KoxgyAKehsy1FQ110k0GeOB
 2do42lg7C6uGXvS2yasACUjo1zLN49iTz52CSlwEu7KN01dlGKBModUC0/aATiFvBN1u
 86iv4RvC55DYe/7vLNu2IvsZ0Pla4KwOQDaat2IiKD8LenM6bkH7o0Iz2FiXB1IBbyON
 S75giY54GoGmkIlZuqCc4A/rhvnS7al5E2Bj6MdF6nonk4T8hXXgblPD9kzki1iz+9as
 Znn9Pt1zlKynz3GM4POK5GfnGAslXSSR/580VWdA6p4lOpvKnlPc+v0s5/5pap3Aiueu
 HfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ET4mSXBIbU1RcRNZ9AkWbEQxIHcNFPoQ0b6J4+AMgjQ=;
 b=AI6LuA4LCv3W9heNEv6eFYv9Hx0Rdv3kp6jPuXzjQXtkD/blOPhtw8nhMWhytIsqCx
 j2n1IR2jkVHFHQ9viWPxuiJn9UMPn/jx+VtdPtB1c4xj7BefB+u7kPcMTMUyMSKIro4W
 O+gqhaw56WYyVDM6XCoLcdmYixL2GnFcsVvfFFPYyoRTqhvCSrPMlK68/WZmhcv+g22o
 dPxsNHAs/41LDz/oqg5x+RZ9d5t69242ciNKV0zxCg6LGuM1CMYkDA/p8NHK3CdEICRO
 VeDQrHYyAx58G+yFcM457jfs2ceDSR9+c54gVhZ6RBY68Ro9rULHUb8TPS28sK2+BHBJ
 n41Q==
X-Gm-Message-State: AOAM530F1naOM3WEOWoUFzoM4XOlvK8HvRfGdatOxmUiaMyYuIHEWdIa
 gSEG9j8sOSdCnfejryuNFFs5akUU46ojdj8I
X-Google-Smtp-Source: ABdhPJx89jxEfsCUFaxTsGZStWwoi4y9g4WF6xaUpb5s+7UQnM2k+alr12WIxPmtaQdleH+lsoB/9w==
X-Received: by 2002:ac8:7347:: with SMTP id q7mr761662qtp.255.1616432148721;
 Mon, 22 Mar 2021 09:55:48 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 6sm9429797qth.82.2021.03.22.09.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 09:55:48 -0700 (PDT)
Subject: Re: [PATCH v4 07/17] target/ppc: Disconnect hflags from MSR
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-8-richard.henderson@linaro.org>
 <YFgUkS3iyr/k9/hE@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47d0bf1d-b423-4503-645a-0f293eb95b87@linaro.org>
Date: Mon, 22 Mar 2021 10:55:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFgUkS3iyr/k9/hE@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/21 9:52 PM, David Gibson wrote:
>> +/*
>> + * Bits for env->hflags.
>> + *
>> + * Most of these bits overlap with corresponding bits in MSR,
>> + * but some come from other sources.  Be cautious when modifying.
> 
> Yeah.. I'm not sure "be cautious" is enough of a warning.  The exact
> value of some but not all of these flags must equal that for the
> corresponding MSR bits, which is terrifyingly subtle.

Fair.  How about, for the comment here, "This is validated in hreg_compute_hflags."

>> +    /* Some bits come straight across from MSR. */
>> +    msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
>> +                (1 << MSR_DR) | (1 << MSR_IR) |
>> +                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));

Here, and in every other spot within this function where we manipulate msr_mask,

     QEMU_BUILD_BUG_ON(MSR_LE != HFLAGS_LE);

etc.


r~

