Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190686658D3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:18:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFYBZ-0004yX-BJ; Wed, 11 Jan 2023 05:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFYBW-0004yG-O0
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:18:18 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFYBV-0004jy-AC
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:18:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so12228405wms.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dJeF/7L4+phPOMM3aDFo6PHEHD+NkyPl26+uM4j51oU=;
 b=kjxjTbdzjNTaR6F/O9qbdK6voS4aqKfk8fyOVOzNK1wNFrK7e+lS/9F0tErZIgL0Jg
 Z42EA2fik9AyeF7r7QMPmb6GFY1V24b+79BkoJcw4HTjUaCyKKdOPazQpA+mlqqCu4Dn
 mKhTlyyKujWrFx4UrV+4ci23J+ikNMbFTgUurQ+4lVbBddP8RlJimzWijEDap1DDxI4e
 Slwl+k7t0PA6AkijuwuZh+vM0MRE2q4VEdi35W9RYmZ2cLX6urP8WWLqpUpYFgpEavvf
 Nr007fVyb82JXeTjk2u6XnJWfuPeBrKFHD/y/qsNpLPwmMhfHysGkk0qS/uf709j7r9p
 kWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dJeF/7L4+phPOMM3aDFo6PHEHD+NkyPl26+uM4j51oU=;
 b=DLbKspCJHlkPU9wZHnePeB0eMR0dOcRCXEWAVoizR/mSSoESGThgXksajhO1A8g/FC
 ioWuG7cnZvvpAxdd//6EGlTl+JUcnnIcLlZHYVkaTFwVM/BGDomRk+uvPJxac8tIc90L
 AdkrKxMK5AlYKH5z+AzaSoPks1U8WQhwNj/YKC8hzEYqHZGueUI93QHHwvSSt7jLXZ6y
 C2eqRH9D/FFKwX7riVZz64CeEkQ3SJORMfYgo1rbbSl8AgFxLAfZkLhYkP8fuqPx3QH4
 hGI6sCzpTK59HrWri8U0PKasbWtc/YMdpbij4Z7JWR+2HZE2I8Kn7Sqq1DSKxGB0AZOr
 hPUg==
X-Gm-Message-State: AFqh2ko13KhZJOj5PxmW6xsYfIXY86rQQK/L0VbPxEhsESsaWUwiD6DH
 R+1TMF3Ulzj0Xqpd5W7nOphzAA==
X-Google-Smtp-Source: AMrXdXsrGZn/nZZVd9FgJjtb+JMGya6zSToZwp4vJOx0ayfoFx3ZTtEXKKe0IsWRIwlo5XViu9bRuQ==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr52171769wms.36.1673432295954; 
 Wed, 11 Jan 2023 02:18:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b49bd61b19sm25332827wms.15.2023.01.11.02.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:18:15 -0800 (PST)
Message-ID: <c81747a0-e95d-519b-08e5-63d48f82d324@linaro.org>
Date: Wed, 11 Jan 2023 11:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 08/29] gitlab: remove redundant setting of PKG_CONFIG_PATH
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
 <20230110160233.339771-9-pbonzini@redhat.com> <Y72U/8LeENuOKu/i@redhat.com>
 <eb068a2a-071b-38bf-9707-85d0dc22e062@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <eb068a2a-071b-38bf-9707-85d0dc22e062@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 11/1/23 10:20, Paolo Bonzini wrote:
> On 1/10/23 17:40, Daniel P. Berrangé wrote:
>>> Signed-off-by: Daniel P. Berrang??<berrange@redhat.com>
>>
>> This has mangled my name - think your client sending mail
>> needs to specify utf8 charset in the mail headers perhaps ?
> 
> I have a "Content-type: text/plain" header added from the mimecast 
> issues of last year, and git has started putting it *after* its own 
> Content-type header with utf-8 charset instead of before.  I'll just 
> remove the additional header.

Ah, now I see this post. So that confirms the commits are correct
in your staged branch, and it is just a git-send-email issue.


