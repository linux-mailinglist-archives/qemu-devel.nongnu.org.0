Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301D67411B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZoi-0002au-C9; Thu, 19 Jan 2023 13:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZog-0002aU-KS
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:39:14 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZof-00081t-4F
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:39:14 -0500
Received: by mail-pl1-x632.google.com with SMTP id d3so3106865plr.10
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aa3coja4AMjFyZCcxHTLfv06BvIUp4JaeTzXQxnFees=;
 b=wF6xJoZDraOe7jgghqWHYU/Uke+NLyRFjAwuOlT1vJIJO6+hK7hu6ANxYYXq55G6S+
 gSjWTgPzKUqkZCpMR64R5n5tXMS3Fh/xDzk2nmrdN28nsUPt7tsuRy9pu5xAz8YmxYzY
 M30GaNFVDYrcZUKJLO4DVSGGbspNPe81uz6XBAtD/61hhsJOygorLjsHJxtgvx9zK4uf
 xKyySk2qUqaAG5h6y2WfynfGCbZfU+thYypve7PZZIDAM+JajizQT1M2Jhyyi6uLpgb2
 DibSTq1xWdjZspsJKb7AsHbacR7Pg/aMJYAxh2mFe5uR4++m4yrelfR7jekpjw1sqkrZ
 hORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aa3coja4AMjFyZCcxHTLfv06BvIUp4JaeTzXQxnFees=;
 b=SvLMtRBHxr5GAB2InGJE9kGBMee36q2djXduFL5L59jJZxwM6SjCZGcou0gJQFEMkf
 q6m03eYrYaTP3DdGQ3Yg/JOhsLV8x+tMEltrBnK7D3BmOwjRUUn7571fskRwt/tQX/hM
 F70lBzZvY99J80HW8pbEURtxYK7h2SGEuLh7BR4KC4TeRztokEod6ym1GOS5Wu648jKO
 uCnaXT06SvVSBdXYO0aiQ3OlZSoWde0dmQbTsUS2lucY8XswV7P5hEvsKevW9psmXaYQ
 EQ4IgDvUnqMFJWND9FiQQ992Gh+5/ra/tTljbJRVRcIQqmO3BA6tVug2N60+MAFvEAn4
 9/Nw==
X-Gm-Message-State: AFqh2kou018+EL+7jRgfQo0CSnBXHytqy/rujoFco85K0AOUUSXLAP4e
 omS3X9C20HU0SM8k6a5ajWxi2g==
X-Google-Smtp-Source: AMrXdXv2AnVGpWaMDTa3ADPubQPm+NVhL4Neyg/ICY3EmVMUMerQevmBPIx8Bu7pcEmLa1q5Wgmz1w==
X-Received: by 2002:a17:90a:5509:b0:228:d353:9614 with SMTP id
 b9-20020a17090a550900b00228d3539614mr12064292pji.10.1674153551795; 
 Thu, 19 Jan 2023 10:39:11 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 m1-20020a17090a414100b002276ba8fb71sm3354610pjg.25.2023.01.19.10.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:39:11 -0800 (PST)
Message-ID: <a94c1ff0-9b27-6af7-0858-8fc0fac1bdd4@linaro.org>
Date: Thu, 19 Jan 2023 08:39:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 05/15] tests/qtest: Restrict
 tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 03:54, Fabiano Rosas wrote:
> These tests set -accel tcg, so restrict them to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

