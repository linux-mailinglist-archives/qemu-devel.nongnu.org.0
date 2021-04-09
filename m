Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F0935957B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:30:04 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkeZ-0001Wc-2X
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZ4-0004T3-1Y; Fri, 09 Apr 2021 02:24:22 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZ0-0001R4-Nx; Fri, 09 Apr 2021 02:24:21 -0400
Received: by mail-ej1-x635.google.com with SMTP id u17so6872816ejk.2;
 Thu, 08 Apr 2021 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zv8F1mVV51iuCp3WfDxO+akUI3QLMou50E1/QnZlhLk=;
 b=qxd+RzbM5kMKgsvTyLiyNQgr71qrrYTmogHq0FfpuhG+Z3388PwJTdpgz0BAA9q3HH
 gY5ixnpIn3/gAfn/7axlIoG28w9O23qJkEENiko+LHkKz2NUR3A5/kJAaL4GnFr/qaL1
 X0RekDtZA88dYcv8cUVPFXCrkPKR4QlGaxjEiBaMLOajIpzf9zyHrvR01HC+Fokp2Zax
 ULzANGijajblICV5vDONcOpLAFZTkLQ8ZQSqeCqjGT8J+X0qbXDJXwrIpvMH6T4/Jq42
 r+R4gD4/9qkJfwVAU3P9dSX5Rr5l6M3UwW9CRaPxW+lT2JsHQ1/SrFswd4VWONxcIS68
 +1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zv8F1mVV51iuCp3WfDxO+akUI3QLMou50E1/QnZlhLk=;
 b=hoZozFaDFlj9RpysN/YBIOwXWh23/d1kGggSeYqVoGRJszsb49PAqdTn9lb1JW4Wog
 KipvvmK19F48M8nX00xUuqOyjTpbOk6I0ETdk2xnBi2/1SDDM+eRdws3lHtZHqG8QLfv
 JQl5BQfgB5cOgdv+3+uH8Oi3f1ZavaYPGsunFaEDw8w67F/S//apzpucJIQKlJ9eRub3
 AK4a/pLW4vhdfhImK/eEoCD3UQWtbyDkGXrpTG0BpC6hcTpWwZ+udHcGhMpduoMMrxa7
 fmEOrG/2cdIgqQRRhmeLR5qzaDSoqWhnYAWMPo+oOuxz8S1YVbxX9D85RsN8XxBMaqvD
 hxYw==
X-Gm-Message-State: AOAM5324tuJPUv/1jm9yash/HnNXrOql/BIWXPTehmlwCFaYghCOZmBN
 /FV/H4uLHbMCSI5niK7pK/xQKwHqzGowqA==
X-Google-Smtp-Source: ABdhPJxfff6Eo8NnUprk30XCkBTgoUGGNgk01dY+gvIRfX5cGKSCFsBL+IYvVazeTQ8rOduo7SxKBw==
X-Received: by 2002:a17:906:6b8c:: with SMTP id
 l12mr14409061ejr.511.1617949453870; 
 Thu, 08 Apr 2021 23:24:13 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b24sm719251ejq.75.2021.04.08.23.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 2/9] hw/core/machine: Add
 machine_create_constant_clock() helper
Date: Fri,  9 Apr 2021 08:23:54 +0200
Message-Id: <20210409062401.2350436-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Boards usually have crystal oscillators (at fixed frequency)
feeding their various clocked components.

Add a helper to create such constant clocks in the machine.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/boards.h | 17 +++++++++++++++++
 hw/core/machine.c   | 11 +++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index ad6c8fd5376..c8100f7a33a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -11,6 +11,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/clock.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -83,6 +84,22 @@ bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev);
 MemoryRegion *machine_consume_memdev(MachineState *machine,
                                      HostMemoryBackend *backend);
 
+/**
+ * machine_create_constant_clock:
+ * @machine: the parent machine
+ * @name: the clock object name
+ * @freq_hz: the clock frequency (in Hz)
+ *
+ * Helper function to create a new constant clock (fixed frequency
+ * of @freq_hz) and parent it to @machine. There is no need to call
+ * clock_setup_canonical_path on the returned clock as it is done
+ * by this function.
+ *
+ * @return the newly created clock
+ */
+Clock *machine_create_constant_clock(MachineState *machine,
+                                     const char *name, unsigned freq_hz);
+
 /**
  * CPUArchId:
  * @arch_id - architecture-dependent CPU ID of present or possible CPU
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 40def78183a..41baf80559d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1233,6 +1233,17 @@ void machine_run_board_init(MachineState *machine)
     phase_advance(PHASE_MACHINE_INITIALIZED);
 }
 
+Clock *machine_create_constant_clock(MachineState *machine,
+                                     const char *name, unsigned freq_hz)
+{
+    Clock *clk;
+
+    clk = clock_new(OBJECT(machine), name);
+    clock_set_hz(clk, freq_hz);
+
+    return clk;
+}
+
 static NotifierList machine_init_done_notifiers =
     NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
 
-- 
2.26.3


