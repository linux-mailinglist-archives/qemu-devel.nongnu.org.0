Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D74656DB9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAE6r-0007ub-61; Tue, 27 Dec 2022 12:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAE6o-0007tr-Tw
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:51:26 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAE6m-00031n-Pp
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:51:26 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1442977d77dso16199232fac.6
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GWT6VnkrHlQoRtLu2DA9858OPofMgMjRRiTGncGlu7k=;
 b=SWeLMw3ao4ELf/eKGXWaFMyW6zBxnnE+P+qO9+JQnMHurg4aj/gOMIctDXKpVCmDje
 RIiYnkfQJ/gghjDHNbIs4Oiu6PtCtbGrSotebECnxNbvia7M+rPOh/ZeJMOL4bhRgf/e
 fO9nXB+ptmgg4E7UjrjCWkJqVOCcCe/vsTwKL09GyqlhqqnelGTWJ2hyElbxpibJn4qq
 nXrlT+kEwf5Zfz3oqtb/a/nLRjrG0VL2U5wnRYrVYyJS4Uhs2SQgkwNdV6wIQyHBwcom
 kxyyP2ciyZ2JM4BxdKauDrU8xvXoNvsJqA4Vw86IHzijns4JFcUeaFkHc056tJ2cdM7o
 u2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GWT6VnkrHlQoRtLu2DA9858OPofMgMjRRiTGncGlu7k=;
 b=gDpz0e9qc6zeNHfT1xpsRN+SDJuHyF1OnKYJFj3idl4UHzX+7lPK3LZTAv4u+MKpwD
 E8bG4dIs/HP1aBPDwBKqerlSrT2WNsK8tDRnC3/eiFXaIdyaobQwdhywfNlrsGXdgBwx
 8GOAimIp5b8Fdz20X1I8FmSu2JNeUvXwk3uMdwF7XxLH0QJOcrLFb0OyBTQtAJTfs27s
 Sh/C87AxrWymb68YUf68ukb7tDmY/Wswgcj5TA8eXcjCmfodFCgyZS+HtZbneyBtUVTQ
 2+E3g3uj8QeeKE0UxLvnFtj5jgf+G4FRTQZ7rOhVFRe1e9IhtQjBzriLGa605xulFoJB
 llvQ==
X-Gm-Message-State: AFqh2kqxEGaiVZYPAg6Jbi+SEowvw4+OzrsJZd8/dvze4uIOnL4ciKtT
 sGRV0W/M8LNLAUR9KD0rz5fYaw==
X-Google-Smtp-Source: AMrXdXvQC3xSfbtYpKAPFnPtH7c9BRfMYoRB44xkE2u/e3zwro3iyL17GvPok3MqLvNruilzacHXiA==
X-Received: by 2002:a05:6870:2194:b0:143:9c9f:c7e3 with SMTP id
 l20-20020a056870219400b001439c9fc7e3mr20080750oae.45.1672163482366; 
 Tue, 27 Dec 2022 09:51:22 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056870c38d00b0014185b2b3d5sm6325630oao.18.2022.12.27.09.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:51:21 -0800 (PST)
Message-ID: <670a96f5-b703-5c20-3cb6-c95f55249e4e@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:51:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221227064812.1903326-1-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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



On 12/27/22 03:48, Bin Meng wrote:
> At present the 32-bit OpenSBI generic firmware image does not boot on
> Spike, only 64-bit image can. This is due to the HTIF emulation does
> not implement the proxy syscall interface which is required for the
> 32-bit HTIF console output.
>
> An OpenSBI bug fix [1] is also needed when booting the plain binary image.
>
> With this series plus the above OpenSBI fix, both 32-bit OpenSBI BIN & ELF
> images can boot on QEMU 'spike' machine.
>
> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/

Aside from a nit in patch 12/12, LGTM. I've tested with a patched version of
Opensbi including [1] and I can get terminal output with riscv32 spike:

$ ./qemu-system-riscv32 -M spike -display none -nographic
-bios ../../opensbi/build/platform/generic/firmware/fw_payload.bin

OpenSBI v1.1-112-g6ce00f8
    ____                    _____ ____ _____
   / __ \                  / ____|  _ \_   _|
  | |  | |_ __   ___ _ __ | (___ | |_) || |
  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
  | |__| | |_) |  __/ | | |____) | |_) || |_
   \____/| .__/ \___|_| |_|_____/|____/_____|
         | |
         |_|
(.......)


Speaking of [1], it seems like the fix went a bit too late for the opensbi 1.2 release.
Assuming that [1] is accepted, it would be nice if we could bake in this fix on top of the
1.2 release when updating the QEMU roms.


Thanks,

Daniel

>
>
> Bin Meng (10):
>    hw/char: riscv_htif: Avoid using magic numbers
>    hw/char: riscv_htif: Drop {to,from}host_size in HTIFState
>    hw/char: riscv_htif: Drop useless assignment of memory region
>    hw/char: riscv_htif: Use conventional 's' for HTIFState
>    hw/char: riscv_htif: Move registers from CPUArchState to HTIFState
>    hw/char: riscv_htif: Remove forward declarations for non-existent
>      variables
>    hw/char: riscv_htif: Support console output via proxy syscall
>    hw/riscv: spike: Remove the out-of-date comments
>    hw/riscv/boot.c: Introduce riscv_find_firmware()
>    hw/riscv: spike: Decouple create_fdt() dependency to ELF loading
>
> Daniel Henrique Barboza (2):
>    hw/riscv/boot.c: make riscv_find_firmware() static
>    hw/riscv/boot.c: introduce riscv_default_firmware_name()
>
>   include/hw/char/riscv_htif.h |  19 +---
>   include/hw/riscv/boot.h      |   4 +-
>   target/riscv/cpu.h           |   4 -
>   hw/char/riscv_htif.c         | 172 +++++++++++++++++++++--------------
>   hw/riscv/boot.c              |  76 ++++++++++------
>   hw/riscv/sifive_u.c          |  11 +--
>   hw/riscv/spike.c             |  59 ++++++++----
>   hw/riscv/virt.c              |  10 +-
>   target/riscv/machine.c       |   6 +-
>   9 files changed, 212 insertions(+), 149 deletions(-)
>


