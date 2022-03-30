Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE24ECDF7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:30:18 +0200 (CEST)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZexN-0007Pv-36
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:30:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuC-00041f-8t; Wed, 30 Mar 2022 16:27:00 -0400
Received: from [187.72.171.209] (port=8867 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuA-0001WS-TX; Wed, 30 Mar 2022 16:27:00 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 17:25:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 93E6E8002AF;
 Wed, 30 Mar 2022 17:25:34 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 01/10] qemu/int128: avoid undefined behavior in int128_lshift
Date: Wed, 30 Mar 2022 17:25:06 -0300
Message-Id: <20220330202515.66554-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 20:25:35.0161 (UTC)
 FILETIME=[4FB55A90:01D84474]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Avoid the left shift of negative values in int128_lshift by casting
a/a.hi to unsigned.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 include/qemu/int128.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 2c4064256c..2a19558ac6 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -85,7 +85,7 @@ static inline Int128 int128_rshift(Int128 a, int n)
 
 static inline Int128 int128_lshift(Int128 a, int n)
 {
-    return a << n;
+    return (__uint128_t)a << n;
 }
 
 static inline Int128 int128_add(Int128 a, Int128 b)
@@ -305,7 +305,7 @@ static inline Int128 int128_lshift(Int128 a, int n)
     if (n >= 64) {
         return int128_make128(0, l);
     } else if (n > 0) {
-        return int128_make128(l, (a.hi << n) | (a.lo >> (64 - n)));
+        return int128_make128(l, ((uint64_t)a.hi << n) | (a.lo >> (64 - n)));
     }
     return a;
 }
-- 
2.31.1


