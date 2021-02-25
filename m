Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4E324F4D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:37:41 +0100 (CET)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFExg-0002y1-Ll
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFEd6-0006cv-EO
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:16:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFEd0-0006yu-Gb
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614251777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Co9+wzVrkExJlVkuF7bfU2tqehXl1mAQR9zwOh6M/I=;
 b=H85S/alm/fxDGb857r0XHJJpHKPkNuu2MW+LEoWaEwgyv/SrCQ+lec8JUG/76enFW9Bv9Y
 xa6+wXTgFjQcfytfzAaX/thmr4aWX6H23p1nwtRHJrkYq+RJJjbZQKNd2WfED21mkOSlgU
 Adz5Zrzx+xnCk+X8PGZ/RixkmOpScNA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-2WDhXbCWP3mVYpxDTOGoqg-1; Thu, 25 Feb 2021 06:16:14 -0500
X-MC-Unique: 2WDhXbCWP3mVYpxDTOGoqg-1
Received: by mail-wr1-f69.google.com with SMTP id q5so2511197wrs.20
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 03:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Co9+wzVrkExJlVkuF7bfU2tqehXl1mAQR9zwOh6M/I=;
 b=bhFxtCQwQ70+50Voscp28Qzf28vShzWV/IfR4lVSTicYJIGn1CCC2AK+MYtd/nB9lA
 UlivvIFDy5JkNlUAN+Ezhf0Wvp+DIjUBvAr+qN1G1hqOrQ6NjMHWBEs56bdMdXEAcySv
 xibI5C+e+NHpW/RbzFTWjO0CiTvMFdjKb3LabYQUjQJEglI7ydTREapK7+tbTtYrgeN0
 yhBDNLf2B8grW7mUp2818r70Xz85albl/tUzMKNiOJnnIfGmHjjuw+ApNvJmIenXQDgA
 wDH78bnmldviPtkzykBkjRjO/vHUJYTBL3Ofd6m6mkW/gDGKsbCZ6E4Svz0P2l+7nSfB
 MfPA==
X-Gm-Message-State: AOAM530VxBEZtgJDeZMhKpJD28bwDvTtEeGqiv499v38j3ze+sPoItHU
 QW1s8NO8wOmPVfzg9HAABqXWZdcN56XhqmvZu5TOUO2jqRfnrO4Ydw+nQIyMLd3vBDX5WZSnlh4
 ECSiLDYBYiby42Ws=
X-Received: by 2002:adf:b355:: with SMTP id k21mr3030149wrd.156.1614251772734; 
 Thu, 25 Feb 2021 03:16:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa7nTOE34GBVjNK5wyMsVL595UNKs7p3zDP740VWqLW1/rB4Cw815ZsSx/YhJ3worJmyMPJQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr3030096wrd.156.1614251772082; 
 Thu, 25 Feb 2021 03:16:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o15sm6843040wmh.39.2021.02.25.03.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 03:16:11 -0800 (PST)
Subject: Re: [PATCH] hw/riscv: Add basic fw_cfg support to virt
To: Asherah Connor <ashe@kivikakk.ee>
References: <20210225101343.40301-1-ashe@kivikakk.ee>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a09c550e-2172-adfe-140d-45936b7edacd@redhat.com>
Date: Thu, 25 Feb 2021 12:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225101343.40301-1-ashe@kivikakk.ee>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Asherah,

You forgot to Cc the maintainers (doing it now):

./scripts/get_maintainer.pl -f hw/riscv/virt.c
Palmer Dabbelt <palmer@dabbelt.com>
Alistair Francis <Alistair.Francis@wdc.com>
Sagar Karandikar <sagark@eecs.berkeley.edu>
Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
qemu-riscv@nongnu.org
qemu-devel@nongnu.org

On 2/25/21 11:13 AM, Asherah Connor wrote:
> Provides a minimal fw_cfg for the virt machine on riscv.  I've
> arbitrarily selected an MMIO base for it.  This is very rudimentary, so
> no DMA interface is exposed.  Tested as working!
> 
> (First patch to qemu, so whatever patience you can afford would be
> appreciated.)

What is missing here is why do you need this, what problem
does this patch solve.

> 
> Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
> ---
>  hw/riscv/virt.c         | 25 +++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  4 +++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2299b3a6be..4981ca004b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -56,6 +56,7 @@ static const struct MemmapEntry {
>      [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
>      [VIRT_UART0] =       { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
> +    [VIRT_FW_CFG] =      { 0x10100000,          0x10 },
>      [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
>      [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
>      [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
> @@ -488,6 +489,26 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>      return dev;
>  }
>  
> +static FWCfgState *create_fw_cfg(const RISCVVirtState *s)
> +{
> +    hwaddr base = virt_memmap[VIRT_FW_CFG].base;
> +    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
> +    FWCfgState *fw_cfg;
> +    char *nodename;
> +
> +    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, 0, NULL);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)MACHINE(s)->smp.cpus);
> +
> +    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
> +    qemu_fdt_add_subnode(s->fdt, nodename);
> +    qemu_fdt_setprop_string(s->fdt, nodename,
> +                            "compatible", "qemu,fw-cfg-mmio");
> +    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    g_free(nodename);
> +    return fw_cfg;
> +}
> +
>  static void virt_machine_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap = virt_memmap;
> @@ -652,6 +673,10 @@ static void virt_machine_init(MachineState *machine)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>  
> +    /* init fw_cfg */
> +    s->fw_cfg = create_fw_cfg(s);
> +    rom_set_fw(s->fw_cfg);
> +
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
>                                     machine->ram_size, s->fdt);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 84b7a3848f..3b81a2e3f6 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -40,6 +40,7 @@ struct RISCVVirtState {
>      RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
>      DeviceState *plic[VIRT_SOCKETS_MAX];
>      PFlashCFI01 *flash[2];
> +    FWCfgState *fw_cfg;
>  
>      void *fdt;
>      int fdt_size;
> @@ -58,7 +59,8 @@ enum {
>      VIRT_DRAM,
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
> -    VIRT_PCIE_ECAM
> +    VIRT_PCIE_ECAM,
> +    VIRT_FW_CFG
>  };
>  
>  enum {
> 


