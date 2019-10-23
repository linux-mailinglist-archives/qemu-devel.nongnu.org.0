Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901AE2177
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 19:11:27 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNKAP-00014S-Ov
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 13:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNItY-0000M4-Jn
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:49:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNItX-0001Rr-BC
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:49:56 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:33558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNItX-0001RN-2t
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:49:55 -0400
Received: by mail-qt1-x843.google.com with SMTP id r5so33032337qtd.0
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=2y8GjcHaXNcISE1+NhQOJSVY8e02AaZyazCWqJfapIQ=;
 b=Nln3Pzx7zx6PBwo+n0YJLLl5EFz9tT4eDm/eSg6n9yqWKPqjhaTHCtBAtpTst9eo4/
 X1deF8pyAMKLvNXWtidb9drlRtuSA2uwTHbfBYFKnMV6aINX26cf88YNnTLwnlkYQgYR
 ShzOozK6OQPHzcXSKF99ufrRCXvbBkIAloZt01JoOecvFm3YBc5rPLVRPVRKW7FZVVvG
 2ekGRkN8impHKAQ6OLaO2Y0kjwdJg2M8M2Wncs+lFj7lZ/Yna1LAFoTs5opVs6DwYJBy
 92KK+oG31QuggGKkiyoetW6rLEhTCQBwrfmcSG9d3a8RvRI+MtfsjoBADG7W0dZVWrhr
 7wbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2y8GjcHaXNcISE1+NhQOJSVY8e02AaZyazCWqJfapIQ=;
 b=HflAj8sZP98vR4rz6BzF/17QUCCPwqJOfzM8uzoHYSoo1S2FngCJiSmJLMcihfNkt8
 c0rp9eWusA1w+K6AnMWqz0fp99mKcX2UDFTpCouNlLUFr8eq0zEcR8yGuOPNeUOpuq3T
 eap6eqGsp3gk3vd2Tr9GYVgeRxHc9PBOwYNZyftTmrlnKtCp5yA6tQIGBTHXb7j+K10C
 KZRD9r1tAluBCmVHfsBYXyKsXvbkI05cdr3QkuNBxv+eUx5vhPWxDG6GITWwS4ljVGGP
 gDuj4rRBP8CLxc3O4bF0SI5neRBvAkw89Qbgt67+i+GBYQE23jeU9V+XOInu/Qh/baBJ
 y/iw==
X-Gm-Message-State: APjAAAXtZjt0h9oBVBBXa79PGHs3DesoWkDi3/oT1bZeEDffD3KC8b9F
 diuVu686u6FXyDCKmyE+bQ7w8fzCXJA=
X-Google-Smtp-Source: APXvYqw85rCEmW2C+2Z//DN7xCTkJYr0PNLxPFxLiF0MA3KEAFtakqXibfYBnfWC2qJohp6z5/lxsA==
X-Received: by 2002:ac8:901:: with SMTP id t1mr9840793qth.47.1571845793718;
 Wed, 23 Oct 2019 08:49:53 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-50.nyc.biz.rr.com.
 [172.254.253.50])
 by smtp.gmail.com with ESMTPSA id t13sm8271823qtn.18.2019.10.23.08.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:49:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] cputlb: Fix tlb_vaddr_to_host
Date: Wed, 23 Oct 2019 11:49:52 -0400
Message-Id: <20191023154952.30731-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using uintptr_t instead of target_ulong meant that, for 64-bit guest
and 32-bit host, we truncated the guest address comparator and so may
not hit the tlb when we should.

Fixes: 4811e9095c0
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Fixes aarch64 emulation on arm32 host, after our recent changes
to tlb probing.


r~

---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6f4194df96..5eebddcca8 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1189,7 +1189,7 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
                         MMUAccessType access_type, int mmu_idx)
 {
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-    uintptr_t tlb_addr, page;
+    target_ulong tlb_addr, page;
     size_t elt_ofs;
 
     switch (access_type) {
-- 
2.17.1


