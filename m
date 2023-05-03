Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED46F55C7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:17:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9WO-0002V9-VY; Wed, 03 May 2023 06:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9WG-0002Ti-8U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:15:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9WE-0004Jm-5e
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:15:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso1717549f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683108926; x=1685700926;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SRnln/5S8dapEvjx0b4DOlS7faXakPfLBHiR7HXh8iY=;
 b=BtpayPM6jiAyygg0kzsBxXlejcUQ1ghkr3fspg39avn6k45wMxFpxFwga4uCO71pNc
 JpM+upZDsBk2/mMmRkH5UuvO6wgatxCIqu+Y4XYRGVMZDofDnAQsx0Jpd4uK+A+mf8rO
 Pvb3X3A/tWx7s9hyzPz0O7hO+nKgLNZ98Sm0K8OBfs3PUYhMILSiobSO2c3CKfeClWCy
 Voe6DQMzBdJzOD0ONwyPyJRVAsNBUjvOLbqdzgTDF06ZIwrNBAkCSUB5JkE9FVTPdY2R
 ZjpKOEUPFDqzCzB6TbbAjptv0BsHJu/JLflvEBA2ZGrkR2YXdBKvGVht4tgcr1QKEzwj
 GqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683108926; x=1685700926;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRnln/5S8dapEvjx0b4DOlS7faXakPfLBHiR7HXh8iY=;
 b=fgYQfpi8tEjh39ZvUT8NzE/MJJR2a3D2AFgaC/7p5Jtzjax/23AGjTzQTs5s+L6X0z
 Tl2Lu7HpM05LVneq+BDIrwI0jlUfuyVQ3nmtocsYcipNQdLo4gWRENJJXBL9QoBbOJaP
 /WNDe3KI02MLPcdnGjMrm8eh3B1egrfrhMNuPa9eN4JZHbiNL+vfqqXHuCmwBK137Qmi
 vmdbXb9rE4a6UVtb1CyHz3gm/wDOucPlr4r5cl1UwlCU3PWVMsX3Jy1Fmt+QVj5iIxqd
 fyShZlBxldAjVgJf08ze4O3UnzZ+WbVmDt4KKai4jvp5RS3g6K897VbbOuSj2kbx4L3a
 hrQA==
X-Gm-Message-State: AC+VfDylzmgF/iNzE8lMpXJViTMq6Ts+c2DiNtzaEt6sxmo3iBUfHRZk
 r/LMlO5PS4ncPXomiwe3DWn4ZM9h56EuIluyVL8s0A==
X-Google-Smtp-Source: ACHHUZ6mvLoAjrsd0+FSbnMAQI/V8J/1bkLdfjflvUuFwZr5m/CEdvHnKHfDErQcoGMY/b5yOBHnVQ==
X-Received: by 2002:a5d:4dcc:0:b0:306:30de:6fb8 with SMTP id
 f12-20020a5d4dcc000000b0030630de6fb8mr5727583wru.29.1683108926617; 
 Wed, 03 May 2023 03:15:26 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adfdd07000000b003062db9cc21sm7642440wrm.92.2023.05.03.03.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:15:26 -0700 (PDT)
Message-ID: <ce8b3a6f-4d99-7b10-02ce-ebb613b32d26@linaro.org>
Date: Wed, 3 May 2023 11:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 04/22] scripts/ci: add gitlab-runner to kvm group
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 10:12, Alex Bennée wrote:
> One of the main reasons to have custom runners it so we can run KVM
> tests. Enable the "kvm" additional group so we can access the feature
> on the kernel.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reported-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   scripts/ci/setup/gitlab-runner.yml | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

