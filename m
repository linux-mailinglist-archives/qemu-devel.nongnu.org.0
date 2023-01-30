Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB956819FA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:11:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZXd-0008UG-Cg; Mon, 30 Jan 2023 14:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZXR-0008TI-AE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:09:57 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZXP-000387-Nx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:09:56 -0500
Received: by mail-pl1-x631.google.com with SMTP id m13so788967plx.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SU7T7wzuNXqW7tbKXbJt+gcBSgPYBopMfVqVQ7Y+rrs=;
 b=jlw+HQufNGsfBC6kSH3hglxWqd1UkTODDKjjZ8z+ypnVkh880o6lQRjN/EELVFjEFu
 uLCtTHszler4PW0GTFllcV1Ll3QnSobWUNHPxvG1s3pnql67biBbQmrcuP4kczltaj+2
 lC4EZbEF2ABt/ZjypbM57RbnwChTKpRQo1l06h7G4Ld8M2Q/yCSurS8pAaklVC+MLSxo
 1zDuXUdJulE/oSno/5j9+S9IVhhyu681A3KiBoqGSrk7nkyCexDofYrMSzDnhsyDKhf3
 HFGCDTcA2HQpdGPmCZEk4J1n7yMn6LQWo8MxSqAgiGI75Cn7/mAXtZH8mt8NLniGda/Q
 envA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SU7T7wzuNXqW7tbKXbJt+gcBSgPYBopMfVqVQ7Y+rrs=;
 b=o8MJ9c5zvNr0vI70sQypM5y4RMtHxdLIcXY2mMrX8jHOyOyeFxtQY/kar01i8gnGxA
 JsvOpcSt9hY68VJswPSnGiCk71rZo1e/k4DhvaaDqgbffN3aoiOyKA/2eorLdo3dafUI
 bHkAVIeDj46c+y4xXYKEp3b6MbepLvBMq0xj7QLRoDxeJtOlal/FAcBgkmC62EDZXbMH
 a76czLjcwQFIFQPHwkLFRNYD0QCI8EPfG1FKshXwBcHWxrUQ7NHhAcsn2UZI3xIczhd8
 Js9oiY/gAm6qYXlLztqia+1VNt2FIhZxaVeyVC9p1IYRlbTRGIVE7M7PpKJBWyTUDRPm
 X6Ow==
X-Gm-Message-State: AFqh2kruwjsKFVyn8gDcrW7AskdW/Tki7nBxxJYQ0w/xfGEcx8VKboMB
 36Du7b7Kh0aHifCNIB7ZvXH0tw==
X-Google-Smtp-Source: AMrXdXtop4vlhRiE6TxIEDRtnjyA0GGA0JnXI5B3tNpJeDyv9pDNh8IcsXNsjUEJNl3Z+veVM3GUpQ==
X-Received: by 2002:a17:902:f791:b0:194:4981:2018 with SMTP id
 q17-20020a170902f79100b0019449812018mr54900789pln.60.1675105791057; 
 Mon, 30 Jan 2023 11:09:51 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b0019601f98550sm8168771plx.132.2023.01.30.11.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:09:50 -0800 (PST)
Message-ID: <b105124a-4711-29d1-81bd-b3929ff74651@linaro.org>
Date: Mon, 30 Jan 2023 09:09:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] tcg: use QTree instead of GTree
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-3-cota@braap.org> <Y76s1VNBUYwlpIGo@redhat.com>
 <Y9FRoUI3I5LfQsjW@redhat.com> <Y9b1UHyyPux7FKV5@cota-l14>
 <Y9eNbnL+TgONAMPM@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y9eNbnL+TgONAMPM@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/29/23 23:27, Daniel P. Berrangé wrote:
> On Sun, Jan 29, 2023 at 05:38:08PM -0500, Emilio Cota wrote:
>> Since this is a correctness issue, I think we should ship with qtree
>> and use it when configuring with glib <2.76.0. For later glib versions
>> we would just use gtree, e.g. via typedef + inline functions.
>>
>> Once the minimum glib required by the configure script is >= 2.76.0,
>> then we'd remove qtree.
>>
>> If that sounds like a good plan, I can send a v2.
> 
> I'm fine with it, but be good to have an opinion here from the TCG
> subsystem maintainers, CC'ing them

I agree the correctness issue wants the fix now,
and typedef + inlines sounds like a good way moving forward.


r~

