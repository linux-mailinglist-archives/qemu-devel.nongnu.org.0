Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B95418346
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:37:02 +0200 (CEST)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9jZ-0004aE-7x
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9f8-0006KJ-Du
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:32:26 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9f6-0004GO-QF
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:32:26 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id gs10so8234968qvb.13
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8PLrQtdeOjk+9s/jWzMR0IG8h8a40/waIixXrB22IJk=;
 b=dwqBMBm1XmJ6xrkZGrwXCISjnOiUlZN9ajpjNYUdFiE8PGk9Guvkyt1plFIpf3GSz8
 YPncmVGLGnYiiT1rUZyzfETaeiRtx5Q/CrVn39KUwhJOUWVP+ccNuetf7T2m7vbaY4r+
 2tIfyQeN43TFkeRbCAc/40oKG3rlalz0gxEoHc+k53IEmIXKpI3BahwqnJQw4TQA/KXH
 7ZHn/wY8eH2GEXB4juD7Umd2vC5UdN1cotsCrOFPLILT/0Q6EAfBNa5pKpbv+ZdvoPji
 +dTSA2Qon6xpqm2B4kuwt/ncZxaklMuCxwx+J0jn9jnMUpeZ0rlDqxmII+UTaGnFiT6q
 Z23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8PLrQtdeOjk+9s/jWzMR0IG8h8a40/waIixXrB22IJk=;
 b=Vf3eF8sxVwPE0vRYvVwML97xCi/oYbWg/PZGKqb5fVAWcbSPpc2saBpceSRM5TW7M6
 C4xZoR8chZdLWbgEr7GpPGmbhpsDx3YAQXI1chP5kR9POb5STh07Ka1mHdICMLkjSdJN
 om1FphDjhF9R1WYChSj2Bgy44S7aD5K6ZwIt4mVFlfom6h8JlWGTJmREVxKqe7eqvRou
 K27l7BLmJ8F+iraCwqjzGQNaTHu/KKmUmd2Eb3gEIXoP73obPJxJDRwotMwRoaWz12YB
 yJL+g2yRjAzr+iAk5rOKSE7uEztr3kiEb4IW6xf/oG5f5QBHRUA0pY2gh7spIDgv7CIt
 i2zw==
X-Gm-Message-State: AOAM53155ULvF84MMaf0CnNzlv5BUrsPUQRfVFCQb4pflneWYXWIfJ2+
 jkFH4Ak0wp63ted1kTwAJS+xzQ==
X-Google-Smtp-Source: ABdhPJyQSxQ3Hxa+W48K4rpTEWXaABwUB+LAj76HKIRi4dBpTpyDSYEVEsaiwtCwVXXX64c8Vnrw/A==
X-Received: by 2002:a0c:ca85:: with SMTP id a5mr15701998qvk.64.1632583943785; 
 Sat, 25 Sep 2021 08:32:23 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id g8sm7136133qtp.62.2021.09.25.08.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 08:32:23 -0700 (PDT)
Subject: Re: [PATCH v7 12/40] accel/qtest: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20210925145118.1361230-1-f4bug@amsat.org>
 <20210925145118.1361230-13-f4bug@amsat.org>
 <8b882c1d-933a-448b-ec76-010b36d12096@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1c7cb21-459e-15a3-7d99-da30c174ea76@linaro.org>
Date: Sat, 25 Sep 2021 11:32:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8b882c1d-933a-448b-ec76-010b36d12096@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 11:27 AM, Philippe Mathieu-Daudé wrote:
>> +static bool qtest_cpu_has_work(CPUState *cpu)
>> +{
>> +    g_assert_not_reached();
>> +}
> 
> Sigh, this triggers:
> 
> Running test qtest-i386/cpu-plug-test
> **
> ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be reached
> ERROR qtest-i386/cpu-plug-test - Bail out! 
> ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be reached
> Broken pipe

Ha ha, yes.  You beat me to the reply within minutes.

> I suppose it is in my interest to 'return false' here and call it
> a day...

I *think* that's the right thing, but I could see maybe "true" also makes sense.  I'll try 
and have a closer look.


r~

