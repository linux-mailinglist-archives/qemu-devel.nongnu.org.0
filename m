Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7C4D21C2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:41:09 +0100 (CET)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfhk-0003qE-TP
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:41:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfcz-0007uF-VB
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:36:15 -0500
Received: from [2607:f8b0:4864:20::1033] (port=45885
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfcy-0007CO-F9
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:36:13 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so252744pjl.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3PI3Mq05ItURVlomeT6r3F6paRPilOAx0oNlIsphaWc=;
 b=o4Yr+2VPjFRSMzu09VFUIapEsn9rkyQMAvrH6vfo76KS4emNMeW920uZAOibn0ASZy
 EBKkJ4JUnf7gNOYe5WzASJoC6YmWJ6SlBWMvsjU1ibtP/B198gW6vRpLP9TAI3lhWSEF
 r7CuOviyLxEUMVJg6/ORmQWNFPakkE8xX50jtRqFH45kor+5XgngDQefQMWih89vsIxi
 ObH6zd4FDLQe10ny1YWGdf5qBqrc//RQQj1Wxq8/Ohm85kWNp0pT8ZnOQSTb3x8ujFvP
 tVteAmqMiaJsnmoc6Vh8HEyAFNaCl3woCL7JUBuUNY5qJdbHQv5jFbBAO/Zsr7TZ5dg8
 ul8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3PI3Mq05ItURVlomeT6r3F6paRPilOAx0oNlIsphaWc=;
 b=ZPtZBZ63AJxUIUdDioJGyOOMXK2tiBy21tp1KyTUfxgpbUc5j8dMO8QrIqQp8kkm7O
 u2WB8iKiINhB0TWG9wdeTJPgsajT3o3XUPVTFi7KCMdPJ+U7oSV96MFC03Hx2AfNprbv
 Up1Q9xkX0LsPmxyF0qk8tfGDmVal9Qfc8SvENDPaptg8MaoiuzuY9T9vvIESdzDdCtTb
 HH8IfnVVpwkVgaP9j+aMiPVluE8q3ov296J+zPxiVavQiAafBSCIgzE4Sy0qsIlGWqju
 pR0jOMwDySM59wW59RJU0KdFIVdUpWMt+lkvw0oS444Y6VguDkS8+VtOLaCrYi/cnQIy
 uRGQ==
X-Gm-Message-State: AOAM530IkmW+Z/TPlksaFgnirFJyUcczZtbdhXnShgaUqLG574Xbfc/e
 NkUDt7JWGbGSzm0dDa5Who1onQ==
X-Google-Smtp-Source: ABdhPJyxPxG3jplTSEzoPOAjEUvqsi7prMsvRGsWobxVsGaKd07iX0PFfo0WJOLClfClHpowpG7w5Q==
X-Received: by 2002:a17:90a:990c:b0:1bc:3c9f:2abe with SMTP id
 b12-20020a17090a990c00b001bc3c9f2abemr6472110pjp.220.1646768171172; 
 Tue, 08 Mar 2022 11:36:11 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 o19-20020a056a0015d300b004f6e4dc74b5sm12183807pfu.92.2022.03.08.11.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:36:10 -0800 (PST)
Message-ID: <3715c1e5-f6aa-dd1e-7179-7a7ee4e58029@linaro.org>
Date: Tue, 8 Mar 2022 09:36:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/33] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-13-richard.henderson@linaro.org>
 <CAFEAcA-5dZyXVZu=opxXxE5b-S8B=vOowHpjCeVS7mbJ9jUNQA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-5dZyXVZu=opxXxE5b-S8B=vOowHpjCeVS7mbJ9jUNQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 00:12, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 07:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Sink the set of env->exception to the end of nios2_cpu_do_interrupt.
> 
> This splits the two things the patch is doing between the subject line
> and the commit message body; the subject is supposed to be a summary
> and the body should be able to stand alone without the subject.

Yea, I should merge this sink to patch 28, which does other cleanup to this function.

>> +    env->exception = FIELD_DP32(env->exception, CR_EXCEPTION, CAUSE,
>> +                                cs->exception_index);
>>   }
> 
> This is a behaviour change in the semihosting case, which
> previously did not change env->exception and now does.
> Since that's guest visible I think it's not correct.
> You could fix that by making the semihosting handling end
> with 'return' rather than 'break'.

Yea, poor patch ordering, as you discovered.


r~


