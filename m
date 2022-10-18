Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4DA603669
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 01:07:50 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okvgb-0001Cp-GI
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 19:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okvcn-0007Yg-On
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 19:03:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okvcl-0003rq-SK
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 19:03:53 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso18839290pjf.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 16:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4l+Wu65I5JWP2zR087cUq9KLDVYyOAtNJz+60HIKh2M=;
 b=G5qd4RUpviMqb++hbnmuOrDGjmVgkfcKWv1zYLr5fSwqXj2XT+mHC47ET8S/BgyyfG
 NpbenvUsAFOLfTY11tpivzUxNT37Da+8SJuXOz6IFXGsA8ZfCWYZhxfAdjDxhEMtdHNw
 ywanAl/NFJEXS5k55WfByCOE0cyviSEdv5ihk3+pidyx88g8Q/68G7lAlRbzkV4Xxpv3
 eMrYIyb0BjpLTSI9Cj0yZ/+5/FJnXgiU1l2OhSk4DmnZ7kZJwZTMhblku1Ui4BRzKgS3
 AfYTdGI3je5GVZaKY4KUf3fGiBnNTXfoY45GxxAKPt0Otp+s1WP8TaP+4EpoX1uZanbR
 UMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4l+Wu65I5JWP2zR087cUq9KLDVYyOAtNJz+60HIKh2M=;
 b=qsJT4Ozm4AAcIQM72TCkdWUaL+8IOB2HwvjvB5iG53YdHCsNOTLSy7C6fpYsdnmTPY
 X9rv+Kk+MOlCSrEWayU+b2G2CeCs50KGRphPdRxWwjpjZd1gY6PwwFAfEXM7tYNYIeRT
 BHePc4TcNUa78DnlCm7c9R8KWzkJqtRQ6SiPjJrlVfez8bd5dLQEWkviliTjWc/w57hF
 ZlcOWzdzXJZlghW9HB2AHMcUFG2Q1Y5zfK9x9RZf67DHR0yJkDDXHba8cANRDtWXePzA
 h9krTIk9/grgm5ftmH4mJ6Yt1z9xO83c2VEM/q9q8t5flA8mEgdyLsTR6u+mYuDyNY2m
 KoFQ==
X-Gm-Message-State: ACrzQf39cf/R9ku/qDRlmlcXLT2tU9fqF+wpWD1l7g303AWl0yw+T1MS
 DF9P6u3cxiDs2Z9l/EujeKDLJg==
X-Google-Smtp-Source: AMsMyM4djnCqF0XqZOSfDyAKYRdAKHlt6oj2S8AkD4EtPS/2g0wwjyhZPnehPlooIZdM35g+EAbf1g==
X-Received: by 2002:a17:902:d2c3:b0:185:3bda:46f8 with SMTP id
 n3-20020a170902d2c300b001853bda46f8mr5228136plc.58.1666134228867; 
 Tue, 18 Oct 2022 16:03:48 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 k5-20020aa79985000000b0054223a0185asm9746302pfh.161.2022.10.18.16.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 16:03:47 -0700 (PDT)
Message-ID: <ca09e907-e0d2-f64c-e72e-7cbf343a8e4d@linaro.org>
Date: Wed, 19 Oct 2022 09:03:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Question about TCG backend correctness
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
References: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
 <87lepeeno0.fsf@linaro.org>
 <4841b154-bd05-c677-cfb4-46a350ddd0aa@linux.alibaba.com>
 <b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org> <87v8ohcwm0.fsf@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87v8ohcwm0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/22 19:22, Alex Bennée wrote:
> I'm not wedded to the idea - but it could be a super simple processor
> with a lot less extra baggage than a full ISA - purely for throwing TCG
> ops at rather than decoding any machine code.

I'd be surprised if you don't wind up with a similar amount of code as for a full ISA, and 
a lot more baggage on the side besides.  But feel free to prove me wrong...

OTOH, if we really did split out a libtcg, disconnected from any target and parameterized, 
that would make the sort of non-ISA unit testing you're thinking about vastly easier, 
because you'd be able to write a driver program that isn't "qemu", without all of the 
target baggage that would currently make this infeasible.

And, very most likely, such a parameterized libtcg will be required for full heterogeneous 
emulation...

> Can we detect optimisation failures with guest tests?

No, and that's where some sort of specific harness might be helpful.

> Is it worth doing anything to lower the barrier of entry for these small
> micro tests or is the current check-tcg framework enough?

I think the current check-tcg framework probably sufficient.
Generally I think

int main()
{
    asm("test");
    assert(result);
    return 0;
}

is what these micro tests should be aiming for.


r~

