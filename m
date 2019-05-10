Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586721A1CF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:46:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8fT-00065d-Fo
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:46:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8d6-0004gO-Gl
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8d5-0002Wj-Fl
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:16 -0400
Received: from m12-13.163.com ([220.181.12.13]:46138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hP8cx-0002Se-WA
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=QIasgmbFmQFh6heCmI
	oYYkbFdxWLVq+R+/WMqUG2ufw=; b=KcMN8NL/TEWg1qIbJjkXqrvWFqEdoC/lrA
	SPE8vMTrBcYanSqHa3xy5tPsHxILnCobWNE0UBWVg5XnM9Ro5ZRex7tZIW+3Lcz1
	xiBLKxHniMsQSFte3sd7QJHNE3OrJDpnyyNdDxrflbKC9qtBPhQY7L9VO6LCBn38
	F+1CfZih0=
Received: from localhost.localdomain (unknown [183.159.64.133])
	by smtp9 (Coremail) with SMTP id DcCowAB3fTFLqtVcVYWnCg--.3399S4;
	Sat, 11 May 2019 00:44:01 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: pbonzini@redhat.com,
	jslaby@suse.cz
Date: Fri, 10 May 2019 09:43:48 -0700
Message-Id: <20190510164349.81507-3-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510164349.81507-1-liq3ea@163.com>
References: <20190510164349.81507-1-liq3ea@163.com>
X-CM-TRANSID: DcCowAB3fTFLqtVcVYWnCg--.3399S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWrCw18XrWDAw1fGw4rZrb_yoWxAwc_A3
	y0ka9rZFWDKFy3CF12vFnxZr1UJw4rZryfua1Iqrs7ArZ8CrW8A34vgFnrGw47XrZxury8
	Z3yDZFyvkr9IgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8-18DUUUUU==
X-Originating-IP: [183.159.64.133]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBLxGwbVUMJPd5SAAAsY
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Subject: [Qemu-devel] [PATCH v4 2/3] edu: mmio: allow 64-bit access in read
 dispatch
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

The edu spec says when address >= 0x80, the MMIO area can
be accessed by 64-bit.

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
---
 hw/misc/edu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 65fc32b928..33de05141f 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -185,7 +185,11 @@ static uint64_t edu_mmio_read(void *opaque, hwaddr addr, unsigned size)
     EduState *edu = opaque;
     uint64_t val = ~0ULL;
 
-    if (size != 4) {
+    if (addr < 0x80 && size != 4) {
+        return val;
+    }
+
+    if (addr >= 0x80 && size != 4 && size != 8) {
         return val;
     }
 
-- 
2.17.1



