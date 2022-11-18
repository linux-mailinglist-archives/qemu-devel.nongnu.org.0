Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E962EEB5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:56:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwEM-0002Jh-ND; Fri, 18 Nov 2022 02:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwEI-0002GN-0E
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:56:06 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwED-0001ry-CS
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:56:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso6930374wme.5
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j0LhRr84JMVf/sIcEN4S8upklzU7fAjX4g5cgS3180Q=;
 b=blh2ZG/HN5l9sgZUNEWxeC3RVOCWK3oUpmcZkvjPXVUqGpEjm4X0V7ktEvPSN3Qwuj
 yra9uylvChr9jkriPIOGKpGxMAdlzPOGyqEwTl3ph8TF7tJOr5krWvOgyHZSF0Ad9gt2
 u7fBVExelIQ3N/oSIpn7ScBsFfaPxtm0RJJP2KHqt2/pvDYUaZ8Ur9gZ5/hj7kdhLbxd
 KN9FcLb2oT8ESesD1szdA/Mk+WSABRov0GYXkgzSBm8DsI0LwVfXEZ3CSnAg1QSGRMda
 I5SQwTLdRcS8WX/YSchTuMRHMj0srbg5pYQwt4z8cXpdB3bkgVEhAh56aMomDNYxhoY3
 Kh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j0LhRr84JMVf/sIcEN4S8upklzU7fAjX4g5cgS3180Q=;
 b=a1tb5/adjX6DNf9Lvs9jHLcuZv8CUSfBYUerboew7EzYIpZ4i+EbOS/D1Ypqkscs4w
 4/APxiS8CNfeJ7I51bGj6WWMcp3CG7/my8nIRqdSyBkfmJkMb+aaUGyDH0ZAPiw4TdzI
 kA7JNWzqoPJzW4TlhLLeepeQ++JOlsa3b01sZjIPTHNqhN0fbq87Yq6CjkbYpCKuCUC8
 PcY7tOaJCZR3y5PqXhkuYe+iXEodVo2o1nSFAuAmEckSElm8EfeDe1wdqsJBHZucE/36
 kbii0AIKty20THz855EXilWOf/pBXw0Z2OQfjYiE+X53Lf05Kxjb6JE/jqcQa8DaQE8y
 +mKQ==
X-Gm-Message-State: ANoB5pmebm0gnTX7kPKss+4jrZqu7Bs9RP2+iRPiRu3aUyLtzQVAUY+b
 KpLmgD3cvzEJht8vj3CMNkJuUA==
X-Google-Smtp-Source: AA0mqf6Xs2qY11HrngXCQWYG1/SI8QWBrUHCWej+ewlSLYEynnhFBRSEOz8zsNpOm4RZUr/AWCAXdA==
X-Received: by 2002:a05:600c:688:b0:3cf:a18d:39a4 with SMTP id
 a8-20020a05600c068800b003cfa18d39a4mr3910235wmn.125.1668758159701; 
 Thu, 17 Nov 2022 23:55:59 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 n24-20020a7bcbd8000000b003b4fdbb6319sm8057770wmi.21.2022.11.17.23.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:55:17 -0800 (PST)
Message-ID: <d625c02a-dd84-2eac-82e5-ae4515647ddd@linaro.org>
Date: Fri, 18 Nov 2022 08:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 06/13] docs/devel: simplify the minimal checklist
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 17/11/22 18:25, Alex Bennée wrote:
> The bullet points are quite long and contain process tips. Move those
> bits of the bullet to the relevant sections and link to them. Use a
> table for nicer formatting of the checklist.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20221111145529.4020801-8-alex.bennee@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 75 ++++++++++++++++++++-----------
>   1 file changed, 49 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


