Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F826C224
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 13:33:14 +0200 (CEST)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIVgX-00006D-5M
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 07:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kIVeh-0007fA-7E
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kIVee-0005mJ-Dh
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600255874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9JceFoepaeBtg+amNpuy8AkT/yCci2mWWvCUd+bqeo=;
 b=J9smYp4T1bWcTnuVOQTY4bVKKAn8NcYG/l6NWOii9kqVe6RriN+/yM2s/zRTUdnVnMNeBn
 cpOT76V2PGf5eGEv0Oc6AWmyuoGCcKjxtZ2dVCBSf/pyNzoSZQeaFoS4bgRhIKLF2roX2l
 EXN1fP2zrZZs5FsLATlF27el1PpzsuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-GkoOLPkyMZaowLxmtnb3aA-1; Wed, 16 Sep 2020 07:31:10 -0400
X-MC-Unique: GkoOLPkyMZaowLxmtnb3aA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5F5084E246;
 Wed, 16 Sep 2020 11:31:08 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-213.ams2.redhat.com
 [10.36.113.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76FB4100239F;
 Wed, 16 Sep 2020 11:31:06 +0000 (UTC)
Subject: Re: PATCH: Increase System Firmware Max Size
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <CS1PR8401MB0327EF9D532330BA44257AFCF3240@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <CS1PR8401MB0327959D96C84FB32E071E49F3200@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <CS1PR8401MB03279AC1D869BBBA8D810A19F3200@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <eaa64c6a-18cb-69df-3154-614744e1bfa9@redhat.com>
 <20200916095633.GJ1535709@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <712696ed-8f23-d8e6-f765-df7aa68f1013@redhat.com>
Date: Wed, 16 Sep 2020 13:31:05 +0200
MIME-Version: 1.0
In-Reply-To: <20200916095633.GJ1535709@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "McMillan,
 Erich" <erich.mcmillan@hp.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/16/20 11:56, Daniel P. Berrangé wrote:
> On Wed, Sep 16, 2020 at 11:52:41AM +0200, Laszlo Ersek wrote:
>> Hi Erich,
>>
>> (1) this patch is really not trivial; please do not continue CC'ing
>> qemu-trivial
>>
>> (2) Please do CC people that have given you feedback previously. I
>> primarily mean Daniel and David.
>>
>> (3) Generally speaking, please post new versions of a patch stand-alone
>> (not in reply to another message) on the list.
>>
>> (4) Please use git-send-email (or suitable wrapper utilities) for
>> sending your patch.
>>
>> https://wiki.qemu.org/Contribute/SubmitAPatch
>>
>>
>> One non-meta comment below:
>>
>> On 09/15/20 21:10, McMillan, Erich via wrote:
>>> Apologies, ignore previous patch. The relevant patch is below:
>>>
>>> From 473daf6129debf8d158a9ae1aff788c5bdbbc799 Mon Sep 17 00:00:00 2001
>>> From: Erich McMillan <erich.mcmillan@hp.com>
>>> Date: Tue, 15 Sep 2020 13:23:25 -0500
>>> Subject: [PATCH 2/2] Add max firmware size as optional parameter
>>>
>>> Signed-off-by: Erich McMillan <erich.mcmillan@hp.com>
>>> ---
>>>  hw/i386/pc_sysfw.c  | 13 ++-----------
>>>  include/hw/loader.h |  9 +++++++++
>>>  qemu-options.hx     |  8 ++++++++
>>>  softmmu/vl.c        | 40 ++++++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 59 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>>> index b6c0822..ba6c99d 100644
>>> --- a/hw/i386/pc_sysfw.c
>>> +++ b/hw/i386/pc_sysfw.c
>>> @@ -39,15 +39,6 @@
>>>  #include "hw/block/flash.h"
>>>  #include "sysemu/kvm.h"
>>>
>>> -/*
>>> - * We don't have a theoretically justifiable exact lower bound on the base
>>> - * address of any flash mapping. In practice, the IO-APIC MMIO range is
>>> - * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving free
>>> - * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB in
>>> - * size.
>>> - */
>>> -#define FLASH_SIZE_LIMIT (8 * MiB)
>>> -
>>>  #define FLASH_SECTOR_SIZE 4096
>>>
>>>  static void pc_isa_bios_init(MemoryRegion *rom_memory,
>>> @@ -182,10 +173,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
>>>          }
>>>          if ((hwaddr)size != size
>>>              || total_size > HWADDR_MAX - size
>>> -            || total_size + size > FLASH_SIZE_LIMIT) {
>>> +            || total_size + size > MaxCombinedFirmwareSize) {
>>>              error_report("combined size of system firmware exceeds "
>>>                           "%" PRIu64 " bytes",
>>> -                         FLASH_SIZE_LIMIT);
>>> +                         MaxCombinedFirmwareSize);
>>>              exit(1);
>>>          }
>>>
>>> diff --git a/include/hw/loader.h b/include/hw/loader.h
>>> index a9eeea3..7898b63 100644
>>> --- a/include/hw/loader.h
>>> +++ b/include/hw/loader.h
>>> @@ -318,4 +318,13 @@ int rom_add_option(const char *file, int32_t bootindex);
>>>   * overflow on real hardware too. */
>>>  #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
>>>
>>> +/*
>>> + * We don't have a theoretically justifiable exact lower bound on the base
>>> + * address of any flash mapping. In practice, the IO-APIC MMIO range is
>>> + * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving free
>>> + * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB in
>>> + * size, but allow user to specify larger size via command line.
>>> + */
>>> +extern uint64_t MaxCombinedFirmwareSize;
>>> +
>>>  #endif
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index b0f0205..32eed3a 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -1377,6 +1377,14 @@ SRST
>>>          |qemu_system_x86| -hda a -hdb b
>>>  ERST
>>>
>>> +DEF("maxfirmwaresize", HAS_ARG, QEMU_OPTION_maxfirmwaresize,
>>> +    "-maxfirmwaresize [size=]megs  specify maximum combined firmware size, default is 8MiB. Known issues if value exceeds 16MiB.\n",
>>> +    QEMU_ARCH_ALL)
>>> +SRST
>>> +``-maxfirmwaresize [size=]megs``
>>> +    Specify maximum combined firmware size, default is 8MiB. Known issues if value exceeds 16MiB.
>>> +ERST
>>> +
>>>  DEF("mtdblock", HAS_ARG, QEMU_OPTION_mtdblock,
>>>      "-mtdblock file  use 'file' as on-board Flash memory image\n",
>>>      QEMU_ARCH_ALL)
>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>> index 0cc86b0..fcf41d2 100644
>>> --- a/softmmu/vl.c
>>> +++ b/softmmu/vl.c
>>> @@ -116,6 +116,8 @@
>>>
>>>  #define MAX_VIRTIO_CONSOLES 1
>>>
>>> +uint64_t MaxCombinedFirmwareSize = 8 * MiB;
>>> +
>>>  static const char *data_dir[16];
>>>  static int data_dir_idx;
>>>  const char *bios_name = NULL;
>>> @@ -448,6 +450,20 @@ static QemuOptsList qemu_mem_opts = {
>>>      },
>>>  };
>>>
>>> +static QemuOptsList qemu_max_fw_size_opts = {
>>> +    .name = "maxfirmwaresize",
>>> +    .implied_opt_name = "size",
>>> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_max_fw_size_opts.head),
>>> +    .merge_lists = true,
>>> +    .desc = {
>>> +        {
>>> +            .name = "size",
>>> +            .type = QEMU_OPT_SIZE,
>>> +        },
>>> +        { /* end of list */ }
>>> +    },
>>> +};
>>> +
>>>  static QemuOptsList qemu_icount_opts = {
>>>      .name = "icount",
>>>      .implied_opt_name = "shift",
>>> @@ -2576,6 +2592,23 @@ static bool object_create_delayed(const char *type, QemuOpts *opts)
>>>      return !object_create_initial(type, opts);
>>>  }
>>>
>>> +static void set_max_firmware_size(uint64_t *maxfwsize)
>>> +{
>>> +    const char *max_fw_size_str;
>>> +    QemuOpts *opts = qemu_find_opts_singleton("maxfirmwaresize");
>>> +
>>> +    max_fw_size_str = qemu_opt_get(opts, "size");
>>> +
>>> +    if (max_fw_size_str) {
>>> +        if (!*max_fw_size_str) {
>>> +            error_report("missing 'size' option value");
>>> +            exit(EXIT_FAILURE);
>>> +        }
>>> +
>>> +        *maxfwsize = qemu_opt_get_size(opts, "size", 8 * MiB);
>>> +    }
>>> +}
>>> +
>>>
>>>  static bool set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
>>>                                 MachineClass *mc)
>>> @@ -2904,6 +2937,7 @@ void qemu_init(int argc, char **argv, char **envp)
>>>      qemu_add_opts(&qemu_machine_opts);
>>>      qemu_add_opts(&qemu_accel_opts);
>>>      qemu_add_opts(&qemu_mem_opts);
>>> +    qemu_add_opts(&qemu_max_fw_size_opts);
>>>      qemu_add_opts(&qemu_smp_opts);
>>>      qemu_add_opts(&qemu_boot_opts);
>>>      qemu_add_opts(&qemu_add_fd_opts);
>>> @@ -3160,6 +3194,10 @@ void qemu_init(int argc, char **argv, char **envp)
>>>                      exit(EXIT_FAILURE);
>>>                  }
>>>                  break;
>>> +            case QEMU_OPTION_maxfirmwaresize:
>>> +                opts = qemu_opts_parse_noisily(qemu_find_opts("maxfirmwaresize"),
>>> +                                               optarg, true);
>>> +                break;
>>>  #ifdef CONFIG_TPM
>>>              case QEMU_OPTION_tpmdev:
>>>                  if (tpm_config_parse(qemu_find_opts("tpmdev"), optarg) < 0) {
>>> @@ -3845,6 +3883,8 @@ void qemu_init(int argc, char **argv, char **envp)
>>>      have_custom_ram_size = set_memory_options(&ram_slots, &maxram_size,
>>>                                                machine_class);
>>>
>>> +    set_max_firmware_size(&MaxCombinedFirmwareSize);
>>> +
>>>      os_daemonize();
>>>      rcu_disable_atfork();
>>>
>>
>> (5) In my opinion (which could be wrong of course), we shouldn't
>> introduce a new command line option for this, but a new PC machine type
>> property called "x-firmware-max-size".
> 
> Yeah, we definitely do not want a new top level CLI arg, just a
> machine type property.  We don't need any "x-" prefix on it
> though, just a plain "firmware-max-size" prop is fine.

According to the previous discussion, I'd like to request that we add
the x- prefix (showing that either the property is experimental, or that
it is intended in support of experimental use cases).

If you disagree, I'll accept that though.

Thanks
Laszlo


