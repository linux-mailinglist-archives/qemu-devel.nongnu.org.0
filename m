Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00352E8C5A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 14:54:41 +0100 (CET)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw3qD-0000Af-13
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 08:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3o4-0007h4-Rg
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:52:29 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3ny-0001LI-N8
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:52:23 -0500
Received: by mail-wm1-x32b.google.com with SMTP id a6so14780840wmc.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gMNYz+DY0NZiuYqmRTZaF5QlFGshcVTgxqj/hNUcW7g=;
 b=OnIM5CvFteogj89Wy0GkjWX2B+5PqQ6TY5qyQtqblJcuEu62QcPrLaCsvD71blZ0LI
 Ibr4NYteSX1fHljdCI3wzp1kv/hbN/ptSyn2XC+56myZFxAcD3yEVpFu96sJC3RzZOdO
 /mb8BbNpCLjg3aQ7DiJ6NUCWK1zdAkOorD3UwNCwLjvcdEAbdP96HvMDXQThP692zypZ
 KHbOkfaXX5YADOJFzn4E+4dSXT4UcYbJCCgEl2sHIZZIMcfZZN+fnqEmHJpkkyavXOqm
 kgtv7CXzRc3vX8+AdLQmZTo1Qb9jsg+u5hfRsNtC7FZj+PBVLmTLDQQQX3vwpJsztBgH
 Qbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gMNYz+DY0NZiuYqmRTZaF5QlFGshcVTgxqj/hNUcW7g=;
 b=rt0omk/a7s2ESEqWonNvOAaJsqfGTZwNYTUT+3RD4VIBiZI83OsvPFaCN8aAy8uy/a
 d14jDW90+juCqxNtMpFTTvRiwNZfQjGbpgWUZIB0awuumCR2VmNe0Ld6xq39jxz7nqlb
 N52EC+0H0cAwj98CJqK5QFy1PcAh2QqMGJH0IxDo/DBkFcFRmDlHyHgFEJvN+t9nSrxv
 5vqcdkWJ0oizwnIwIcBam/86ZXP1bkHSgSc55ggf49ZdE6cmQOtrX8pAsA9LZsV4M3JS
 aHVXFac8WY2k91u/VOcHHW2D8k8hucpwU+YvkFtSPnvwS3ZrLcTjQEzrdUNZlMOoMhlE
 M04g==
X-Gm-Message-State: AOAM533+UYRrPobejsdqA0rhOOOz4F/walXKb6RM2VxfUS3HVF/MUprX
 Legphg3LOeeCJE+y5lLWNZVKvYe8LDI=
X-Google-Smtp-Source: ABdhPJz/+M+y0NafhRXfySBcgGQ6EdP4ryA+NIbJ8EIr0t0C7S5iHSynnb0Kpu8d9Mc4mxTD7bHaHw==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr23675794wmg.189.1609681940580; 
 Sun, 03 Jan 2021 05:52:20 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id l11sm85684389wrt.23.2021.01.03.05.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 05:52:19 -0800 (PST)
Subject: Re: [PATCH 00/18] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
To: qemu-devel@nongnu.org
References: <20201231224911.1467352-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <539d083c-e622-19a8-45ea-22115b33c7b2@amsat.org>
Date: Sun, 3 Jan 2021 14:52:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/20 11:48 PM, Philippe Mathieu-Daudé wrote:
> Patches I wrote while reviewing/testing Jiaxun's v3 [1] trying
> to understand the problem with "Fixup pci.lomem mapping" [2].
> 
> The issue should be fixed by patch #8 of this series:
> 'Remap PCI "lo" regions when PCIMAP reg is modified'.
> The rest are cleanups patches.
> 
> Happy new year,
> 
> Phil.
> 
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769286.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769294.html
> 
> Philippe Mathieu-Daudé (18):
>   hw/pci-host/bonito: Remove unused definitions
>   hw/pci-host/bonito: Display hexadecimal value with '0x' prefix
>   hw/pci-host/bonito: Use PCI_DEVFN() macro
>   hw/pci-host/bonito: Use pci_config_set_interrupt_pin()

Patches 2-4 applied to mips-next.

