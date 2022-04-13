Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E204500265
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 01:16:55 +0200 (CEST)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nemEH-0003nX-QD
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 19:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1nemCd-00037L-0m; Wed, 13 Apr 2022 19:15:11 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:57628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1nemCb-0006Ln-6p; Wed, 13 Apr 2022 19:15:10 -0400
Received: from LT2ubnt.fritz.box (ip-088-152-144-107.um26.pools.vodafone-ip.de
 [88.152.144.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 17FF23F11D; 
 Wed, 13 Apr 2022 23:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1649891703;
 bh=fgJytORPX/by9LBapE5V9ok+3BZR1lC/hRPbFADFbUk=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=XBRlCNQZyi3I/MrvjOt4ZLOxEVjOdqxCL6TxQ/u4bSbU/lx3ST7S9Tu/kBT/xdvLP
 W7z4hh8H/6/9rNYR8Nj8KaZKB6SHUwE+m9EAsb5Hzs22CkdqOrjARkBlH99S3iFq+d
 KY8hCClnHAvdlddwehrf3fKZQIKW8FeYi8Hv6e+/YR5Us54DwPI+rkTu9upeFhVKKf
 7oCUOW/o3kNQvOVZ7nuheHbiRPl8TF2cFmIAFgcJWx64Qqt5CA3A1kKdr2mckKNr/O
 86cQVURMmshOUeP3zln4GBrrR2Fh8sTu/A+re9WWBTPBjfjlY81XAiEo1BrCxIHCvN
 0h5EMxrqybW+w==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/virt: impact of gic-version on max CPUs
Date: Thu, 14 Apr 2022 01:14:56 +0200
Message-Id: <20220413231456.35811-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.121;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-canonical-1.canonical.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Describe that the gic-version influences the maximum number of CPUs.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 docs/system/arm/virt.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 1544632b67..1af3f6a0a8 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -96,9 +96,9 @@ gic-version
   Valid values are:
 
   ``2``
-    GICv2
+    GICv2 - This limits the number of CPUs to 8.
   ``3``
-    GICv3
+    GICv3 - This allows up to 512 CPUs.
   ``host``
     Use the same GIC version the host provides, when using KVM
   ``max``
-- 
2.34.1


