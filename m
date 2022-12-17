Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2A64F63F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6L1F-0008Cg-GJ; Fri, 16 Dec 2022 19:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L16-0008CJ-UF
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:25:28 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L15-0002Y8-AW
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:25:28 -0500
Received: by mail-pl1-x634.google.com with SMTP id n4so3883745plp.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ft8SC1RObBqkGzCXYjpwJTS9uAtnH9wrnQbiDf2JcRk=;
 b=okhPBw2LQHBj7nvQAWQz3ke9S+vxUTkPHvSmW+6+3N33EoMMZBlP5Trf4EXWZhOtjl
 Lhw11JvUxOW78JuHy5I0/+t/EMidLAWTxh65AjNOQEkEJ4u1ijSFHeq2Z2jEFpvpxFJI
 ciZCDN3Kdbt1vepE3UnMo5c3jlBocqj4zcB+Q1pu69Mzan/Gb7UkVorj83iqAfsJ4D48
 CxTh8tfWQLHMf14HdS1se0QBqM5yVgPT8QfVc0pkz0c7VMiz2NBIgwFsellR0x7I8bK+
 RosiacdHXqEkCNXRk4zTmTfDR3UQ1WajVYAH5QrvCgTG4h6X3Ed2+Nc3n8LwfEVTiQQw
 10RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ft8SC1RObBqkGzCXYjpwJTS9uAtnH9wrnQbiDf2JcRk=;
 b=aDyGxwHfF/uHoprOEPWTQBbwAKBmu5YEWRNhTjh5LT7eNMNIxsTDb8wOcVJIjBFJxG
 8AvgTHujkKDOg0yu+sdoO67a4DhGX9wVvNT+iyz2GQC1BB7F6ohCbCG4AboyVQg2IBTB
 LGQR2eOjTICkYNd0aKt/6yQjwUWuRxvLgtvDU8qUbof4egdewU6EJLmdbgcijUu4QCWt
 AtXhjcPBH9Z7XIv9Ib0DnHN8Qgh5TsJXtUwo3EQlHH9UQzC4Ej04DS72axbkUOF7bl57
 nZ9ct3sVwhJ38mkJaD7QcljBB2MystDullDS5WFAnk4P5Q1Ue7Efkla1/rvx/0jKjMko
 mSMw==
X-Gm-Message-State: AFqh2kqVfANgqEDOvjuQM9nJbx9BZFkS/ojfRXCRtMPc1s18wq01aL/v
 unSsC3O+vdkMaBKw2qXzM65D5Q==
X-Google-Smtp-Source: AMrXdXsjv/qs7CEDUCLiIe3NmjoA8NyeTz54srknhooMAvISdvd7Lh6DfbcnkwxMycFF1Y7ZvvJ9YA==
X-Received: by 2002:a17:902:f2ca:b0:189:86cd:d7c0 with SMTP id
 h10-20020a170902f2ca00b0018986cdd7c0mr261792plc.18.1671236725871; 
 Fri, 16 Dec 2022 16:25:25 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a170902daca00b00190fb8f9e0asm2184438plx.249.2022.12.16.16.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:25:25 -0800 (PST)
Message-ID: <b784460b-635f-2304-c125-050c5cfb1de9@linaro.org>
Date: Fri, 16 Dec 2022 16:25:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] hw/i386/x86: Reduce init_topo_info() scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20221216220158.6317-1-philmd@linaro.org>
 <20221216220158.6317-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220158.6317-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 12/16/22 14:01, Philippe Mathieu-Daudé wrote:
> This function is not used anywhere outside this file, so
> we can delete the prototype from include/hw/i386/x86.h and
> make the function "static void".
> 
> This fixes when building with -Wall and using Clang
> ("Apple clang version 14.0.0 (clang-1400.0.29.202)"):
> 
>    ../hw/i386/x86.c:70:24: error: static function 'MACHINE' is used in an inline function with external linkage [-Werror,-Wstatic-in-inline]
>        MachineState *ms = MACHINE(x86ms);
>                           ^
>    include/hw/i386/x86.h:101:1: note: use 'static' to give inline function 'init_topo_info' internal linkage
>    void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
>    ^
>    static
>    include/hw/boards.h:24:49: note: 'MACHINE' declared here
>    OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
>                                                    ^
> 
> Reported-by: Stefan Weil<sw@weilnetz.de>
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i386/x86.c         | 2 +-
>   include/hw/i386/x86.h | 3 ---
>   2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

