Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD2161224C
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 13:19:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oojqd-0004hc-EH; Sat, 29 Oct 2022 07:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oojqZ-0004hO-R1; Sat, 29 Oct 2022 07:17:51 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oojqY-0004w2-3n; Sat, 29 Oct 2022 07:17:51 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso4362443otb.6; 
 Sat, 29 Oct 2022 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oN/exz7a+Pegz2+CvEj9APn6wSYtIT21F/MMCKKuUSE=;
 b=e5mFrOzRkABLQkStKE2deJx7jvcs8iQiSBNTeJqPdFG5vi+quNYERf8uA6K8vrtvCP
 0l2SAOBLHxN5RqgLcQRxzJ69rvAjlB8ZgPgga5gZJ8scpaAg1pRCRuQH3w/Dn3yDxxXo
 m2f7JqhqFfe532A7sT81FNDtL4m338BYgsQcvdZYABQtRrq9Qn70QEsgG/lgbvw8G3mh
 tIsGTvcDFOxWralJhAAG0wmpXLnDn16oI+oyUzXUvKVODdSH43LKMBkj0phVXPwzZzgj
 HAv/CijTh0unhdoFL3dZF7cXBeuktbvCLIgoZTEkqXjALA2Wi4n7UwTNtViBgREN49lc
 hNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oN/exz7a+Pegz2+CvEj9APn6wSYtIT21F/MMCKKuUSE=;
 b=bYgBNVVbz0SsHfnC6FcGHvPPcB3KdHb+gJ2IW7s/aKNGXTPg5FvMWaNYrbGeEluzyr
 yz8NsJI4lVKPiqRNxM7sW9oZHTtk+eIT62EF4CskNplDrDB/2UYB0Ov+OBkkO+GfNk8w
 N7wY/d/5m66mh7SlF7RqcoMeXk+doilCajsmgP4MzpAOLgCK8Oyge7BDLuwDNlCTmrSN
 bb2sD4BB9kPcjGL+jXRLfuYFNfmn1b2HeeRKwESMYuQMFTP1dJskffAPuckwAwGJB8pj
 kmz/fVv5H1EF+GkEQj465MEM+UGCUpyWFueFWkfx3/YMTkk53+IyrnjYjTtGryMuJ8ri
 Iwkg==
X-Gm-Message-State: ACrzQf2oeX9Vx+Jqx+E8GRRYh17XwYIn6T+56LOFyFNASI1h5VoYQ229
 ycJ5tk0/RF7G3du9tkyj2sXUzcNHn4A0uA==
X-Google-Smtp-Source: AMsMyM643TSDRYqzF8etlhXF3J/Mbnw/NiN74wykEGHTqBwD0Fe020dNWvRi3/HUI4yqdlJWTBjGtw==
X-Received: by 2002:a9d:12a6:0:b0:661:d26c:708c with SMTP id
 g35-20020a9d12a6000000b00661d26c708cmr1875216otg.160.1667042268103; 
 Sat, 29 Oct 2022 04:17:48 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a9d6c19000000b00661a05691fasm494163otq.79.2022.10.29.04.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:17:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Victor Colombo <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 63/63] target/ppc: Fix regression in Radix MMU
Date: Sat, 29 Oct 2022 08:17:27 -0300
Message-Id: <20221029111727.1065252-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029111727.1065252-1-danielhb413@gmail.com>
References: <20221029111727.1065252-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Commit 47e83d9107 ended up unintentionally changing the control flow
of ppc_radix64_process_scoped_xlate(). When guest_visible is false,
it must not raise an exception, even if the radix configuration is
not valid.

This regression prevented Linux boot in a nested environment with
L1 using TCG and emulating KVM (cap-nested-hv=on) and L2 using
KVM. L2 would hang on Linux's futex_init(), when it tested how a
futex_atomic_cmpxchg_inatomic() handled a fault, because L1 would
start a loop of trying to perform partition scoped translations
and raising exceptions.

Fixes: 47e83d9107 ("target/ppc: Improve Radix xlate level validation")
Reported-by: Victor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Tested-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221028183617.121786-1-leandro.lupori@eldorado.org.br>
[danielhb: use %"PRIu64" to print 'nls']
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/mmu-radix64.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 00f2e9fa2e..031efda0df 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -238,6 +238,8 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
 
 static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
 {
+    bool ret;
+
     /*
      * Check if this is a valid level, according to POWER9 and POWER10
      * Processor User's Manuals, sections 4.10.4.1 and 5.10.6.1, respectively:
@@ -249,16 +251,25 @@ static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
      */
     switch (level) {
     case 0:     /* Root Page Dir */
-        return psize == 52 && nls == 13;
+        ret = psize == 52 && nls == 13;
+        break;
     case 1:
     case 2:
-        return nls == 9;
+        ret = nls == 9;
+        break;
     case 3:
-        return nls == 9 || nls == 5;
+        ret = nls == 9 || nls == 5;
+        break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix level: %d\n", level);
-        return false;
+        ret = false;
+    }
+
+    if (unlikely(!ret)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix configuration: "
+                      "level %d size %d nls %"PRIu64"\n",
+                      level, psize, nls);
     }
+    return ret;
 }
 
 static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
@@ -519,11 +530,13 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
 
             if (!ppc_radix64_is_valid_level(level++, *g_page_size, nls)) {
                 fault_cause |= DSISR_R_BADCONFIG;
-                return 1;
+                ret = 1;
+            } else {
+                ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK,
+                                             &h_raddr, &nls, g_page_size,
+                                             &pte, &fault_cause);
             }
 
-            ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK, &h_raddr,
-                                         &nls, g_page_size, &pte, &fault_cause);
             if (ret) {
                 /* No valid pte */
                 if (guest_visible) {
-- 
2.37.3


