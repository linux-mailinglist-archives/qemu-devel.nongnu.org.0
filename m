Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCEC4C543B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 07:33:21 +0100 (CET)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNqdr-000428-L4
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 01:33:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbm-000246-PE
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:10 -0500
Received: from [2a00:1450:4864:20::435] (port=39633
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbj-0006Sp-TZ
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id s13so7461583wrb.6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 22:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+4euos2X2sE9Kn//yFjNOTsm9gej+U7wgc1A9eCeFA=;
 b=Q8ExgdlIxdQ7LeBFkgx+h4/UGen8kOezHThSfVgvHqKCx2c4o4dF8nRRPaU266eiTs
 gKcyXcaLbDYD23n1eAANzfGSJdoStKDAvYN8nMAuhd6Yj+CKYo06MsK8hbZ85FulhaZP
 sPuqORxAvhZS5VruqYHU9Ko/SlH3K1MJJYoFPPQa1mgFnWKlLHfs7UenEk2lYNUwmsxC
 J2dD+2P93joG4NUC14zNhUMXeSK+5ZYf9psod6+9DqruVnB86mFrhNBN/Tr3OT3Jxdvs
 5FHnkRhMsULmCOzeegzXPslkJC8Q/Av6tYEKVLZ73+roF9eetuYo0UnxVzTJQXqkUjnU
 uWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+4euos2X2sE9Kn//yFjNOTsm9gej+U7wgc1A9eCeFA=;
 b=K2VzjUoML1VQsMOFA/9UB4eOnp2OWiy7zFBoPuyCQunA09gX4VpNvWkYSjU8caWodO
 spIO04OEAu3THn64c9sCj+ED1sOwCsvj8s1ZlOa8EKdwvCVGLmAgcTxcq2u0ycXJDL1/
 +TCJMdhxz/trzt9h0VQtvrVaFWLaybLDNk2ZSRfo+w6QE65/tv5Y+gZ8uruempGML3E5
 RcUPdtqLhLrjVmyTEv0Kqk0/rYUGm4qc/3veVY93NxuW0mmYm0/SoODE21NEvDdf/qOH
 HQtI8ue+T/jczNVGM0Yw61fBFlpTmHaoojK0ZjOt/KFxUG+fr9ioXxZ7zZ3TwJ65lTFD
 omRg==
X-Gm-Message-State: AOAM532EPzJpjLOtUiK6MePkvQnR7mbVaZGzZhR7/LutCZ1xYdvcUJQq
 nSa2qIKpO890rplHlN9hT8OBJgAmpzk=
X-Google-Smtp-Source: ABdhPJyfWy9mzXPOyvCf9uDQsI4iFCmPYbh8A3p4YFc+FwW4PfMyM0lIG9cj2ApgR8v1WaXI4smFwQ==
X-Received: by 2002:a5d:4a08:0:b0:1ed:b997:46d8 with SMTP id
 m8-20020a5d4a08000000b001edb99746d8mr8406958wrq.440.1645857065892; 
 Fri, 25 Feb 2022 22:31:05 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adfcd87000000b001e8a4f58a8csm3933407wrj.66.2022.02.25.22.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 22:31:05 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] hw/isa: add function to check for existence of device
 by its type
Date: Sat, 26 Feb 2022 08:30:16 +0200
Message-Id: <20220226063019.1112654-2-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220226063019.1112654-1-liavalb@gmail.com>
References: <20220226063019.1112654-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, Liav Albani <liavalb@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function enumerates all attached ISA devices in the machine, and
tries to compare a given device type name to the enumerated devices.
For example, this can help other code to determine if a i8042 controller
exists in the machine.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/isa/isa-bus.c     | 23 +++++++++++++++++++++++
 include/hw/isa/isa.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 6c31398dda..663aa36d29 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -222,6 +222,29 @@ void isa_build_aml(ISABus *bus, Aml *scope)
     }
 }
 
+bool isa_check_device_existence(const char *typename)
+{
+    /*
+     * If there's no ISA bus, we know for sure that the checked ISA device type
+     * doesn't exist in the machine.
+     */
+    if (isabus == NULL) {
+        return false;
+    }
+
+    BusChild *kid;
+    ISADevice *dev;
+
+    QTAILQ_FOREACH(kid, &isabus->parent_obj.children, sibling) {
+        dev = ISA_DEVICE(kid->child);
+        const char *object_type = object_get_typename(OBJECT(dev));
+        if (object_type && strcmp(object_type, typename) == 0) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 {
     ISADevice *d = ISA_DEVICE(dev);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d4417b34b6..65f0c7e28c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -99,6 +99,7 @@ IsaDma *isa_get_dma(ISABus *bus, int nchan);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
 ISADevice *isa_new(const char *name);
+bool isa_check_device_existence(const char *typename);
 ISADevice *isa_try_new(const char *name);
 bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
 ISADevice *isa_create_simple(ISABus *bus, const char *name);
-- 
2.35.1


