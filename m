Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50CC6EB142
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:57:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppv0d-0004qV-VH; Fri, 21 Apr 2023 13:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppv0Y-0004pK-Nl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:57:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppv0V-0002kM-Go
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:57:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f18123d9f6so14348185e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682099834; x=1684691834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IGNgEV/AmNTyW5IcndaJKv1I/lWmvmwoTOo4eJbfmz0=;
 b=MWvjdpUN5d0d419WGQMIt4A72uqoHf9SUbholO7hKyEFcNROcUPCnPvJGs4lsy41EN
 ZDCDQatNMfdEcYttt1c/lAsDOmii8uY6rRauOpUxY3APd1PZKYsGcmsee3KB2RvrWTlk
 2WyJ1C2H7VkhEuRCQbOIKMka47RVuufGnXyxocvB6S+aycllZfhK8raQORIlauqOf7Jt
 6eNRyAFuFmHLiRYunSguH/p8ymkeoMLqBVc91dVlTbUmKMEwrpQRWRkPEW/vH2/ja7fX
 a06hGRbFyuhAP5K70v/qx9ySaQk1ukKAB+9OBs2Pmb2ggcNleAeF+d046JpujWo5vhKT
 9M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682099834; x=1684691834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IGNgEV/AmNTyW5IcndaJKv1I/lWmvmwoTOo4eJbfmz0=;
 b=TPILSZJPOShnSPWynd/lA6Wn7ylkkduUZdQ3nOuySJTmkKKwvQLS9bHKWkBLZj/54T
 iKguE81ZMRD/Olvcfg5yYXmFrMnnZUGnmyIHWJnjB7XuN9bQuEpCDh71mrJCWrZ44cV7
 hJEsZP38LVbs6KTY52UWDNaFM1oo2I+Olnflxdiz05abl8ynWlwYJ76xJPV7NfUWCRxC
 Zpu0wTWSRO56VaZB1yaWfbspYno/AXnrO4yCd7/SXQ/TClOLlaaV0DphIT0cTKYjiFQQ
 O8L92HkoBpuvAv/E/21I/XpJXicjo8AqoCepFrGtw4jNG0EvgLKXKN0ZFQc47rTJXgmg
 OUyg==
X-Gm-Message-State: AAQBX9fJeViSuS9d4Msr0eVKVwNcub77XikvkyBf31uq1F7VBtfTy8yk
 pQuBLUSmouOFwlv2t+X3u9XrCQ==
X-Google-Smtp-Source: AKy350b2yluOf1AGPpzuhLsdnbofEtWZlUFQC8amdCJUe/NziRKdULvizM6U5Dfzchsv6wGBWw3jVg==
X-Received: by 2002:a7b:c845:0:b0:3f1:9526:22be with SMTP id
 c5-20020a7bc845000000b003f1952622bemr1690664wml.23.1682099833996; 
 Fri, 21 Apr 2023 10:57:13 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc855000000b003f17300c7dcsm5340305wml.48.2023.04.21.10.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 10:57:13 -0700 (PDT)
Message-ID: <ae65d59f-5e16-24bb-aece-ccdd504fe75e@linaro.org>
Date: Fri, 21 Apr 2023 19:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 04/11] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-5-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 12/4/23 14:18, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


