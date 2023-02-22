Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096469FD0C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:36:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUvpY-0004Uv-Ou; Wed, 22 Feb 2023 15:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUvpU-0004Ua-Fc
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:35:09 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUvpR-0006IL-Sf
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:35:07 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so6994453pjj.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ytgFRrl7ujTpQT6iPXJ4l8eWZR8tUL4l+p2NMJaEEHs=;
 b=JUTov27OvRuYE2F19JWmbAyj1sH33A76qyMmECheJfSgdiJNvloGmp3XhJqL/+OD71
 wlfF0fO2dvPxpkHB4Wjhl/4ZQ03OnL9gT1vkn0TXdyNBDqlBDHieZrfFEH95MwcLAOL3
 QOC+aRGEYOSIYzH5GzAbDA7ghmlxRl+zPF+XYvpMZQvxw7Bq8VKuQt0jwyYo14skvFXJ
 tVUR3rUOZ622CywxqFSCwxmSIFa927HuX23RqLaMtw55fCfMU0VlCF2fjnBemDOvwNd7
 khVMMnjMz6oIiU4YISWi4bmHcSAdqKNdcdl2T6xcPWVOFpuFg54MFJucWsLtmr0fWYiG
 RYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ytgFRrl7ujTpQT6iPXJ4l8eWZR8tUL4l+p2NMJaEEHs=;
 b=DE3rpRUQ1uNjkTqV6Eowa5wAV0ykoIBsg/F97rKRrb5LLxhHfTKSINjPlMovJX0K/M
 Xd0ZBfNchBJhcQZToCdvoVqLlCyIWqLHTvXc3Ace7EmceKqp2k5fL8VcS+w4/k8rCLwe
 fJ2iRuT+mAGjmtp3ATsz6TEdsPLV6mSDuTnjXQcHQIqHhHsjDn4Vf72J4htCLWctnYtJ
 fdKvJu6D8i8T1gjTCWH8/aHUJoRZYat4RqkGdiiwy0FEC6lqjzJ4oCg0aLg7yEPpWAnE
 SGV3862IJEN8Bp3ADCZuHspchKli/uYJWZzSBDZEtLGyvaHnOQWtem9/SGTTU/vpXejC
 vJ6g==
X-Gm-Message-State: AO0yUKUCIezyCMCPb9TNjLjWG7tYQTjcIvj27f4r9PvuSrcZfjHKY+07
 0expAT/NgGQMrDqh14BslOo+7A==
X-Google-Smtp-Source: AK7set87XzFHVRqJQBHua2964GxM0/ThSBIRysmURJ+fYF0e55mSBdLA7WY8dHh2J5wwMbQwPVs4Vg==
X-Received: by 2002:a17:903:11d0:b0:19c:b7da:fc44 with SMTP id
 q16-20020a17090311d000b0019cb7dafc44mr1164654plh.34.1677098104109; 
 Wed, 22 Feb 2023 12:35:04 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm1794025pli.64.2023.02.22.12.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 12:35:03 -0800 (PST)
Message-ID: <24860a73-b1c9-3f3a-1c9f-44ba9803776a@linaro.org>
Date: Wed, 22 Feb 2023 10:35:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/7] target/arm: Implement v8.3 QARMA3 PAC cipher
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-3-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-3-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2/22/23 09:35, Aaron Lindsay wrote:
> -        workingval = pac_sub(workingval);
> +        if (isqarma3)
> +            workingval = pac_sub1(workingval);
> +        else
> +            workingval = pac_sub(workingval);

Braces required for all if+else.  Multiple instances.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

