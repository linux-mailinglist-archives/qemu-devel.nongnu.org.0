Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD348251750
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:19:46 +0200 (CEST)
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAWzR-00034t-RF
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kAWwU-00072f-HZ; Tue, 25 Aug 2020 07:16:43 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kAWwS-00054A-4Y; Tue, 25 Aug 2020 07:16:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BbRJg4Tfkz9sTX; Tue, 25 Aug 2020 21:16:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1598354195;
 bh=MrGE/TpCR1qUcgPMnE2s3PEkLpFlXx8qX3wKLCtJ45w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y5No8DgFqqvi880lFJ6YRdDHbMIDoyhKcPYH1iNseulbOVvar+EAwifti7xUwYrut
 ljWznq4CUNODuCSuqavwIodAtNtDfYZKmUqCgRVSioAPOSBHTQ57TDbZt1s9TwtPNd
 Cy/IM1+EomVqWYOVFxjUPC+DLpyg6WbZ0+7eL6z0=
From: David Gibson <david@gibson.dropbear.id.au>
To: ehabkost@redhat.com
Subject: [PATCH 1/3] adb: Correct class size on TYPE_ADB_DEVICE
Date: Tue, 25 Aug 2020 21:16:25 +1000
Message-Id: <20200825111627.2007820-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825111627.2007820-1-david@gibson.dropbear.id.au>
References: <20200825111627.2007820-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TypeInfo incorrectly just lets the class size be inherited.  It won't
actually break things, since the class is abstract, but we should get it
right.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/input/adb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index 013fcc9c54..84331b9fce 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -309,6 +309,7 @@ static void adb_device_class_init(ObjectClass *oc, void *data)
 static const TypeInfo adb_device_type_info = {
     .name = TYPE_ADB_DEVICE,
     .parent = TYPE_DEVICE,
+    .class_size = sizeof(ADBDeviceClass),
     .instance_size = sizeof(ADBDevice),
     .abstract = true,
     .class_init = adb_device_class_init,
-- 
2.26.2


