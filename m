Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF25818CA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:46:23 +0200 (CEST)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOdR-0007nh-F8
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGOZT-0005rO-Lq
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 13:42:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGOZM-0003XJ-42
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 13:42:13 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ku18so14114508pjb.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LY54dkBZToNxDxUj32YvMVeLEKUE7pIeZpxRrwYTaLM=;
 b=g7vPM9U0inlvEQaETPDDoeEJfgzAcuAHoxqjEF9SQ9CEoamsf7vDl57gBLYPWHeRC/
 28jgGO4svw/c3TZeKfD70FE9VgZPvBx30VE5MWor8KC+FSLSUK2StaJDgTvfWKD5ror9
 /NjsFpaewN1AdLraNtxXsCEdVqJ3tL0gkG/+kLdkAVrNAxSvHpw8TkEkCxcZNK5SJJl5
 pyn1BqjxEiuwa9BN6SG1T3dOg9zfXSZfaJN5oyNgo2BolpZ3xciMFiVNeB9xg/PhrCUw
 jvEAG0VY4f39wmxRVJr1VH8KYuWnnLhZs4wfQaxRmaJauIGt5aauKBDxuIp75OiTILnY
 485Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LY54dkBZToNxDxUj32YvMVeLEKUE7pIeZpxRrwYTaLM=;
 b=6A7magpGiaL1IdVcdz31xfCNDw3G2QgsYc1DTJscmzC/dJHYyd0N5IDkvW/I7owcw7
 QGndLRXc6luFmWRXdX4zjT95ccNgc3Ey78lRo5lTAUegA4GGPWzhKzuBvZGgXrt3R+bH
 BbcUWd4klZTaoszx+NoJwDRouAb1rFRF7d8xUcmyZgMMVbh5GUhMsbuOxtpbaibhRI2c
 d90HhEO6Oo5db+PJxJK+GtszUADujCTHVmiV7PoeRC8VqriLW76EU1B6DwqXDmX4MIhH
 Y0AQocdelE4vKPSMDhKo/Tj9zuPMoxR8ovY/7ZUjy0+uwSz7bOxiDQsF79OruRHBErYX
 HOHw==
X-Gm-Message-State: AJIora8oyJfL/AtN7EoZyBRrfDFkNqR9iY0PxindCK2SpkX28PGLGR24
 bem+yey6+oZfCetnZSrG6g+KsQ==
X-Google-Smtp-Source: AGRyM1vgNSrs35HIJ0A6HJnsUVR7/bSfNE8DlFBppxG3nfvNkBcgA+wbKuY+q3z2SWiCBRp2+fkg0Q==
X-Received: by 2002:a17:90b:1648:b0:1f2:df01:d714 with SMTP id
 il8-20020a17090b164800b001f2df01d714mr290934pjb.157.1658857325191; 
 Tue, 26 Jul 2022 10:42:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a170902f69100b0016d9cd4bbafsm2333843plg.96.2022.07.26.10.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 10:42:04 -0700 (PDT)
Message-ID: <15ff8390-a822-f904-457b-0647104fab54@linaro.org>
Date: Tue, 26 Jul 2022 10:42:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: hexagon docker test failure
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
 <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 7/26/22 10:23, Taylor Simpson wrote:
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Tuesday, July 26, 2022 10:41 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>
>> Cc: qemu-devel <qemu-devel@nongnu.org>
>> Subject: hexagon docker test failure
>>
>> Hi Taylor,
>>
>> One of your recent hexagon testsuite changes is incompatible with the
>> docker image that we're using:
>>
>> tests/tcg/hexagon/multi_result.c:79:16: error: invalid instruction
>>
>>     asm volatile("%0,p0 = vminub(%2, %3)\n\t"
>>
>>                  ^
>>
>> <inline asm>:1:2: note: instantiated into assembly here
>>
>>           r3:2,p0 = vminub(r1:0, r3:2)
>>
>>           ^
>>
>> 1 error generated.
>>
>>
>> Can we try again to update debian-hexagon-cross?  I recall that last time
>> there was a compiler bug that prevented forward progress.  Perhaps that has
>> been fixed in the interim?
>>
>> I'm willing to accept such an update in the next week before rc1, but if we
>> can't manage that we'll need to disable the failing test(s?).  Thanks in
>> advance,
>>
>>
>> r~
> 
> Hi Richard,
> 
> Some of the tests require the -mv67 flag to be passed to the compiler because they have instructions that are new in v67.
> 
> This patch
> commit cd362defbbd09cbbc08b3bb465141542887b8cef
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Fri May 27 16:35:48 2022 +0100
> 
>      tests/tcg: merge configure.sh back into main configure script
> 
> Moved this line from tests/tcg/configure.sh to the main configure script
> : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
> 
> 
> However, those flags aren't actually passed to the compiler any more - at least by default.
> 
> The gitlab builder is passing
> https://gitlab.com/qemu-project/qemu/-/jobs/2771528066
> So, there must be something in $MAKE_CHECK_ARGS
> 
> I use the following when I run
> make EXTRA_CFLAGS='-mv67 -O2' check-tcg
> 
> 
> So, we probably don't need a new docker image.  Do other targets have their cross_cc_cflags?  Please advise.

Oooh, that's easy.  Just modify CFLAGS in tests/tcg/hexagon/Makefile.target.

I've just tested

--- a/tests/tcg/hexagon/Makefile.target

+++ b/tests/tcg/hexagon/Makefile.target

@@ -19,7 +19,7 @@

  EXTRA_RUNS =



  CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal

-CFLAGS += -fno-unroll-loops

+CFLAGS += -fno-unroll-loops -mv67 -O2



  HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon

  VPATH += $(HEX_SRC)


and it now builds, but I see a runtime error:

timeout --foreground 90  /home/rth/qemu/bld/qemu-hexagon  misc >  misc.out

make[1]: *** [../Makefile.target:158: run-misc] Error 1

$ cat ./tests/tcg/hexagon-linux-user/misc.out

ERROR: 0x0007 != 0x001f

FAIL


Any ideas there?


r~

