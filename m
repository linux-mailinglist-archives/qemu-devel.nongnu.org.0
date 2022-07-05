Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9721566411
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:34:59 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8d5G-0003sH-V2
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8d2O-0001Id-Ak
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8d2J-0002iq-EA
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657006314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmLjMKY4FuiJXrqFx/mSIqU1CgkkRDV+gNESCmig85k=;
 b=Gm9pX6TjDq3uG7k5u6YUn/ke04AfCq5b4k9UU/6lTaDjzyt5NlQf1f41Hl3AKKv8jKIbdO
 8Vgunr9E/Deb6BYE/HHC/s/gtgZHn2uN/SMGimkdkpCSulgrMkr8bx5G9ddtibrJQKUYga
 cB0zmXPGTkhpzW8T4A3y9Sl5sctLdzI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-5hDTXhLEN6ymxsBNCRQV1g-1; Tue, 05 Jul 2022 03:31:53 -0400
X-MC-Unique: 5hDTXhLEN6ymxsBNCRQV1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 o28-20020a05600c511c00b003a04f97f27aso6389957wms.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 00:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LmLjMKY4FuiJXrqFx/mSIqU1CgkkRDV+gNESCmig85k=;
 b=sUeI9ZMOmADl43nfOeBH0QgWssnacwiCGLdRzdDplLrL0qpAJW47iP4rNVacGuSOX/
 D0QGLOHlj0MLL405aTWMGkg0NQ1Q6QA+HtaM5eC6N2Vl5J422caPcDjj3o65bpnEJ4sk
 sjSP6tEyzYXUBL2M3/p0ALw4fa5yTIfoOJA5rYaC32AZrTbyHydd+NvGwcmzLaECo6EF
 uXpvRbCraXsWZaoOhCXmIlE5J5vFZmqI7wMDjsYrNRLpaLkzCJPuJNqt6TPbW7i8XJDp
 ZZdA85tYgnz+ISXodFpB9R0wDvrEmuPWPPD1a5WT7A3b/47PG89UJJQ86bGDeVpQHAt2
 NFkg==
X-Gm-Message-State: AJIora+uhdWgu3btZyiYAND1dnC5EiPSRCK4fJlFSOhq91SbjsquPjDG
 xusGZojOEvFL53sHVaoLo8vjEtL7kYdXSzBM9DhFt8C+1OChwEBJgdw4HcS+V2CMo8e8U28IXCC
 M92aS1J8p43qBC+4=
X-Received: by 2002:a5d:5985:0:b0:21b:c74b:5a7 with SMTP id
 n5-20020a5d5985000000b0021bc74b05a7mr28626961wri.242.1657006312234; 
 Tue, 05 Jul 2022 00:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vBpvMPcQ2dwNcUN1Q9jsfH00pkKHQbkr/NPWJGUpkOM6JFyQEeLnnndYHyggU57xIMuO6uZA==
X-Received: by 2002:a5d:5985:0:b0:21b:c74b:5a7 with SMTP id
 n5-20020a5d5985000000b0021bc74b05a7mr28626947wri.242.1657006312037; 
 Tue, 05 Jul 2022 00:31:52 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm16480272wmp.19.2022.07.05.00.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 00:31:51 -0700 (PDT)
Message-ID: <542f576b-c0fa-73ca-f167-80534363f00c@redhat.com>
Date: Tue, 5 Jul 2022 09:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 00/23] loongarch64 patch queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
 <23bcb252-3a46-eab5-8a76-1f55d5c07685@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <23bcb252-3a46-eab5-8a76-1f55d5c07685@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/07/2022 17.16, Richard Henderson wrote:
> On 7/4/22 15:03, Richard Henderson wrote:
>> The following changes since commit e8e86b484eac70cd86e15fa10a2f0038a536cbba:
>>
>>    Merge tag 'pull-riscv-to-apply-20220703-1' of 
>> github.com:alistair23/qemu into staging (2022-07-03 06:29:02 +0530)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220704
>>
>> for you to fetch changes up to eb1e9ff8bba91674b4321f2b075c55aa8d9948cc:
>>
>>    target/loongarch: Add lock when writing timer clear reg (2022-07-04 
>> 11:08:58 +0530)
>>
>> ----------------------------------------------------------------
>> LoongArch patch queue:
>>    Support linux-user.
>>    Fixes for CSR BADV.
>>    Fix ASRT{LE,GT} exception.
>>    Fixes for LS7A RTC.
>>    Fix for interrupt vector spacing.
> 
> Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as 
> appropriate.

  Hi Xiaojuan, hi Richard!

Seems like this is failing on FreeBSD:

https://gitlab.com/qemu-project/qemu/-/jobs/2675891548#L4076

Could you please have a look?

  Thanks,
   Thomas


