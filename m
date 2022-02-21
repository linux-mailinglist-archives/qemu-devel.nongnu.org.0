Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A94BEA58
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:22:50 +0100 (CET)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEGn-0007Kn-Cj
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:22:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nME9Z-0003U5-FL
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:15:22 -0500
Received: from [2a00:1450:4864:20::330] (port=34510
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nME9X-0001eH-Hy
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:15:21 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so119903wmj.1
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+4euos2X2sE9Kn//yFjNOTsm9gej+U7wgc1A9eCeFA=;
 b=GW1oUqII+7uf45rFXqcY4maiFLVOj0/xw41RZ/KJjMM7SHJbl/G5LXw3CqIkVEzkVp
 AzA9J1ONeMLML8G7lll+EAwxudIfjceWdA3SUL2R5nzSai4QfdXTn1eJMFbp+EnUn4NJ
 HAdI327T7TBufFYUtb5Ahn0Ku2GtGqVej1iEmvx+mRgOO/++pa5JGgpuL5/UUS6WfzBN
 1qMI2AUJm2FZvFxDkBZMCn/m+2z6KEpsZnvd9VZOObicCkjzwCeiAKWl0+UlEmbv5JFv
 ysRQq3nKBUwUgf4KQendB1BVN/eTaPLi5OQiOsGwxlu3w5o/bFvgDxW9PSUlAWzCV+jW
 lwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+4euos2X2sE9Kn//yFjNOTsm9gej+U7wgc1A9eCeFA=;
 b=hdUsruBXsHvo3zVyvES+XjakCq7kLzQuIEC5fE0YLo25k9o3NDjGo9XK8bTs8xN2dU
 U9qGh1K/+YR2URChvBC3B56DBHh8huCUPDGAGxKnWDz6ySE/jwnCTEcYgcXyK0x67xYi
 i1tTxQsljCI3T0Op5RQE7a7IbWtAibuw+eRo6Lw3/m+OLZLzYw42QU0x+72hWHa7A46Y
 GXGFn8SNW5AaRIBNHBaFwiNyLqGdsW+FqAgzLJCI13clPTp7CYHw/l7aF0rrZf83AZbT
 f3GEPsrAmRWKLd28XIxmpwc0RYTb+HR+np93NAh69NrpY4dfT9KlEj6huhTN5ZpxwxnY
 53EQ==
X-Gm-Message-State: AOAM5318HiGajFjMLWX07A/XG6l+f+kQF0dkZJn0dIJqxaKmmxCXkSxD
 2EU4jgLfC2RNg3v/Ht5UFe0uCe8HptxaAw==
X-Google-Smtp-Source: ABdhPJxzvRjcUCxe9dHf+FiGL12NlP+HYdRLR8vYd3TmRC6v5jMui6K06RMwVOOKPe6BaC0LpZsjIw==
X-Received: by 2002:a05:600c:3486:b0:37c:d45c:179f with SMTP id
 a6-20020a05600c348600b0037cd45c179fmr382301wmq.6.1645470917746; 
 Mon, 21 Feb 2022 11:15:17 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id b7sm40563258wrp.23.2022.02.21.11.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:15:17 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/isa: add function to check for existence of device
 by its type
Date: Mon, 21 Feb 2022 21:13:22 +0200
Message-Id: <20220221191323.617323-2-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221191323.617323-1-liavalb@gmail.com>
References: <20220221191323.617323-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x330.google.com
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


