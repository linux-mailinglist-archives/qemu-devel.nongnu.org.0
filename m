Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D1666DE7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:17:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtgz-0002xS-5M; Thu, 12 Jan 2023 04:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtgw-0002uc-Op
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:16:10 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtgu-0003tO-TM
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:16:10 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11258228wma.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AetZmlO1b2EWe5EIF7NB9tiCOx7ssrEdvyQMErQTo2I=;
 b=P76ehxpOcKuJhLaOdLsLviOWBmM13UyHLR1h7kKeiCKF2rP8QGjxzT/L0KUIcCxEM4
 XUcTf7QfwoZtgrEZF7O250SYONTTUbsPn+YEXkgYWWjBbTvBz97m80WUC5uXgsSm1QOA
 vNircbQozqYn9+zth28Jb+c8IpQ8F56Dy0AyL+SZ7ERDEo5LUcu9AzUM3Zf13GT7TKcH
 UwXw/8u7J0SxB/wGiGqCDKf0IlKlyFU22cDrN2XK33XzHVYCZiB98MkVVuoQc03ZG/PE
 sy3S3fhBBe1ArybzNXzuwfPPN8OUdORC/tlCBZwVevgh/Y2ZHfmOjaaju7D1asSxxrd3
 ioOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AetZmlO1b2EWe5EIF7NB9tiCOx7ssrEdvyQMErQTo2I=;
 b=wQFMx3SVxsYsS0KmtCqfW6ZAGks+ebblXoJ6TWPGU24m69JQY4ufHTU1myUbstrWTW
 izgEKEVrHRz7pO98ltlO5Iep8NI4NtDk5S0Kgk1aqZD0IZ3gcdQhGZB9kZQH5R7Yt3q4
 08br2J8wvqhdhknQWuAk/mY7gq3utUq9oC02PydyNe9pCVd6U696llM5hmnBgPN+Cqiz
 n5sJ27qu9QiH9qjRWpCpThPR/hLDADpxxct/6giYpJ7dy3LkcBCynSTTeMo1ixebd3Ub
 e7h1JkG3ZuuMFznYhXDZeg+/m17G6z/hzXuuiUYdYs5QorLbqKrHitBZM6o+wAxWc8wD
 o6Gg==
X-Gm-Message-State: AFqh2kpVeW56cfHEGRhut+zbgqtp++NysLTGyypbdPJUEn8M7/e9B6fv
 674DdCFXFm20AESRl5z/i3sPbpGe5nvwUyw6
X-Google-Smtp-Source: AMrXdXs3p9ICvDUHEE0YFxIK2mcgYtMwDCHDH+mB+GPKtCC8o4xmAohD0tjvaHqgco8HiPQDf/HXWw==
X-Received: by 2002:a1c:4b03:0:b0:3d9:103d:9081 with SMTP id
 y3-20020a1c4b03000000b003d9103d9081mr54799184wma.28.1673514967419; 
 Thu, 12 Jan 2023 01:16:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c1d0e00b003da105437besm3208040wms.29.2023.01.12.01.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:16:06 -0800 (PST)
Message-ID: <28498e65-43e7-3fa0-6c2f-7f6511891572@linaro.org>
Date: Thu, 12 Jan 2023 10:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/misc/sifive_u_otp: Remove the deprecated OTP config
 with '-drive if=none'
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
References: <20230112082951.874492-1-thuth@redhat.com>
 <b749a663-475f-558c-30ba-0b46d752c0d3@linaro.org>
In-Reply-To: <b749a663-475f-558c-30ba-0b46d752c0d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/1/23 10:15, Philippe Mathieu-Daudé wrote:
> On 12/1/23 09:29, Thomas Huth wrote:
>> '-drive if=none' is meant for configuring back-end devices only, so this
>> got marked as deprecated in QEMU 6.2. Users should now only use the new
>> way with '-drive if=pflash' instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst       | 6 ------
>>   docs/about/removed-features.rst | 7 +++++++
>>   hw/misc/sifive_u_otp.c          | 7 -------
>>   3 files changed, 7 insertions(+), 13 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

-ENOTENOUGHCOFFEEYET I read v2 and meant to reply there :P

