Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D626C4152
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 04:55:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pepYO-0003px-0j; Tue, 21 Mar 2023 23:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepYL-0003pm-At
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:54:21 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepYJ-00033A-R5
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:54:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso17938902pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 20:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679457258;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W5ircy7005orBDrhl7Y5tSfE2F8ORbcMp3R5NHRpaeU=;
 b=hiQerz5EkHt+ehM5DGuZbMYXDalnI3w8xeUSeNsKZrfKCc7idrSOn5WIvELfpjNhqf
 fQmr+GJYcglDcllmiDJlyr4U9dQyIAf5oOcKkFOOuzW/gqSzQzN1JsPCEr5x3PG4dmMo
 7nHoS5wEySNQZJ8D5YFgwNgQWV2npTM/y4OOHlEY84zhzoTgx912Su7fSoH6D8z5D7iV
 Dari1LnujzF5UfZxKuU82jjBvQvuEUR3VOIxWDeRGgy+kPorZ2nAOymo8nVwDPFcyANK
 T+y9yO0d+HQ9G0g/WBT652a8wB8P0HD3ug7N7WunnW6wnUH0mmYjxZdS4o1QRHBY/R/l
 jg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679457258;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W5ircy7005orBDrhl7Y5tSfE2F8ORbcMp3R5NHRpaeU=;
 b=gLJY9vV34M7tEB+2ctzByzY3ola0ZdGW9v6rIUlAeItdRIYKP4qjUjSfTIyryBa1oL
 r5oNQvgr+BLPBWa6T+dleRBsSWoRk0kccHmH/LimwPSVTrX47rYFgX8SOVgiuCnHbFo/
 7gS+SXSRcMdDkIu8zTsCzLCwtptbBKzkFaqFv8B5cSE1syc4b/dtHTMCdOv7S/5K3CBQ
 jynMZX5CKSthj/SV1M8ACv2LWwUIxDMrpWHJtk07O+Du8lWnPMfFBlqX8dH/KTIP9O0B
 BzdAq65Qzf2QA7hJC0XGqe1hO++i2Whh/2hyWAoy7HsabZWTtcH0HEqryfBHC5Um1rdj
 wvJQ==
X-Gm-Message-State: AO0yUKXn5BENeYI45XxSELlwGVRImQr3ue69d66BEPoFOQtBe7RYlG1f
 sL5mtkPWoOl+kzmdJ43+CqhNSA==
X-Google-Smtp-Source: AK7set+rftMUUg8GWTaHr5EQy33RflCoAwHV0CnbsVKQtwuggDIxHAv0z1n1vJ5JRLbmT2eFcq+ubQ==
X-Received: by 2002:a17:90b:4b0a:b0:23f:44da:208d with SMTP id
 lx10-20020a17090b4b0a00b0023f44da208dmr1911126pjb.47.1679457258209; 
 Tue, 21 Mar 2023 20:54:18 -0700 (PDT)
Received: from [192.168.165.227] (24-113-166-229.wavecable.com.
 [24.113.166.229]) by smtp.gmail.com with ESMTPSA id
 30-20020a630c5e000000b00502fd141ffbsm8840411pgm.49.2023.03.21.20.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 20:54:17 -0700 (PDT)
Message-ID: <52635c3b-ced1-8310-ece6-b97a7d4a0aad@linaro.org>
Date: Tue, 21 Mar 2023 20:54:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 v2 2/3] target/s390x: Fix float_comp_to_cc()
 prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-3-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321161609.716474-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/21/23 09:16, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../target/s390x/tcg/fpu_helper.c:123:5: error: conflicting types for ‘float_comp_to_cc’ due to enum/integer mismatch; have ‘int(CPUS390XState *, FloatRelation)’ {aka ‘int(struct CPUArchState *, FloatRelation)’} [-Werror=enum-int-mismatch]
> 
>    123 | int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare)
>        |     ^~~~~~~~~~~~~~~~
> In file included from ../target/s390x/tcg/fpu_helper.c:23:
> ../target/s390x/s390x-internal.h:302:5: note: previous declaration of ‘float_comp_to_cc’ with type ‘int(CPUS390XState *, int)’ {aka ‘int(struct CPUArchState *, int)’}
>    302 | int float_comp_to_cc(CPUS390XState *env, int float_compare);
>        |     ^~~~~~~~~~~~~~~~
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Fixes: 71bfd65c5f ("softfloat: Name compare relation enum")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

