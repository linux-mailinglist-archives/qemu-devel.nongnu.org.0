Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDA56B2592
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:37:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGS4-0006Ix-OZ; Thu, 09 Mar 2023 08:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGS2-0006H9-GN
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:36:58 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGS0-0005MU-S2
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:36:58 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso3618100wmq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678369015;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HwYoA0Tw1M/lahmNA2YQlwLtLfmntrq8dlhEsYfJGGY=;
 b=PBUxwl4hnpXebYAsZmwo4vNjEPyC+AuFt4QV/gcpIp8N9MoPXA256noOmzi9w0wJ0+
 g0Kyy5r1HogzIqJr98F8+2UsOAOzu3SUzDxXLu9LfIsIS0ncW2uPiCBwhaYd/b9EB7XM
 6QWeWC8sZX74IC6kFvSlDFvJ9q3oymZVmTg8e2J4/lz1GQZ5JHR/T/wOBW26FqbXgkfO
 jUzei79zxIZFP3FXM3otXlLha3ppfAFNJFf7XPnOYVXeRZh3GZuRcwqLwpX40KURRqgP
 d9sMif+FomcuNdv005xdvKYHgO0iJyM5o+dtGYzVdIoye9qhIxO3NWGsYxexJ1+fh7CV
 q3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678369015;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HwYoA0Tw1M/lahmNA2YQlwLtLfmntrq8dlhEsYfJGGY=;
 b=H0b/zrPIun3xcFigcBMvRlHbG78/Yqnw6ZdnjvMBtyujr75XcCDoCfuQxkfGRI/7FR
 Mnf8vdXR3UTvq8oWnK1zZk/r31SQ5R0DwEhQ8IP7Q38QwSQO+kF8aHuZ+kP5LKF7OTr8
 fGD1xYDK/ngAkCj0EBPOF2Cy4BPuj8uwmjuXM+uqsv5NUdv2U3WG5TivOCKoV8uHjemb
 eBBtiqiUhhZnW4xikHZVxbDOQpun0FYv833C55cqW0jOkxipCWFEVdEfClPmiF7kyPZb
 NmJRG1SIDdphUVp6XSbOATA/mBLazktNO00g8gU6+L7CbbktxKpjkO86ukzSgN2ND7D6
 AhfA==
X-Gm-Message-State: AO0yUKUsoViDyG5V0Huy+jMj00jB07HPtcnh0UewS7CDv+eU9kd3GdtH
 pnjL0IpbCKMuOcQRYzpMgxZYfNq96XhvZ7QzMBE=
X-Google-Smtp-Source: AK7set/QAzh7lLiF26GPqVzoptDRcpCXnCpZQajXEQctciE4rSB0nuiI0sC9xNjlBRYQpO2YBY0nCQ==
X-Received: by 2002:a05:600c:35cb:b0:3eb:3104:efec with SMTP id
 r11-20020a05600c35cb00b003eb3104efecmr20205746wmq.16.1678369014840; 
 Thu, 09 Mar 2023 05:36:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003dc42d48defsm2848465wmq.6.2023.03.09.05.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:36:54 -0800 (PST)
Message-ID: <89658f17-6c19-146a-62df-dae35bdbd5a6@linaro.org>
Date: Thu, 9 Mar 2023 14:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/4] target/mips: misc microMIPS fixes
Content-Language: en-US
To: Marcin Nowakowski <marcin.nowakowski@fungible.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

> Marcin Nowakowski (4):
>    target/mips: fix JALS32/J32 instruction handling for microMIPS
>    target/mips: fix SWM32 handling for micromips
>    target/mips: implement CP0.Config7.WII bit support
>    target/mips: set correct CP0.Config[4,5] values for M14K(c)

Merged as commits 9055ffd76e..dcebb36eb0.


