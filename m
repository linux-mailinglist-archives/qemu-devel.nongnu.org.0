Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F54047BC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:29:18 +0200 (CEST)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGMv-0004mj-KN
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGLm-0003mu-8t
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGLj-000562-N5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631179682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mp/yxKIxo35qlIxjkPpHR2WWZd6Ip78W8vNh9glzSik=;
 b=S3m6KLTNfsE/VRWifdS8hGsWrfeDeud+ACm3c7gtJbhvL03yxkDz25CWhzenYJG0mT2asa
 /1bBjqJI3ryKDE21ozgHqgCnYPoL+WohqomI1N53mnJuJpunJHDM3Rt6wFQhZvQ2/dsUBe
 f/QOfKu9XMpXbwBn1Q59qnLevwXaItI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-qMoSJS5XOEywLvKCqzsmTg-1; Thu, 09 Sep 2021 05:28:00 -0400
X-MC-Unique: qMoSJS5XOEywLvKCqzsmTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfec81000000b0015b085dbde3so311577wrn.14
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 02:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mp/yxKIxo35qlIxjkPpHR2WWZd6Ip78W8vNh9glzSik=;
 b=y95ci0F/nFOxA8P+wLjSz2cD+4j74fGQydB2fvGa9Yk+J2s4z+P8ELN4ufCcL6LoZi
 SLckFNEhpGJCbfrdm9V4QuKPWlqSjB2HgfRhcfDH3rK9GdD8L4XrizgV6yDTW0Gw7if9
 9OkgIkb1zLdjt2SnaIAn1jeBr7LvwLMIHAROQt2Ro0KmNRXg3e9y+/Hg+xtQ3wV0TAm1
 b/vrE35LJnUmcVocXVM1epVO9ePNDgFAybQlbus+FKHhLWhEkOkmzPN0RHVC9LD5c06+
 NtdFBBlHCzfRy9cHP/UIcM9aGJTjWHv4IV6iWk4z0MvYzqjw/M5cqmnQRrwJsMt309So
 aaGg==
X-Gm-Message-State: AOAM532XrjnEtMvvC7Ty9Ds92DExR42V9yzR8C9uEa0LAd+DopvG7YBw
 w8AfKgstitvAyYhG9OJMEa8WhTm3FolC8Ib9ZwmdeBzY6f81DBRDMuLGctwXL3SkEa0Jyfi8Eyw
 8D1PcDxsS0Vjpk70=
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr1883291wmq.193.1631179679403; 
 Thu, 09 Sep 2021 02:27:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzelBAPmV3sw9nwLMDuG5DogOe1kIZbNmmweWCzGZQaLrijn21DaDs7fmJovE3u0+aAeBuLhg==
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr1883244wmq.193.1631179678983; 
 Thu, 09 Sep 2021 02:27:58 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm1096209wmq.36.2021.09.09.02.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 02:27:58 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] hw/pflash_cfi01: Allow backing devices to be
 smaller than memory region
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 Tom Lendacky <thomas.lendacky@amd.com>, James Bottomley <jejb@linux.ibm.com>
References: <20210810134050.396747-1-david.edmondson@oracle.com>
 <20210810134050.396747-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <384a5d1d-de25-78d7-d8b0-226ebca44a6d@redhat.com>
