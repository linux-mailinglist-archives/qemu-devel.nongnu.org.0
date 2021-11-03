Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA48443EB6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:55:05 +0100 (CET)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miC2y-0000J3-KE
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1miC1O-00076h-N4
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:53:26 -0400
Received: from apollo.dupie.be ([51.159.20.238]:56212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1miC1J-0005V2-Dc
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:53:23 -0400
Received: from localhost.localdomain (unknown
 [IPv6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8])
 by apollo.dupie.be (Postfix) with ESMTPSA id ED8BA152106D;
 Wed,  3 Nov 2021 09:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1635929597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=M7RWEqSxpO4BAB/I0fNJQ7NgsCcYeNATScD8NlCF0Fc=;
 b=DvPQP3Uso5LeV4lZIrOTtfhHYNhMT39mr/vj5vXvvi7M+S1slQ9chKBCB2V22eLfl0Nrd6
 6UzpV+i7LqDlF8VEm0Y3TDpN3uhWYqpZjhTZIdNa7D5QqQd18cRvuTtzCWv8lYW4DFeyhg
 ZsvFu/Mx5Tm5854qRvfE6CYANwFqv0bg1A3GwwZ675DL/VjVL/bLoRDMDI02MFXU1fBvu9
 x0QCj9TepUNvPnvdUJiyLDNB5311kis8sAiUCF9TgUKSc5AR2Z2+ukLRJ9vo9d+w9yP0Hc
 C0jPIDcghS0RWuh5Y61B+pz6Uj3o2W62LORjpZchpeVVqGhgdkcoRm002SgoyA==
From: Jean-Louis Dupond <jean-louis@dupond.be>
To: qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, mst@redhat.com, Jason Wang <jasowang@redhat.com>,
 Jean-Louis Dupond <jean-louis@dupond.be>
Subject: [PATCH] Fix virtio-net-pci* "vectors" compat
Date: Wed,  3 Nov 2021 09:52:34 +0100
Message-Id: <20211103085234.15079-1-jean-louis@dupond.be>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Eduardo Habkost <ehabkost@redhat.com>

hw_compat_5_2 has an issue: it affects only "virtio-net-pci"
but not "virtio-net-pci-transitional" and
"virtio-net-pci-non-transitional".  The solution is to use the
"virtio-net-pci-base" type in compat_props.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1999141

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Jean-Louis Dupond <jean-louis@dupond.be>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index e24e3e27db..b17a15508c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
     { "virtio-blk-device", "report-discard-granularity", "off" },
-    { "virtio-net-pci", "vectors", "3"},
+    { "virtio-net-pci-base", "vectors", "3"},
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
-- 
2.33.1


