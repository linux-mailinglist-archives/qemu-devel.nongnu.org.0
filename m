Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF452609E9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:22:00 +0200 (CEST)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFW4t-0007eo-QP
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW39-0005iF-Vw; Tue, 08 Sep 2020 01:20:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44289 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW37-0005rC-A2; Tue, 08 Sep 2020 01:20:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkj3MKgz9sR4; Tue,  8 Sep 2020 15:19:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542397;
 bh=qgx6z9rQQE1xqJs/Hitt+hn4TaVazW9OJAaF7qJoeT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jOWPeh0uE4ZsIgDXKTVKNCJuKYVisgyOXC1PuLvCA7NLqEHvX8NfKmOG4iXoOdQ4n
 acnWeRDQLe92s5YOO9xlqI34gomMqmWANJhJckp5j1qI1swOyjAb8jxW0nEIYbktmC
 La97SEuWboYjiLI1Q5lFD2RFDYbflmRKLqHdIyiE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/33] adb: Correct class size on TYPE_ADB_DEVICE
Date: Tue,  8 Sep 2020 15:19:21 +1000
Message-Id: <20200908051953.1616885-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:19:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TypeInfo incorrectly just lets the class size be inherited.  It won't
actually break things, since the class is abstract, but we should get it
right.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


