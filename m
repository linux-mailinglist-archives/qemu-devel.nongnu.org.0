Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072050E98D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 21:35:02 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj4U9-0002Wx-30
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 15:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nj4SJ-0000ph-5o
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nj4SC-0003eI-FD
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650915179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vMZzJf70G4ZkbyK8zMViainHa66LS6RejXiPflF6uPE=;
 b=fLvvwJEzWynkgYlKkGs4KN8SAVXzQ8LHVRyv+DVpKHDWqMuPaGotMOvIHBB3b9cQf8UWPf
 TZTS3d2a3U8Wqb6SJ72msDv+ZwcWzw6C5IqCRcYuhsI+tqf/Z8+1SDCdXcVKQKGeLokEK/
 yQYHpLlLxjektvMGjDzmpRC7qpmw87g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-f6mvInGGOc66aNs3NZqPuw-1; Mon, 25 Apr 2022 15:32:57 -0400
X-MC-Unique: f6mvInGGOc66aNs3NZqPuw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so2353485wra.15
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 12:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vMZzJf70G4ZkbyK8zMViainHa66LS6RejXiPflF6uPE=;
 b=ubHIoxnozxKqvXkJbzgGQdvDYoPxC5v54x9OuIRDfZq4Ua+T+ZMw4lsDGPa69pi75V
 /kZq5IPt3jkeI/dcbVwpgkAIFyQtHVi1F/+yuA4+7H35k8tnK6+mfz8Quof8yNwnf1hK
 Y+hMoCgrFg12RGEOIB/eQEwbUX2W/IkxRiyoWxOa0NQ8nTH1mRvJ3H4mWSKWZ+/tKQ1h
 dmJW5JGnCm8z1w+s/eV2TdUY2332m8N8wPMFxIuRp6CdRGkn2L8dlrD7XAgsoSGF+Ngb
 IMnCvC2J9Ang6A6VlYBKEFgwj9uhzhcQknbqyWgMEuH7I02K6ozMzApRJqn766FCDeEV
 wv3Q==
X-Gm-Message-State: AOAM5317XSeJ7jn9KyNDf38LfS3gzR+Yrve9STOPIRkeA2HB8zalEqtd
 dDV56CYKIbB4E9XPzuEC2m8TISjV+m4JmqHsFBrXvrMs/zneaKuWBiar19xOutuPktnnT69cISW
 5UcfuTwBL5cn6zUU=
X-Received: by 2002:a7b:c1cc:0:b0:38e:b876:95d8 with SMTP id
 a12-20020a7bc1cc000000b0038eb87695d8mr27174019wmj.57.1650915176662; 
 Mon, 25 Apr 2022 12:32:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzCwNcP5jwWfX3pUTqLk9Etw+j7xV3sS4PzaTnG4E5Ub2vA917JxebrkM6OzCpGDQegG7ZxA==
X-Received: by 2002:a7b:c1cc:0:b0:38e:b876:95d8 with SMTP id
 a12-20020a7bc1cc000000b0038eb87695d8mr27173961wmj.57.1650915176284; 
 Mon, 25 Apr 2022 12:32:56 -0700 (PDT)
Received: from [192.168.8.104] (tmo-069-126.customers.d1-online.com.
 [80.187.69.126]) by smtp.gmail.com with ESMTPSA id
 p3-20020adfaa03000000b00207a1db96cfsm10150854wrd.71.2022.04.25.12.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:32:55 -0700 (PDT)
