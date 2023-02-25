Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA06A28A2
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:46:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVr7T-00061t-QH; Sat, 25 Feb 2023 04:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVr7R-00061Z-QT
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:45:29 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVr7Q-00075f-9t
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:45:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id r18so1582889wrx.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rm5RNbYpzOwK+gX04bQH9GhMOUqOnDiPQeCSvaOvRX8=;
 b=tjPx63LxgARqAB7LGWkrNVRjEcMP0BaZ9y0straqzXoZKHDBSPZqUMyTplP9A8FrEO
 R+NlT49CaIOx2J/Tf8sLUwaZiVKK42QQwoUBvtMRf6wF6h3PHneqUVbrQ71F2SyGGGk3
 QppvfvN6NRJGMeHryQSFrXgrmsK11X9YSt+/isQfuS6J4F6zz6D2kQReCHmgiGCce1ou
 4qkib7EzfadgN/A212O1xNWF6MnH5JRZGWopzqwHYvfr1JkW89t+UrKBwtDwgmHoA/ci
 f+dR9J/NxSTdVCNHF36r9qoVCS1u1aKsNwwBTKmk8WeQaoX+ZImCbh46rhItFY6QauQY
 Yefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rm5RNbYpzOwK+gX04bQH9GhMOUqOnDiPQeCSvaOvRX8=;
 b=a8OLP/iIVKS+leZ2g0Vctjg7gqAJk4Xh65XUuIJHPfcMijdPeiBM/0hg8Arit1vf1K
 HQCji5EBvgHgh+TuLVmXc3JEhjC6HGoFEB+WCsROMTeUFIlnnVeo3eN2Er5nZg9O/tBd
 6wVBzKwJvopc/WNCT2h1TJOFrPZGk0H7WwCs/4fYP/B6/g61/W+hfIhLUMB5dTSbU7MV
 kWBRukB1pHC1SApqVIR8Vlvvo2N+4PbbiPz8zBqfpps0/t5HL214zGWPPA8R6t8+nkPm
 E8R4esv7j6IW8KWLOD/cX/SZCGxfVuMm3wOo2W85T9TMkj46y27AGwDJ3sO0DZbasw2P
 XyUA==
X-Gm-Message-State: AO0yUKWjlOwaCcucnOQUD94byAxb8OvXYg4Po9zR7s/KGaT6BzwjMHj5
 mo5ilqJVZrgqr4ThseRHQQiYLw==
X-Google-Smtp-Source: AK7set+1xwjJuXa0f+aA2RK0QEp/yvK7ixxU1rqWZF9n27Pyg0bsx9kaNiC1Tlegzv5hacDDmx5ZgQ==
X-Received: by 2002:a05:6000:88:b0:2c5:a040:5dd2 with SMTP id
 m8-20020a056000008800b002c5a0405dd2mr16413224wrx.22.1677318326095; 
 Sat, 25 Feb 2023 01:45:26 -0800 (PST)
Received: from [192.168.136.175] (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b003df5be8987esm6325316wms.20.2023.02.25.01.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:45:25 -0800 (PST)
Message-ID: <5df67bcb-07ce-25b5-3445-450c9e91014f@linaro.org>
Date: Sat, 25 Feb 2023 10:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 5/5] dump: Add create_win_dump() stub for non-x86
 targets
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
 <20230224073850.84913-6-philmd@linaro.org>
 <6254606d-7164-50c3-a0c1-e3614810978d@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6254606d-7164-50c3-a0c1-e3614810978d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 24/2/23 22:10, Richard Henderson wrote:
> On 2/23/23 21:38, Philippe Mathieu-Daudé wrote:
>> -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), 
>> snappy, lzo])
>> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), 
>> snappy, lzo])
> 
> You can remove the when: as well, yes?

Good point!


