Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F50058CEEA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 22:11:24 +0200 (CEST)
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL95u-00016d-SN
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 16:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oL8yu-0005Xx-0f
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 16:04:08 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oL8ys-0005jR-Fg
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 16:04:07 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 202so2747231pgc.8
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1kD3OditStPuc7xI+UfUyTcELX9ovuP/kBJ+W169L9E=;
 b=f4SSIEKFn1gQkpb98aZTUwuWfRZ0l4oCi2/IbTQ5GEYe7lghmNp3StzIrBFZ6lqU1i
 Xa5DXFW2iVlNI3ET3zC6s8NbfKhuOLg2qI84vJhE0DeKOsDE1mNUnO3poqzZ43Kc9seX
 g8BIWxv13mVf0JrRChylLR47JrNaC5ZR574mcZRZ7NkDSEFvxIDC1xm+ZRaN9yuK67Gj
 YluHBr9FydwNgCCZE5BK7WOWCgRGh8EIMJgOCe6fRZpfIdKasdm0use6N++uwRCuQ/2s
 J4nHl/48SvFQt8W+ohQiuMJQ2lCuso9pBnh4hBQR07Z40h3KQCA9mtjuA8Q0zrdvG8as
 lW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1kD3OditStPuc7xI+UfUyTcELX9ovuP/kBJ+W169L9E=;
 b=wxLCyFy0A0tB3QwplJ7if6oZ8j1JK/zETcOHv2INJV99L1RtKbgjnoydkoIcVnrF6j
 lwiE8enbLWu6owE1uz6l0GVIJbZTGn+1WSZB0lYOL5Jg9eIXtbcibrdLrjr/Mrwt4zNl
 hF1lXzz9zPVhA0zR/ZF84Yfq0CS0V7W0B5XxE9x2kaxW5335ezJbbc4SiYQu8CYFfZ65
 0l2Xmo9p5ffAGMZnzw3fuxlAbnR7N3Ol19hG3fpPpbNQsXbbzjVYZXZbjSFqaXeI7QSh
 pS6JZHCwk+990GA8GOIEeW5R2S7JaHBYs3JxbOdswJAZgHLHymIGm3ZRJF35GBvs22xE
 H2Og==
X-Gm-Message-State: ACgBeo2mrT/XTAygumYBJOh3dxnH80Om80frgANB32juTIZ1n8RQZZJB
 e69g8nb5ER5NSzN8I6mp3jQuAgZzS45zFQ==
X-Google-Smtp-Source: AA6agR7Sop+kS4n1PiPdA248e8Mwfl+hL/UknNA3vt8Ok6p1LqF2oMRTVjpGBO0dJEBI38dVIAx3Bw==
X-Received: by 2002:a63:4d04:0:b0:41b:ff8a:ddb9 with SMTP id
 a4-20020a634d04000000b0041bff8addb9mr16401768pgb.330.1659989045077; 
 Mon, 08 Aug 2022 13:04:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:6ef5:1d2f:d0f8:3a7b?
 ([2602:ae:154e:e201:6ef5:1d2f:d0f8:3a7b])
 by smtp.gmail.com with ESMTPSA id
 y6-20020aa79e06000000b00518e1251197sm9228701pfq.148.2022.08.08.13.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 13:04:04 -0700 (PDT)
Message-ID: <6895250b-1371-1a97-d233-bc3f3a52feee@linaro.org>
Date: Mon, 8 Aug 2022 13:04:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/5] Misc QEMU 7.1 fixes for 2002-08-08
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>
References: <20220808125706.60511-1-pbonzini@redhat.com>
 <70743a29-474e-728f-4ee1-dd4c734f342f@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <70743a29-474e-728f-4ee1-dd4c734f342f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

On 8/8/22 07:23, Thomas Huth wrote:
> On 08/08/2022 14.57, Paolo Bonzini wrote:
>> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
>>
>>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging 
>> (2022-07-29 17:39:17 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to f6a5f380627ab2af384bf2f2940d29386dea11ff:
>>
>>    tests/qtest: add scenario for -readconfig handling (2022-08-08 14:54:56 +0200)
>>
>> ----------------------------------------------------------------
>> * Fix and tests for -readconfig
>> * Fixes for changeable block size
>>
>> ----------------------------------------------------------------
>> Daniel P. Berrangé (1):
>>        tests/qtest: add scenario for -readconfig handling
> 
> I still had some questions wrt to Daniel's patch, especially there seems to be a bug 
> ("spcie" instead of "spice"), see:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01153.html
> 
> I doubt that this test is working if spice is enabled...
> (which leads us to the next question: if the CI did not fail for you, are we missing a 
> build with spice enabled there?)

Arg.  I didn't notice this until after I'd done the push to master.
I see from Daniel's reply that the string with the typo doesn't seem to be used, but 
please do let's fix this asap.


r~

