Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140455E6B20
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:41:54 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obR8z-0004FX-68
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBC-0002CL-6n
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0005R3-P4
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s14so14443237wro.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=VGATNFAYBw8EtHTqtsDKOUj2+4XhHnTvCj4CQXtJ0zM=;
 b=mWnuW4St7g/bjSRCTI9iDoZj5+nYKO/E7xrvPq7H0VEwb/kTxF4K1bk2WjdiJPgrV4
 H7wsLC9hUFi1shIeIeYQz0XmM0GnMVo56EoAMv4CSDk2R1aEBD+45SCoFxgtCIOXlWt7
 L1qeYH6XPA1Ok2yIPT/TPU1Cf38uRbBNUAFmUuMHtAZasm5TAn4X+8YNGAjAT9ds+SVd
 iOiJag2k4P0txkwJZ/+hsxfJ5zCYvTSndaAwAXmkBe4oFe1tDGXTxG0HR7bK492RRqPZ
 OMJ+moL/Gp6fHaNF8zdYQtxPzXX+yQGGHt0aMjpAgvyn/hBnma1iCic6jFjgXzXT5X+0
 BfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VGATNFAYBw8EtHTqtsDKOUj2+4XhHnTvCj4CQXtJ0zM=;
 b=fEB1i5JFjbEyCOd5Kw/bH4+IfzyZHBoLB6O4V3Aauerfg2/mc8Xd8N6jCAm7SV12W0
 E2uJu+2YtDRW0p4gigfckpeynfRXLPepmFGoNSvENglbIIQ3nwaIfIH9hHipO72vMtp/
 wXOEN+qZv2EXdEHpaJn/mTQ2WLam0TEEDH+AT3AgHQyLYum1414jBvvmCYIyK0AW4Slk
 eiwHH5lGVwq0fZsBCUPb+gSTS13qxWowHDJAKl6nRWvquooGt3iTLV3Q6dt1kHwb9dmk
 XmAwGNFUOAaZU2m2F8Xfagni211B39aE1pIkB5F/W82PW82NegIooUrDF75+6Z6jXZct
 5wtA==
X-Gm-Message-State: ACrzQf1317hsZNG05QwaArpOqI2qUnqRq+DTXglNk6ij4/WZXNh9Tj1R
 DAGa+qAVvuTYxkUg3dKwlOIm83mg3rvLLA==
X-Google-Smtp-Source: AMsMyM6ohn80sFLQTeoK4BR6Ri5PlrcxYU2FPI34OeYbVNwhQNtCNtN6+qWqWmTTWnKq8yfkIF7wtw==
X-Received: by 2002:a05:6000:1081:b0:22a:2ecf:9cf8 with SMTP id
 y1-20020a056000108100b0022a2ecf9cf8mr2540664wrw.205.1663864551727; 
 Thu, 22 Sep 2022 09:35:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/39] hw/acpi: Add ospm_status hook implementation for acpi-ged
Date: Thu, 22 Sep 2022 17:35:17 +0100
Message-Id: <20220922163536.1096175-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keqian Zhu <zhukeqian1@huawei.com>

Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
causes segmentation fault with following dumpstack:
 #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
 #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
 #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
 #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
 #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
 #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
 #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
 #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
 #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
 #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
 #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
 #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
 #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
 #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47

Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20220816094957.31700-1-zhukeqian1@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/acpi/generic_event_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index e28457a7d10..a3d31631fe0 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -267,6 +267,13 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
+{
+    AcpiGedState *s = ACPI_GED(adev);
+
+    acpi_memory_ospm_status(&s->memhp_state, list);
+}
+
 static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
     AcpiGedState *s = ACPI_GED(adev);
@@ -409,6 +416,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
 
+    adevc->ospm_status = acpi_ged_ospm_status;
     adevc->send_event = acpi_ged_send_event;
 }
 
-- 
2.25.1


