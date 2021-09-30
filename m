Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C2D41D2D6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:48:19 +0200 (CEST)
Received: from localhost ([::1]:50688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVova-0004DP-6Y
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos3-0000tl-1d; Thu, 30 Sep 2021 01:44:39 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:55239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVorz-0003LJ-QN; Thu, 30 Sep 2021 01:44:38 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR0BS4z4xbT; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=GuOUZTZB00KWv24pZwWdyBYnJfTSSVmOcNmrtpiDiEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O1eXB/U6bak9BpGIf83wDIVw2X0/HOaCxYuAPsbhHCn/EnZ+Vlo7ANKwmWNGRXOGE
 06kP7JvZPlcBOmjQ/zllT6lOZnZ3MwY085NHWTIyEQDGAi3Fm0lVQ5ughHTUKDJ62F
 BWFzqFQBW2UB9IqVBo5zAFa0xuxONr0rQXZhe0Gc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 04/44] i386/kvm: Replace abs64() with uabs64() from host-utils
Date: Thu, 30 Sep 2021 15:43:46 +1000
Message-Id: <20210930054426.357344-5-david@gibson.dropbear.id.au>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Drop abs64() and use uabs64() from host-utils, which avoids
an undefined behavior when taking abs of the most negative value.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210910112624.72748-5-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/i386/kvm/i8254.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index fa68669e8a..191a26fa57 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -59,11 +59,6 @@ struct KVMPITClass {
     DeviceRealize parent_realize;
 };
 
-static int64_t abs64(int64_t v)
-{
-    return v < 0 ? -v : v;
-}
-
 static void kvm_pit_update_clock_offset(KVMPITState *s)
 {
     int64_t offset, clock_offset;
@@ -81,7 +76,7 @@ static void kvm_pit_update_clock_offset(KVMPITState *s)
         clock_gettime(CLOCK_MONOTONIC, &ts);
         offset -= ts.tv_nsec;
         offset -= (int64_t)ts.tv_sec * 1000000000;
-        if (abs64(offset) < abs64(clock_offset)) {
+        if (uabs64(offset) < uabs64(clock_offset)) {
             clock_offset = offset;
         }
     }
-- 
2.31.1


