Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C63AF03E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:45:32 +0200 (CEST)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN3D-0005Ne-7C
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnN-0007JV-NZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnF-0007ck-3O
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so14316567wms.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QtQnDAe9S49mYd+BjvMt6hhZ7+BjmRl8I1duH98J0W4=;
 b=z3V2bamlrujyio6wIVS55jhSi4GDwpq1j5OGAZe04p76iApmDgpFIL6hoLrc2tnmjz
 maV1smL9He/VvOuvvV3tH2cskfyjQQZjhePdHNJ2dKi+H32eLCmcrcvnvB7W7EHRDSk4
 9wbkMw5lFIC/bnqM13LD4/9Q5UIP3PE/1cYG2tniBlkRdqkjYmc3INcGAd+BBCfLPMe2
 /PGWlOrSgZTnwRnT72P3u8hrPVryYJGP44eM+DSMnOAUvaW2NDlt12S/PrRJFtrfkN/D
 G4jGpHsSHZxkSt6NhU3Gv+PCWHrhdwf6EEtqxMbQ9V7OJLVmTBGZvER2AHXbyrPVuZve
 BXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtQnDAe9S49mYd+BjvMt6hhZ7+BjmRl8I1duH98J0W4=;
 b=hUHcMupxq+bZo1upcb63W7QrStRZVFLWr/yjP3dZwENihbb9AObVLxNjFc47oNyNtP
 Tu4RYkP9aOONoKlDPAg6R2D3NtaDAgLJvjHhylJc5Ay2W4XLJDrJZRV3+UjGHKOt4EGf
 8dY+G85u22KlUKpGEe8sa9np8WTjqB1avquPWuTUwzwyH5vb9daKCtCoAZfxuYQhp/GR
 atubL22B1sSbzb84f7HUR/ntX7RlrsFBNFIsG0AozUdxZHndAelgVwmyFtFJr7oMjV38
 U1bf8KqqfGNeYGo9jNZ17GjmyU1FYuBaTYs+rjhJZV4AHJfzS8TnaRoSRnad+2B5DaUm
 0VFQ==
X-Gm-Message-State: AOAM533KoSqneMAS6BguiL0sG08mhSc5wLEgT6+vocpU+/B80u38HZ07
 kdcngZnF24Dr/IEEQn5QG17wnjPZHC0dcwpj
X-Google-Smtp-Source: ABdhPJzXn0HkWLzH3uoN9Y++rWqHzBHWnH7jQ+PGZxT3LYIC0/pehioE4SOACkTrtw/7WR51PIgEiw==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr27678276wmq.13.1624292939775; 
 Mon, 21 Jun 2021 09:28:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/57] target/arm: Implement MVE VABD
Date: Mon, 21 Jun 2021 17:28:03 +0100
Message-Id: <20210621162833.32535-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Implement the MVE VABD insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-17-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 7 +++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5181d3b9413..5cd4e7d736d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -109,3 +109,10 @@ DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vabdsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 42d5504500c..087d3db2a31 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -93,6 +93,9 @@ VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
 VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 
+VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c040e42bda2..63eacd7349b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -424,3 +424,8 @@ DO_2OP_S(vmaxs, DO_MAX)
 DO_2OP_U(vmaxu, DO_MAX)
 DO_2OP_S(vmins, DO_MIN)
 DO_2OP_U(vminu, DO_MIN)
+
+#define DO_ABD(N, M)  ((N) >= (M) ? (N) - (M) : (M) - (N))
+
+DO_2OP_S(vabds, DO_ABD)
+DO_2OP_U(vabdu, DO_ABD)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 107c393a997..041fd1ef14f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -355,3 +355,5 @@ DO_2OP(VMAX_S, vmaxs)
 DO_2OP(VMAX_U, vmaxu)
 DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
+DO_2OP(VABD_S, vabds)
+DO_2OP(VABD_U, vabdu)
-- 
2.20.1


