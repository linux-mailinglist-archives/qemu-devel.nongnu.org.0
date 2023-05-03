Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF946F5A83
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:58:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDva-0002Lk-1p; Wed, 03 May 2023 10:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puDvY-0002Js-1V
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:57:56 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puDvW-0003jQ-7S
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:57:55 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9619095f479so649346566b.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683125872; x=1685717872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3mpjwaQvl2Eva8AxXO/8G6tFWaYkzVRlrQHGn2reGpY=;
 b=Sr3LPZnppu2tQe8kOb19dd/WPmlRzyn03kW1qsBJ+pCudGl0qBYXqg28ndgVNMQxOU
 fil0uxhC6iIRXtX2+P+gB8VpEJrsX+1PfAMbHF5wn4hBKt0k7JbyM/lP5Y8+ohHbs51b
 YP0IS/iB6RJslahf8J9o4XWm32irdiwZyqfpddzvxKfRTfDZKGrpA9tlURTVR7JzZR66
 G8Vzk9KG/8o5ojXx2yZZoikL80Ac1Vaxy7Oj9KMQ0dWd0CX0U2QSkqXlL2COb1+0dFrN
 uYqHxHZGeGip74bpTGfMzgyL7c4yznjRYIiJvvdoiYu9UBTu7Y4ktp9bGCW5/k4PrW3h
 9sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683125872; x=1685717872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3mpjwaQvl2Eva8AxXO/8G6tFWaYkzVRlrQHGn2reGpY=;
 b=lSkM/SJ1PvYaCor97H4YYq4KeK1yIWdsiDzaRGDt7g3sU6R4C+0bBp+au68Vklh3zB
 PKmV8Bh+VOw0We7K7AAYb8FfFEfThyQfkqYF+YEexCVWsbWLp05/wHKtmAWTGzWkrDF/
 pAWNZkLi21AWgMOd9zCZ3bEbLLwg9EskYXHz0eKAT+8ROQunP/vCKNc7LL3X8XNg2HRb
 4WqxZmnS76q8z+z0WNCdZ8qb09oAvME3x2fouXblGl4fveQXmP06lbAltlDnJ+CTG4Nw
 guawDtosShuMcKywqv2A8RP5bdcnUSHmI/QeCwag0R+1corRYjubmlrI9c/H8A/k+ej0
 /z8w==
X-Gm-Message-State: AC+VfDyai5F4xorHrgBh73EGI2fkSIV0APPSyYHGR8tqj7ABwY5nJm4E
 3w1dKzAKDLH8X92ckpKHE/LUHw==
X-Google-Smtp-Source: ACHHUZ75wIiFTqwTyckbmi91dVs3aUYbjK2pEv4Cr1WgRgPCxPa+aBb+euCZ+yMU80JaWLSWvRzbDg==
X-Received: by 2002:a17:907:86aa:b0:94f:2eb1:ffd2 with SMTP id
 qa42-20020a17090786aa00b0094f2eb1ffd2mr4083231ejc.40.1683125872456; 
 Wed, 03 May 2023 07:57:52 -0700 (PDT)
Received: from [192.168.66.227] ([82.152.154.96])
 by smtp.gmail.com with ESMTPSA id
 sb11-20020a170906edcb00b0094f7c1b6a94sm17646087ejb.11.2023.05.03.07.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 07:57:52 -0700 (PDT)
Message-ID: <c8ffbf01-ba9d-4c13-4a3b-fb012647649b@linaro.org>
Date: Wed, 3 May 2023 15:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/8] Migration 20230428 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
References: <20230503092606.9415-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503092606.9415-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/3/23 10:25, Juan Quintela wrote:
> The following changes since commit 4ebc33f3f3b656ebf62112daca6aa0f8019b4891:
> 
>    Merge tag 'pull-tcg-20230502-2' ofhttps://gitlab.com/rth7680/qemu  into staging (2023-05-02 21:18:45 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/migration-20230428-pull-request
> 
> for you to fetch changes up to 0deb7e9b6cfdb39d89a629e705d6176c511fa83e:
> 
>    migration: Drop unused parameter for migration_tls_client_create() (2023-05-03 11:24:20 +0200)
> 
> ----------------------------------------------------------------
> Migraiton Pull request (20230428 take 2)
> 
> Hi
> 
> Dropped the compression cleanups to see if we find what is going on.
> 
> Please apply.
> 
> Later, Juan.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


