Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798F6C6F87
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 18:42:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfOx1-0002RR-2v; Thu, 23 Mar 2023 13:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfOwy-0002R9-UM
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:42:08 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfOwx-0006ly-9l
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:42:08 -0400
Received: by mail-pl1-x629.google.com with SMTP id w4so14937110plg.9
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679593325;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zhoQTThOaI/PO8pHwSoHARWdDXTCFsRGRzfdVEtVE5I=;
 b=a/JrLaRoTnBQLfuZmOFz5dNA+4VTS44LcCLYJEVR7pMKNLsub4qP7VrbAwCJMi2DFp
 qQKLnF6z9c8D1pWm7os0+6GsUWzGjWZsQDdiL/taWjeAcK3ApjfgT6kokFpa2q8GJDma
 U/hI6dsbjFUkbPatgm6pNqHaUTpiAqNGvZg5xj5cR9VOOk3XuyQD0PMFhFxzBLwOWV5L
 /8tuaDJwJ0FWLD7Vj8ZSabTqFwuf5Y8RyVuPN0Vxc1jrliuN3OMwHfFQLmjVYgKw9afX
 iUTJZUFKbIecI+nWgAF3HpHuoP/FAJkUtNurge2lbtAgD5hDZKYD/nF/2hIPJR8AZzNh
 AhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679593325;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zhoQTThOaI/PO8pHwSoHARWdDXTCFsRGRzfdVEtVE5I=;
 b=QzJu/h/fTyXI0s5hnsopBwrbcpHFThEOlYIOJKSV2jKxN0Do750vgDLE5sHPrwMQQF
 04h7BkDpCxrhLdT/VffIIfreG4JRMPLiZhH5zM1cltRo6VV5gYX1Qn3pVxViKrdgBQCv
 sdaaZeG/ppn+AmNpOFPFUacPAUpvfoZu3MzBOv46/rDnVOdon6T1IxQ+P6S4pSlcd1B0
 xo0jBZxPxF/Mgips3qPVdljCB0q+bp+LuJUrDn7vRbVnhYRCpHaXZgSa12H1BzmwdhT3
 MaHkX/rbVLtLwH9IMLzEtp/AkIPYfamn0cgmUbQc7ZJOydOwufHQg4TZS2Pgbq+y6gtn
 WZ4Q==
X-Gm-Message-State: AO0yUKUj7rwUWFFs7UcvTxPMKYOc18kKznE9aD2NidSTELx4l26F6Xdd
 requqiUvwqaL9SEHKMPl5tLPIA==
X-Google-Smtp-Source: AK7set+MWTs7X5s3z/WRE6shlpoHVoplZZMETxmW2n/FXCN0ERDJXcYgNVC2a/zuNhlkWmX0aD54pA==
X-Received: by 2002:a17:90b:4b06:b0:23f:635e:51e5 with SMTP id
 lx6-20020a17090b4b0600b0023f635e51e5mr8571180pjb.36.1679593325507; 
 Thu, 23 Mar 2023 10:42:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c24c00b0019e5fc3c7e6sm12598333plg.101.2023.03.23.10.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 10:42:05 -0700 (PDT)
Message-ID: <9475a6fd-421b-0396-1703-040cfff1a942@linaro.org>
Date: Thu, 23 Mar 2023 10:42:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/8] target/arm: v8.3 PAC ID_AA64ISAR[12]
 feature-detection
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-3-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322202541.1404058-3-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 3/22/23 13:25, Aaron Lindsay wrote:
> +static inline int isar_feature_pauth_get_features(const ARMISARegisters *id)
> +{
> +    if (isar_feature_aa64_pauth_arch_qarma5(id)) {
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
> +    } else if (isar_feature_aa64_pauth_arch_qarma3(id)) {
> +        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
> +    } else {
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);
> +    }
> +}

Only one of these fields is allowed to be non-zero, so we can avoid the tests and simply 
OR them all together.  With a comment to that effect, of course.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

