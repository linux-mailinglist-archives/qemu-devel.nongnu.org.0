Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB1646249
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p30s5-00047a-8h; Wed, 07 Dec 2022 15:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p30rn-00046z-T3
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p30rl-0002sv-6o
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670444284;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1zMcQtRBIwE0d+dZpwzQy/VO1aKSTORhcSDzWNT5lI=;
 b=DYkag8QLJtWZMDN/3cZcxNnuSHsBOG+Pn+w/5HOGcX1l/Uhr2Xs7VtMK76zHvbJd2B5oO/
 4FUUQCx9ANvyJJdrXZp/aF5rfo97lgswYuffKAA9liBXMFyMWrLsDFCnu8cxUJpfyeOY80
 OEnEOYx9yeP/DfSIWZrOSKZOmr8ZJXE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-GsEN3GLuM7icvkJa71wxsg-1; Wed, 07 Dec 2022 15:18:02 -0500
X-MC-Unique: GsEN3GLuM7icvkJa71wxsg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso10420204wma.6
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 12:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1zMcQtRBIwE0d+dZpwzQy/VO1aKSTORhcSDzWNT5lI=;
 b=n5vyVFPs8ScVKFTwNWx1eMmAOhE6kar7LReVTwMn9iVa5JLc0nrS+GLo6t3aHrK73Y
 v6LTJPQS2tMPmP2ro0pWcJLeqt77ETGJQR2scflm18Tay2uXLYHDK7VeoZc6CNx32mb7
 wh38HGPHp+gRIHxJT5CkWIFwoU/DUMdDdJ2BWrwibHip0DOGSn4DYcOzO7jFJilY8IKk
 Ao+EbPvDdX6iTCFgOObxdapf6GlVBf2CudRDVWKiMrQI/TqyDNv7hne93g1Ml/rHLPE3
 R3UFbKSRMCQ78jstDKEZv/uQeRT+hmS6l1ZQbT1kn/WXaRWTbA/TL77+HsE0IJd1fJe+
 2l/w==
X-Gm-Message-State: ANoB5pks5YTqTpf/oLgNRG4dDLHm2EpqKTayetCn184yZB9+GjE3gjGe
 7Bcjcd7fgEipmEh7cwnd/hzXUAkRFqRa3NJej5/qEXXwTg+EoXBMHp2hRt1Ru5MvbmkATOPrei4
 1npXblHzDIeM7H8Q=
X-Received: by 2002:a05:600c:4f92:b0:3cf:e87a:8068 with SMTP id
 n18-20020a05600c4f9200b003cfe87a8068mr62268063wmq.3.1670444281595; 
 Wed, 07 Dec 2022 12:18:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Z1/kyxh2p9NgGFYQBx+IvnbvY/ZRkPzaA1P8MgJgtJ6w0BHxzpEQxbYiFLunNpFf2PBpCdA==
X-Received: by 2002:a05:600c:4f92:b0:3cf:e87a:8068 with SMTP id
 n18-20020a05600c4f9200b003cfe87a8068mr62268044wmq.3.1670444281306; 
 Wed, 07 Dec 2022 12:18:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a5d4b90000000b002422202fa7fsm17800381wrt.39.2022.12.07.12.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 12:18:00 -0800 (PST)
Message-ID: <c51e8135-e0dd-be9d-f2a4-89545f196f74@redhat.com>
Date: Wed, 7 Dec 2022 21:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: eric.auger.pro@gmail.com, Stefan Hajnoczi <stefanha@gmail.com>,
 pbonzini@redhat.com, richard.henderson@linaro.org, paul@nowt.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <0828040a-c297-46b0-68b7-4761583f1ceb@linaro.org>
 <3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com>
 <b0afb1f7-1156-9b4a-a87b-f56c72f753c0@weilnetz.de>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <b0afb1f7-1156-9b4a-a87b-f56c72f753c0@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

On 12/7/22 20:11, Stefan Weil via wrote:
> Am 07.12.22 um 19:22 schrieb Eric Auger:
>>
>> On 12/7/22 17:55, Philippe Mathieu-Daudé wrote:
>>> On 7/12/22 15:33, Eric Auger wrote:
>>>> On 12/7/22 15:09, Stefan Hajnoczi wrote:
>>>>> On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com>
>>>>> wrote:
>>>>>> On 12/7/22 14:24, Eric Auger wrote:
>>>>>>> Initialize r0-3 to avoid compilation errors when
>>>>>>> -Werror=maybe-uninitialized is used
>>>>>>>
>>>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2495 |     d->Q(3) = r3;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2494 |     d->Q(2) = r2;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2493 |     d->Q(1) = r1;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2492 |     d->Q(0) = r0;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>>
>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> Am I the only one getting this? Or anything wrong in my setup.
>
> Hi Eric,
>
> no, you are not the only one. I regularly build with higher warning
> levels, for example with -Weverything on macOS, and get a much longer
> list which includes the mentioned warnings (see below).

