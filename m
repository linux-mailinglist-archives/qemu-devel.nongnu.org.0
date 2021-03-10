Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E2333227
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 01:04:04 +0100 (CET)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmKZ-0002hY-Q5
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 19:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmJ8-00024H-MW; Tue, 09 Mar 2021 19:02:34 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmJ6-00061U-5T; Tue, 09 Mar 2021 19:02:33 -0500
Received: by mail-ej1-x636.google.com with SMTP id e19so33215554ejt.3;
 Tue, 09 Mar 2021 16:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dmrmk3YY7MxD8gdEMf3O+iiiMp9WkFXxJeet/SAEDYI=;
 b=CeheNKZn186toVtpz6RXj6FALqcKJ6UFMenNk0huoGqKQ9WujBzx/MNcq9bBXwvwtL
 BzZWoMb/HELSW8JxO+9eT27r/cX/kfycKWeYeUtPMCse1SNgCRU/OfF/4LZV7EHdvM80
 wNsI4C375LQJbuLjWPJFyR+pa6o65Yfss3eeVDHzMM9aiLkshO5K89/rU6oYZlIEgTGs
 Oi03azwcWLpamoxsfPL6wO//HCRsIgswtovJp3REKQMcf3BcuBj3N24Zv0TpUdRxVvbM
 3yR1RnP7xC55/t3/hOZ9yf2RDoQn9YfrwJYxqQGmGS870N5tRBYs14vzlbsZqN5WP4Wm
 MsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dmrmk3YY7MxD8gdEMf3O+iiiMp9WkFXxJeet/SAEDYI=;
 b=U699tSYcmQcY7COTEApkFGAcYL7jsC9aWINT2sf/POY/sh8ytF34tm3cfSBckFtZx2
 Q2oHl7QeNHuiLhXO1rRaMvR8B9neTtDGaAmY+DMK7w4WKNMzFMMxH4PZFfWmLLUszpFM
 iwTAUjBKVy1ZECgRy8ULnrVfjxsJCJsxTY2c4EQ5AqbBKf4isCSknYc3pmchwxXZnEQg
 iGHO8CHQnEzwmC287XEI/LSburiIALi42vrdCw995kkrSBEup3lK1ImEFginEgRYcy0h
 BPu24XZZnxdUAKLCaIXPPndfkBzini2XkfPcVc2ewKQ/E0w17IXgWnYDvlqmne8dMD3F
 NxHQ==
X-Gm-Message-State: AOAM53099cLpyc5BGw9Oe7DmwCXGliukm/dTj9QC8EmXRaOeu9aGxjXH
 mkpK3VS4n+nHF4hQq2KsIz0=
X-Google-Smtp-Source: ABdhPJxtw7fH+SZSvuiUHIsvO+O9luholD8VEjXllhrlSfl8eL4vXESrxTTxPPBRx888dohOOpQEPQ==
X-Received: by 2002:a17:906:4f02:: with SMTP id
 t2mr586996eju.121.1615334549953; 
 Tue, 09 Mar 2021 16:02:29 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t17sm9901225edr.36.2021.03.09.16.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 16:02:29 -0800 (PST)
Subject: Re: [PATCH v6 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and base
 vt82c686b_isa on it
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615321729.git.balaton@eik.bme.hu>
 <ffd30415332be2d23f72072dc256cc6eee170f3d.1615321729.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <18602f6c-a1d1-bf02-26cf-c3f1cba52294@amsat.org>
Date: Wed, 10 Mar 2021 01:02:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ffd30415332be2d23f72072dc256cc6eee170f3d.1615321729.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 9:28 PM, BALATON Zoltan wrote:
> To allow reusing ISA bridge emulation for vt8231_isa move the device
> state of vt82c686b_isa emulation in an abstract via_isa class. This
> change breaks migration back compatibility but this is not an issue
> for Fuloong2E machine which is not versioned or migration supported.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>  include/hw/pci/pci_ids.h |  2 +-
>  2 files changed, 40 insertions(+), 32 deletions(-)

This should be OK if this other series is accepted:
"hw/usb: Extract Extract VT82C686 UHCI PCI function into new unit"
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg03083.html

I'll come back to this patch after the former series is reviewed.

