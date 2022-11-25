Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED814638F24
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:33:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycY6-00056d-2y; Fri, 25 Nov 2022 12:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycY4-000562-2e
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:31:36 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycY2-0004dU-9d
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:31:35 -0500
Received: by mail-wr1-x431.google.com with SMTP id d1so7762595wrs.12
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/bWbtdqAUbu0hq+grjo2KrcGsDO+Qr3IZNc4f7/ntsA=;
 b=Y0CNghks3gF1uKFAOoKOb6t2IbrM3U17ln8y1FKeR6Tf4keggpf8OiVrOQG3IIpA3O
 ZVby91vTOYWUrxolPlsS5eWUt8DbLBtpL1/0jl73j3j1LA6kueRqqzYWEMi687qQdNOv
 qFWkf0V/QVAofNkQQvolovOtZAuBbUmi8xgSVuGbsfdBDhrRx03ZJfy1kCu5A08K7Q5Q
 FPlYCmqyqGB1+fIvGQ8Lz81Pj+TVgFtzHWFDjEL5NByD3SZoF8AISFNYTcf7/9vLtIP9
 yDHoRDngDApS/omsHyDVx2ixy3bqQfzJjekmtwID59qXyIvlXYNlH9KOHdDserHIqJCD
 V9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/bWbtdqAUbu0hq+grjo2KrcGsDO+Qr3IZNc4f7/ntsA=;
 b=ay27fsbxmotrpXrqPi5qrbvBD+8SyvscyWaQ68Nh17ZzXiTdjApf5eNmF+/XTUMQ5X
 gSvztf2NPZiEuNeIEXbYdh4juPmzaWGBpGstxq+rAHAHKSuPnTHq7GyBJR+zukJQXZK+
 MWPKTZ3Qfo0wgAttSDB7lwXltrxviWzO9XKAfTf2ve/57kKMb6phEhTSI40AZoBa7WZq
 Zk5qOmUePM+rD+xMWXHlNbDnllGFOiOKvk/H6KNYoSSJ8jBxm5tfwbSwmyBFf7t2tq01
 5+/ozAMm+atvF2jxsksix4snpdJ1EREPaoLzH/Cbyz+WU2zx8A63N4w52fZSN04H2LJu
 /XZQ==
X-Gm-Message-State: ANoB5pncdPa9Ekf1uNi9GS/Fo9yXV1vsLXqeQJLEAmMlwa/STPeTcBVd
 ZyDQj1TgirMNtKkRUkP+8wffxry7xqGfyw==
X-Google-Smtp-Source: AA0mqf6iRol4n9W05NEb8OQazQG6HHcXJE7xF7cFd78SFmqJUJAtz5iDJ3Jv+kgZa68Ym3CdwJB22g==
X-Received: by 2002:adf:f10d:0:b0:241:c0e3:ad9d with SMTP id
 r13-20020adff10d000000b00241c0e3ad9dmr17182943wro.338.1669397492490; 
 Fri, 25 Nov 2022 09:31:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bx9-20020a5d5b09000000b002365254ea42sm4320358wrb.1.2022.11.25.09.31.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Nov 2022 09:31:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 4/4] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
Date: Fri, 25 Nov 2022 18:31:19 +0100
Message-Id: <20221125173119.46665-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125173119.46665-1-philmd@linaro.org>
References: <20221125154030.42108-1-philmd@linaro.org>
 <20221125173119.46665-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Return NULL if the requested buffer size does not fit
within the slot memory region.

Reported-by: Wenxu Yin (@awxylitol)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/qxl.c | 11 ++++++++++-
 hw/display/qxl.h |  2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 231d733250..e5e162f82d 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1462,7 +1462,7 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
 void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
                     size_t size)
 {
-    uint64_t offset;
+    uint64_t offset, ptr_end_offset;
     uint32_t slot;
     void *ptr;
 
@@ -1474,6 +1474,15 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
             return NULL;
         }
+
+        ptr_end_offset = qxl->guest_slots[slot].offset + offset + size;
+        if (ptr_end_offset > memory_region_size(qxl->guest_slots[slot].mr)) {
+            qxl_set_guest_bug(qxl,
+                              "slot %d offset %"PRIu64" size %zu: "
+                              "overrun by %"PRIu64" bytes\n",
+                              slot, offset, size, ptr_end_offset - offset);
+            return NULL;
+        }
         ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
         ptr += qxl->guest_slots[slot].offset;
         ptr += offset;
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index bf03138ab4..7894bd5134 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -157,7 +157,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
  *
  * Returns a host pointer to a buffer placed at offset @phys within the
  * active slot @group_id of the PCI VGA RAM memory region associated with
- * the @qxl device. If the slot is inactive, or the offset is out
+ * the @qxl device. If the slot is inactive, or the offset + size are out
  * of the memory region, returns NULL.
  *
  * Use with care; by the time this function returns, the returned pointer is
-- 
2.38.1


