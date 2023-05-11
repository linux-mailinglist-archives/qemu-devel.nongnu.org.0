Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD646FF05B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:03:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px44t-0001MW-7u; Thu, 11 May 2023 07:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px44c-0001Lj-6q
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:03:02 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px44Z-0004z8-0U
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:03:01 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50db7ec8188so5121361a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683802947; x=1686394947;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0/j5Qxz/ykQ/SmYrY0vYlGPIbtxC19wo3jMLIi/JC6A=;
 b=hZS9Vg1DcrjoZ5FxKcMnGwjk9KNdSZ+9HfHTcEcuHEL+mSmcYd4uFQQtG/I2ePbtG1
 WZgozmCV53IBQvClCT3wJNLO8JdV8rCMX8rHPxXRmEW4v7i9z8ZmZbMfHd+Dvukd4yKg
 mEjSoNuZwaoc6Y8eyPWvtpsrR66oObIytjnkNmgsB+RT+bTiUKmFHHdNNDE0T7gb9h/9
 1iOiY8HFdI3ROoaqX1wOATmxjYLwYeFHpVWul1cBCHIm1PtT62Bqp2ZgJgKgEJkHHESL
 RH/SgRk+/1v14z5kj+wV3JWXSCECqELfqD9EGzqshLcfYHlvI4Zt7Vf38uRvlp8MvZ8h
 OSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683802947; x=1686394947;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0/j5Qxz/ykQ/SmYrY0vYlGPIbtxC19wo3jMLIi/JC6A=;
 b=SgvNg/vhoKucVVRCgnmqV3X43H/rxZfBN2VjWsC+E+w/EIpZd5Dsy35g0Woc+KFJ+L
 uqvL9yy4ZNkhF3mGjrebliqpBOVhQmTqqGC4eDU02y7NM0SMvKLiDot8LjfeM7kA7/Yb
 b+ur5iVl7C2AIFPu6RBBrSR9+crIs2LgcRKU2Led+WdBZc2mCtbVwvBAlNCLV1yAmjOe
 Petwzx0n0u1Eg5z4sG3bHoX7hXWIFMI7G1JxMqgR4enKZfuI+D0CHqgyuukaiATiJKWw
 uVfZkgbGKeqigZeNuRxy6Fr1To+Tigh2AZDFhtyQskjHEQEXzMfPlT1cCiUQGhVPItF0
 g5gQ==
X-Gm-Message-State: AC+VfDxVRbqT4Z2nNcIFn8wdCohuEpVxhdn/Baa8M4DLkpPYKm66+xYh
 EAvX/eUXXix7x7aG34TBQSq1sw==
X-Google-Smtp-Source: ACHHUZ7cjyF4j/cvIe0QSGr4UfSivxMI3D2TKhyLBU27+7ni8ADyaL2Ct9QOZlrqONyS6Y5dRX6XNA==
X-Received: by 2002:a05:6402:414:b0:50b:c0ce:d55 with SMTP id
 q20-20020a056402041400b0050bc0ce0d55mr14362698edv.3.1683802947196; 
 Thu, 11 May 2023 04:02:27 -0700 (PDT)
Received: from [192.168.5.14] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a50fb82000000b00509e3053b66sm2749299edq.90.2023.05.11.04.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 04:02:26 -0700 (PDT)
Message-ID: <a5c261f4-b3e5-314f-b28f-dfac54a0bed8@linaro.org>
Date: Thu, 11 May 2023 12:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH for-8.1] target/sparc: Use tcg_gen_lookup_and_goto_ptr
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230405185922.2122668-1-richard.henderson@linaro.org>
 <2d46a274-8234-a635-81ca-c79c2969cb7b@linaro.org>
 <fc35257d-8af0-8aa1-af88-982c7506bfa5@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <fc35257d-8af0-8aa1-af88-982c7506bfa5@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 09:40, Mark Cave-Ayland wrote:
> Obviously nothing notionally against this patch, however if you could give me a few days 
> to run my OpenBIOS SPARC32/SPARC64 boot tests against git master with this patch applied 
> to double-check there are no regressions, that would be great.

No problem.  I just didn't want it to get lost.


r~