Message-ID: <f7b7845b-c93e-a396-a1c4-a7767fda6911@redhat.com>
Date: Mon, 25 Apr 2022 21:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/10] tests: move libqtest.h back under qtest/
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-5-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220422083639.3156978-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 Klaus Jensen <its@irrelevant.dk>, Su Hang <suhang16@mails.ucas.ac.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Ani Sinha <ani@anisinha.ca>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 "open list:IDE" <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Michael Roth <michael.roth@amd.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 "open list:sPAPR \(pseries\)" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/04/2022 10.36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Since commit a2ce7dbd917 ("meson: convert tests/qtest to meson"),
> libqtest.h is under libqos/ directory, while libqtest.c is still in
> qtest/. Move back to its original location to avoid mixing with libqos/.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/devel/qtest.rst                             | 2 +-
>   tests/qtest/acpi-utils.h                         | 2 +-
>   tests/qtest/boot-sector.h                        | 2 +-
>   tests/qtest/fuzz/fuzz.h                          | 2 +-
>   tests/qtest/libqos/fw_cfg.h                      | 2 +-
>   tests/qtest/libqos/i2c.h                         | 2 +-
>   tests/qtest/libqos/libqos.h                      | 2 +-
>   tests/qtest/libqos/malloc.h                      | 2 +-
>   tests/qtest/libqos/pci.h                         | 2 +-
>   tests/qtest/libqos/sdhci-cmd.h                   | 2 +-
>   tests/qtest/libqtest-single.h                    | 2 +-
>   tests/qtest/{libqos => }/libqtest.h              | 0
>   tests/qtest/migration-helpers.h                  | 2 +-
>   tests/qtest/tpm-emu.h                            | 2 +-
>   tests/qtest/ac97-test.c                          | 2 +-
>   tests/qtest/ahci-test.c                          | 2 +-
>   tests/qtest/am53c974-test.c                      | 2 +-
>   tests/qtest/arm-cpu-features.c                   | 2 +-
>   tests/qtest/aspeed_hace-test.c                   | 2 +-
>   tests/qtest/boot-order-test.c                    | 2 +-
>   tests/qtest/boot-sector.c                        | 2 +-
>   tests/qtest/boot-serial-test.c                   | 2 +-
>   tests/qtest/cdrom-test.c                         | 2 +-
>   tests/qtest/dbus-display-test.c                  | 2 +-
>   tests/qtest/dbus-vmstate-test.c                  | 2 +-
>   tests/qtest/device-introspect-test.c             | 2 +-
>   tests/qtest/device-plug-test.c                   | 2 +-
>   tests/qtest/drive_del-test.c                     | 2 +-
>   tests/qtest/ds1338-test.c                        | 2 +-
>   tests/qtest/e1000-test.c                         | 2 +-
>   tests/qtest/eepro100-test.c                      | 2 +-
>   tests/qtest/endianness-test.c                    | 2 +-
>   tests/qtest/erst-test.c                          | 2 +-
>   tests/qtest/es1370-test.c                        | 2 +-
>   tests/qtest/fuzz-e1000e-test.c                   | 2 +-
>   tests/qtest/fuzz-lsi53c895a-test.c               | 2 +-
>   tests/qtest/fuzz-megasas-test.c                  | 2 +-
>   tests/qtest/fuzz-sb16-test.c                     | 2 +-
>   tests/qtest/fuzz-sdcard-test.c                   | 2 +-
>   tests/qtest/fuzz-virtio-scsi-test.c              | 2 +-
>   tests/qtest/fuzz-xlnx-dp-test.c                  | 2 +-
>   tests/qtest/fuzz/fuzz.c                          | 2 +-
>   tests/qtest/fuzz/generic_fuzz.c                  | 2 +-
>   tests/qtest/fuzz/i440fx_fuzz.c                   | 2 +-
>   tests/qtest/fuzz/qos_fuzz.c                      | 2 +-
>   tests/qtest/fuzz/virtio_blk_fuzz.c               | 2 +-
>   tests/qtest/fuzz/virtio_net_fuzz.c               | 2 +-
>   tests/qtest/fuzz/virtio_scsi_fuzz.c              | 2 +-
>   tests/qtest/fw_cfg-test.c                        | 2 +-
>   tests/qtest/hd-geo-test.c                        | 2 +-
>   tests/qtest/hexloader-test.c                     | 2 +-
>   tests/qtest/ide-test.c                           | 2 +-
>   tests/qtest/ipoctal232-test.c                    | 2 +-
>   tests/qtest/ivshmem-test.c                       | 2 +-
>   tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c | 2 +-
>   tests/qtest/libqos/ahci.c                        | 2 +-
>   tests/qtest/libqos/arm-imx25-pdk-machine.c       | 2 +-
>   tests/qtest/libqos/arm-n800-machine.c            | 2 +-
>   tests/qtest/libqos/arm-raspi2-machine.c          | 2 +-
>   tests/qtest/libqos/arm-sabrelite-machine.c       | 2 +-
>   tests/qtest/libqos/arm-smdkc210-machine.c        | 2 +-
>   tests/qtest/libqos/arm-virt-machine.c            | 2 +-
>   tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c  | 2 +-
>   tests/qtest/libqos/e1000e.c                      | 2 +-
>   tests/qtest/libqos/fw_cfg.c                      | 2 +-
>   tests/qtest/libqos/i2c-imx.c                     | 2 +-
>   tests/qtest/libqos/i2c-omap.c                    | 2 +-
>   tests/qtest/libqos/i2c.c                         | 2 +-
>   tests/qtest/libqos/libqos.c                      | 2 +-
>   tests/qtest/libqos/pci-pc.c                      | 2 +-
>   tests/qtest/libqos/pci-spapr.c                   | 2 +-
>   tests/qtest/libqos/ppc64_pseries-machine.c       | 2 +-
>   tests/qtest/libqos/qgraph.c                      | 2 +-
>   tests/qtest/libqos/qos_external.c                | 2 +-
>   tests/qtest/libqos/rtas.c                        | 2 +-
>   tests/qtest/libqos/sdhci-cmd.c                   | 2 +-
>   tests/qtest/libqos/sdhci.c                       | 2 +-
>   tests/qtest/libqos/tpci200.c                     | 2 +-
>   tests/qtest/libqos/usb.c                         | 2 +-
>   tests/qtest/libqos/vhost-user-blk.c              | 2 +-
>   tests/qtest/libqos/virtio-9p.c                   | 2 +-
>   tests/qtest/libqos/virtio-balloon.c              | 2 +-
>   tests/qtest/libqos/virtio-blk.c                  | 2 +-
>   tests/qtest/libqos/virtio-iommu.c                | 2 +-
>   tests/qtest/libqos/virtio-mmio.c                 | 2 +-
>   tests/qtest/libqos/virtio-net.c                  | 2 +-
>   tests/qtest/libqos/virtio-pci.c                  | 2 +-
>   tests/qtest/libqos/virtio-rng.c                  | 2 +-
>   tests/qtest/libqos/virtio-scsi.c                 | 2 +-
>   tests/qtest/libqos/virtio-serial.c               | 2 +-
>   tests/qtest/libqos/virtio.c                      | 2 +-
>   tests/qtest/libqos/x86_64_pc-machine.c           | 2 +-
>   tests/qtest/libqtest.c                           | 2 +-
>   tests/qtest/lpc-ich9-test.c                      | 2 +-
>   tests/qtest/m48t59-test.c                        | 2 +-
>   tests/qtest/machine-none-test.c                  | 2 +-
>   tests/qtest/megasas-test.c                       | 2 +-
>   tests/qtest/microbit-test.c                      | 2 +-
>   tests/qtest/migration-test.c                     | 2 +-
>   tests/qtest/modules-test.c                       | 2 +-
>   tests/qtest/ne2000-test.c                        | 2 +-
>   tests/qtest/npcm7xx_adc-test.c                   | 2 +-
>   tests/qtest/npcm7xx_pwm-test.c                   | 2 +-
>   tests/qtest/npcm7xx_sdhci-test.c                 | 2 +-
>   tests/qtest/npcm7xx_smbus-test.c                 | 2 +-
>   tests/qtest/npcm7xx_watchdog_timer-test.c        | 2 +-
>   tests/qtest/numa-test.c                          | 2 +-
>   tests/qtest/nvme-test.c                          | 2 +-
>   tests/qtest/pca9552-test.c                       | 2 +-
>   tests/qtest/pci-test.c                           | 2 +-
>   tests/qtest/pcnet-test.c                         | 2 +-
>   tests/qtest/pflash-cfi02-test.c                  | 2 +-
>   tests/qtest/pnv-xscom-test.c                     | 2 +-
>   tests/qtest/prom-env-test.c                      | 2 +-
>   tests/qtest/pvpanic-pci-test.c                   | 2 +-
>   tests/qtest/pvpanic-test.c                       | 2 +-
>   tests/qtest/pxe-test.c                           | 2 +-
>   tests/qtest/q35-test.c                           | 2 +-
>   tests/qtest/qmp-cmd-test.c                       | 2 +-
>   tests/qtest/qmp-test.c                           | 2 +-
>   tests/qtest/qom-test.c                           | 2 +-
>   tests/qtest/rtas-test.c                          | 2 +-
>   tests/qtest/sdhci-test.c                         | 2 +-
>   tests/qtest/spapr-phb-test.c                     | 2 +-
>   tests/qtest/tco-test.c                           | 2 +-
>   tests/qtest/test-filter-mirror.c                 | 2 +-
>   tests/qtest/test-filter-redirector.c             | 2 +-
>   tests/qtest/test-hmp.c                           | 2 +-
>   tests/qtest/tpm-crb-swtpm-test.c                 | 2 +-
>   tests/qtest/tpm-tis-device-swtpm-test.c          | 2 +-
>   tests/qtest/tpm-tis-swtpm-test.c                 | 2 +-
>   tests/qtest/tpm-util.c                           | 2 +-
>   tests/qtest/tulip-test.c                         | 2 +-
>   tests/qtest/virtio-net-failover.c                | 2 +-
>   tests/qtest/virtio-rng-test.c                    | 2 +-
>   tests/qtest/virtio-test.c                        | 2 +-
>   tests/qtest/vmgenid-test.c                       | 2 +-
>   tests/qtest/vmxnet3-test.c                       | 2 +-
>   tests/qtest/wdt_ib700-test.c                     | 2 +-
>   tests/qtest/xlnx-can-test.c                      | 2 +-
>   tests/unit/test-qga.c                            | 2 +-
>   scripts/oss-fuzz/output_reproducer.py            | 2 +-
>   142 files changed, 141 insertions(+), 141 deletions(-)
>   rename tests/qtest/{libqos => }/libqtest.h (100%)
> 
> diff --git a/docs/devel/qtest.rst b/docs/devel/qtest.rst
> index add293d39700..0455aa06ab28 100644
> --- a/docs/devel/qtest.rst
> +++ b/docs/devel/qtest.rst
> @@ -88,4 +88,4 @@ QTest Protocol
>   libqtest API reference
>   ----------------------
>   
> -.. kernel-doc:: tests/qtest/libqos/libqtest.h
> +.. kernel-doc:: tests/qtest/libqtest.h
> diff --git a/tests/qtest/acpi-utils.h b/tests/qtest/acpi-utils.h
> index 261784d25189..0c8678068931 100644
> --- a/tests/qtest/acpi-utils.h
> +++ b/tests/qtest/acpi-utils.h
> @@ -13,7 +13,7 @@
>   #ifndef TEST_ACPI_UTILS_H
>   #define TEST_ACPI_UTILS_H
>   
> -#include "libqos/libqtest.h"
> +#include "libqtest.h"
>   
>   /* DSDT and SSDTs format */
>   typedef struct {
> diff --git a/tests/qtest/boot-sector.h b/tests/qtest/boot-sector.h
> index b339fdee4c84..6ee6bb4d97f4 100644
> --- a/tests/qtest/boot-sector.h
> +++ b/tests/qtest/boot-sector.h
> @@ -14,7 +14,7 @@
>   #ifndef TEST_BOOT_SECTOR_H
>   #define TEST_BOOT_SECTOR_H
>   
> -#include "libqos/libqtest.h"
> +#include "libqtest.h"
>   
>   /* Create boot disk file. fname must be a suitable string for mkstemp() */
>   int boot_sector_init(char *fname);
> diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
> index 3a8570e84c79..c5f0b7227a10 100644
> --- a/tests/qtest/fuzz/fuzz.h
> +++ b/tests/qtest/fuzz/fuzz.h
> @@ -17,7 +17,7 @@
>   #include "qemu/units.h"
>   #include "qapi/error.h"
>   
> -#include "tests/qtest/libqos/libqtest.h"
> +#include "tests/qtest/libqtest.h"
>   
>   /**
>    * A libfuzzer fuzzing target
> diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
> index c6a7cf8cf053..b0456a15df19 100644
> --- a/tests/qtest/libqos/fw_cfg.h
> +++ b/tests/qtest/libqos/fw_cfg.h
> @@ -13,7 +13,7 @@
>   #ifndef LIBQOS_FW_CFG_H
>   #define LIBQOS_FW_CFG_H
>   
> -#include "libqtest.h"
> +#include "../libqtest.h"

Thank you very much for tackling this!

For the files in the tests/qtest/libqos/ directory, I think it should also 
be fine if you keep the #include "libqtest.h" there since the tests/qtest/ 
folder is in the header search path already?

Anyway, I'm also fine with spelling out the "../" explicitly.

Reviewed-by: Thomas Huth <thuth@redhat.com>


