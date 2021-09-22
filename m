Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB5041505C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:09:59 +0200 (CEST)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7d0-00043p-Ix
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT6wW-0003DO-CI
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:26:05 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT6wU-0003iw-VW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:26:04 -0400
Received: by mail-pf1-x433.google.com with SMTP id k17so3448609pff.8
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y95NFmKnNVeVadvY3EdJssGST0f3s0Zum3QJAE3NjAY=;
 b=kRxLA/fYXypZcr3iBgF8MGN4jvcgTi5wOdDrbTkCqnGyz9xV2AFa6S72duxjMz/K/j
 G+pkHJFw4N6o7fBEZ++HpQIERV60vD7tpfLKena7Z2TRZx++Cb13JEXWt91Kp2kNossO
 HpGj6OGsRXBONUKGzUOb3AoGyiiAaKRnGIARe1ixtPx5qqSbY6NyWfnkLe3KWkNVT9Bi
 PACedWL8ECpzgyYepx5LgcHT9NMED7jbns7ByBQnx7L+kyjhFCY/iF5GHRB4CWdtE3Lz
 phPaKJeZh39uhzNW8rWCTW6TJRGWTFIBTLIo6wLCtuqtfzIAJCpxHSXRkQTIMlTm5MwT
 mw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y95NFmKnNVeVadvY3EdJssGST0f3s0Zum3QJAE3NjAY=;
 b=3NXMM58eTfrQM447BV60DomGBAF00V1fnmuwVX4U/jQIpHoysPNUXCgPuIE4sJ/txr
 NuAEz2V47VN/WJ+BeUyZwDi7m8kulkjafRfyTCNkfplAoV/3v7yJuRCSUxi/Y8qhpWvH
 PwEVboXjvIvZt037XKxpaZitk9071DHnbWOAGKAe03v5wGOMA3md6ldAXiiSxwjr0/5O
 7iaizUJvtWfTXLm9aHW3kCL/upgHZv1It6OVcAqqZRrFW3HSAD0KLgb5gS7ikVUnGrQi
 f9QnAepsCRB12MfqoduZIqHUbjQDgsiRvcfNTXDUfO4mJrPD2QKvR4t0AQm6uhd2dd8T
 lNOA==
X-Gm-Message-State: AOAM532eyxtpHRRYcdkItVhC6Gb33BCZywxQMbF14bjpRJx/0q+PwTaD
 /Jpsy7/LuxRx6Eij7+bNHIhd3A==
X-Google-Smtp-Source: ABdhPJxes8JI8JCb9BOflDpjaVyR7wGkmdZx9Icr3Mu/qkKvKWsi5YA0N8pZkuT6IQFCcbLKc86o9Q==
X-Received: by 2002:aa7:83c6:0:b029:3e0:1f64:6f75 with SMTP id
 j6-20020aa783c60000b02903e01f646f75mr153263pfn.69.1632335161108; 
 Wed, 22 Sep 2021 11:26:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b20sm3120019pfp.26.2021.09.22.11.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:26:00 -0700 (PDT)
Subject: Re: [PATCH v3 20/30] tcg/loongarch64: Implement setcond ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-21-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e5f09a01-bca2-2388-07a3-a13ec50128ba@linaro.org>
Date: Wed, 22 Sep 2021 11:25:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922180927.666273-21-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:09 AM, WANG Xuerui wrote:
> +    case INDEX_op_setcond_i32:
> +    case INDEX_op_setcond_i64:
>           return C_O1_I2(r, rZ, rZ);

It shouldn't ever happen, but just for safety, remove the Z from arg1.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

