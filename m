Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F131ECEE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 18:11:26 +0100 (CET)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmpp-00086c-0m
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 12:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmna-0005yM-QI; Thu, 18 Feb 2021 12:09:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmnZ-0001L9-8b; Thu, 18 Feb 2021 12:09:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id f7so2632798wrt.12;
 Thu, 18 Feb 2021 09:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9ZF24CeZrGYTFY8Z1wwt0e8tpxjc60tMm2j8eZZIRlM=;
 b=shPNL53eBjK96sSW6gxKVcZdp+PDT0LUSz9gwv7p7LIcWnsnrdJTixRldIdMGHKQ6K
 Fc6bsfWwzgYX5/3wbAB3j3tspAvCqvYiMZMkjT20XYLtRgSKUWn9EHUyfymcBUJUiepZ
 SuZ4rpxn0Mmr2okAOZJg08pJrNYZodO+TVwR44TEhInsG1iIJKDVIPqYPP/xV8svJmlJ
 MX8a6PEtmJiUX/2gs8FMo0B9K95Zlvr0wsDu7f1/fc/+kdSR9+3J0mtLj6l1AepPhYH0
 zUIAu14kKtpat6T5kw/jZW24Sh5ZdaSiVHA6JJcMoDr/vpHcEN62nVMXEFdFuq5js2Vr
 scQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ZF24CeZrGYTFY8Z1wwt0e8tpxjc60tMm2j8eZZIRlM=;
 b=iBo749LFJAuLOcDXD7akfTTiAd7XPkjoHG2jtOmyZZKW4lGFL8kKuN+k06B9YSpEat
 Q5WDV6FXYsIY3ioAizNQuDinmktpPJhy95dyRrrz36dxPDMxOE0iDP6tBU7PDydZIqCD
 62H9tS1me+lp+Ncn2ayutu/RlD06VnbaBcrYn9JnUGiTKvfxpmlmIG8D1miyRsyLdpdg
 sKgZdyEiuoJiYd5CTok8a+NPLQYTMOesQDWnFX1VSk83USOxaOLytbxd9Z6G1CDEcnNz
 +fdbchOtUe2rL2xJR+IRG5oQPSMxCc/WQwHfsk0aiu3naW63zHbUplWsLL91kn97i3nx
 ZCcQ==
X-Gm-Message-State: AOAM533Z3qrrzTvqBx+/1aQsGQpSd9wF13lsHq2kpMb1lk0V49hvXI4L
 K3egQOspguWPLjHRPMXoAmO7Dkv5j3A=
X-Google-Smtp-Source: ABdhPJwgwFoXlHGZmN79mtx86R2DREOpSnjXWca3drnPrwTgisHovb6oCWRW/EhXnn5ucfh6eOYLlg==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr5307385wrh.76.1613668142741; 
 Thu, 18 Feb 2021 09:09:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x13sm8401967wmi.17.2021.02.18.09.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 09:09:01 -0800 (PST)
Subject: Re: [PATCH v2 5/6] hw/sd: sdhci: Limit block size only when
 SDHC_BLKSIZE register is writable
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-6-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9d73ef0b-2d58-6c5b-8a14-590eaddd4a3c@amsat.org>
Date: Thu, 18 Feb 2021 18:09:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-6-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:46 AM, Bin Meng wrote:
> The codes to limit the maximum block size is only necessary when
> SDHC_BLKSIZE register is writable.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable
> 
>  hw/sd/sdhci.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

