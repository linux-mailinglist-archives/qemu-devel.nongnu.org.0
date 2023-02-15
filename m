Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CFC69843A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNDr-00037G-Sy; Wed, 15 Feb 2023 14:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNDp-00036H-Hd
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:13:41 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNDo-0001vQ-0w
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:13:41 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso3284763pjb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pcu9yjMdF3QznNmMYTF59XNZ6v/tH9EqDzsm8sAF9XE=;
 b=VzP9DyidwGbO1KvJ0SdjW2MX8ohTKjpazgXktiDjwYYqZHOfMoyAodbasG0xvHIKt0
 R7rztsQG4+hgKJeDbM5SiTuE2+ReITvt9zbYK1KNsWWQXtSMYHJs7UWcXqeuRO4rk0Pr
 csUrz/93Ofk/dl2znOEmQUv7d/eJXUawIdSP0s2l7njpePhTEXST7SsEHSUgsJXBXIGg
 vsPJ39W3j+pIElwIscBl3HrYDjTo4V7/dsKgOrBeTooCzSZ3p/rG5yaKohY4f8g/hbAE
 4hz6LbhAFgj3CYO7kc3xhFKVXBMW/edEPlmj6B/v7UCjEnjuTPlbJb8zpj8lo5//jbXC
 hFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pcu9yjMdF3QznNmMYTF59XNZ6v/tH9EqDzsm8sAF9XE=;
 b=nyNKoNwKBXAFnZ2TywyYc+iTguyl1DbCxeGuHrpvswd9L9QqnzEjUkOq3IcVDERgWF
 lVIItCCCgT15zbR49cegxbtSavjFg+WotiG0j1aRFzrXjmxjas21fPQyImssfHIu7Lfv
 t/8EKLRwEWlPP4nU/fUJo/eSfQL5QlMRfx5V1qq2fo0n6ySy5a7p3zBdq2FZM99ikjrQ
 gbw7f7O63c/PZrHRJuk39kRQPkjlDsIKW3cSHeh1gNUjpzdTutKywkDR2AoKxeNjjFpb
 d5WwnqsA6qsgHR0B5i+QEURiT9nzOUcI/G7l75tJU0RRnAAATiMhBaUO6r4xkSpQ6MpC
 Z1Rg==
X-Gm-Message-State: AO0yUKVTjc4FbsFd1bgchcKg8Nm5QtWy2RwXUv2Hey2RoQFtyvFvyBm1
 V1DDUkTbyQsq7OWyupy5dXzTNA==
X-Google-Smtp-Source: AK7set9/IjczjYAUMBbQJWyhvXCI/vKzo08E2gdpgPX17zebGmmlgvAnhxDh1btJTCTfR6ws+LDdjA==
X-Received: by 2002:a17:902:d04a:b0:19a:c675:a8fd with SMTP id
 l10-20020a170902d04a00b0019ac675a8fdmr2832937pll.36.1676488418581; 
 Wed, 15 Feb 2023 11:13:38 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v3-20020a170902e8c300b00198fb25d09bsm12551233plg.237.2023.02.15.11.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:13:37 -0800 (PST)
Message-ID: <ce203ee0-0cd3-a2b0-e364-16420bd4cf2e@linaro.org>
Date: Wed, 15 Feb 2023 09:13:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 12/20] hw/ide: Rename ide_register_restart_cb ->
 ide_bus_register_restart_cb
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-13-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> ide_register_restart_cb() operates on a IDEBus; rename it as
> ide_bus_register_restart_cb() to emphasize its first argument
> is a IDEBus.
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/ide_register_restart_cb/ide_bus_register_restart_cb/g' \
>      $(git grep -l ide_register_restart_cb)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/ahci.c             | 2 +-
>   hw/ide/cmd646.c           | 2 +-
>   hw/ide/core.c             | 2 +-
>   hw/ide/isa.c              | 2 +-
>   hw/ide/piix.c             | 2 +-
>   hw/ide/sii3112.c          | 2 +-
>   hw/ide/via.c              | 2 +-
>   include/hw/ide/internal.h | 2 +-
>   8 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

