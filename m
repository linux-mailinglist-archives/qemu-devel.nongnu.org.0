Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6E6BB922
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 17:08:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcTfV-0007Tg-Bo; Wed, 15 Mar 2023 12:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcTfS-0007TJ-Pr
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:07:58 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcTfR-0001Gt-2V
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:07:58 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so1410049wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678896475;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiMcwvgWjIeAN5mbfVzZjcLkZfJIz/H9ihV5hHxwzJ8=;
 b=g+gsMjMSMuD1CAb1PWERCkkUfriS946BYfgZXv3Blt8r70xUsUkNbszxsEoDoqje0f
 us/HAts6WT3ainPUOPTo41L/4JAXb2HxBPn74ccrIaHUlvN6Itb/8iXZRWRzSc3Ex1Tg
 gP25WSr1r26Ukn/oIZd2GYexDfcV+O6H8mcm0OuqMBrhFNqpX2CfXUIHWxJSTVpsxjFr
 I262LD3Iy9WanM55C/fzcaqiAMBYYM7HQgV5pZzmKj2CeGxc01tztU0pZcevYCqCXby8
 p27TJFMK5dR09ukzbN7z6Y/HgKeiK8GBh+F9fHX+r1uk4PUJrC2DPTVulBkfkrzUQgU2
 32Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678896475;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiMcwvgWjIeAN5mbfVzZjcLkZfJIz/H9ihV5hHxwzJ8=;
 b=e/m7k1xrtb8uUVEgE2QbSk1OxKApqPaByXWtqrAlqTF//6pOGCG7J//Sybk1xzReV9
 fuPfnfDJJVbUF/BhcOh7/a8EcgLH8c+waD7ZgxcFZAMSGiQh3HFpd63daUMsoYwrDzIQ
 ZuBRXDFXOc3RpcaP0w9ZetzUgMWp5DxjJrunvFQ1g1BzIEWgVeXsACEaCSI6dFH8WFX4
 RbQKNQgC/aPMlYJh+ksu1UuldXqQVu3Gt/nS3QF3SeUVmapQSa1BvpiQxt9LIseV/G5D
 fU95pY7U7D0ATevd2z8e0K8sOa+tY2YX8kUjYWHWdTKQnuDIOL5f8Epdjvs5Rq4l++jU
 VcjA==
X-Gm-Message-State: AO0yUKV8mzy9Zwsnj7/Za5U99t6B+Fst/Jit5ENW4ajTAXRkNefV3nuo
 g8vjW+UYjbKf7Zrpk+SZJJmeig==
X-Google-Smtp-Source: AK7set+n4tWLvxB5XhhgVDr9flLcGUmowqfNYVdHnhSLN7+8xh6t+z6BU2o7xjzC+t0Z6sDzlv8UXw==
X-Received: by 2002:a05:600c:3d8a:b0:3eb:3c76:c241 with SMTP id
 bi10-20020a05600c3d8a00b003eb3c76c241mr17832715wmb.13.1678896475139; 
 Wed, 15 Mar 2023 09:07:55 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c00d600b003e203681b26sm2353374wmm.29.2023.03.15.09.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 09:07:54 -0700 (PDT)
Message-ID: <62e4dedc-585b-ef70-7b74-aac4037647dd@linaro.org>
Date: Wed, 15 Mar 2023 17:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/30] accel/tcg: Add cpu_in_serial_context
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216025739.1211680-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 16/2/23 03:57, Richard Henderson wrote:
> Like cpu_in_exclusive_context, but also true if
> there is no other cpu against which we could race.
> 
> Use it in tb_flush as a direct replacement.
> Use it in cpu_loop_exit_atomic to ensure that there
> is no loop against cpu_exec_step_atomic.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/internal.h        | 5 +++++
>   accel/tcg/cpu-exec-common.c | 3 +++
>   accel/tcg/tb-maint.c        | 2 +-
>   3 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


