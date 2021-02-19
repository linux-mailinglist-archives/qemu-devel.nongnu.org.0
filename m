Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56052320168
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:38:09 +0100 (CET)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEPY-0006Jl-D5
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDELg-0001YP-Ur; Fri, 19 Feb 2021 17:34:08 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDELf-00039a-42; Fri, 19 Feb 2021 17:34:08 -0500
Received: by mail-ed1-x536.google.com with SMTP id g3so12353430edb.11;
 Fri, 19 Feb 2021 14:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9dFpeMp3R3uTEGrDSlhmlxItl2jBSfeQjxNn/Cp2pbs=;
 b=cwli+DFY0/HazNgjeugq/59UWk/sbRLoBvo1xRn+7jnkbC2yXQnlpbluEOV+xIqIzT
 jqYHpIRp8KszfXhItipvPoq6Mu3NVa8mmADWRk1jdOydcxFZ6XmVeLD5sjQC/0XJwnNJ
 y5/gGzpF+egEFW4bt6nvdE1X0A5li8vy4Z7JSx7Pl0gyLo61kz1IZhX9XCPIReiEE02m
 XLBY99yq9hSomPeD9YzDnbbwRpOzlxu/Lf/LaKghg2xvXbG5kbGCqRniDa/N9O6IpscO
 EqQqbPWQcBJVqEd1mSos8rjrfpjFZsBqu9DCyXQB0owq7lOx/evTggfREwqKDrxyvR/1
 mOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9dFpeMp3R3uTEGrDSlhmlxItl2jBSfeQjxNn/Cp2pbs=;
 b=AlbzrFRt8RhFgVXmkDTSTutQNh1J2smZiOooX4+eX8AWkTuR+OKlVNPuqwNHB54K6B
 xB2TNRJJ0VGjotdfmZV4Wmz1JstonWrPBagBs64+gDV2xEPc07aKCfBoBbftVBDXwfJl
 +5nHr6WtTNiSoch6KOZQhgDTDrT8KM2hnB5i8WOxpEsYhfNuNuNicrxiOaPWD1IqLUqY
 gtgA4/g/BIbMcodaCw6mOmnomg9YQjpM0wcKR/aGL2TZ2FQJhlEk75NubHX/n6QypggY
 XlrKPaubJjiGWgtOA2CmnHjJeDm4uBbHruEAf/yjddGEIdpcumSS8L4jEwKEJpoqQK+L
 y0jA==
X-Gm-Message-State: AOAM5331F+7w6PR8eElznZsFWfRN78moXoU2f3WRo5VSVJorM+uTXz5L
 QXyDEWPA+8331zuCyu55i34=
X-Google-Smtp-Source: ABdhPJyhyZpQghMReI3KK427tnLEcaOB/eCNydcmpmrhUPDewuRtKKU8Igas/wT2PoJp62q+gtF++A==
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr4068335edv.140.1613774045168; 
 Fri, 19 Feb 2021 14:34:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hc40sm4962595ejc.50.2021.02.19.14.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 14:34:04 -0800 (PST)
Subject: Re: [PATCH v2 0/8] hw/sd: sd: Erase operation and other fixes
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ec7acce-8a57-e077-03a1-62f0b9ffc25b@amsat.org>
Date: Fri, 19 Feb 2021 23:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:02 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This includes several fixes related to erase operation of a SD card.

> Bin Meng (8):
>   hw/sd: sd: Fix address check in sd_erase()
>   hw/sd: sd: Only SDSC cards support CMD28/29/30
>   hw/sd: sd: Fix CMD30 response type
>   hw/sd: sd: Move the sd_block_{read,write} and macros ahead
>   hw/sd: sd: Skip write protect groups check in sd_erase() for high
>     capacity cards
>   hw/sd: sd: Actually perform the erase operation
>   hw/sd: sd: Skip write protect groups check in CMD24/25 for high
>     capacity cards
>   hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
> 
>  hw/sd/sd.c | 99 +++++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 64 insertions(+), 35 deletions(-)

Thanks, patches 1-5 and 7-8 applied to sdmmc-next tree.

