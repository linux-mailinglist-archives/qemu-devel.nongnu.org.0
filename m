Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9DB5EE27B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:01:44 +0200 (CEST)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaRK-0002qx-R6
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYm2-0003BO-RY
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:15:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYlw-0005WI-Vg
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:14:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y20so1954226plb.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=8oJAeILTzTyILV7GAy7BvGQMYW4NR4AUzZQRdx8BgC4=;
 b=undWJQQB4IUApJJLCoNVFBphZzK2m9rh0BRhbEnZWesGBACGKcgQJUHMpFAPGDMoAW
 n7VAxm4PQghYgtzdAEl7YYQMsE6HhvHyGi0HaJ2UWry6lsA6GLdImTAfmiXAw00bd7f0
 1JNIo/J2r2iJLAduhYHhH/9SeiB5k7NNttq46L4jae60+xCJdB191hGXGC4qcx/vFVZi
 RkyQCgqreZVvb0/1spuSN3YesdQ7i7HLye55ecPGuTpoPl7b5scn23+PrGx6216Ord2I
 2KEm0D0VvPL9KVdTWIBfWjWPF2WNRKNUNJ57TLYvF6YXFvhkwllxcDkqN/Mm9/5sXuKu
 mJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8oJAeILTzTyILV7GAy7BvGQMYW4NR4AUzZQRdx8BgC4=;
 b=3QemWeFbAO8DJIBrIsaasYtw31398G//H7Ggl6frSzGBYz+wOv8hpFAWFji6l+Q6ge
 pabPV+GsOdVEmP0BRhw3QJ362L7VRTYcHYVBL2c/sch6303xMC65TYB3BS0gsJXZ8p/k
 Ag7QlMoLFkG1yT8Vn0UgoX3wDk75H8hoA0fr5IE1Oa7i7XusYpBNi0ETDiKUmBEQP+lG
 VtBMo3x7G8odTkYkGxSjzi12gmhpfHN76ampNwtMd33aRxZylzq5Z7TRnQOurh1RDFVP
 OCtVigXfg1iO2W1Dc66pqD7hbjr1w17hRjJFgYTV2tnVkedAnAHf9y6R8F8WnsWyNU2X
 PNZg==
X-Gm-Message-State: ACrzQf0hq87UVCgtEbM+9Pl+EM6mFN4H8k6J3PlgJiw2Aik6vow3K35B
 llVTXd00R8Htxaqvh7UDjd1+KYPwClRbCA==
X-Google-Smtp-Source: AMsMyM4YrRPi8pJ95UN9VC93e7mpbt8tNmfZ8QPXWF45hfmt13hEKTpFYdJ3wF1CcOFc56FQ/6zIsw==
X-Received: by 2002:a17:902:d509:b0:179:ee34:faaf with SMTP id
 b9-20020a170902d50900b00179ee34faafmr315758plg.150.1664378090408; 
 Wed, 28 Sep 2022 08:14:50 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a294200b002004a2eab5bsm1665874pjf.14.2022.09.28.08.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:14:49 -0700 (PDT)
Message-ID: <7cedbe66-7fc0-9e4a-c6e1-55aeb76c3e42@linaro.org>
Date: Wed, 28 Sep 2022 08:14:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] target/loongarch: ftint_xxx insns set the result
 high 32bit 0xffffffff
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, huqi@loongson.cn, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220927064838.3570928-1-gaosong@loongson.cn>
 <20220927064838.3570928-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927064838.3570928-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 9/26/22 23:48, Song Gao wrote:
> we just set high 32bit 0xffffffff as the other float instructions do.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/fpu_helper.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

But the result in these cases is an integer, not a (single-precision) float.
Is this really what hardware does?


r~