thanks! Interesting to see the exhaustive list below and your stats
sorted by warning category.
>
> The warnings for ops_sse.h are false positives, so I think no fix is
> needed for 7.2. The compiler is not clever enough to see that the
> switch statements handle all possible cases. It should be sufficient
> to replace `case 3` by `default` to help the compiler and fix the
> warning. Your fix might produce new compiler warnings because setting
> the variables to 0 has no effect.
OK. I will respin according to your suggestion for 8.0.

Eric
>
> Cheers
> Stefan
>
> ../block/mirror.c:1024:13: warning: variable 'iostatus' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../block/mirror.c:1498:20: warning: variable 'bounce_buf' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../block/nbd.c:1208:24: warning: variable 'request_ret' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../block/nbd.c:1266:24: warning: variable 'request_ret' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../block/nbd.c:1424:20: warning: variable 'request_ret' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../block/qcow2-snapshot.c:423:51: warning: variable 'snapshots_size'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../block/qcow2.c:3236:23: warning: variable 'cur_bytes' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../block/ssh.c:306:52: warning: variable 'server_hash_len' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../block/ssh.c:313:45: warning: variable 'pubkey_type' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../contrib/elf2dmp/main.c:138:17: warning: variable 'kwn' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../contrib/elf2dmp/main.c:138:22: warning: variable 'kwa' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../contrib/elf2dmp/main.c:138:27: warning: variable
> 'KdpDataBlockEncoded' may be uninitialized when used here
> [-Wconditional-uninitialized]
> ../crypto/block-luks.c:844:29: warning: variable 'splitkeylen' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../disas/m68k.c:1513:47: warning: variable 'flval' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../dump/win_dump.c:105:18: warning: variable 'ptr64' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../dump/win_dump.c:105:26: warning: variable 'ptr32' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../gdbstub/gdbstub.c:1191:39: warning: variable 'pid' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../gdbstub/gdbstub.c:1209:36: warning: variable 'tid' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/9pfs/9p.c:1911:13: warning: variable 'fidst' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/block/block.c:110:33: warning: variable 'bs' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/core/generic-loader.c:160:23: warning: variable 'entry' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/i386/intel_iommu.c:323:12: warning: variable 'entry' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/ide/ahci.c:968:60: warning: variable 'tbl_entry_size' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/microblaze/boot.c:107:42: warning: variable 'fdt_size' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/net/rtl8139.c:1801:20: warning: variable 'buf2' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/nios2/boot.c:118:44: warning: variable 'fdt_size' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/nvram/fw_cfg.c:1254:40: warning: variable 'data' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/ppc/mac_oldworld.c:148:26: warning: variable 'bios_addr' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/ppc/spapr.c:274:55: warning: variable 'pa_size' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/riscv/microchip_pfsoc.c:609:54: warning: variable
> 'firmware_load_addr' may be uninitialized when used here
> [-Wconditional-uninitialized]
> ../hw/s390x/css.c:553:9: warning: variable 'ret' may be uninitialized
> when used here [-Wconditional-uninitialized]
> ../hw/s390x/ipl.c:410:17: warning: variable 'devtype' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/s390x/s390-pci-inst.c:156:39: warning: variable 'res_code' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../hw/sd/sdhci.c:844:17: warning: variable 'res' may be uninitialized
> when used here [-Wconditional-uninitialized]
> ../hw/sparc64/sun4u_iommu.c:159:66: warning: variable 'offset' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/xtensa/mx_pic.c:260:27: warning: variable 'oldv' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../hw/xtensa/mx_pic.c:260:33: warning: variable 'newv' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../migration/block.c:989:17: warning: variable 'ret' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../migration/migration.c:2847:17: warning: variable 'file' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../migration/ram.c:2088:24: warning: variable 'dirty' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../migration/savevm.c:721:30: warning: variable 'se' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../monitor/misc.c:1908:20: warning: variable 'snapshots' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../nbd/client-connection.c:419:9: warning: variable 'wait_co' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../net/socket.c:389:24: warning: variable 'saddr' may be uninitialized
> when used here [-Wconditional-uninitialized]
> ../net/tap-bsd.c:70:9: warning: variable 'fd' may be uninitialized
> when used here [-Wconditional-uninitialized]
> ../plugins/loader.c:406:17: warning: variable 'ctx' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../qemu-nbd.c:1175:22: warning: variable 'client_thread' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../softmmu/vl.c:1006:13: warning: variable 'opts' may be uninitialized
> when used here [-Wconditional-uninitialized]
> ../target/arm/helper.c:3299:17: warning: variable 'target_el' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/m_helper.c:1727:37: warning: variable 'xpsr' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/m_helper.c:1814:36: warning: variable 'shi' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/m_helper.c:1814:48: warning: variable 'slo' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/m_helper.c:1820:40: warning: variable 'fpscr' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/translate-a64.c:10572:51: warning: variable 'rmode' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/translate-a64.c:13225:51: warning: variable 'rmode' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/translate-a64.c:8519:34: warning: variable 'tcg_src_hi'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/arm/translate.c:1590:50: warning: variable 'tmp' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/cris/mmu.c:201:33: warning: variable 'lo' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/i386/ops_sse.h:2492:15: warning: variable 'r0' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/i386/ops_sse.h:2493:15: warning: variable 'r1' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/i386/ops_sse.h:2494:15: warning: variable 'r2' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/i386/ops_sse.h:2495:15: warning: variable 'r3' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/m68k/softfloat.c:825:44: warning: variable 'm1' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1251:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1269:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1493:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1516:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1517:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1518:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1519:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1520:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1521:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1522:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1523:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1524:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1525:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1526:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1527:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1680:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:1954:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2039:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2040:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2061:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2062:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2063:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2064:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2065:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2066:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2945:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2956:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:2987:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:3063:10: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:967:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:968:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/int_helper.c:969:1: warning: variable 'result' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/ppc/mmu-radix64.c:548:20: warning: variable 'pte' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/ioinst.c:364:52: warning: variable 'irb_len' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/mem_helper.c:2978:12: warning: variable 'cc' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:1023:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:132:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:156:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:278:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:301:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:439:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:471:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:551:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:592:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:635:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:659:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_fpu_helper.c:961:26: warning: variable 'vxc'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_helper.c:189:25: warning: variable 'tmp' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_helper.c:89:1: warning: variable 'tmp' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_helper.c:90:1: warning: variable 'tmp' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_helper.c:91:1: warning: variable 'tmp' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_int_helper.c:556:25: warning: variable 'tmp'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/s390x/tcg/vec_int_helper.c:606:25: warning: variable 'tmp'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../target/xtensa/translate.c:1074:51: warning: variable 'resource' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../target/xtensa/translate.c:1092:35: warning: variable 'temp' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/xtensa/translate.c:936:72: warning: variable 'rf' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../target/xtensa/xtensa-semi.c:297:17: warning: variable 'rc' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../tests/fp/berkeley-softfloat-3/source/s_shiftRightJam256M.c:117:10:
> warning: variable 'ptr' may be uninitialized when used here
> [-Wconditional-uninitialized]
> ../tests/fp/berkeley-testfloat-3/source/slowfloat.c:1015:13: warning:
> variable 'uiZ' may be uninitialized when used here
> [-Wconditional-uninitialized]
> ../tests/fp/berkeley-testfloat-3/source/slowfloat.c:742:13: warning:
> variable 'uiZ' may be uninitialized when used here
> [-Wconditional-uninitialized]
> ../tests/fp/berkeley-testfloat-3/source/slowfloat.c:878:13: warning:
> variable 'uiZ' may be uninitialized when used here
> [-Wconditional-uninitialized]
> ../tests/qtest/boot-sector.c:169:21: warning: variable 'signature' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../tests/qtest/prom-env-test.c:43:21: warning: variable 'signature'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../tests/unit/test-bdrv-drain.c:1022:21: warning: variable 'ret' may
> be uninitialized when used here [-Wconditional-uninitialized]
> ../tests/unit/test-block-iothread.c:772:14: warning: variable 'job'
> may be uninitialized when used here [-Wconditional-uninitialized]
> ../ui/vnc-enc-tight.c:416:1: warning: variable 'ci' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../ui/vnc-enc-tight.c:417:1: warning: variable 'ci' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../ui/vnc-enc-tight.c:418:1: warning: variable 'ci' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../util/iov.c:469:52: warning: variable 'mid_head' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../util/iov.c:471:36: warning: variable 'mid_tail' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../util/qemu-timer.c:198:12: warning: variable 'expire_time' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../util/qemu-timer.c:236:13: warning: variable 'expire_time' may be
> uninitialized when used here [-Wconditional-uninitialized]
> ../util/qemu-timer.c:476:9: warning: variable 'rearm' may be
> uninitialized when used here [-Wconditional-uninitialized]
>


