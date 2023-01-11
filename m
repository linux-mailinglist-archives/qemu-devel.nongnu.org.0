Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063BA6667FA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:41:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlah-0007rS-BY; Wed, 11 Jan 2023 19:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlag-0007rK-5S
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:10 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlae-0001re-Ll
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:09 -0500
Received: by mail-pl1-x634.google.com with SMTP id w3so18583171ply.3
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2o3Yi5sN7ePUFpOmNGZWQT8Glbuuf7MSs/9JMhNYzkU=;
 b=Ox2p9xjPHkvzhdqW3WM3lnQpAaNhgv6w4Dez3Ow9D8eP80CYgQSISUkoWTnLANfjys
 /KB9jBjrY5qpf7y4reLn0H2q5mfmf2nj9vsm9I7NB1tjnfG+AWRgfemlLjdUX/pwxbmH
 At2FF2LYOz61fIEtIDopGtDuDLeMfTgoP0fkY7kVMvod1J87LubOYZhQsgzuMhcVK28s
 j+UBjRGcO+wxI+WMyZp6K1Ta0b8kFoDxKNroC5Nk/GTB5AQNOqhR7zdnH2iJNokOHpj5
 bmTeyZeWuip6QRuR/6hzElPVCDaneaRp63CnAK8lHY+PRqJ3/2g3VC8z0cZjvGCN33/F
 YUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2o3Yi5sN7ePUFpOmNGZWQT8Glbuuf7MSs/9JMhNYzkU=;
 b=5yZANcttNU8f9tBoMXZA2/aWc/R2f5GTCQIdnfC0f+gXQGRpBZIAD+G3XJZGwZc+X0
 3iNt/hXM0pBvd4NYVSy+G9uIS25TDoQhLqoVd7nqPy6DSGyWk4A7kooJvblcfoYXQyoA
 ibbUhvEq62pj932TqgEg6RCh7yKw4ishDZPvSwbebLeTd0QvQDi256wTBcdRrQvA9wh1
 AN0hyZ6rpYeET/gFFrHDaRC2xXQX9DcDD8rLjLQAnMbTah/6/yaVvPvhR9L/BramLdcr
 Ki/HnO5URZqd7WvwcJx04dUPeum2V0K+K91Rt9GEHItRnLO27zbQCundlJ4qRMr+P2xl
 BUkw==
X-Gm-Message-State: AFqh2koKSabRcPtYyZXtcGApvjDvekQDrO/dZBwNON3xSHFLNEF71+WE
 uA7FmfDPZsKKqkn11BwQsY60mX+f8I9KYgrm
X-Google-Smtp-Source: AMrXdXtlY+PGBJ94UeYS7zCNtDlZjSYP7WIeOoKLGX4qNPObHGtgKh2P0Q86CI9ULpv2vracESKFqg==
X-Received: by 2002:a17:902:edc5:b0:192:c882:703e with SMTP id
 q5-20020a170902edc500b00192c882703emr35097929plk.43.1673483827324; 
 Wed, 11 Jan 2023 16:37:07 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 3-20020a170902c10300b001930b189b32sm3991832pli.189.2023.01.11.16.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:06 -0800 (PST)
Message-ID: <7cd88410-bd48-5bd1-07b0-d69480107e3d@linaro.org>
Date: Wed, 11 Jan 2023 09:56:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/18] target/arm/cpregs: Include missing
 'target/arm/cpu.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110164406.94366-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 08:43, Philippe Mathieu-Daudé wrote:
> +#include "target/arm/cpu.h"

Just "cpu.h" in this file.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

