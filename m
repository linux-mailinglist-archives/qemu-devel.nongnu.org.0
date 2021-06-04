Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0DB39C1CD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:03:37 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGye-0007tI-U2
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGxb-0006l2-CW
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:02:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGxZ-0004kP-Sl
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:02:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id e1so5268737pld.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yvTv8Y8/BdcUEM7ioKdAIWlmTM9pFf3um/BRm6uVHWc=;
 b=BZqF1MQ+mTnSvclflnCHaquHAXrcrUU06XSvYMx0Sk2JndQzh/HGugK/9WZvSx+C5N
 rPLMH/K1TnwSjdd/sKnKZrBCqAFr55CMa7uwReinTO2lE0y1GsYZbgSA6xj38E/vwnP7
 EFtDHpBdPGoqyfitWQXZi3fvpfR1lu72NLRRWEsc4wVXvASIe5tn/jnJe+CZp5nEPKs7
 9SBOXiDPmsuodKx2nnFO+VoqszUVnribwy4dHV0WhZIvDu10WwSoPC82XKTXSkJBf1tm
 +yjJ0nHZ4NazJZKBE65sFkewwpBEsf9voMCPiyFjIkQvjEfaAbsflH6oPsi66Los60Jp
 m5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yvTv8Y8/BdcUEM7ioKdAIWlmTM9pFf3um/BRm6uVHWc=;
 b=JB+Ez6+gBDv0CHUmOGiBm3URBGq9OTn9xabOwDyQm4LGOaq2plqnPgElp14MTN8C/A
 tm5uF5BmxuOUqQtcBaGHMWuu078dvnCwfcjARbZOXs8dzNL1ZYvJiVCrJw6wSSBiuSCS
 +s8uW6ywD1x2CRpsvbGTch1mkByKRCV4vyeWmF0m37SqUrJdifhRXBUpn8uc9KUxKJjA
 r2NcJ0MXWmEdIMPEpLQdHi8emzWrdkD/FXZbPb3/NNnrTno7wojoqhDAhUpsrweh875R
 dyN6l1Ylb3HKTNHZ2eDnBZX9UVArIrqUgbd3HZHGqRgwqRmJRzfP/vMCOd6rvyc8gcdI
 I+GA==
X-Gm-Message-State: AOAM530Dow2068/bd4FWz5n1UKZBp1P7Q0WvXqaArJ6Yqeypu3AfGWUo
 yRDj3Q63lJ7b2L8X62+S785kBR1TiqpOnw==
X-Google-Smtp-Source: ABdhPJyF2bOdx1MnO/uQKRzIl7jOfQhi6IJiNs6VWXBbzApE4VZtKhOFYfyCVpnpqJ1tH7j2uGlcDQ==
X-Received: by 2002:a17:902:ec8e:b029:105:5ab8:609e with SMTP id
 x14-20020a170902ec8eb02901055ab8609emr6203130plg.55.1622840548554; 
 Fri, 04 Jun 2021 14:02:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a9sm2710172pga.43.2021.06.04.14.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:02:28 -0700 (PDT)
Subject: Re: [PATCH v16 05/99] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10d89e8a-c777-c1ba-f62d-ac3553c98d93@linaro.org>
Date: Fri, 4 Jun 2021 14:02:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> The sve_tests_sve_off_kvm() test is KVM specific.
> Only run it if KVM is available.
> 
> Suggested-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-6-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

