Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE16EC1A4
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 20:47:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqejH-0006Jk-A6; Sun, 23 Apr 2023 14:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqejD-0006JT-JD
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:46:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqejA-0002C6-FR
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:46:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso3828535e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682275582; x=1684867582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mynE0oZUIplQIl5D0HGMw7lkSFecL/c/+Qlc3ksZexo=;
 b=ZI7Fb0lwGan35rFboQh0Tw7r3mHUa9aC18yz8jXxd1952xVn+aa47QeDVZTk7xcj5e
 TErykK10U+JpFJkAghOJnPLbD77Mn3L3ZZRYjGmKtbESUAzF94ewuEfmoMxd/Aym499O
 VNzsMVEdOGyP8YGbn5hgRN3CRLvuYC6dGWUlfR5KC7MisFjrOFamxX4H0Tt67UcI3U38
 2mpmon4Bv7T+I9a9cizfL+FDa3bvYy/y8Z1jh7OymUwOBYwLLS12Z7jLYyjxrnNKH4lU
 XBXk4c/9n6x0fMzDA7V+IAe8BoZmUn7qTX+ib0ruMNq/81fHObqk3HHnEh9X73n/2ofn
 lTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682275582; x=1684867582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mynE0oZUIplQIl5D0HGMw7lkSFecL/c/+Qlc3ksZexo=;
 b=SqyuZuZa7giMCV33s1NAOiYvbgHGnHxCcl25d1vNgJcskRBLy4rDv89UHtGaEA8oOL
 GKR/5weGOyqU/mWbWPWf5qI7boJZ8AjDtMBjBnysLF6g0C636q/SKSFIUkzMAWSEHpCD
 qfM6o/+YYdGLEUVjAatS31R6bsY5loUHCVrS5Bfe+Adt6pAlOSxcAIoXjjqejAZMRiNp
 hLVAcnCXJwXc++uFRwOcnuZiQc2PK3COF4RvhvxtTkY7yAa9tKP12VdQst8EnMbniFTF
 pPeXzaOtDChnMEL0D3ybzO+p2GduUwPuH2P3Z204mwMjCgVq8XwhdIdb/e9Kxg4OI1tb
 E2fw==
X-Gm-Message-State: AAQBX9f4xLEO9mEvO+g+dI7F/rbSZigXp45bbImTo+1qgnyBhgKs5xFx
 EEuXhZOJytP5melVkF+8Br66Jg==
X-Google-Smtp-Source: AKy350YkRjAHQZTSVp/RN7fbSsH8+8yFMzuBUjj8v/cC3sicJN4RJfUbH1Pav5EUO22l6ebNEb51FQ==
X-Received: by 2002:a7b:c3d7:0:b0:3f1:9391:46c with SMTP id
 t23-20020a7bc3d7000000b003f19391046cmr5677832wmj.30.1682275582614; 
 Sun, 23 Apr 2023 11:46:22 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b003f17a00c214sm10194371wmi.16.2023.04.23.11.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 11:46:22 -0700 (PDT)
Message-ID: <2c803abc-0f24-ecc6-fc14-56e674994829@linaro.org>
Date: Sun, 23 Apr 2023 19:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/8] cpu: Replace target_ulong with vaddr in
 tb_invalidate_phys_addr()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-8-anjo@rev.ng>
 <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
 <fe84e730-88e6-3b68-1929-758868757c68@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <fe84e730-88e6-3b68-1929-758868757c68@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

On 4/23/23 18:29, Philippe Mathieu-Daudé wrote:
> On 23/4/23 11:14, Richard Henderson wrote:
>> On 4/20/23 22:28, Anton Johansson wrote:
>>> -void tb_invalidate_phys_addr(target_ulong addr)
>>> +void tb_invalidate_phys_addr(vaddr addr)
>>
>> Hmm.  This isn't a virtual address, so 'vaddr' isn't right.
>> I'm sure we have something more appropriate.
> 
> tb_page_addr_t?

No, it isn't a ram_addr_t either (see exec-all.h).
Perhaps just uint64_t.


r~

