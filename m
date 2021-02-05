Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7743102AC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 03:21:33 +0100 (CET)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7qkW-0003nb-4J
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 21:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1l7qje-0003BJ-5f; Thu, 04 Feb 2021 21:20:38 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1l7qja-0000LA-G0; Thu, 04 Feb 2021 21:20:37 -0500
Received: by mail-io1-xd2c.google.com with SMTP id u8so5424552ior.13;
 Thu, 04 Feb 2021 18:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=kxZ08gdFWgnbbu/XoHH1SGEbS1d0c+AUA/NzfSJAkxs=;
 b=Nhb0BG1FMaP8pC9KH0Ik+XWv7hBYSN6TuAIpRocbEGm7LQXbfvMCh5aGnnc4IwltoR
 DoCMbELMv3/dgkorR+aXQwkfvzc0nFDnYtBs73T9i3nv/9ymMKIBk+Tn1HTVwDX2S2S1
 AGfRI23P0jWVkPF4WPvd3f+fOTD5nr9qPTtIhgmru9Y4UTQa5/flV1tI+cPql2TeFX4O
 UzSe9dJf0tzjMbZnuib6TfE7sVvoQBb/3JIX1kUp9omwetyT3CgXB7PMUXvIJRIJipsj
 p0hx800xAPYd9huIOFIro978x5VMsDrFlwzKcqmr/EE1ezIzgo1vGRO1IFPBBE9oRxQk
 TpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=kxZ08gdFWgnbbu/XoHH1SGEbS1d0c+AUA/NzfSJAkxs=;
 b=YVAKeEzgas7xiz0OfslGwMe9nIscuPj99U9T+uzPkPD6/3cvisRlJAF2+1osC7gNfD
 tJ+zipcuby2XvLXn23UXOXU+gbF80xgcBBNXOIf1SjVEAa0E7Fl/SoNb6hN1boHeN2tY
 9r5B6MNvGPtZLg3NDJdygInp2LMqUld5Qs83sW4ZfOIGGPCpJeI1yxtrLqahq2elR+4i
 JI1E074/w0lBwLmRcxK2sX3ZU+eUuxnnVg8r6SqZfPslkx+4mJWwUvhUeb5gKUCEWcpb
 thOZmuFYn+CGWlDHZoC4m2H8wvlpputpogn0pq/4TS0cPxVmZ33NkOaGei+VuQ8O6Qua
 lF9w==
X-Gm-Message-State: AOAM533SSSsF7A8RsterA92hzFQ4tGtpCEeBKThuDTE9mrIaqifVixKh
 483WI66lDj7KeoVN0aul64FRXD2Vx5uju4IkMBk=
X-Google-Smtp-Source: ABdhPJz1mSOiM6goxLB7BaVN/9YG99YEPrY1xVJOTgUlnCspNz59xi2zmrVFQ8O2eCQ3l/7uxKHUcQ==
X-Received: by 2002:a02:a90a:: with SMTP id n10mr2664688jam.7.1612491632681;
 Thu, 04 Feb 2021 18:20:32 -0800 (PST)
Received: from [127.0.0.1] (ec2-3-14-82-192.us-east-2.compute.amazonaws.com.
 [3.14.82.192])
 by smtp.gmail.com with ESMTPSA id f8sm3472897ioh.42.2021.02.04.18.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 18:20:32 -0800 (PST)
Message-ID: <db793d463822491bc581fa3204f733adb649faa6.camel@gmail.com>
Subject: [PATCH v2] arm: xlnx-versal: fix virtio-mmio base address assignment
From: schspa <schspa@gmail.com>
To: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Date: Fri, 05 Feb 2021 10:20:23 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


At the moment the following QEMU command line triggers an assertion
failure On xlnx-versal SOC:
  qemu-system-aarch64 \
      -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
      -fsdev local,id=shareid,path=${HOME}/work,security_model=none \
      -device virtio-9p-device,fsdev=shareid,mount_tag=share \
      -fsdev local,id=shareid1,path=${HOME}/Music,security_model=none \
      -device virtio-9p-device,fsdev=shareid1,mount_tag=share1

  qemu-system-aarch64: ../migration/savevm.c:860:
  vmstate_register_with_alias_id:
  Assertion `!se->compat || se->instance_id == 0' failed.

This problem was fixed on arm virt platform in commit f58b39d2d5b
("virtio-mmio: format transport base address in BusClass.get_dev_path")

It works perfectly on arm virt platform. but there is still there on
xlnx-versal SOC.

The main difference between arm virt and xlnx-versal is they use
different way to create virtio-mmio qdev. on arm virt, it calls
sysbus_create_simple("virtio-mmio", base, pic[irq]); which will call
sysbus_mmio_map internally and assign base address to subsys device
mmio correctly. but xlnx-versal's implements won't do this.

However, xlnx-versal can't switch to sysbus_create_simple() to create
virtio-mmio device. It's because xlnx-versal's cpu use
VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
system_memory. sysbus_create_simple will add virtio to system_memory,
which can't be accessed by cpu.

Besides, xlnx-versal can't add sysbus_mmio_map api call too, because
this will add memory region to system_memory, and it can't be added
to VersalVirt.soc.fpd.apu.mr again.

We can solve this by simply assign mmio[0].addr directly. makes
virtio_mmio_bus_get_dev_path to produce correct unique device path.

Signed-off-by: schspa <schspa@gmail.com>
---
 hw/arm/xlnx-versal-virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd6196..87b92ec6c3 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -490,6 +490,7 @@ static void create_virtio_regions(VersalVirt *s)
         object_property_add_child(OBJECT(&s->soc), name, OBJECT(dev));
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
+        SYS_BUS_DEVICE(dev)->mmio[0].addr = base;
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_add_subregion(&s->soc.mr_ps, base, mr);
         g_free(name);
-- 
2.30.0



