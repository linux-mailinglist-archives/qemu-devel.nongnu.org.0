Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F199E6E5CB8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:00:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohCA-00051u-3l; Tue, 18 Apr 2023 05:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pohC6-00051Z-OM
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:00:10 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pohC4-0004wj-Rz
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:00:10 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4edc114c716so1605673e87.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681808406; x=1684400406;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=260dZg9pm2YRQGgrpHsmIt6rFEd8tbwm1XprJdiyU2U=;
 b=WrFmdUAdtV26bblPTgBv2YYeqlDJ/XgPKSks9+pWGMusvLWOG88RbZounejAKH8vfm
 3u7a6LpaZcev0OwnO5LobCSvTtsdmoQXofEoLFGj5InX3bpryRa23qm8Tr1Gy52n4Y3b
 b8LgqtP4fReYbOGMTHWhPRnfoVnUeHblBO9WweWOh90/sFCHZoVHGSv3mC8E3CW8doqP
 8I6oEZ/Gue5alRrBzgk7KKRJkiIMRQdO5zZwbfEyQBOmzvAVJVmcN1OQfKM0/1Kl8xt+
 LtQxsFzTA4fIrmL7uEJinXIrZtle9b9dwKRVlW+RVMUI9aWRR2W4jd0w886t0CKuysE4
 ThZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681808406; x=1684400406;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=260dZg9pm2YRQGgrpHsmIt6rFEd8tbwm1XprJdiyU2U=;
 b=jtYN74zGHy+S2XUEW8rMf087GkRX9qcMtSyTYHFtZqr57f9ZxcMf5mjDVeEHPdfl4U
 fEzUdqMekplxL2GwBR7Wi3XdfqYRUFcZaN0gSkzVO0tZoxTdJwTU2kUx2nO19+gcCSC7
 YJt/QrNxQMX5YOFtP8NrgNYF2QJYcPh+g2cm/4fDVY1thorBFoLqDcXzFMV5NS2+Wj+R
 2MlgbkKwoh3xzTNBfuo8HuL2eQ41nTUWA/NjqDU9pjg/GVZ0bUsNXXPNb27svJnrfvgJ
 rr1caenNupZOovzX7g5AbkeGFItlgeD636yxZAx4e36dx8sHIHT7jLvWOAPQC6OTKSc7
 0Jmg==
X-Gm-Message-State: AAQBX9cKxuvkKKSNELBKNowoRrk/U+lJwpy7EVlBG+O+OQ67Wc3Kk6Q4
 XazhBPCFwb8uyXsk66IEIWZKyK8nhBsGelVSXqqSHg==
X-Google-Smtp-Source: AKy350a38xgAIxcAEKWFD6q4tlDyzxh5BJ0V4XfFgIv1szm4lwU9cOBUMnyT5XbuzbnyIoiXoHsCkg==
X-Received: by 2002:ac2:4f88:0:b0:4e8:3ede:7e3c with SMTP id
 z8-20020ac24f88000000b004e83ede7e3cmr2582967lfs.65.1681808406208; 
 Tue, 18 Apr 2023 02:00:06 -0700 (PDT)
Received: from [192.168.200.206] (83.8.56.86.ipv4.supernova.orange.pl.
 [83.8.56.86]) by smtp.gmail.com with ESMTPSA id
 p7-20020a19f007000000b004edc63c77d5sm547507lfc.217.2023.04.18.02.00.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 02:00:05 -0700 (PDT)
Message-ID: <f154e6b0-0f29-33f3-65d6-fb0b60ea95be@linaro.org>
Date: Tue, 18 Apr 2023 11:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] target/arm: Add Cortex-A78 CPU
To: qemu-devel@nongnu.org
References: <20230415082827.2054-1-jszhang@kernel.org>
 <20230415082827.2054-3-jszhang@kernel.org>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230415082827.2054-3-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
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

W dniu 15.04.2023 o 10:28, Jisheng Zhang pisze:
> Enable the Cortex-A78 for virt to use a CPU type on the virt
> board that models a specific real hardware CPU, rather than
> have to use the QEMU-specific "max" CPU type.

You can use 'neoverse-n1' to have a specific real hardware CPU.

