Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5DD2FC516
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:49:50 +0100 (CET)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l20kv-0006Ec-Nd
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l20jL-0005mt-KK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:48:11 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l20jG-0007vF-PV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:48:11 -0500
Received: by mail-pj1-x1030.google.com with SMTP id my11so2180002pjb.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 15:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OyNim4OocA+iJ/c0Yu9zlHqVH9FfNukt53rkkoZ3JMk=;
 b=uy/V4db9+WiteRbv0bTMVeImjbdReuWAvRbLvnzCDokICCMbnWtoRU3SXQb7mcz1Xp
 BgpVJGqvcRZn4UMjDnUzVusl0EYdfBsHh+2X682nTWP2qDXk2SSNva2umKv7g2dylOe7
 evDpUU/j921L4Q/KNCRhYq/4xjJtj0MXeZD/+okfJ6pMXux+cpC3KUP6CfwRpx00VnpE
 UIqqU/VS4hwohRK76bqdZ2PYZyCNlvnHa4WkASIgBZgZlSJa84bSk5q2fSmKFrN0Xeeo
 13sqoVNEkyB4kRZj6P10LIFEWz5k2ihQuhlYYyOD6QmqGsI5SCejRjafJGQxBqsD7Hel
 gtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OyNim4OocA+iJ/c0Yu9zlHqVH9FfNukt53rkkoZ3JMk=;
 b=tlQodyiQbG0pb9CvhZhsijqxlLTAf0nZyVkcz3sqlQYeOIBoWb5qVJhtBY3yMAwYJK
 /bYqwdLPOKA2q8jb+mXmQlH12pM9neIKBBNsqBdxpYqatVZqRuwGndyXO7YRAP5jAxo5
 WTozIr3eSRQzbjCT5vn58Zpv8buoU5ctkuI/7lW9cfuJC7lFOEL6cwRfxcjZFR0R6n8i
 OfgGDhCieaPqQhYYN9TB3QeWCxJlq0aGMLHx9SdRQ0P0pKQ3jCUBVk+OFPpvZd2cnGvt
 FEV00XIKvi0UAfmaK89c9zx2mtaK06+z09zEUFFy/L9rNDLyVk3HWhsRTQ0AjVYREZQQ
 cV1Q==
X-Gm-Message-State: AOAM530fwJQtAzT/Y3mMABcAiodHGH6rTkUqcBe+w3sA/k5B8XzJ256P
 vj2a61sGUMSDESoma/KXRdMDX8ajdpmE+w==
X-Google-Smtp-Source: ABdhPJyWwYD1FG6+J4ay+rWvEzkLHYIBn5LByu2iBKp5SWnZJ4mQ9ABxp6OMIuFKfzzVLKIyO+g6Yw==
X-Received: by 2002:a17:90b:100f:: with SMTP id
 gm15mr2341487pjb.47.1611100085099; 
 Tue, 19 Jan 2021 15:48:05 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b17sm93945pju.15.2021.01.19.15.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 15:48:04 -0800 (PST)
Subject: Re: [PATCH v2 13/22] tcg/i386: Split out constraint sets to
 tcg-target-con-set.h
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-14-richard.henderson@linaro.org>
 <CAFEAcA8MsWyA7Aam3VzfV=r_scaD0J3zEBR0bNE-Re7OdL+ezg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b0cea60-a675-1c62-0f2c-4d616a6c1b58@linaro.org>
Date: Tue, 19 Jan 2021 13:48:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8MsWyA7Aam3VzfV=r_scaD0J3zEBR0bNE-Re7OdL+ezg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 5:27 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 21:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This exports the constraint sets from tcg_target_op_def to
>> a place we will be able to manipulate more in future.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/i386/tcg-target-con-set.h |  54 ++++++++++
>>  tcg/i386/tcg-target.h         |   1 +
>>  tcg/tcg.c                     | 122 +++++++++++++++++++++
>>  tcg/i386/tcg-target.c.inc     | 194 ++++++++++++----------------------
>>  4 files changed, 244 insertions(+), 127 deletions(-)
>>  create mode 100644 tcg/i386/tcg-target-con-set.h
> 
>> +#define C_O2_I1(O1, O2, I1)             C_PFX3(c_o2_i1_, O1, O2, I1),
>> +#define C_O2_I2(O1, O2, I1, I2)         C_PFX4(c_o2_i2_, O1, O2, I1, I2),
>> +#define C_O2_I3(O1, O2, I1, I2, I3)     C_PFX5(c_o2_i3_, O1, O2, I1, I2, I3),
>> +#define C_O2_I4(O1, O2, I1, I2, I3, I4) \
>> +    C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4),
> 
> Personally this is the kind of code where I would follow
> CODING_STYLE.rst's suggestion of "If wrapping the line at 80
> columns is obviously less readable and more awkward, prefer not
> to wrap it; better to have an 85 character line than one which
> is awkwardly wrapped.". The parallelism between the lines
> is much easier to see without the linebreak.

The maximum within this section is column 92.
Still ok with that?

> I know the macro magic should make it impossible, but maybe
> we should have an assert that we definitely have a valid
> array index here ?

Ok.

>>      case INDEX_op_andc_i32:
>>      case INDEX_op_andc_i64:
>> -        {
>> -            static const TCGTargetOpDef andc
>> -                = { .args_ct_str = { "r", "r", "rI" } };
>> -            return &andc;
>> -        }
>> -        break;
>> +        return C_O1_I2(r, 0, rI);
> 
> Old constraint was r r rI; new one is r 0 rI  ?

Oops, good catch.  And of course the error would have worked in testing.


r~

