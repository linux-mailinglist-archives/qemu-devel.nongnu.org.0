Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD65872A2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 22:57:28 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIcTZ-0001wA-Qu
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 16:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIcRw-0000On-Nx
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:55:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIcRv-0001st-0t
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:55:40 -0400
Received: by mail-pf1-x431.google.com with SMTP id y141so11708649pfb.7
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ud7hxiu0whaJXSxRHAXIldz/AlZxJlnaGDoppTsZqzA=;
 b=C7AVX8IFxJS2JdWA0gCt9KGJqf2/Pi8TPEZdFroL6eY4bEPaoMyGEUr2KZ+1HjfwQd
 60HIzM34FmYvOnyZUIQSh3wELnR6qXp0LpRVGppVj5BlqDHqdW3BShX5qcGBVJOUmMfh
 Fw7S48TDlEAL36dMOB6rE4KEjBT6kvTz8+sVuTc/JUYD8qn11D1Y2+6dt8wPgtzC1Kjg
 g+IcF/wcOMu6WdTJwktqkEv8KG3Y1aZhlKI14104Z0XI1YloChd6z8XJXfSrGJO15G/t
 sEdXuMfx34MbZD4p7g5G88XwwDurxiG9QEHPNGoNz0vEq5LzW+D7B6V6OX+zQlvawyzF
 O3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ud7hxiu0whaJXSxRHAXIldz/AlZxJlnaGDoppTsZqzA=;
 b=AI6PCsj3h2wV9s6/uZKYOq9En9MGnsZ77wtxGpviue8yHj18hEANHIjvZH+JtmVD73
 g7rjwdgahqMv44N5dT1t6uUxiKz9f00GWiXM1BRVcEYJes9HlbIvU438mV6nrPxKxPsn
 rDn2yMOWf32uwkk7cISSqS5XF9lEcj9HTc1r1E2Qskws64zS6Yj0kWTpHu7Upj6YQ5ny
 Mf6d4xuix2MZHh0tQV3Yv0KDWHKNuHXa77aG5hNtSBnaFPaNmbCzQqTHw46gn7Wq0ThI
 bKuR4yx/3AskguysiHMZXV1DXnzaC6GK7nT1AVOU0T+DVoGKkYGjczT+qldW1WtJ0b8T
 2i/g==
X-Gm-Message-State: ACgBeo03sZRbnKU7XmuBAIJhTJLz+GtWRbSDFjK+TAY3Y0oOcx66zfO+
 pgpMVKypi6VX/5ZmuutUSHjrmg==
X-Google-Smtp-Source: AA6agR4BxFXbrn9/CRTjDV1k/FVp7/AxwL+KdpKrU6KokhR1Ihf0ICa3ZNcmw+XxDrh83TVgk0lSYQ==
X-Received: by 2002:a62:544:0:b0:52d:946c:b884 with SMTP id
 65-20020a620544000000b0052d946cb884mr4593269pff.72.1659387330993; 
 Mon, 01 Aug 2022 13:55:30 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:e82c:8cfb:9ffa:3c7c?
 ([2602:ae:1549:801:e82c:8cfb:9ffa:3c7c])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170902d50600b0016a0ac06424sm10298190plg.51.2022.08.01.13.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 13:55:11 -0700 (PDT)
Message-ID: <57866fff-f702-9cc5-e0f3-bd60d2e4494e@linaro.org>
Date: Mon, 1 Aug 2022 13:54:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220801153605.3051778-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801153605.3051778-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 8/1/22 08:36, Peter Maydell wrote:
> Only thing for Arm for rc1 is RTH's fix for the KVM SVE probe code.
> 
> -- PMM
> 
> The following changes since commit 4e06b3fc1b5e1ec03f22190eabe56891dc9c2236:
> 
>    Merge tag 'pull-hex-20220731' of https://github.com/quic/qemu into staging (2022-07-31 21:38:54 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220801
> 
> for you to fetch changes up to 5265d24c981dfdda8d29b44f7e84a514da75eedc:
> 
>    target/arm: Move sve probe inside kvm >= 4.15 branch (2022-08-01 16:21:18 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Fix KVM SVE ID register probe code

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Richard Henderson (3):
>        target/arm: Use kvm_arm_sve_supported in kvm_arm_get_host_cpu_features
>        target/arm: Set KVM_ARM_VCPU_SVE while probing the host
>        target/arm: Move sve probe inside kvm >= 4.15 branch
> 
>   target/arm/kvm64.c | 45 ++++++++++++++++++++++-----------------------
>   1 file changed, 22 insertions(+), 23 deletions(-)
> 


