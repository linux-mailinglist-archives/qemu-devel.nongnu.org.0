Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A839A5C9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:32:59 +0200 (CEST)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqHC-0002XA-ET
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl1-0001Xr-Ok
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:43 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkz-0007FE-OL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:43 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h8so6356006wrz.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Ll9YC3gq0ZRPtZyXFyJvlXQyvVNNe2QT4j+IfKDeno=;
 b=j78OhndX4+41/3JlpnQNd4vKrvQwd9EcIHh18l4a8lwch0adzhe2rp9QG5b+65gPC9
 zB4QcqNrF+uwGix7EikcxNi3S4mcFMtVOeQQSGDHSsPzYjFJ3bjDaJjS/w9FpllxQHaa
 SdSrwUvxrCsbaDfinG1leWtZlKwuXVoWRwRn88Y8cLnCChN/O7/6m0sR+NCKPNJUAzS9
 YHSE8v/T6RXBJpqaSSSTmVvOq8P9HYVxIdluvwHzFucKANNDi1djtFaRh78LJix/vc1O
 UtnLl26dRjBN+9aJWYluKsQJ+z05WBtbRknoIPuAA+fPcGV/TNJWJnwoPl3KT6uHCr1g
 q13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Ll9YC3gq0ZRPtZyXFyJvlXQyvVNNe2QT4j+IfKDeno=;
 b=YZhIoSu8p8vS8bWgDg5Ot5l+3xSHlujQP4kChXV1xZCM/Fd2mvL+zA50MEAz+7gFAc
 24BbK0rS8KWTzbyMOxIi9tahRe/Clp6bYfTyo4KVpNbr/Dg9bnE7mfTuAI0lq+8d8Te+
 f6hkChXxFWuSi79wbDz3P0Eg1kKGuzDyyG+Mcr7hIRRQHXCaAoGvkbfnx0RhoInDwfnr
 eBE+f59sQdkWqUmOTYMJmgou190rvUbhn/oZ7uA26XHH4jX0d1Lzf1bB4mrpQWoFT4Bf
 /XFcmBOn4NZqCQEU/dNe6sd0AG8WTyxOuG2NH+h4B5KUwkv52Mv2u3ko1JYwFCeJ5iTG
 W/VQ==
X-Gm-Message-State: AOAM530rMsChDcEOnZRe8KMyQTcCBChXvmRuncy9uwR2jOKFYOXXmc9M
 btRYO77zDH6xUE592oAPHNAIenFGRh2fW6Qw
X-Google-Smtp-Source: ABdhPJwUd67m+EoAHM7iH3S+u8TN+tEuxduhq+Uo/11Pk+iMoJ6T4TqM9rdddMLF+1RMJyTFIJ+fPQ==
X-Received: by 2002:adf:f346:: with SMTP id e6mr624224wrp.179.1622735980410;
 Thu, 03 Jun 2021 08:59:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/45] hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
Date: Thu,  3 Jun 2021 16:58:52 +0100
Message-Id: <20210603155904.26021-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The ARM version of Hypervisor.framework no longer defines these two
types, so let's just revert to standard ones.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-7-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 5bec7b4d6dc..7370fcfba09 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -109,7 +109,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     macslot->present = 1;
     macslot->gpa_start = slot->start;
     macslot->size = slot->size;
-    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size, flags);
+    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
     assert_hvf_ok(ret);
     return 0;
 }
@@ -253,12 +253,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
     /* protect region against writes; begin tracking it */
     if (on) {
         slot->flags |= HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ);
     /* stop tracking region*/
     } else {
         slot->flags &= ~HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ | HV_MEMORY_WRITE);
     }
 }
-- 
2.20.1


