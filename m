Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B83FA375
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 06:05:59 +0200 (CEST)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJpbL-0002cc-7n
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 00:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mJpa4-0001lq-VC
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 00:04:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mJpa1-0006rq-PI
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 00:04:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id m17so5274654plc.6
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 21:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/e12KvIEZvRO6ZiexW26hSSE6zFfYKNVGBc7NhVAL0Q=;
 b=MybD7kRBOip8noy58r0o57TF/s0AXTwgpzotztWr19yOjg3mmGdFe62z1yw6cz7pJX
 PJSeRf4pAYHd1XxpQ4nJOxmqfACdsys5VwI0258FBAL+cK4wMHz6l2Jda8i52QavlF8L
 NgIQoKwe3V7jcfMj34q5fraUZ8loNjzvqRvRAdDkAzHuL6t18jy6IZKrKJSu34ri+o+/
 auSQrpaU27mQHLmCl0nmEBDXCi9Ugu1yd7OuIvVNKnIsubUWuBA6MRMYaghzLGvHGtXg
 nZajEP5U4+0nTez45eDskCN4NXA7BIVCfESdcvfK5Z2sDN/bjVJe5xN+qrm1TRuKNNbN
 tQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/e12KvIEZvRO6ZiexW26hSSE6zFfYKNVGBc7NhVAL0Q=;
 b=OBU1ks1PtBjWad3O/HCwX2Pg8UZvlL+iPN7KPM3QLf+0zdqNKXjS6naj9VTgPiVmUn
 TZbLmL64sxFaMOn9zxki2louemWUydLwjM4fTF4nZLsRG7GBADI+vGvSnI7XJ1aJXszM
 XGpFEIF7mhdOZVydsXVj9+kmsIgfmHXDoGXUQ4+9XvTvZyqK56ekG+8fxDVKxmpfq157
 nbUNlm4lLrjLyrvnRrtG7TYsX856+2GKGF8YXQ01qybnFheCKv00k8X6eDr42WTU0Bam
 U/DOu/jmWDyX6wPmRx1I8WSvnAV2OGdcrqoZDIO36idojiiHx3nA7+zUojiovDRkgNo7
 f9RQ==
X-Gm-Message-State: AOAM532qc3KLeWJb9dY454TBtjh5GuantNiyZH9QxpTW/4HwqJMF3bug
 Xflv/fmeSwJsdJoevVa/qjpfEA==
X-Google-Smtp-Source: ABdhPJwVYBTtpuZv/yugBw9xHew54PNATMadsqbVtcp3Lp0KxvNFpM+RBOMKm0q133ts//QxrwheYg==
X-Received: by 2002:a17:903:228a:b0:133:305f:2dd2 with SMTP id
 b10-20020a170903228a00b00133305f2dd2mr11555563plh.21.1630123467254; 
 Fri, 27 Aug 2021 21:04:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c24sm59507pfd.145.2021.08.27.21.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 21:04:26 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] tests/tcg: Add arm and aarch64 pc alignment tests
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-9-richard.henderson@linaro.org>
 <CAFEAcA8Vf-mF4xpMkv+Xc6Cc-u1fW5yW1-fHwVSFqZ6EKNdmPA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7fe267b-154b-8d96-1b27-1c696b1a030d@linaro.org>
Date: Fri, 27 Aug 2021 21:04:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Vf-mF4xpMkv+Xc6Cc-u1fW5yW1-fHwVSFqZ6EKNdmPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.437,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 6:54 AM, Peter Maydell wrote:
> On Sat, 21 Aug 2021 at 21:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> 
>> +    /*
>> +     * From v8, it is CONSTRAINED UNPREDICTABLE whether BXWritePC aligns
>> +     * the address or not.  If so, we can legitimately fall through.
>> +     */
>> +    return EXIT_SUCCESS;
>> +}
> 
> Can we get the test harness to run the test on a cortex-a9 guest CPU
> so we can avoid the UNPREDICTABLE and can always check the signal
> happened ? The test is a bit weak if it doesn't actually test that
> we take an exception...

Well, it'll always raise an exception under qemu.

I wrote it this way so that it would also always succeed when run on real hardware.  Even 
then, I have no specific knowledge of a cpu that does not raise an exception, but I only 
tested cortex-a57.


r~

