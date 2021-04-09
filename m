Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A881359166
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 03:24:49 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUftA-0001nb-Bo
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 21:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfdZ-0006eX-NL
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:41 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6254)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfdW-0001Cp-8B
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617930518; x=1649466518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ej1mlCwgokOz+82c3twYEOoVgdzabHpXf2Pt+ERiZk=;
 b=eKJLB+43fpCfwr2tVuUfTrn0gJhzUU2lso1u3anCFR8+D9SiEcfBI5DW
 kWMQSqUmeL4w/9QBBydw9KMXuemrV/rI/B0fgltlmgV/ylXoJUmEk6JWS
 mijdtxK5U8xuqrMYM7mN0jKxmUesmYpVV6pydb3k+xidgaxUWl3RAqhgl 8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 897D315A3; Thu,  8 Apr 2021 20:07:56 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/26] Hexagon (target/hexagon) move QEMU_GENERATE to only
 be on during macros.h
Date: Thu,  8 Apr 2021 20:07:43 -0500
Message-Id: <1617930474-31979-16-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/genptr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 6b74344..b87e264 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -15,7 +15,6 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#define QEMU_GENERATE
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
@@ -24,7 +23,9 @@
 #include "insn.h"
 #include "opcodes.h"
 #include "translate.h"
+#define QEMU_GENERATE       /* Used internally by macros.h */
 #include "macros.h"
+#undef QEMU_GENERATE
 #include "gen_tcg.h"
 
 static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
-- 
2.7.4


