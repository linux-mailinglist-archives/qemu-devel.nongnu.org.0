Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8A7597420
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:28:37 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLuG-0000y0-G6
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOLZW-0004rM-KG
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:07:11 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOLZT-0006D1-QN
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:07:10 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so15642497fac.9
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Iph7ugWS879yvH6bSKGSy50Fg0VVRY7/KhH7FVNA/VA=;
 b=nY0cP+F2g4zr9EWkQynG1AcR3GT5S6zE8pjui4VBku+hWeUkUbCNJuxwqkLnhIw03a
 YX1MXi8dTDy+NsHzneIVvmEnC02hbFL5GgH/hLNw911kXELLmaGJvYOg6N9z35aoQyr2
 jqwo7bQP9Q0BQ3Z9cz2qAO5WY6brMV9/L/Vclm4bRRlSVAKSDiRTbs+hX7LiAHhsvlEX
 luAjJwL/NFkI5mqnRkD5i1eSdQqYt2+wbNDRtDM282bkqXMcQiEPln4oNo0HFCOk2kLZ
 yrJWvLOjlQuAABY6h/VAyZxrbmVXmvbNlhO+O5qUBqlJu1gEC1/mhhHOd1dRap+NT+Y0
 DneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Iph7ugWS879yvH6bSKGSy50Fg0VVRY7/KhH7FVNA/VA=;
 b=IB5Jfulh3x0SVk860gDXySizq5e+lUj7uI7dIGgQ1Oo/s619UeK5L5FqRbmPZUpWy9
 TIIdiXcQhYA1feY2hdXj0Kj/HjTHsMLzUgBZbscY8FXL0bFkIJTydCldWGsSzRzOQkNK
 lcClliG0msicqBhPY4q8o0f3DyC1oaTVc1+py5+XAmj/UozEObKuBIP+ZIbPTfEYVOzk
 LLut8pisGFjHgM5ykOwwnaVH8QmJQvYVDSDTSFAIusZf3PtptXOh3SYeSRH4FmyGT9+z
 UFCVHqGVYIL3r1s1mI+IbYdE4XbSJxFBLYeujdZF2U8rRFS+WfwbFVAOGUxbZTRShHt6
 pBQg==
X-Gm-Message-State: ACgBeo0FBBiKy48tdRAcKOOgnCIVQjSamR6PbajEzWaOYhGnMkDjtj46
 S3IXbvEWOhK+/C1jNCYDFelcpg==
X-Google-Smtp-Source: AA6agR4/TiGqT6A2aqk9DCc4qQwiQOFqvKoPbYe4X+4Ia0Uo3qV8UefzNLsqGfrKkmChUuuZ6t/2tg==
X-Received: by 2002:a05:6870:c10e:b0:10d:9e83:57bb with SMTP id
 f14-20020a056870c10e00b0010d9e8357bbmr1938410oad.177.1660752424392; 
 Wed, 17 Aug 2022 09:07:04 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f5:5571:5caf:c046:6d11:3902?
 ([2605:ef80:80f5:5571:5caf:c046:6d11:3902])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a9d30d2000000b006372969fbdcsm3432213otg.26.2022.08.17.09.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 09:07:03 -0700 (PDT)
Message-ID: <64514d74-7711-86bd-161d-3520cc3132ca@linaro.org>
Date: Wed, 17 Aug 2022 11:07:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out of
 tb_lookup
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
 <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
 <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
 <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
 <cc2cab12-2dda-25db-5696-fe13971db467@linaro.org>
 <f8a922e90a624453bd86ea0438b3562cc4b809a6.camel@linux.ibm.com>
 <fbccc410-3599-9e31-82e7-a9a20caf8d53@linaro.org>
 <38090dfe48a64edc49a23dc88e42dfc0572567ae.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <38090dfe48a64edc49a23dc88e42dfc0572567ae.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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

On 8/17/22 09:07, Ilya Leoshkevich wrote:
>> Oh my.  Well, we could
>>
>> (1) revert that patch because the premise is wrong,
>> (2) go with your per-tb clearing,
>> (3) clear the whole thing with cpu_tb_jmp_cache_clear
>>
>> Ideally we'd have some benchmark numbers to inform the choice...
> 
> FWIW 6f1653180f570 still looks useful.
> Reverting it caused 620.omnetpp_s to take ~4% more time.
> I ran the benchmark with reduced values in omnetpp.ini so as not to
> wait forever, therefore the real figures might be closer to what the
> commit message says. In any case this still shows that the patch has
> measurable impact.

Thanks for the testing.

I think option (3) will be best for user-only, because mprotect/munmap of existing code 
pages is rare -- usually only at process startup.


r~

