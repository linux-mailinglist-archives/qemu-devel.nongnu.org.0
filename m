Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11858593D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 10:41:28 +0200 (CEST)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHi2H-0007LI-Hl
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 04:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1oHi0X-0005vb-8D
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 04:39:37 -0400
Received: from relay.yourmailgateway.de ([188.68.63.101]:48419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1oHi0U-0002q2-Mo
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 04:39:36 -0400
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4LvyVV2Vd0z4yb8;
 Sat, 30 Jul 2022 10:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1659170370; bh=04pJLgE4YItmhYkrzkEeSE+40SFoKRnKNtJqWjizGJ0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=CP0E51DKtQd4Ucw/VcvNW1kaZtvIMqrtIYW47jwqIyjmLTvDKZdAGb4V9wlDef8Ji
 zqLXpafG9U6tMG6MB5NaoRTXndoJ+/z+HZ5DmCme4EtVcYrYTXMcZqKlEyhDWAxKKj
 t8esyejpGDMUjxgI6X434rVfBS2bcOzAjlU0eoARBnodyabhgI0NSdRUPy4F5nBxmp
 oZq+Jbl8gf75810mBCc5Dt4RhDBBry+u+bOLsak86t8J1tQX1dQgtKxvsUkfS+nCeN
 v2c7yYxj52oXGvCtIjL1HgZtnTNiMnlDbDRLcTmofHUUBG2W3J+m1fWNzlUJ9hSMmi
 Hqf3qJxWqWksQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4LvyVV21mVz4yMn;
 Sat, 30 Jul 2022 10:39:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4LvyVT1ZYTz8sZR;
 Sat, 30 Jul 2022 10:39:29 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-202.um35.pools.vodafone-ip.de
 [95.223.70.202])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 18E2160499;
 Sat, 30 Jul 2022 10:39:28 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.202) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <ea20f155-4a43-a55d-6ae9-713c267617a1@zapateado.de>
Date: Sat, 30 Jul 2022 10:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Helge Konetzka <hk@zapateado.de>
Subject: Re: [PATCH] WHPX: Add support for device backed memory regions
To: qemu-devel@nongnu.org
Cc: Aidan Khoury <aidan@revers.engineering>
References: <20220727180012.45615-1-aidan@revers.engineering>
Content-Language: en-US
In-Reply-To: <20220727180012.45615-1-aidan@revers.engineering>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <165917036851.30406.4117800654721737232@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: FZad2kP/CiI2J3alVDkqKrFqY4pFLN8/VLO7sSYxQJvN
Received-SPF: pass client-ip=188.68.63.101; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.07.22 um 20:00 schrieb Aidan Khoury:
> Due to skipping the mapping of read only device memory, Windows
> Hypervisor Platform would fail to emulate such memory accesses when booting
> OVMF EDK2 firmware. This patch adds ROM device memory region support
> for WHPX since the Windows Hypervisor Platform supports mapping read-only
> device memory, which allows successful booting of OVMF EDK2 firmware.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/513
>            https://gitlab.com/qemu-project/qemu/-/issues/934
> Buglink: https://bugs.launchpad.net/bugs/1821595
> 
> Signed-off-by: Aidan Khoury <aidan@revers.engineering>
> ---
>   target/i386/whpx/whpx-all.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index b22a3314b4..7a61df1135 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -2363,11 +2363,18 @@ static void whpx_process_section(MemoryRegionSection *section, int add)
>       MemoryRegion *mr = section->mr;
>       hwaddr start_pa = section->offset_within_address_space;
>       ram_addr_t size = int128_get64(section->size);
> +    bool is_romd = false;
>       unsigned int delta;
>       uint64_t host_va;
>   
>       if (!memory_region_is_ram(mr)) {
> -        return;
> +        if (memory_region_is_romd(mr)) {
> +            is_romd = true;
> +            warn_report("WHPX: ROMD region 0x%016" PRIx64 "->0x%016" PRIx64,
> +                        start_pa, start_pa + size);
> +        } else {
> +            return;
> +        }
>       }
>   
>       delta = qemu_real_host_page_size() - (start_pa & ~qemu_real_host_page_mask());
> @@ -2386,7 +2393,7 @@ static void whpx_process_section(MemoryRegionSection *section, int add)
>               + section->offset_within_region + delta;
>   
>       whpx_update_mapping(start_pa, size, (void *)(uintptr_t)host_va, add,
> -                        memory_region_is_rom(mr), mr->name);
> +                        memory_region_is_rom(mr) || is_romd, mr->name);
>   }
>   
>   static void whpx_region_add(MemoryListener *listener,

Test was successful on Windows 10 Pro, 21H1, build & test environment 
MSYS2, MINGW64

Tested-by: Helge Konetzka <hk@zapateado.de>

Test execution after building and installing patched MSys2/Mingw64 package:

$ cp /mingw64/share/qemu/edk2-i386-vars.fd ./
$ qemu-system-x86_64 \
  -M q35 \
  -m 1536 \
  -accel whpx,kernel-irqchip=off \
  -drive 
file=/mingw64/share/qemu/edk2-x86_64-code.fd,if=pflash,format=raw,readonly=on 
\
  -drive file=edk2-i386-vars.fd,if=pflash,format=raw,readonly=off \
  -cdrom openSUSE-Leap-15.3-GNOME-Live-x86_64-Media.iso

Windows Hypervisor Platform accelerator is operational
D:\msys64\mingw64\bin\qemu-system-x86_64.exe: warning: WHPX: ROMD region 
0x00000000ffc84000->0x0000000100000000
D:\msys64\mingw64\bin\qemu-system-x86_64.exe: warning: WHPX: ROMD region 
0x00000000ffc00000->0x00000000ffc84000
qemu: warning: WHPX: ROMD region 0x00000000ffc00000->0x00000000ffc84000
qemu: warning: WHPX: ROMD region 0x00000000ffc00000->0x00000000ffc84000

