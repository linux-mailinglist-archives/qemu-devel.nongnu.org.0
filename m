Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241386494D6
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:30:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OGF-0006v4-HR; Sun, 11 Dec 2022 10:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OG1-0006XQ-9T
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:50 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFn-0007Xy-Cy
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:39 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 z14-20020a9d65ce000000b0067059c25facso5840771oth.6
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6a8SyY9eZgzz8AJukTfXtGKf9OCDu+smgkxjoQH9ksA=;
 b=gvbPaXxWvlmWDqIkYhhurH84QUf1s67kFhC/ZOHYP+vBPZGmcZVCb9dcmwGKpp0WJp
 dJZmSOV9p5c1h9SX7K3oi8oAH1djJNhEBvuAqvuNG6EG6/WkaSzLWuhGb0NML1SDxNYB
 E14cqusnGgUNAtRC7lBwkFafSafa+aR48RzD21jlVe0grgN2Av8bxgBJDVrQy5z1VHvg
 9nxYSwFzok9seppscXJkxr6xdLvldPL4T75ZzceQ7MTWioiVxQFKsWhIW0L2yRYnGo49
 Coi/zZg17JsAncBH2PiRikOLtfCJpp6ozjOkQkfyb5vtIUxz9kYajCcRBVHFJW97fwJn
 56Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6a8SyY9eZgzz8AJukTfXtGKf9OCDu+smgkxjoQH9ksA=;
 b=xUV5JvF9La4gm+03OFeD6z5usc4xc59z4VDQiyALX61CQemjdETh9fC9epzcr3a6mu
 inwTLEnqhnoqo86DnVB6QB1xj9zWjsLnKOWtw93sWBAs8ztUnVOrb1FbGY1gZV/OVT4G
 6uQeCPmE/MwcpX5EtOAdhpp24KwHoKVH0+XBwJweqMs1e0yE5cECASbgwScmapEVDB/J
 5j9pyvaG8MznoOE14dLuQ0VMfITCrwMFNK7hGVvqwNxXW7EA38yZsulVRuKtlr6YstwL
 ppv7hX85aTIaTX/115T273VnwMldIARKwS05MeqOW02T9LzY+FI1qKWznv2zcCUiu9c3
 FuWQ==
X-Gm-Message-State: ANoB5pkWrEgyo568LwU0zFPmPhQan4rRYPMOaGfSl/0zHB49cAoj0hDC
 hESH1WaYunEaYW3mn6zzg+BPMRz6kKkRwju9x6w=
X-Google-Smtp-Source: AA0mqf7fUj9jUjP/iHc3yU/XYggOLBx+Zz7B4vlt7A8U2HGe14MWPTb20MwUO2xqc46ZxiXWUUeWhQ==
X-Received: by 2002:a9d:5e86:0:b0:670:48c6:2c8d with SMTP id
 f6-20020a9d5e86000000b0067048c62c8dmr6169354otl.28.1670772514481; 
 Sun, 11 Dec 2022 07:28:34 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 25/27] tests/tcg/s390x: Add per.S
Date: Sun, 11 Dec 2022 09:28:00 -0600
Message-Id: <20221211152802.923900-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to avoid regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221130174610.434590-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/per.S                   | 55 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 tests/tcg/s390x/per.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index d6ca8d7342..7ee69e78d8 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -9,3 +9,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+TESTS += per
diff --git a/tests/tcg/s390x/per.S b/tests/tcg/s390x/per.S
new file mode 100644
index 0000000000..02f8422c44
--- /dev/null
+++ b/tests/tcg/s390x/per.S
@@ -0,0 +1,55 @@
+#define N_ITERATIONS 10
+
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x96
+per_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1d0                         /* program new PSW */
+    .quad 0,pgm_handler
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe per_on_psw
+start_per:
+    lghi %r0,N_ITERATIONS
+    xgr %r1,%r1
+    lctlg %c9,%c11,per_on_regs
+loop:
+    brct %r0,loop
+    lctlg %c9,%c11,per_off_regs
+    cgijne %r1,N_ITERATIONS-1,fail     /* expected number of events? */
+    lpswe success_psw
+fail:
+    lpswe failure_psw
+
+pgm_handler:
+    chhsi program_interruption_code,0x80         /* PER event? */
+    jne fail
+    cli per_code,0x80                  /* successful-branching event? */
+    jne fail
+    la %r1,1(%r1)                      /* increment event counter */
+    mvc return_psw(8),program_old_psw
+    lg %r3,program_old_psw+8
+    llgc %r2,ilc
+    sgr %r3,%r2                        /* rewind PSW */
+    stg %r3,return_psw+8
+    lpswe return_psw
+
+    .align 8
+per_on_psw:
+    .quad 0x4000000000000000,start_per
+per_on_regs:
+    .quad 0x80000000,0,-1              /* successful-branching everywhere */
+per_off_regs:
+    .quad 0,0,0
+return_psw:
+    .quad 0,0
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.34.1


