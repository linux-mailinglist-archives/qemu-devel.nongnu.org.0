Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180A29AEC1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:04:42 +0100 (CET)
Received: from localhost ([::1]:34442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPab-0001Oa-Ev
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPTH-0003Wf-Tq
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPTE-0004O1-VT
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603807024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaWnoSHk3gYww0GtxO3QwPtbarT6V9nMm5FHP0y80Lw=;
 b=avSS2UCnXm3puE6iZmetkuvMc9FyW85VErU6SE6jkF7wJzvZR2VfZ5+ULuvBreH8PkleML
 bQkqqaa4H3+501ql3Y3uZVs16HR6M0F+AlvbiwrqXIpNEiBptY3H9heJQltSqj1Crjvsl8
 qGldgLBADBX0Wt0JASqe+4HOM+ynArI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-eO0I1uMgMMSoA4boqhK7mA-1; Tue, 27 Oct 2020 09:57:02 -0400
X-MC-Unique: eO0I1uMgMMSoA4boqhK7mA-1
Received: by mail-ed1-f69.google.com with SMTP id a19so691365edb.18
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 06:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaWnoSHk3gYww0GtxO3QwPtbarT6V9nMm5FHP0y80Lw=;
 b=dTKeWYVHXZhHbNSWm1rYQKrkPQvjKabUDexMOB7DOibtV+Urf90xDzcFMlVXQL9kyH
 96X8O1mlJ4kR5IFS0AIi8LNjuAaOz7bxt0a03+p3hYTbiJhWWsqOdNyIm2bwndQ+vPiG
 il4LvYh9VEurvCiQMycUSa8rVyy7vadEpRCtL+JNY0jnaR3N7rT2wlTuwLFbjZZzlnGS
 PtA7MPbBibKSZL/kUNhtA5/PNQmRr1uSFxUeXp+1LaqgM47udJouzgv3eTez7fFP2qAK
 M34Fsk+wokeMOLqsbvG+EvldaJtssb2s60O9jJI0V4sQAYMxfjyWktWU4/H6uT9ko8Ch
 jffA==
X-Gm-Message-State: AOAM530J+uPjIScgpCtn4ClntG1TWIPIuS5rIK+qkIkg1rjcG8CN5i+f
 upaGlJwxRMgEoj43TCf0Q31eL4ZCq8aKlFD5zvAMfc2ZCZv6A4drgn1Yi1/PrH2nk6ziIbF+rF7
 5oTWBtgrJ0uH7fW4=
X-Received: by 2002:a05:6402:1d2c:: with SMTP id
 dh12mr2313204edb.256.1603807020754; 
 Tue, 27 Oct 2020 06:57:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoLJkGL1xFej60+Spi56zjOKlnHehmNr1rH2CxGuiQXJAq8qk1Q5eG2ah0lToIYRm3Uzzh1A==
X-Received: by 2002:a05:6402:1d2c:: with SMTP id
 dh12mr2313189edb.256.1603807020597; 
 Tue, 27 Oct 2020 06:57:00 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id t8sm1113943ejc.45.2020.10.27.06.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:57:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/25] block/nvme: Introduce Completion Queue definitions
Date: Tue, 27 Oct 2020 14:55:35 +0100
Message-Id: <20201027135547.374946-14-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027135547.374946-1-philmd@redhat.com>
References: <20201027135547.374946-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename Submission Queue flags with 'Sq' and introduce
Completion Queue flag definitions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/block/nvme.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 65e68a82c89..079f884a2d3 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -491,6 +491,11 @@ typedef struct QEMU_PACKED NvmeCreateCq {
 #define NVME_CQ_FLAGS_PC(cq_flags)  (cq_flags & 0x1)
 #define NVME_CQ_FLAGS_IEN(cq_flags) ((cq_flags >> 1) & 0x1)
 
+enum NvmeFlagsCq {
+    NVME_CQ_PC          = 1,
+    NVME_CQ_IEN         = 2,
+};
+
 typedef struct QEMU_PACKED NvmeCreateSq {
     uint8_t     opcode;
     uint8_t     flags;
@@ -508,12 +513,12 @@ typedef struct QEMU_PACKED NvmeCreateSq {
 #define NVME_SQ_FLAGS_PC(sq_flags)      (sq_flags & 0x1)
 #define NVME_SQ_FLAGS_QPRIO(sq_flags)   ((sq_flags >> 1) & 0x3)
 
-enum NvmeQueueFlags {
-    NVME_Q_PC           = 1,
-    NVME_Q_PRIO_URGENT  = 0,
-    NVME_Q_PRIO_HIGH    = 1,
-    NVME_Q_PRIO_NORMAL  = 2,
-    NVME_Q_PRIO_LOW     = 3,
+enum NvmeFlagsSq {
+    NVME_SQ_PC          = 1,
+    NVME_SQ_PRIO_URGENT = 0,
+    NVME_SQ_PRIO_HIGH   = 1,
+    NVME_SQ_PRIO_NORMAL = 2,
+    NVME_SQ_PRIO_LOW    = 3,
 };
 
 typedef struct QEMU_PACKED NvmeIdentify {
-- 
2.26.2


