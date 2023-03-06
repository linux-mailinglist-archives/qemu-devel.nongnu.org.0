Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D66AB3D8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYytn-0004Pj-TC; Sun, 05 Mar 2023 19:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytZ-0004O4-7p
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:05 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytX-0006NZ-Ca
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:04 -0500
Received: by mail-pj1-x1029.google.com with SMTP id kb15so8171671pjb.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TkEN34DJDutuRTHXFmA2vuNe5wTUw1X2Ctodk8NtTM=;
 b=B4wbkgOKSahL36KgDlRN/0oLtRidwfXDwrnWxk7HVsBxizMHmMDmIpv3aYEsy7gkOV
 AgLR0dQBTedDPuMPpHp5aN850ifWfsZnE0lHU56dIyyQ6vLYwcvoO5IU09zLC0GX+52Z
 BRvY5MeqL+sL7DLGLUjOvJJlgW4njePeBUrGInXw0zKzH7SzHr1Qfe5tRWDQh8Qr0eif
 vaTuB6gF8TPrWUco9rX/ujPo+AriQX4b4BToss4EE34QQ6TSuUpFrnuZJimUlrYtboy5
 xqFUUdbEzP9pjEsq4g6HepavU8scRj1x8mf8qtCzevJCJsbm1Vn6YBSkYTLE65Gr/u3i
 GaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5TkEN34DJDutuRTHXFmA2vuNe5wTUw1X2Ctodk8NtTM=;
 b=s1svpw7u+glV5TBjet38ORrM3BH7mzOGN2a6iPRIcyinR5tmPaNLDlJ+CFyLcIBzIo
 dxOuOXJxd024R13POkIHs7hAWKb01KclrdB2S7WDDGpVHkiLwLo/FugL2SuqZ82VOPDH
 wvK+8TXIznQN3WK56tl2IwdPYYxJQS+bPBdWEQtPKf/NzVRz+Ran6vvemvNteqedimnn
 JxLESR9yVEBXRaFNIJvdvCpUpsbOEFKQ8JIyOjPBkC5o9ao2y9sljSqUEsVDZqTfKR/I
 dfV+yc0X9retZJc9kJe64iLhyJAz/jVdmbhelMUtrMtoYSdzhblu7MnAygqppNKMQn8i
 VmFw==
X-Gm-Message-State: AO0yUKWVCDe/sln4InWWpOqGnRqNqFG1l+ul0d2lOxHotKwjU+XKn/GC
 gKkz9K6r5W1lJ0XQU8tKFM1Po7e3IU+rVI6gAVomPw==
X-Google-Smtp-Source: AK7set/nDzL2g7A+d3O2mI7Y/Zm42muRVw6IpU1PQMNbelRKUIwUNrUJ4MmcPchEyg/rJUYgSWoMWA==
X-Received: by 2002:a17:90b:1d0f:b0:234:2485:6743 with SMTP id
 on15-20020a17090b1d0f00b0023424856743mr9274162pjb.3.1678063201362; 
 Sun, 05 Mar 2023 16:40:01 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 06/84] accel/tcg: Honor TLB_DISCARD_WRITE in atomic_mmu_lookup
Date: Sun,  5 Mar 2023 16:38:36 -0800
Message-Id: <20230306003954.1866998-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Using an atomic write or read-write insn on ROM is basically
a happens-never case.  Handle it via stop-the-world, which
will generate non-atomic serial code, where we can correctly
ignore the write while producing the correct read result.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index deafcc7f15..b49fb0d754 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1831,7 +1831,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     }
 
     /* Notice an IO access or a needs-MMU-lookup access */
-    if (unlikely(tlb_addr & TLB_MMIO)) {
+    if (unlikely(tlb_addr & (TLB_MMIO | TLB_DISCARD_WRITE))) {
         /* There's really nothing that can be done to
            support this apart from stop-the-world.  */
         goto stop_the_world;
-- 
2.34.1


