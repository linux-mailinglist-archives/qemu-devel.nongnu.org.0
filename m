Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6A3506648
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:49:44 +0200 (CEST)
Received: from localhost ([::1]:59886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngicJ-00015c-Vc
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmR-0001J4-0W
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmO-0004bM-S2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id b19so20894429wrh.11
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7L4IeRSV0TUqkZzYtCMlxQlVhxwA60J0hTVN8JRD+w=;
 b=b2hR5+EJc/Vmls3N47VEJdhKeyyhItVaNU4zbxLnTLuP94POVgE3mvDMVvxv3dEdbK
 O2wLmuBBVvx2GB4YbOzh14rqcaK6eVhZu2E8yQUuDWI5lfwVn60ZG7zCXoIvk+fQeVPO
 UXZLN4Wy3X0UeHkDybJXYbdaTPGDJOrxaE6mOpaXSo25Qe7LS4iatGEHX9B4g/TBwNPQ
 Q4o0wYe3bWUlVXkbf3yXnp0yZa2VK3S64tYaCASr2Rq+5eNpfTo1EceZs9fCicCh3LJc
 av/uvp7zYBvPcMzN8yWn9sc3Je004IobWzeIhYDW0evm0ToCJ1x7QJGxx3n1GyKzkLwT
 aIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z7L4IeRSV0TUqkZzYtCMlxQlVhxwA60J0hTVN8JRD+w=;
 b=dSc1AJa8/dfGC9b02wQLDRTrIeJZ2HSigT+kwmjhL2b5W6nLAL8wkgqgNkHB2STQvh
 zHUgVFIH4nKdhxe7F72ptEsnslRMtyiyTWFFiMsSRCizF+ScvOYpzUz+F155o/hvw9q3
 jI90TahFBeUZtfrCkd57G3nEgXdsNAjH7dHmjWnMskjP2l07TVS0PpSvr5jxsmHDjKq+
 KMz43pndzuJEzn6nlU6DZyT+fPAOHpJo380ohjolgKWinZI9NyDEOud7Lw04XgIVQ30x
 KjAcugTwHw8W8SAnMWCa8SEibTgI86j2y8qauE3a9MLKHvOSJxSN/hQ0/fj5zHbdafcC
 0LvQ==
X-Gm-Message-State: AOAM533BaaLbwOrK3C4hKtfX4HS9mZXs8nFKTyQ5r6PCrEWFfwCkgOgA
 /uvWvkiHkMNp5xIuXoBfSpYPUWisMrFlLQ==
X-Google-Smtp-Source: ABdhPJz7jM3ByfUtggy39zB4+ETW6SwW6pJO4/yzlZ3+bDHXb6wwoOX6RPS5qUXjbxajdAoD3VMxRw==
X-Received: by 2002:a5d:49c1:0:b0:20a:a65b:4648 with SMTP id
 t1-20020a5d49c1000000b0020aa65b4648mr1375652wrs.707.1650347519511; 
 Mon, 18 Apr 2022 22:51:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 53/53] target/i386: Remove unused XMMReg,
 YMMReg types and CPUState fields
Date: Tue, 19 Apr 2022 07:51:09 +0200
Message-Id: <20220419055109.142788-54-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In commit b7711471f5 in 2014 we refactored the handling of the x86
vector registers so that instead of separate structs XMMReg, YMMReg
and ZMMReg for representing the 16-byte, 32-byte and 64-byte width
vector registers and multiple fields in the CPU state, we have a
single type (XMMReg, later renamed to ZMMReg) and a single struct
field (xmm_regs).  However, in 2017 in commit c97d6d2cdf97ed some of
the old struct types and CPU state fields got added back, when we
merged in the hvf support (which had developed in a separate fork
that had presumably not had the refactoring of b7711471f5), as part
of code handling xsave.  Commit f585195ec07 then almost immediately
dropped that xsave code again in favour of sharing the xsave handling
with KVM, but forgot to remove the now unused CPU state fields and
struct types.

Delete the unused types and CPUState fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220412110047.1497190-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6b61124887..9661f9fbd1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1219,20 +1219,6 @@ typedef struct SegmentCache {
         float64  _d_##n[(bits)/64]; \
     }
 
-typedef union {
-    uint8_t _b[16];
-    uint16_t _w[8];
-    uint32_t _l[4];
-    uint64_t _q[2];
-} XMMReg;
-
-typedef union {
-    uint8_t _b[32];
-    uint16_t _w[16];
-    uint32_t _l[8];
-    uint64_t _q[4];
-} YMMReg;
-
 typedef MMREG_UNION(ZMMReg, 512) ZMMReg;
 typedef MMREG_UNION(MMXReg, 64)  MMXReg;
 
@@ -1531,11 +1517,7 @@ typedef struct CPUArchState {
     ZMMReg xmm_t0;
     MMXReg mmx_t0;
 
-    XMMReg ymmh_regs[CPU_NB_REGS];
-
     uint64_t opmask_regs[NB_OPMASK_REGS];
-    YMMReg zmmh_regs[CPU_NB_REGS];
-    ZMMReg hi16_zmm_regs[CPU_NB_REGS];
 #ifdef TARGET_X86_64
     uint8_t xtilecfg[64];
     uint8_t xtiledata[8192];
-- 
2.35.1


