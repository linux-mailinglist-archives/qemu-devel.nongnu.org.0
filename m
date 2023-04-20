Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB76E8C93
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:21:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPXk-00016L-1f; Thu, 20 Apr 2023 04:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPXi-00015y-6I
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:21:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPXg-00054N-7y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:21:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bi21-20020a05600c3d9500b003f17a8eaedbso2661351wmb.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681978880; x=1684570880;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wg2hW/QnBtwAsYFjf21zgPXvn3nah4ML3TROhdQAqtk=;
 b=TOSraZkffiDp8jypnz0tBsdLv3zPB8eUkozKuXxEfDK4kfCXzb3CCXFHinPuMM6rKy
 olzkv9xt888wubCvPrtILckcN0ejEr8YNUhKppphNPKmvC8wP3t8yqYUX4L0glbFgURU
 4GtIsqUfsYK/jNzYnUJJhgrS7RVW6IL/Jm7bwi+kTWmRYnCloJqoZtW733io4YlJ9TzF
 X/Nr0hl8Xi6elNq+90HhZ60l7Ot4Bl6+T3yU0Vbc0E8vTlBWoHSYJzvHeuBevORcpvHn
 smeHwDG4xb502/8uC6IM+9kudN/JCNVphzcRIVIhCL8XYktelQNdVQIQcmdP1LCmccDE
 GptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681978880; x=1684570880;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wg2hW/QnBtwAsYFjf21zgPXvn3nah4ML3TROhdQAqtk=;
 b=fbYO6rINouk5gJawclkvVaznyWPb25TJPKZ2mXJr1QD1YPwKziCJp9WAlAfgNvxskS
 O+3U/11NjlE0AclpN8mu5guuWnAAtMJK9OU7DNlA2HrSwSVo0ENMqt/WuDUCRbSPMgnx
 Y7ozqUzq3kDTQMIgIb73oPZx/Mtm9k6JA3qDFvQPnBHnCN2Wwfeh9db0P740q+FBWm3f
 uiXssPM0XG7aFIe/+MeEpUMLVNtvSsT/B/VQEYwk9FSM80oeMxbRAbx+Zgn+6a2v821Z
 4dB29gEwexBLA9DATqqUgbrJSYRgiEsY88GQetcpftRJW2MDUYqLLD/PORKC2bAuQeHX
 Zitg==
X-Gm-Message-State: AAQBX9fOhdPezRY5orb9DLH+/Oo4YeJhTQzhSHGuP8XMZuyYIri37K5D
 jbAWYQsUufakWWNp1Q9yZ6I4zL6s8oSW1RMK3Qalig==
X-Google-Smtp-Source: AKy350ZEhSUePlSkj6rtNJ1Fp22zTJ+l+pmFPFj/YIVHIXYYsvi7f0CZ3yVYTZKuchzprnxqaBF6Gg==
X-Received: by 2002:a7b:cc85:0:b0:3f1:738f:d3d1 with SMTP id
 p5-20020a7bcc85000000b003f1738fd3d1mr618193wma.4.1681978880395; 
 Thu, 20 Apr 2023 01:21:20 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w23-20020a05600c099700b003f17af4c4e0sm4620031wmp.9.2023.04.20.01.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:21:19 -0700 (PDT)
Message-ID: <c8ee781b-9402-6b98-b983-ba18c5059492@linaro.org>
Date: Thu, 20 Apr 2023 10:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] MAINTAINERS: Add Juan Quintela to developer guides review
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230419163457.17175-1-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419163457.17175-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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

On 19/4/23 18:34, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


