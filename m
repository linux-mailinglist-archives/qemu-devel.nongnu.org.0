Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E541D2E6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:52:20 +0200 (CEST)
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVozT-0002lE-Tu
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos3-0000tm-4C; Thu, 30 Sep 2021 01:44:39 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:59267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos0-0003LH-4J; Thu, 30 Sep 2021 01:44:38 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyQ6xnXz4xb9; Thu, 30 Sep 2021 15:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980670;
 bh=ndz8vhlC+4u4oL7K9TxL3BD+ACDtY42WBMLj9fITS24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ILAKNg0c2CaArPyZiW7iJfEjQlV+5AdPyFaBLsYEctLP5peMcpGneSZ1wi6jtKApm
 JbGyiWmI2+1rUPwXZK0ZeCZZEt7eZAU2BLkoxaqsAoVpx8mZs9FYAkYw6lKnApOg+K
 XB+YOLmKv8iywR64uZIIrGhwRwoMx540UqWDNSYw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/44] host-utils: fix missing zero-extension in divs128
Date: Thu, 30 Sep 2021 15:43:44 +1000
Message-Id: <20210930054426.357344-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

*plow (lower 64 bits of the dividend) is passed into divs128() as
a signed 64-bit integer. When building an __int128_t from it, it
must be zero-extended, instead of sign-extended.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Message-Id: <20210910112624.72748-3-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/qemu/host-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 711b221704..753b9fb89f 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -70,7 +70,7 @@ static inline int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
     if (divisor == 0) {
         return 1;
     } else {
-        __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;
+        __int128_t dividend = ((__int128_t)*phigh << 64) | (uint64_t)*plow;
         __int128_t result = dividend / divisor;
         *plow = result;
         *phigh = dividend % divisor;
-- 
2.31.1


