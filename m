Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705637A4B6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:39:04 +0200 (CEST)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPn5-0005gt-Gh
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWC-0000yx-4r
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:36 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPW3-0006TG-H5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728485; x=1652264485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eBNCyqtOfzNeogyxUlf2PGSAY8yQsrhavKYqjK6n7uE=;
 b=DEd2RiKOq0ZSy0DHgRQidfRoLKWsdxeqZkjaPFMB0C/IcC+Z5hGgUSwC
 T5xPgquqUC1bte5gGOpADfCPxv3CFd4hqdkhEnkx7/3Mo6WI1WnjKyNHM
 Bcup2Z/wcUVDuEN//lbYQfnszm3O4wVEmX6D/4hzGVUcX0GGiWCydcpA8
 ibKQVvpFkHJz5rwqqQSTP4DltW9vtJRaiUBpmhxZnlSxfBaYPMjmC1NH0
 JBC4Zxm5RhhgtCnTi3o7i40rwaPdjqma36Al6CbeBvRJaMSDGJXWCNv1y
 W6HJ9dwjb0cH+3fnIIMk3ABjiOBwvz/jOkPIfFW+sYrcg7nkZWmSJQRS3 w==;
IronPort-SDR: JfGFTOijgSX9aBqlopLj5DsLUJ0yS5VWjLrxJz3b7CmSwkHWMfRs2ztvtGa/+x8T68ajKEfIVl
 bS7sHpqosbXoOlrSxsfaresnJPhu5IS/kFVHIYUiqZYvF6w5/dXKiP0EDTqI/OWzpgceVb1BNH
 yr/EJ7lwqVlxe4PRoCh0vBXVsJrxCSl/8bTFkgXu3zySwr8/616TFeccmrHmjaPUUfy0veG5ig
 kYq3ChZaDNuhK4xzmrKaBpwm7a0DnIyqQ9UMI9RcNAOt8i60kCfL8IhVYsiyZuEYXCKThk+Ji5
 2EU=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735402"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:59 +0800
IronPort-SDR: 9m1BuC717QO7QIsy3ZTRVRbshUM3Bw+5e+ldxFR8hEM8Gqen04NX9xaK7aZT4mmps65PngXCb7
 bYKyKSCAXUqpmiRzQSkb3F+Qb7IIfIeDxKzW0ETFCieTe6QFAz1nupv+Om+roxTo/qL2Fwb4p0
 y/aF1TBjMFd5r8XazkKwNgHc27Vx4HkLFwENr6lzmMnOHKOhBayWf0P+K9WxxV/WE8fgxcsByL
 ORbVWpG72USHzxl4PSNY6Pjjfw/zp6ElpS1Po2wu9eMPHfZa0aQb61fT5uT7cK2vaLGHhrZcd8
 s68ipQAzaL/DKsecsozGRAR+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:59 -0700
IronPort-SDR: kui9oBkgCzOZVHXy/ensks9+ME4FPk+Dd03eXRbifl0x6wVGxWFmsn4W5NM4F2JFBIB9HiVtbg
 Sd8i1C9ofmqpFR63fm916qX+ANyGy3cDirlr4MHZhxzfJgVkBWK/JqXU87QXXVz3F5fIciN5yx
 GWk2wlp70cnQNJmhab/z4vGPIbJpRxYdvc280NCl83EzOGJjRi6ksIo+xz/5vbaO3TCdL7TNCL
 IGPYU+ZiI0frCliTJY/3RxFJUicREeWSQuTgFnMDskjeTns1SK6OHokaSTikjg3aFhBesxH/wv
 AoQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:58 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 18/42] target/riscv: Fixup saturate subtract function
Date: Tue, 11 May 2021 20:19:27 +1000
Message-Id: <20210511101951.165287-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
However, when the predication is ture and a is 0, it should return maximum.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210212150256.885-4-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d28..356cef8a09 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT8_MIN) {
-        res = a > 0 ? INT8_MAX : INT8_MIN;
+        res = a >= 0 ? INT8_MAX : INT8_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
-        res = a > 0 ? INT16_MAX : INT16_MIN;
+        res = a >= 0 ? INT16_MAX : INT16_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
-        res = a > 0 ? INT32_MAX : INT32_MIN;
+        res = a >= 0 ? INT32_MAX : INT32_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
-        res = a > 0 ? INT64_MAX : INT64_MIN;
+        res = a >= 0 ? INT64_MAX : INT64_MIN;
         env->vxsat = 0x1;
     }
     return res;
-- 
2.31.1


