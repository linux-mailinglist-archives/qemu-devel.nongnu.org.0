Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C36631EE2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4Us-00070D-NV; Mon, 21 Nov 2022 05:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmenzel@molgen.mpg.de>)
 id 1ox4Uq-0006y6-8c
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:57:52 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmenzel@molgen.mpg.de>)
 id 1ox4Uo-0005ND-3m
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:57:52 -0500
Received: from [141.14.14.54] (v054.vpnx.molgen.mpg.de [141.14.14.54])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id D809F61EA1932;
 Mon, 21 Nov 2022 11:57:35 +0100 (CET)
Message-ID: <8aef330c-c5e4-1af9-7018-5eff00ac91d3@molgen.mpg.de>
Date: Mon, 21 Nov 2022 11:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [SeaBIOS] [PATCH 3/4] move 64bit pci window to end of address
 space
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: seabios@seabios.org, qemu-devel@nongnu.org
References: <20221121103213.1675568-1-kraxel@redhat.com>
 <20221121103213.1675568-4-kraxel@redhat.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20221121103213.1675568-4-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=141.14.17.11; envelope-from=pmenzel@molgen.mpg.de;
 helo=mx1.molgen.mpg.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Dear Gerd,


Thank you for the patch.

Am 21.11.22 um 11:32 schrieb Gerd Hoffmann:
> When the size of the physical address space is known (PhysBits is not
> zero) move the 64bit pci io window to the end of the address space.

It’d be great, if you elaborated, why this is an improvement.


Kind regards,

Paul


> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   src/fw/pciinit.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/src/fw/pciinit.c b/src/fw/pciinit.c
> index badf13d3233b..ad6def93633b 100644
> --- a/src/fw/pciinit.c
> +++ b/src/fw/pciinit.c
> @@ -1128,6 +1128,14 @@ static void pci_bios_map_devices(struct pci_bus *busses)
>           r64_mem.base = le64_to_cpu(romfile_loadint("etc/reserved-memory-end", 0));
>           if (r64_mem.base < 0x100000000LL + RamSizeOver4G)
>               r64_mem.base = 0x100000000LL + RamSizeOver4G;
> +        if (PhysBits) {
> +            u64 top = 1LL << PhysBits;
> +            u64 size = (ALIGN(sum_mem, (1LL<<30)) +
> +                        ALIGN(sum_pref, (1LL<<30)));
> +            if (r64_mem.base < top - size) {
> +                r64_mem.base = top - size;
> +            }
> +        }
>           r64_mem.base = ALIGN(r64_mem.base, align_mem);
>           r64_mem.base = ALIGN(r64_mem.base, (1LL<<30));    // 1G hugepage
>           r64_pref.base = r64_mem.base + sum_mem;

