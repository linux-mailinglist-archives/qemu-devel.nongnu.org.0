Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8B3022DC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 09:40:42 +0100 (CET)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xQP-0004cs-TK
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 03:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3xOG-0003jv-43; Mon, 25 Jan 2021 03:38:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3xOE-0005Py-Fz; Mon, 25 Jan 2021 03:38:27 -0500
Received: by mail-wr1-x435.google.com with SMTP id 6so11331757wri.3;
 Mon, 25 Jan 2021 00:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uVuV7J3+WDcn5ZqWxQOKIZzgaVEjqgt35D+uE59R/mM=;
 b=WgHHs8GDp4XHGcNYUCHD5FJ7JbobqswXyCQA1d1dmkzTN7kjJOVXtQgwYKq8uddCQE
 fxQPjy2a4XXcdW/y8QV5y07Aw56Ok7ziNcHOnx3WL2xe0B/ro7LJaTKOTeWrRk+nahHr
 ryoSB3SiqGPUlDWSVaaVfpqVCkEOEJ5zwYdBK88EFnfEWi8Ddi6BXA6ThFXDNbAHlaVj
 fwzbmJcC3Zs9pM4Me8D8+TKERyRpRHdVMBdYvVT217jHEtLi3DIAFMgppXS8XupNdf4M
 Z/hPD8ODJFAgK/qoJuVpASZedp92CHSMCr21FcNaIoKhSmRySHKrwYxRJyQ5KMF+koex
 a1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uVuV7J3+WDcn5ZqWxQOKIZzgaVEjqgt35D+uE59R/mM=;
 b=NT4NG1dDRHv0nkplcGXcIKLaIiyt5C/7rhx9+6EZrO9Q3fuEK8MQmfkiXAzYnmzCEi
 vpISL8bO0CMYAYH0DaxkG/iyi1K9D+7G+nPpPsuDdNA1AdUSuBqU/Erq7XyK/FObHCRu
 JkjNw2+63OcrY36RB7UwidjM9iN4NlVom4bVExR5NdRg48vyEPiXyeDGX2xwmJMAr+D5
 MLST2ROj6MnPf7bXWPn4GSAlZdWR6VGBvXuOEIw9WBnEzXq3traAeF2FBE9FcqYlquAd
 HbQkOHVRzECITzPeqKnMOIeuuiBup9gPH1dwPh0WQNx9Uod7vZOLIWPD+KcTCaT35oYB
 TiAQ==
X-Gm-Message-State: AOAM532rdMyVDMi0zGLSOKIshbAYHLtmXrG62S0IkEMJvTQopIz6/nuz
 5CfBC2noVdLghPRgBwJCQf59pLQVc34=
X-Google-Smtp-Source: ABdhPJz4Szn5kHVPmfK0vAs89N5vsTNTQXLSKRW9Mml75bYlllsU85nvbKWv1jHawkxPUedYZZLcvA==
X-Received: by 2002:a5d:6cb4:: with SMTP id a20mr5126937wra.192.1611563903881; 
 Mon, 25 Jan 2021 00:38:23 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z18sm5840340wro.91.2021.01.25.00.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 00:38:23 -0800 (PST)
Subject: Re: [PATCH v3 0/6] hw/sd: Support block write in SPI mode
To: qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
References: <20210124202817.2624557-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4dd7fdd2-e6b5-a607-5c6a-63fe96eb795b@amsat.org>
Date: Mon, 25 Jan 2021 09:38:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 Pragnesh Patel <pragnesh.patel@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 9:28 PM, Philippe Mathieu-Daudé wrote:
> These are Bin's SD patches from his v2, rebased on sd-next.
> 
> v2:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg775712.html
> 
> Based-on: <20210124201106.2602238-1-f4bug@amsat.org>
> 
> Bin Meng (6):
>   hw/sd: ssi-sd: Support multiple block read
>   hw/sd: sd: Remove duplicated codes in single/multiple block read/write
>   hw/sd: sd: Allow single/multiple block write for SPI mode
>   hw/sd: Introduce receive_ready() callback
>   hw/sd: ssi-sd: Support single block write
>   hw/sd: ssi-sd: Support multiple block write
> 
>  include/hw/sd/sd.h |   2 +
>  hw/sd/core.c       |  13 +++++
>  hw/sd/sd.c         |  56 +++-------------------
>  hw/sd/ssi-sd.c     | 117 ++++++++++++++++++++++++++++++++++++++++-----
>  4 files changed, 125 insertions(+), 63 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

