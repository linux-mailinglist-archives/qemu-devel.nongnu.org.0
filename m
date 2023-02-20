Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10C69D1D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9Yy-0002cn-5s; Mon, 20 Feb 2023 12:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9Yg-0002Fg-Px
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:02:38 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9YZ-0001tK-BR
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:02:34 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so2302779pjc.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HVRQyqup4az57zrZTPY5EdqY6wwi5xf0l6siXyuRrw4=;
 b=SESy83V8i23mYOCWVSNXNHsew1DXlDBQDCbJOqnoAEGxPMYuXUTL9CiIxutO/GXRai
 XT+EC4EeHoQ102uthI0suWJOTPHCMwZphH1wfpbb3iywNJJj9lBwXAAuobBPP6sg5oCb
 nlnXH2ziTpOMViJ/B08PVb9HEqo86VUJ+wsn4HTcAndvr5/CvGYYHsHsEh2R9XrOyYzA
 5+iwg0wP4qW0sGRCNJJYtugz8zAqNnrFcP5JjUCPHrSlM176k27N9XxkHvtr8cKbxUAL
 FmkYV7RllEjmijnxxF/hhC3gi+OmMZYs9xEDnMfvoM7neTIoxMfAV1v2STZEEKH4kXae
 gmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HVRQyqup4az57zrZTPY5EdqY6wwi5xf0l6siXyuRrw4=;
 b=7mh/B5KZrXo/7utBAjLV0h6cWDsFydtHtg0uZCDz2SFpNkTGTesiu8X/E8DEfcvtVn
 2YIeVKVmZjQwAEtMMPw3FgUn9VBGQZjnP+KqqHsQUPcuQhodaVf9rIR+LIp7LDy+00D2
 jG9QfkJk/e1cOvRAS0A/6gbOyQiaAKOK4WnOxmPP8K1Goy+aSb9pD+YGPDO7SU5LSp8I
 +Uq9dUnliZBcS4GeVOsO+JWY7I7XExYLHv73GOTAbrw6oN3N06X6S9mBbSSB3tCGdgut
 suhoWfFjWOX/M5DU+i7nOWmwEBI9q1VaEM/Oogg/B0wjVmGnxykiC3c6XN3n/ZP/BCoW
 gK1w==
X-Gm-Message-State: AO0yUKVFxJV474FrThuA2q4NgGMBCS6GvNNPEDUg3/tgZOtWxfbn7X0a
 63MKAGF23rjorgQF3r1IfDgQhg==
X-Google-Smtp-Source: AK7set+vBN02IrYQuLuqQ/rCb0b3WCTfNkAtnC6/F1xTuQDctn+9mKYcJW3JpqFq37CEWFA5U/ARxQ==
X-Received: by 2002:a17:902:d50e:b0:19c:65bd:d44b with SMTP id
 b14-20020a170902d50e00b0019c65bdd44bmr2025953plg.60.1676912538995; 
 Mon, 20 Feb 2023 09:02:18 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q5-20020a170902c74500b0019a997bca5csm8162167plq.121.2023.02.20.09.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:02:18 -0800 (PST)
Message-ID: <9599dcdc-d413-215a-941c-79ed61ec6ef2@linaro.org>
Date: Mon, 20 Feb 2023 07:02:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/27] target/s390x: pc-relative translation blocks
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
 <e7b799a4-c718-00a4-9107-9ea222fdd162@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e7b799a4-c718-00a4-9107-9ea222fdd162@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/19/23 21:57, Thomas Huth wrote:
> On 09/01/2023 21.07, Richard Henderson wrote:
>> This is the S390 specific changes required to reduce the
>> amount of translation for address space randomization.
>>
>> Changes for v3:
>>    * Rebase and fixup conflicts.
>>
>> All patches are reviewed.
> 
>   Hi Richard,
> 
> as far as I can see, this series has not been merged yet? Were there any issues left here? 
> ... soft freeze is coming rather sooner than later ... do you want me to take this trough 
> my s390x tree, or will you take it through your tcg tree?

No, not merged.  I had assumed this would go through s390x tree.


r~


