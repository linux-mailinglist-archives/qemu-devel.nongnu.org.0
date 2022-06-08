Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C278B5439DB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:59:27 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyz1i-00015h-7C
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyz0I-0000My-J1
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:57:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyz0G-00018n-0X
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:57:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so24389548pju.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wyb4WDp8qPmibGe0MpwAnMOux6Tb0qmKegBV6t52XOQ=;
 b=Vo580w1Pav2fqKg31Zj5/YCml0qU8TtbdeDucJW05P3RwzoT/5611jr2Sh4IvSz38N
 WmS2aPo90jSFaS9+YOd7zmJDVKZ2vsOncJHa2ZXj7zlnj3s90dFiW9K93wgkIuQFJW8f
 qfx6jjV971oIvVMUURbyq/WuzCplGMKG++gWto2ydAAfnkiWdYOPICtDQKZhtX47TjHR
 QHCn/c7UAmS8Etyv3VHHXYJoZ7/UW4Go+jsV7gdwfdYjtQCMTf0lz5WnZPeBSgAJ1OWm
 ojk9pwfhyhttgaeGaNi0bG5HhS/vUFpOiPKRYD+FgxuFrYPzE3CRzv8PddOU1FoaapHp
 byyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wyb4WDp8qPmibGe0MpwAnMOux6Tb0qmKegBV6t52XOQ=;
 b=7F2kOEBmptIMzaQVvojGdPGa8EGhylzylmdFPkujfvmUS/NSYLv1u3ATStGNmVD9c+
 XULSBqGI/9lGzmwzruhhV5w7vyKZto1gcpyKiHZ6Xa9uxW4cbPP/MYqR1BgyVihb5GT8
 EKNfLOTFSToJArNHHWmQMS+3X+hUommIc/722eqDbRuPHRP1GpOREAiS4bdavmkMbm3q
 7dko6jEhWvD9b8t49MqupxaM3fCMoLbSPE69SuXCUDcV6xQ2elyFaaA84xJ0YbITPo3W
 kYpkmE7H4Upj2MTAzXmJhuRaXSkQEdedbCFMFwRor1ihE8028jGW4o0ZqF5zk5A3G/Q2
 GbmA==
X-Gm-Message-State: AOAM530AJEwkERWPMgh9nSffgp7RFZwAIe5VTnUzvobotZpXt4WE2tST
 nbstWuqzQU09CapNwpTFJyDPz5XEOxWNpQ==
X-Google-Smtp-Source: ABdhPJwYD+b0JePrfmKnn+sLFDgLGl+uesROqsY/hQBaCKFbLEGTDPUvLrPkbJlJzfajRUSA9w3aIg==
X-Received: by 2002:a17:90b:4f4a:b0:1e3:49c9:aab0 with SMTP id
 pj10-20020a17090b4f4a00b001e349c9aab0mr112467pjb.223.1654707473027; 
 Wed, 08 Jun 2022 09:57:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a056a00216200b0051bd9981cacsm11864608pff.123.2022.06.08.09.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 09:57:52 -0700 (PDT)
Message-ID: <bc93cdcc-549f-28fb-fa33-5c1ba268d6b9@linaro.org>
Date: Wed, 8 Jun 2022 09:57:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] gitlab: compare CIRRUS_nn vars against 'null' not ""
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220608160651.248781-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220608160651.248781-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/8/22 09:06, Daniel P. Berrangé wrote:
> The GitLab variable comparisons don't have shell like semantics where
> an unset variable compares equal to empty string. We need to explicitly
> test against 'null' to detect an unset variable.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/base.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index f334f3ded7..69b36c148a 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -13,7 +13,7 @@
>       #############################################################
>   
>       # Cirrus jobs can't run unless the creds / target repo are set
> -    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
> +    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == null || $CIRRUS_API_TOKEN == null)'
>         when: never
>   
>       # Publishing jobs should only run on the default branch in upstream

Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

