Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1276C69FD30
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:49:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUw2H-0007FT-5X; Wed, 22 Feb 2023 15:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUw2C-0007AC-LF
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:48:16 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUw2A-0004F8-T2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:48:16 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1724d65d002so4753118fac.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ydbUYRBnMYm5IWRPnkcQpdjCAm0TqrUtLjLUaCyVvNg=;
 b=bHFNQI67/cDb5n6QtYMuRUHbTb/Ofhx3YfMp0zjNHVQZ9bBU8Cgze8ETKwXBLzUiiV
 dK95z/G4vCR87n/5OZsP8ozL6LbBlfu/gBcphw9lwSJDOw0IkXssVzCBeXCE14NOwWB9
 7J8/jBaJeM1Etwcg0VH/2j5f0vtRzDMiNkqRt9ZBYH4Dgev9wIY73SZh4JFgZlkcKQn+
 19ZxUlFAzE5kvR/cYJxzNDODS+qdpv169vaAhAY1Z+TmlUdmvixzsZhp8Qr+q3RgXWfh
 cg938Vo7ZHjh3TqvTqmO3eFCU8rESXmYiVRY0dzGoUPPzjoFyKEv0Dy6tzWIsJyN6wOH
 ULzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ydbUYRBnMYm5IWRPnkcQpdjCAm0TqrUtLjLUaCyVvNg=;
 b=gjKDcr/bvsQiLrcjeNTA1GV2ZJmDjrELtzCFDNajqsxQCoDpwtMuqnykUIYgQ4uFky
 9fGSwCvNrfmqBK/8VuI3ymPRaY1u1Em1pVv9qjz7LmYB2lwzT0YEsQhIZN0lORIU7HLV
 gx2ZybLmpr3kbnqn+QAbQO2JKZUj9+t+qxivYQ9Zd/qxXKd8eNIvX04UR8t0y54NhVMv
 oNApdTLctgPuXWqbwFwlToeJnYso3lciglt/lo33WewzgOzQoFaUhWRnqFGTTb5dro1m
 0dqplAwklB7dTLcAxD+WuZvFxIdPnKkjMcu30rEBpAQ2JPQyvxKUEKYoH5k6qENH6AtZ
 Mk7g==
X-Gm-Message-State: AO0yUKXeEqESTn3UXvk9MP0zwvmkilW5MAffliz+J16gPxFQuUUh9KDM
 yQb4oVLc2OdNbnQUnuEmSJzrQvAgwMts1OYq/gE=
X-Google-Smtp-Source: AK7set/EqunxfFX1/dhOcLFK0/NEw+8kzF1I7xGnBw0jHPL0Py4gSpQErZlS5VyOeTGcekigwREY6Q==
X-Received: by 2002:a17:903:187:b0:19a:9984:5562 with SMTP id
 z7-20020a170903018700b0019a99845562mr10061771plg.33.1677098491629; 
 Wed, 22 Feb 2023 12:41:31 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b00195f242d0a0sm2116537plp.194.2023.02.22.12.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 12:41:31 -0800 (PST)
Message-ID: <5a681b71-04a1-2b1a-c1bd-70c33f04a7fe@linaro.org>
Date: Wed, 22 Feb 2023 10:41:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] target/arm: Implement v8.3 EnhancedPAC
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-4-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-4-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/22/23 09:35, Aaron Lindsay wrote:
> +        if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {

It might be cleaner, especially later, to have

     ARMCPU *cpu = env_archcpu(env);

at the top of the function.


r~

