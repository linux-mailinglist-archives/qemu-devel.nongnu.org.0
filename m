Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22346EA36B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:04:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjs6-0005zV-23; Fri, 21 Apr 2023 02:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppjs3-0005sE-Bg
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:03:47 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppjrm-0008Sd-EO
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:03:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f193ca053eso910395e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682057008; x=1684649008;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QYv8U16/UjaQ8viKpqDWvQDkRGAyYBNOtzvcexOmfIs=;
 b=a5PSjguPwC/u2Q4WPMGvZ1TdAaQbEzLbAqBkZRFkJRc5VVbDbZE9CxDMzn9aTtyj4K
 upQ/W073L/j3qObyPlOqRtPNUaw6jjhCCT6oI6XY7oBrYr7FqhF/839Vee6So2xmBzEF
 myoZNr3+v0vhauKmnf+rHI4/ixsxxp5/buZBURJPP+QOZ9gwsw0HhI4MZOUngSADh34K
 YivjtQyRQew6jHJ6NC4l0sRHVch233uG/CshNjwEGJyN5MjCegmBXvbuyrpZEkXBIDGV
 U0DAZLHkE1MKnqPukkNFlxvpF9ud6MlKlJ06Dm5Ksjn62zigbSm4ZF77D82fmFAqjGIw
 Pk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682057008; x=1684649008;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QYv8U16/UjaQ8viKpqDWvQDkRGAyYBNOtzvcexOmfIs=;
 b=FqZFm5NTwiwYTh3z07/iDJizZl4hxqW4VKZBH+OSmB74x8SBcbVBHsPLAlgdknXC8Q
 NWs8k5dgtB6GjxhLkm6TJaSDabfPbIBMwQ6lfSKkHjH/Djx9DmEfKGlKtBHZW7kAZ0SA
 EPqW4bv6f0WlT7ymE3mL2/dTA7pYSm31YNdnbxHvUz75cE+QWGJ6EXuG8aDTdVTpu1KG
 md6G3viMDiaUpcli7i+j29q9rL3rvHSKD0Dc8r5UQwO2e6XVEuGUbvt2POED79OY4oWg
 osfjMKX5DgWAzrOvMSx3Yz4phRhTEyVPgrrEW55gWGDAwHdvI9rm8echKZnd//GWsWjL
 SGIg==
X-Gm-Message-State: AAQBX9c5NIUziV9f7xXjovvCY5ibR7vU4zE83c8Jw70HAJL+1wi+KwTR
 JV2a4X/iBqiFTVmjFq+ION3wOQ==
X-Google-Smtp-Source: AKy350ZRCfRfMgRnt2OE2X6p96XYpGLJi/jetJP2TrS4vhXn0tXDHZJbmbKfolSM16LnU1XSMSfMrw==
X-Received: by 2002:a7b:cbcb:0:b0:3f1:6faa:d94c with SMTP id
 n11-20020a7bcbcb000000b003f16faad94cmr734817wmi.16.1682057007897; 
 Thu, 20 Apr 2023 23:03:27 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c215300b003ee20b4b2dasm3826384wml.46.2023.04.20.23.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:03:27 -0700 (PDT)
Message-ID: <826f3ebc-ec1a-1a05-183b-3edd0291826c@linaro.org>
Date: Fri, 21 Apr 2023 08:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] avocado_qemu/__init__.py: factor out the qemu-img
 finding
Content-Language: en-US
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
 <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 21/4/23 06:23, Kautuk Consul wrote:
> Factor out the code that finds the qemu-img binary in the
> QemuSystemTest class and create a new get_qemu_img() function
> with it. This function will get called also from the new code
> in tuxrun_baselines.py avocado test-case.
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 27 +++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


