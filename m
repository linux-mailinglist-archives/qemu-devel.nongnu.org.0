Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809646EC16A
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 19:42:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqdiZ-0008Bo-3L; Sun, 23 Apr 2023 13:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdiV-0008BR-Ug
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:41:39 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdiU-0000R6-Cr
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:41:39 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso2098427f8f.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 10:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682271696; x=1684863696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hNBd22/nKNmQEA+dU/o5H7CcacvnFiaGH2Lvts7XKuc=;
 b=E/R1JSjCGzdshyeD+0LFD3CwVt6z6BQMzq4v0dEQFdAYTYzHnC5Il0V5KXKwTdZrJg
 UTLY9dYeS/iGnZg2jkOI1PGVfaMQjSLOiUQCaVduK/tX0JYl1PuCA7fpJx80tSUqlewc
 c4Iaa4aNhAL6lYUYi2CgJjiOustqvysPGbGUFhTCq2U2z6rN4wzl8kUTdaJADr383VjD
 9kt2Q3hwYQ32SaQ4vHXLuF7Sz2XnaD2UYcv2LwuhVzC4vnE5qUD8PLuXqdXgGswW4jEe
 cSpjSMlChBDp3Nyv49vG6sfEjhXgnHPg3SnsggyKixSCjihktL0UgvLQGk9n11J0ZWq5
 eKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682271696; x=1684863696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hNBd22/nKNmQEA+dU/o5H7CcacvnFiaGH2Lvts7XKuc=;
 b=R8P0jmh1FQpVtYc4jI/R+SsXIEqahjJX++QOoqNo5IHjeOJ2bPM3GdaZd796y2QTLH
 2EtwbQA4FfCChNaHeJO7xymJY8TkvHq5dL5qbe2qAQzexDNLDkXxU7iTfjUIOntnqrti
 T4KMfxKWHwna6GqAz2YtV/johQM+GR+ZxMrQsHrZqDyChPnxHOLtD38KzFhwqCX9StdP
 DjOwuaBVOKaMFMcW2/8O/DjwCbuYETUCWjLWcQMXGeVVdicx8CjWs8476CCXnqHmxCwr
 M4DfC3XgSjtl7CpJrEBVA04vnYsaFqOXwyHub+TNExbctINuBy4bocXu6B7/2pZgN3QT
 lHuw==
X-Gm-Message-State: AAQBX9cuzLxnN0uKC+WyBLXkyd/7NayrUForzcF8h2zBkR08MYVYZyZ1
 8e/9bLAMnrvFyt+78gjuYcfmPg==
X-Google-Smtp-Source: AKy350bfnXNTyU96nT1Y7X3JVb9lvRTZOCJw54qPkZlKLjm85J9bIKU5yj7/UHQrAm75AAT14PAYDw==
X-Received: by 2002:adf:f3cb:0:b0:2f2:7adf:3c67 with SMTP id
 g11-20020adff3cb000000b002f27adf3c67mr7877177wrp.61.1682271696633; 
 Sun, 23 Apr 2023 10:41:36 -0700 (PDT)
Received: from [192.168.252.175] (8.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.8]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfe552000000b002f3e1122c1asm9088623wrm.15.2023.04.23.10.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:41:36 -0700 (PDT)
Message-ID: <9a25912c-a494-9efc-62ee-1de83b69a060@linaro.org>
Date: Sun, 23 Apr 2023 19:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 05/13] hw/ide: Extract pci_ide_class_init()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230422150728.176512-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 22/4/23 17:07, Bernhard Beschow wrote:
> Resolves redundant code in every PCI IDE device model.
> ---
>   include/hw/ide/pci.h |  1 -
>   hw/ide/cmd646.c      | 15 ---------------
>   hw/ide/pci.c         | 25 ++++++++++++++++++++++++-
>   hw/ide/piix.c        | 19 -------------------
>   hw/ide/sii3112.c     |  3 ++-
>   hw/ide/via.c         | 15 ---------------
>   6 files changed, 26 insertions(+), 52 deletions(-)


> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 5dd3d03c29..0af897a9ef 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -301,9 +301,10 @@ static void sii3112_pci_class_init(ObjectClass *klass, void *data)
>       pd->class_id = PCI_CLASS_STORAGE_RAID;
>       pd->revision = 1;
>       pd->realize = sii3112_pci_realize;
> +    pd->exit = NULL;
>       dc->reset = sii3112_reset;
> +    dc->vmsd = NULL;
>       dc->desc = "SiI3112A SATA controller";

The SiI3112A doesn't have these regions?

