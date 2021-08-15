Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1AD3ECAC8
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 22:04:02 +0200 (CEST)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFMMT-0003gm-A1
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 16:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMJB-0000e6-Ae
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:00:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMJ9-0002Tq-2l
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:00:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c17so13185445plz.2
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/4toCiHyuNDrC5O23EgC39m8GgNwq82B/0Or2hqVnEo=;
 b=h40VAY/fSUcEbqt98Wtf537XEmOgAEtvbfzQz+Ldq7xMo38hNAS18aJZIV9bt+g0HH
 itC2BqgIZPA4wWYsgNZG6rE31EcrdIL+OwBVnockgjlYRkzM28IXH9Bxa9Zy49Em74Dj
 ryFXkcFIbZLq/qMBLpAzgrceqQqUx126DILUeYAlPHEWRPVaVm7VabTGRjstrtZ5zZkX
 dDWU15efpxvQomufRYPRwvWCUYzslwcVLe/xQpDAj1YxW3yFv+yW52XnM5xyQjn7h60+
 lucN4FmMQE8xS4E/oCga4AEJQfPcNx3t3gANlbtMTfDuxDD1IfbWz8zVPjajDBrRIJuL
 DYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/4toCiHyuNDrC5O23EgC39m8GgNwq82B/0Or2hqVnEo=;
 b=BpVm7E8NP5hN2MPMGl8DMP3Qto3eHqCGLxy00nF2sPwWdeUBz3MoV5XStNZeDbuLxQ
 rYTVlHbKKcogZdtbFhfNmvMOYXMgf3eAEXdksFSMIE2QPpRgtYh3O74cztY37CsP8eur
 ZwI1g2jH2AvC766+G+XiiKVC59D6uVpSv+rFcSuh+DxDXLsO5Nmk+6ZQ05xPP6w7/4Zv
 e1jkyS3scbYKyN1P9oDsI83faYwouA7DXXBDUDAJlRZpPLob7XrS+0g9ran3taKhk5R9
 L7UZfp6sOT/whBMHdA2o6Y4vRiVpBR04Ps3Sw+p1q8jZ933yD0doxtD/ntPrv0wgAw57
 xAow==
X-Gm-Message-State: AOAM532HCVGxMrSfy+Nk9nMJ6gP02Sd5ahqlnCqMQgqgs64aYfeBUMef
 EbjOEf/oFV75Io3C/wwWcgiT3w==
X-Google-Smtp-Source: ABdhPJzgaXlqSb+TUgzxtd5A2oQ6q/jkNx5y3/yBDTGVbbEyBvFsqS7yolyZ6p4S7Jrp6jZUYNaUCQ==
X-Received: by 2002:aa7:9dce:0:b0:3e1:3c5d:640d with SMTP id
 g14-20020aa79dce000000b003e13c5d640dmr8332921pfq.25.1629057633423; 
 Sun, 15 Aug 2021 13:00:33 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id p190sm9175945pfb.4.2021.08.15.13.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:00:33 -0700 (PDT)
Subject: Re: [PATCH for-6.2 4/7] linux-user: Zero out target_siginfo_t in
 force_sig()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <115c040b-8357-02bf-1483-3b3f5e56d20c@linaro.org>
Date: Sun, 15 Aug 2021 10:00:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 3:18 AM, Peter Maydell wrote:
> The target_siginfo_t we populate in force_sig() will eventually
> get copied onto the target's stack. Zero it out so that any extra
> padding in the sifields union is consistently zero when the guest
> sees it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/signal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

