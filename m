Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7105B96AE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:53:09 +0200 (CEST)
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkcL-0005fB-Hi
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk48-0000nL-U0
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:17:48 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:41505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk47-0007TP-9W
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:17:44 -0400
Received: by mail-il1-x12f.google.com with SMTP id d16so9298275ils.8
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SLIN/T2UVl0GiEwLwyvJIoYqnT+Vo1HQI1JH12/FB7E=;
 b=VD3ML2PXYOTXg63HleEwRJ5Y4CIcNNs3dvEDJ3ng2u0UesZiOPlJ0rFN/6+5kHNLSG
 5jIOYBquNiow6kWeHRMRvPbsYNA8cbreymMhYblZy3DQLNYZKAvdzjJh+shws6Yebc/x
 55h7Ywt1hg7f4IHavtj6ANd0BNsD/6VzYQ8UVDl0VSXUCaapw5YFeWTdh8gnaqF/BJma
 4vnRO3AfHz1IDOf4xUCe0YVjn3WVSfgSikeHI5Nc8I42BbiBGDxaJJa4sGPF2MvGlKLk
 YJzxER1AlGWEdXnm8WKmckYfwQd+t27hDbfsrBSuw16O/lWpjwOowYj7z0tZCorUI7UU
 2A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SLIN/T2UVl0GiEwLwyvJIoYqnT+Vo1HQI1JH12/FB7E=;
 b=2wcd8Az3XZZOVaXtQcz9EIl3LGk1kPVE+6pV9n2FINGb6jXRbEN+bMnrmL7qn25siR
 ccR55PkHYjT39aSuwDMWzAPEDP5aWlqsTednK+di/5W+74yIBnasoHnlhnNXIPaSLZYs
 PGSTSXTIHDkDCpKbwh0Fmmd598O0Nmb45Sf+pFB9Oxioy7BEovgjzDVLvzB09lxOOM4L
 gFjE7TBojAtoMbX8KGD2jqKicMMBfXpGg6qcCS4I2uDwGONDJufDtYp0YbOogxGJkcqr
 Azgsk4dVPw4cECQCc64oDDDZbACwOnZAzVAMcdDkXoA9D915GMbgQdB3c6BhKTb2JEGl
 kT7w==
X-Gm-Message-State: ACgBeo1BRACDlQTOaHi58eVfb9swMaqHg5/0ci/tSz9PR9iOH2/Qjy0n
 AODdNhKAy6sPLPlISuwnmLYlJw==
X-Google-Smtp-Source: AA6agR7LJKoLaGPEkCo6Ec8cCvd6h3fcQHmlBDp1BI6VT1U5UYzqJy8CYLhmXCrUthvxk7gAG8IukA==
X-Received: by 2002:a05:6e02:1748:b0:2eb:e656:8123 with SMTP id
 y8-20020a056e02174800b002ebe6568123mr16688138ill.15.1663229861944; 
 Thu, 15 Sep 2022 01:17:41 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a0566022d5200b0067b7a057ee8sm5179450iow.25.2022.09.15.01.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:17:41 -0700 (PDT)
Message-ID: <91b4f280-abab-1227-35e7-7d3189f14cbf@linaro.org>
Date: Thu, 15 Sep 2022 09:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 4/4] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 17:09, Alex Bennée wrote:
> This removes the hacks to deal with empty current_cpu.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index cdfca3000b..a7fe6ddc0d 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -41,9 +41,10 @@
>    * which is used in both the ARM11MPCore and Cortex-A9MP.
>    */
>   
> -static inline int get_current_cpu(ARMMPTimerState *s)
> +static inline int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
>   {
> -    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
> +    int cpu_id = attrs.requester_id;
> +    g_assert(attrs.requester_cpu == 1);

Again, drop the "== 1".

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

