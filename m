Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB411A1C8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:46:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8fF-0005qJ-UN
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:46:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8cz-0004ap-Oa
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8cx-0002TZ-Qa
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:09 -0400
Received: from m12-13.163.com ([220.181.12.13]:46005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8cu-0002Qe-3W
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=TAkAEQslBT4X+Y5eAh
	5OCFU79u6ALGBYynB4L5pLfks=; b=atMpWE9NfCa8GoiKHkpZLj3h32797ZQ9sW
	6agk9hgaE/9EmqvsxVGa2INuti9qYWMxKEoB3KF2WECkLxW+hFR0r8BlooLusLDr
	QiJxntXA75xFnCi9m2hg1ijoaJFBx4sD4NEa+4ufoHZCpMKO1Z2cPgl3IWNXj0UH
	icba3fSGQ=
Received: from localhost.localdomain (unknown [183.159.64.133])
	by smtp9 (Coremail) with SMTP id DcCowAB3fTFLqtVcVYWnCg--.3399S3;
	Sat, 11 May 2019 00:44:00 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: pbonzini@redhat.com,
	jslaby@suse.cz
Date: Fri, 10 May 2019 09:43:47 -0700
Message-Id: <20190510164349.81507-2-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510164349.81507-1-liq3ea@163.com>
References: <20190510164349.81507-1-liq3ea@163.com>
X-CM-TRANSID: DcCowAB3fTFLqtVcVYWnCg--.3399S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4xJFWUXF4UurW3Kr4rKrg_yoW3urg_Jw
	1xGFZ7urW5Wry3AF9YqF13ur1xW3yrAFn5uFnagr4fJa4rCF98Z3sagrnxXw47Gw1fCwn5
	ZaykZFy5Kr9rWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUVMNUUUUUU==
X-Originating-IP: [183.159.64.133]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhCwbVaD1aHioAAAsI
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Subject: [Qemu-devel] [PATCH v4 1/3] edu: mmio: allow 64-bit access
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: liq3ea@gmail.com, philmd@redhat.com, qemu-devel@nongnu.org,
	Li Qiang <liq3ea@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The edu spec says the MMIO area can be accessed by 64-bit.
However currently the 'max_access_size' is not so the MMIO
access dispatch can only access 32-bit one time. This patch fixes
this to respect the spec.

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
---
 hw/misc/edu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 91af452c9e..65fc32b928 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -289,6 +289,15 @@ static const MemoryRegionOps edu_mmio_ops = {
     .read = edu_mmio_read,
     .write = edu_mmio_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+
 };
 
 /*
-- 
2.17.1



