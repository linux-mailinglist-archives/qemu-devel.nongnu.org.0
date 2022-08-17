Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E99596902
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 07:50:52 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOBx5-0003ln-ES
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 01:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oOBmW-0005GH-Dh
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 01:39:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:56267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oOBmU-0006op-OP
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 01:39:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id a8so11559090pjg.5
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 22:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OebBOD2hTO+oKIg5mbeMZNAWGkiQhaYQdrY39Q9ajZU=;
 b=T/qM6E+fzJmDaV8Q033SzhaRkvFr6q22ozIzhxnX7FVVhsGHxu7dG4m/xmGwYvuCwx
 F80YodxBOLvmWUF+0I5vkPAr12M1oeFxPK8os0P4xttZbEz3MBqZe3e7sZ+11UqsL5aC
 pDUR0RwSJAgpSNqYTghglfo+TCcI044WVlLa91umimJ0zawOKg3iYXu66T7mfCGHPy4T
 sdfb8lwoLOF5JbmyHsNfWFKWnuvEIGrWp02QdruZ17QOGI5KJLkDvpSjaGQKqvGznPBo
 QyN3LnNL1EEMrXnv3be4mZ+mPT0QZoL82xuvS10y1jQyfAawF2ofu3U/xXYgczbKih9d
 mFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OebBOD2hTO+oKIg5mbeMZNAWGkiQhaYQdrY39Q9ajZU=;
 b=LXKrRGxqV1ljLFocpFu5ttertMtYs176Y8JZfj2E3C8wx/PGyKhzdTxrKVXzFJA5Ey
 zs4WhgX20/4Zd4XLi/YzKyXzpYhufi/atxopuCLTsrP/h+fz44ZpDccJ5gwVtZfk4E0X
 qDRaywrGO0DdTSt3iHACJ7cXTpdTSP27mlDPBy3rdWKV6169WL8Kdw4X5+GCJJRyt9UK
 yZI7ye+I3kWANwHL6oB84fJLGF2oHnKNdfWs+l/pEU9N6g2+ybH1VHxcLnjdnZ196s59
 ih7yev2hNUXt4iIkiCnFtqmPm7cWcImVYDTAeThU8/YbW6o7RP6zif0cVK0JUvYcJ1En
 kStQ==
X-Gm-Message-State: ACgBeo3UQ3x/oLmaOIceZVqLx2Re/BEECNu9msWLyznI4IdebeOm+2PB
 glWAAQi4ooKHb1OysDlzvg3QYzkPY6nx8DDA
X-Google-Smtp-Source: AA6agR5Z2kqAY3Z4hzWUCUVDen0IbXqe9NCp/HaxS/2E7KI7JN7JPlOuyLBi9kN0Ky8sT/+UaZXORg==
X-Received: by 2002:a17:903:18a:b0:16f:8a63:18fe with SMTP id
 z10-20020a170903018a00b0016f8a6318femr25731467plg.174.1660714793464; 
 Tue, 16 Aug 2022 22:39:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:6580:98c0:1200:8471:2642:55c0:76cb])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a17090264d600b0016bb24f5d19sm393975pli.209.2022.08.16.22.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 22:39:52 -0700 (PDT)
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>, Bill Paul <noisetube@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH] esp: Handle CMD_BUSRESET by resetting the SCSI bus
Date: Wed, 17 Aug 2022 14:38:47 +0900
Message-Id: <20220817053846.699310-1-john@john-millikin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817003357.401492-1-john@john-millikin.com>
References: <20220817003357.401492-1-john@john-millikin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=john@john-millikin.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Per investigation on the linked ticket, SunOS issues a SCSI bus reset
to the ESP as part of its boot sequence. If this ESP command doesn't
cause devices to assert sense flag UNIT ATTENTION, SunOS will consider
the CD-ROM device to be non-compliant with Common Command Set (CCS).
In this condition, the SunOS installer's early userspace doesn't set
the installation source location to sr0 and the miniroot copy fails.

Signed-off-by: John Millikin <john@john-millikin.com>
Suggested-by: Bill Paul <noisetube@gmail.com>
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1127
---
 hw/scsi/esp.c | 6 ++++++
 1 file changed, 6 insertions(+)

(re-sending because I forgot the `Signed-off-by`; sorry)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 2d3c649567..c799c19bd4 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -939,6 +939,11 @@ static void esp_soft_reset(ESPState *s)
     esp_hard_reset(s);
 }
 
+static void esp_bus_reset(ESPState *s)
+{
+    qbus_reset_all(BUS(&s->bus));
+}
+
 static void parent_esp_reset(ESPState *s, int irq, int level)
 {
     if (level) {
@@ -1067,6 +1072,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             break;
         case CMD_BUSRESET:
             trace_esp_mem_writeb_cmd_bus_reset(val);
+            esp_bus_reset(s);
             if (!(s->wregs[ESP_CFG1] & CFG1_RESREPT)) {
                 s->rregs[ESP_RINTR] |= INTR_RST;
                 esp_raise_irq(s);
-- 
2.25.1


