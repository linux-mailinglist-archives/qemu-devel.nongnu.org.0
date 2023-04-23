Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883776EC176
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 19:47:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqdnE-000208-3p; Sun, 23 Apr 2023 13:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdn8-0001zJ-Bn
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:46:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdn4-00019Y-S2
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:46:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso14548805e9.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 10:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682271981; x=1684863981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j1slLnW2RkctFnpmCmvThHIA5SNOVohapixLUi7imRA=;
 b=o5XrtK6lJgxbuMmDeagFVOBE0yUijBAlDKeM8UI4Du71itE1JdqjTw1+/T1QORxXUN
 sZRu0Cvrlu6Vbnnzxf8J5JhJN0UOMFmn5S0A2xlznjbKZioshDkD4xTd39Rxs1Ic2U6N
 0r5NvOj2lMy2vzBTEzcDkWAi4fzDZcoSHf44Gc5b/ZucGGz7df2FyCkPo6AtYWcrYWyr
 BN31VJJO0JAwjeMCBXM1nPVnahq3BUXOLWRlBJdLC6qbLOhi+QNGImwtPio+nzrh+1Dq
 9S8Pdqv0ppST/qJAL+o7yppZe01xgcAtKCFr5cJh4CwtdleISGFGEBrYF2UexlR39/AO
 t/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682271981; x=1684863981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j1slLnW2RkctFnpmCmvThHIA5SNOVohapixLUi7imRA=;
 b=cgJAHdv2O4GjejF2V/fQgmrNGWVsKDegEZj+5X9os158nOs9bo8MARZ9MIQqEEGN2L
 lGw6izDOfTqKek/rbw3famzop/dUifcgaDAVZEP9snpXtkCCK4DGE9ALxjVcEjkWuGzb
 sZSZM67SPjUAnj1VO8xIe+1r1BGb+PvQJtayYIvUxBLK819j6UW0G23zFS/9XKH/+pB4
 Y8/chon3jQNQW+kT3ukzI2QyKlG3/lk60wb0RXX7gDV+r2MwKlVB2lvsM4S/KgzVBFzD
 ACPEADKhzR5HgQfKeRO669y7crnf7b5Ovpo4+YVpSIvTxS4BtGXzeyYfhnolnIAukhmE
 zW5w==
X-Gm-Message-State: AAQBX9fVizDo9oBpL1h1e3foBxOsCMg3o5ThUu12rTveKQULYVxm0uh7
 jAe+z6/gIkgN4la1dzitAJIeBA==
X-Google-Smtp-Source: AKy350bor7k34ZyJX+1KK/+GYprzRDZDAzOGmI+aWifqg7U5Is1QrA+x5x0onZNWJj/X/xJTe7rd2w==
X-Received: by 2002:a7b:cb97:0:b0:3f0:310c:e3cf with SMTP id
 m23-20020a7bcb97000000b003f0310ce3cfmr6056029wmi.37.1682271981387; 
 Sun, 23 Apr 2023 10:46:21 -0700 (PDT)
Received: from [192.168.252.175] (8.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.8]) by smtp.gmail.com with ESMTPSA id
 m6-20020adfdc46000000b002d45575643esm9067676wrj.43.2023.04.23.10.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:46:21 -0700 (PDT)
Message-ID: <268be283-6456-c309-cc31-d67d14de6f3d@linaro.org>
Date: Sun, 23 Apr 2023 19:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 07/13] hw/ide: Extract pci_ide_{cmd,data}_le_ops
 initialization into base class constructor
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230422150728.176512-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

On 22/4/23 17:07, Bernhard Beschow wrote:
> There is redundant code in cmd646 and via which can be extracted into the base
> class. In case of piix and sii3112 this is currently unneccessary but shouldn't
> interfere since the memory regions aren't mapped by those devices. In few
> commits later this will be changed, i.e. those device models will also make use
> of these memory regions.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/cmd646.c | 11 -----------
>   hw/ide/pci.c    | 10 ++++++++++
>   hw/ide/via.c    | 11 -----------
>   3 files changed, 10 insertions(+), 22 deletions(-)


> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 65ed6f7f72..a9194313bd 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -543,6 +543,16 @@ static void pci_ide_init(Object *obj)
>   {
>       PCIIDEState *d = PCI_IDE(obj);
>   
> +    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
> +                          &d->bus[0], "pci-ide0-data-ops", 8);
> +    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
> +                          &d->bus[0], "pci-ide0-cmd-ops", 4);
> +
> +    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
> +                          &d->bus[1], "pci-ide1-data-ops", 8);
> +    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
> +                          &d->bus[1], "pci-ide1-cmd-ops", 4);

The trailing "-ops" just adds noise IMO.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