Date: Thu, 9 Sep 2021 11:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810134050.396747-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Xu Yandong <xuyandong2@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 8/10/21 3:40 PM, David Edmondson wrote:
> Allow the backing device to be smaller than the extent of the flash
> device by mapping it as a subregion of the flash device region.
> 
> Return zeroes for all reads of the flash device beyond the extent of
> the backing device.
> 
> For writes beyond the extent of the underlying device, fail on
> read-only devices and discard them for writable devices.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  hw/block/pflash_cfi01.c | 105 ++++++++++++++++++++++++++++++++--------
>  hw/block/trace-events   |   3 ++
>  2 files changed, 87 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 81f9f971d8..f3289b6a2f 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -83,6 +83,8 @@ struct PFlashCFI01 {
>      uint64_t counter;
>      unsigned int writeblock_size;
>      MemoryRegion mem;
> +    MemoryRegion mem_outer;
> +    char outer_name[64];
>      char *name;
>      void *storage;
>      VMChangeStateEntry *vmstate;
> @@ -434,7 +436,6 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
>          }
>          break;
>      }
> -
>  }
>  
>  static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
> @@ -656,8 +657,44 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
>  }
>  
>  
> -static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_t *value,
> -                                              unsigned len, MemTxAttrs attrs)
> +static MemTxResult pflash_outer_read_with_attrs(void *opaque, hwaddr addr,
> +                                                uint64_t *value, unsigned len,
> +                                                MemTxAttrs attrs)
> +{
> +    PFlashCFI01 *pfl = opaque;
> +
> +    trace_pflash_outer_read(pfl->name, addr, len);
> +    *value = 0;

This seems to break the "width" and "old-multiple-chip-handling"
parameters ("emulating a number of flash devices wired up in parallel").

Also this breaks booting with SEV enabled on X86... See commits
9617cddb726 ("pc: add parser for OVMF reset block") and b2f73a0784b
("sev/i386: Allow AP booting under SEV-ES").

> +    return MEMTX_OK;
> +}
> +
> +static MemTxResult pflash_outer_write_with_attrs(void *opaque, hwaddr addr,
> +                                                 uint64_t value, unsigned len,
> +                                                 MemTxAttrs attrs)
> +{
> +    PFlashCFI01 *pfl = opaque;
> +
> +    trace_pflash_outer_write(pfl->name, addr, len);
> +    if (pfl->ro) {
> +        return MEMTX_ERROR;
> +    } else {
> +        warn_report_once("%s: "
> +                         "attempt to write outside of the backing block device "
> +                         "(offset " TARGET_FMT_plx ") ignored",
> +                         pfl->name, addr);

This doesn't seem acceptable on mainstream, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html

> +        return MEMTX_OK;
> +    }
> +}
> +
> +static const MemoryRegionOps pflash_cfi01_outer_ops = {
> +    .read_with_attrs = pflash_outer_read_with_attrs,
> +    .write_with_attrs = pflash_outer_write_with_attrs,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr,
> +                                              uint64_t *value, unsigned len,
> +                                              MemTxAttrs attrs)
>  {
>      PFlashCFI01 *pfl = opaque;
>      bool be = !!(pfl->features & (1 << PFLASH_BE));
> @@ -670,8 +707,9 @@ static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_
>      return MEMTX_OK;
>  }
>  
> -static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr, uint64_t value,
> -                                               unsigned len, MemTxAttrs attrs)
> +static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr,
> +                                               uint64_t value, unsigned len,
> +                                               MemTxAttrs attrs)
>  {
>      PFlashCFI01 *pfl = opaque;
>      bool be = !!(pfl->features & (1 << PFLASH_BE));
> @@ -800,7 +838,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>  {
>      ERRP_GUARD();
>      PFlashCFI01 *pfl = PFLASH_CFI01(dev);
> -    uint64_t total_len;
> +    uint64_t outer_len, inner_len;
>      int ret;
>  
>      if (pfl->sector_len == 0) {
> @@ -816,35 +854,60 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    total_len = pfl->sector_len * pfl->nb_blocs;
> -
> -    memory_region_init_rom_device(
> -        &pfl->mem, OBJECT(dev),
> -        &pflash_cfi01_ops,
> -        pfl,
> -        pfl->name, total_len, errp);
> -    if (*errp) {
> -        return;
> -    }
> -
> -    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> +    outer_len = pfl->sector_len * pfl->nb_blocs;
>  
>      if (pfl->blk) {
>          uint64_t perm;
> +
>          pfl->ro = !blk_supports_write_perm(pfl->blk);
>          perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
>          ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
>          if (ret < 0) {
>              return;
>          }
> +
> +        inner_len = blk_getlength(pfl->blk);
> +
> +        if (inner_len > outer_len) {
> +            error_setg(errp, "%s: "
> +                       "block backend provides %" PRIu64 " bytes, "
> +                       "device limited to %" PRIu64 " bytes",
> +                       pfl->name, inner_len, outer_len);
> +            return;
> +        }
>      } else {
>          pfl->ro = false;
> +        inner_len = outer_len;
>      }
>  
> +    trace_pflash_realize(pfl->name, pfl->ro, inner_len, outer_len);
> +
> +    snprintf(pfl->outer_name, sizeof(pfl->outer_name),
> +             "%s container", pfl->name);
> +    memory_region_init_io(&pfl->mem_outer, OBJECT(dev),
> +                          &pflash_cfi01_outer_ops,
> +                          pfl, pfl->outer_name, outer_len);

Here you create an I/O region but name it "container" ...

> +
> +    memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
> +                                  &pflash_cfi01_ops,
> +                                  pfl, pfl->name, inner_len, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&pfl->mem_outer, 0, &pfl->mem);

... then add it inside the previous region, so &pfl->mem is used
as container (containing &pfl->mem_outer named "container"...).
This is confusing. Anyhow we shouldn't add subregions to I/O
regions but use real containers instead, creating the container
with memory_region_init(), then adding subregions inside.

> +
> +    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem_outer);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);


Have you audited no code uses:

  mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash), 0);

Because we'd need to change 0 -> 1.

See also the problem with pflash_cfi01_get_memory():
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg01988.html
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02026.html

>      if (pfl->blk) {
> -        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
> -                                         errp)) {
> +        int ret = blk_pread(pfl->blk, 0, pfl->storage, inner_len);
> +
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "cannot read %" PRIu64 " "
> +                             "bytes from block backend", inner_len);
>              vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
>              return;
>          }


