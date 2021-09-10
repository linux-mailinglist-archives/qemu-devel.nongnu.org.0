Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B443A406AB7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:30:59 +0200 (CEST)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOekE-0005kd-Og
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegF-00023W-Tf; Fri, 10 Sep 2021 07:26:51 -0400
Received: from [201.28.113.2] (port=13634 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegE-0001ua-IS; Fri, 10 Sep 2021 07:26:51 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:48 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id A3465800C19;
 Fri, 10 Sep 2021 08:26:48 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 03/22] host-utils: introduce uabs64()
Date: Fri, 10 Sep 2021 08:26:05 -0300
Message-Id: <20210910112624.72748-4-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:48.0853 (UTC)
 FILETIME=[BEB27450:01D7A636]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce uabs64(), a function that returns the absolute value of
a 64-bit int as an unsigned value. This avoids the undefined behavior
for common abs implementations, where abs of the most negative value is
undefined.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qemu/host-utils.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 753b9fb89f..ca9f3f021b 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -357,6 +357,14 @@ static inline uint64_t revbit64(uint64_t x)
 #endif
 }
 
+/**
+ * Return the absolute value of a 64-bit integer as an unsigned 64-bit value
+ */
+static inline uint64_t uabs64(int64_t v)
+{
+    return v < 0 ? -v : v;
+}
+
 /**
  * sadd32_overflow - addition with overflow indication
  * @x, @y: addends
-- 
2.25.1


