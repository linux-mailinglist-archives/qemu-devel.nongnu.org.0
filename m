Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8A4ECB60
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:08:07 +0200 (CEST)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcjm-0001Gc-8h
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:08:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbc-0000Fp-Av; Wed, 30 Mar 2022 13:59:40 -0400
Received: from [187.72.171.209] (port=21948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbb-0004ik-0M; Wed, 30 Mar 2022 13:59:40 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:34 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BCDC180060F;
 Wed, 30 Mar 2022 14:59:33 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 1/8] qemu/int128: avoid undefined behavior in int128_lshift
Date: Wed, 30 Mar 2022 14:59:25 -0300
Message-Id: <20220330175932.6995-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 17:59:34.0183 (UTC)
 FILETIME=[E9C23370:01D8445F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Avoid the left shift of negative values in int128_lshift by casting
a/a.hi to unsigned.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


