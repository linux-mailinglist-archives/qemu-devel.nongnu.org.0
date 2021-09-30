Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9441D2E7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:52:31 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVoze-0002x5-6P
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos3-0000tn-4f; Thu, 30 Sep 2021 01:44:39 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:47673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos0-0003LI-Ch; Thu, 30 Sep 2021 01:44:38 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR00tMz4xbR; Thu, 30 Sep 2021 15:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=3oNAI44TIN/AZHZp1f82qjO7/z4Ej9juaLMRZchjIRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WsHXXKs5RoQwjMyhekbKjVbakTMRbCncFdGUcvhDExfF8cPtJm3mqLwVqYR3aTs6t
 els+vpcNX0XDnDHe7DaNVppigLfaUZc0NTo/tVQPyhC4/Dk6HvBDAIl+Dt3su6NUHT
 938yuEtfmFw/a5NJa/wBwrtaIEhA56rbU6Xm2nCQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/44] host-utils: introduce uabs64()
Date: Thu, 30 Sep 2021 15:43:45 +1000
Message-Id: <20210930054426.357344-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Introduce uabs64(), a function that returns the absolute value of
a 64-bit int as an unsigned value. This avoids the undefined behavior
for common abs implementations, where abs of the most negative value is
undefined.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210910112624.72748-4-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


