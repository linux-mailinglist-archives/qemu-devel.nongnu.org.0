Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9813B6BBA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 02:31:42 +0200 (CEST)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly1f8-0006q2-2R
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 20:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ly1dG-00057g-LR
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 20:29:42 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ly1d9-0005Im-6b
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 20:29:42 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so689012pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 17:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+3HGQgYibMAAJr0pIQE8PlPZbqyc1oCSZXtkOx/y8I=;
 b=ZixUNAy9Vr89LQcajOwhSSp6O4O5BEUApefbQaa867+mgKwNqZwvWLFbvZEvUucQXI
 CAETHT/sbHPUHIwGNfNZAPK5ho4XMuhOkvjdlm5yxNGgU0Im9Cs8oN2bYJl8rokjH1z7
 R382FlWhcn+n715ud9KnBN11fc643ye2hrmPX7Gszuhg6qiz97949oku2t+oTGudh6fd
 Diz+8Dp9oVaWUbkArtc6+2lEVt/F9/F3wJXJNHEmMUSGHhDI8kFUIsU9nzZ+LBGR2lhj
 XskzhtqG2xrVzkD/gOqDGHGVpZJoacdsgHBlORckVvYUPERkSOByb05Yc++KJFLNTbrE
 nrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+3HGQgYibMAAJr0pIQE8PlPZbqyc1oCSZXtkOx/y8I=;
 b=IZfaLzpvWRkmjN/oBOzAVc8pP/pdwh+V2jkPIXsOciTl+i5ZAwuoN0DWWViAzYHdqn
 SD4d3zKQd1QcMq8TONK9DAqXIoYEL9+yX/TW8+HIos5UfjG+IMegN42XgNVfB7TwenZL
 xrkAD5lIhJj7h9MVQ+HhdcV2Sp70fKuSIeZzK6u64QRUo0WlBv4k+gqgic0lIH/X6L5l
 4M1k8pl6fjABRl5To7TnyGy7Y7yanHBsujqUxHbGlCD1eaEFTDDag4sGcRUDXnqfhd05
 sacWBGjMt3JvqHuAM8V7+CfLhShka8dJLfevhXDO8cBWjj5+PIHy93MUmoPF9ElaedB5
 03hw==
X-Gm-Message-State: AOAM5314Ks9Hgbtb6C+UwPu8FRdE5ZOZOky6fmFUDrBmzeYlw4NC8wGo
 nc4v8OOoi6o4Ifp6FCBWb3I/DCoZLj3N3A==
X-Google-Smtp-Source: ABdhPJxKMAkiNAUNPcEjUIGvgmaFGMr1NU9uOGgQGVrHFF7oYINhA4xuLGAD2YFFEGGB7TOWCgv0FQ==
X-Received: by 2002:a17:90a:1382:: with SMTP id
 i2mr40363563pja.221.1624926572593; 
 Mon, 28 Jun 2021 17:29:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c2sm15856159pjv.10.2021.06.28.17.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 17:29:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/s390x: Use explicit stores to env->cc_op
Date: Mon, 28 Jun 2021 17:29:30 -0700
Message-Id: <20210629002930.3013776-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: ulrich.weigand@de.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove cc_op as a TCG global and store to it directly.
This will help simplify the fix for some fpu bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h        |  98 ++++++-------
 target/s390x/crypto_helper.c |   6 +-
 target/s390x/fpu_helper.c    |  40 +++---
 target/s390x/mem_helper.c    | 265 ++++++++++++++++++-----------------
 target/s390x/misc_helper.c   |  39 +++---
 target/s390x/translate.c     | 218 ++++++++++++++--------------
 6 files changed, 344 insertions(+), 322 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index ba045f559d..bd4d315f3a 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -1,14 +1,14 @@
 DEF_HELPER_2(exception, noreturn, env, i32)
 DEF_HELPER_2(data_exception, noreturn, env, i32)
-DEF_HELPER_FLAGS_4(nc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
-DEF_HELPER_FLAGS_4(oc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
-DEF_HELPER_FLAGS_4(xc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
+DEF_HELPER_FLAGS_4(nc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
+DEF_HELPER_FLAGS_4(oc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
+DEF_HELPER_FLAGS_4(xc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvcin, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
-DEF_HELPER_3(mvcl, i32, env, i32, i32)
-DEF_HELPER_3(clcl, i32, env, i32, i32)
-DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
+DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
+DEF_HELPER_3(mvcl, void, env, i32, i32)
+DEF_HELPER_3(clcl, void, env, i32, i32)
+DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, void, env, i32, i32, i64)
 DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, s64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
@@ -18,16 +18,16 @@ DEF_HELPER_3(srstu, void, env, i32, i32)
 DEF_HELPER_4(clst, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvn, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvo, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i32, i32)
+DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, void, env, i64, i32, i32)
 DEF_HELPER_FLAGS_4(mvz, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_3(mvst, i32, env, i32, i32)
+DEF_HELPER_3(mvst, void, env, i32, i32)
 DEF_HELPER_4(ex, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(stam, TCG_CALL_NO_WG, void, env, i32, i64, i32)
 DEF_HELPER_FLAGS_4(lam, TCG_CALL_NO_WG, void, env, i32, i64, i32)
-DEF_HELPER_4(mvcle, i32, env, i32, i64, i32)
-DEF_HELPER_4(mvclu, i32, env, i32, i64, i32)
-DEF_HELPER_4(clcle, i32, env, i32, i64, i32)
-DEF_HELPER_4(clclu, i32, env, i32, i64, i32)
+DEF_HELPER_4(mvcle, void, env, i32, i64, i32)
+DEF_HELPER_4(mvclu, void, env, i32, i64, i32)
+DEF_HELPER_4(clcle, void, env, i32, i64, i32)
+DEF_HELPER_4(clclu, void, env, i32, i64, i32)
 DEF_HELPER_3(cegb, i64, env, s64, i32)
 DEF_HELPER_3(cdgb, i64, env, s64, i32)
 DEF_HELPER_3(cxgb, i64, env, s64, i32)
@@ -36,8 +36,8 @@ DEF_HELPER_3(cdlgb, i64, env, i64, i32)
 DEF_HELPER_3(cxlgb, i64, env, i64, i32)
 DEF_HELPER_4(cdsg, void, env, i64, i32, i32)
 DEF_HELPER_4(cdsg_parallel, void, env, i64, i32, i32)
-DEF_HELPER_4(csst, i32, env, i32, i64, i64)
-DEF_HELPER_4(csst_parallel, i32, env, i32, i64, i64)
+DEF_HELPER_4(csst, void, env, i32, i64, i64)
+DEF_HELPER_4(csst_parallel, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_3(aeb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(adb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_5(axb, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i64)
@@ -58,12 +58,12 @@ DEF_HELPER_FLAGS_2(lxdb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(lxeb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(ledb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_4(lexb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
-DEF_HELPER_FLAGS_3(ceb, TCG_CALL_NO_WG_SE, i32, env, i64, i64)
-DEF_HELPER_FLAGS_3(cdb, TCG_CALL_NO_WG_SE, i32, env, i64, i64)
-DEF_HELPER_FLAGS_5(cxb, TCG_CALL_NO_WG_SE, i32, env, i64, i64, i64, i64)
-DEF_HELPER_FLAGS_3(keb, TCG_CALL_NO_WG, i32, env, i64, i64)
-DEF_HELPER_FLAGS_3(kdb, TCG_CALL_NO_WG, i32, env, i64, i64)
-DEF_HELPER_FLAGS_5(kxb, TCG_CALL_NO_WG, i32, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_3(ceb, TCG_CALL_NO_WG_SE, void, env, i64, i64)
+DEF_HELPER_FLAGS_3(cdb, TCG_CALL_NO_WG_SE, void, env, i64, i64)
+DEF_HELPER_FLAGS_5(cxb, TCG_CALL_NO_WG_SE, void, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_3(keb, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_3(kdb, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_5(kxb, TCG_CALL_NO_WG, void, env, i64, i64, i64, i64)
 DEF_HELPER_FLAGS_3(cgeb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(cgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_4(cgxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
@@ -83,9 +83,9 @@ DEF_HELPER_FLAGS_4(maeb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(madb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mseb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(msdb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_3(tceb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64)
-DEF_HELPER_FLAGS_3(tcdb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64)
-DEF_HELPER_FLAGS_4(tcxb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(tceb, TCG_CALL_NO_RWG_SE, void, env, i64, i64)
+DEF_HELPER_FLAGS_3(tcdb, TCG_CALL_NO_RWG_SE, void, env, i64, i64)
+DEF_HELPER_FLAGS_4(tcxb, TCG_CALL_NO_RWG_SE, void, env, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sqeb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(sqdb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(sqxb, TCG_CALL_NO_WG, i64, env, i64, i64)
@@ -94,33 +94,33 @@ DEF_HELPER_FLAGS_4(pack, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(pka, TCG_CALL_NO_WG, void, env, i64, i64, i32)
 DEF_HELPER_FLAGS_4(pku, TCG_CALL_NO_WG, void, env, i64, i64, i32)
 DEF_HELPER_FLAGS_4(unpk, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_FLAGS_4(unpka, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
-DEF_HELPER_FLAGS_4(unpku, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
-DEF_HELPER_FLAGS_3(tp, TCG_CALL_NO_WG, i32, env, i64, i32)
+DEF_HELPER_FLAGS_4(unpka, TCG_CALL_NO_WG, void, env, i64, i32, i64)
+DEF_HELPER_FLAGS_4(unpku, TCG_CALL_NO_WG, void, env, i64, i32, i64)
+DEF_HELPER_FLAGS_3(tp, TCG_CALL_NO_WG, void, env, i64, i32)
 DEF_HELPER_FLAGS_4(tr, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_4(tre, i64, env, i64, i64, i64)
-DEF_HELPER_4(trt, i32, env, i32, i64, i64)
-DEF_HELPER_4(trtr, i32, env, i32, i64, i64)
-DEF_HELPER_5(trXX, i32, env, i32, i32, i32, i32)
+DEF_HELPER_4(trt, void, env, i32, i64, i64)
+DEF_HELPER_4(trtr, void, env, i32, i64, i64)
+DEF_HELPER_5(trXX, void, env, i32, i32, i32, i32)
 DEF_HELPER_4(cksm, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_5(calc_cc, TCG_CALL_NO_RWG_SE, i32, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sfpc, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(sfas, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(srnm, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_1(popcnt, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_2(stfle, i32, env, i64)
+DEF_HELPER_2(stfle, void, env, i64)
 DEF_HELPER_FLAGS_2(lpq, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(lpq_parallel, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_4(stpq, TCG_CALL_NO_WG, void, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(stpq_parallel, TCG_CALL_NO_WG, void, env, i64, i64, i64)
-DEF_HELPER_4(mvcos, i32, env, i64, i64, i64)
-DEF_HELPER_4(cu12, i32, env, i32, i32, i32)
-DEF_HELPER_4(cu14, i32, env, i32, i32, i32)
-DEF_HELPER_4(cu21, i32, env, i32, i32, i32)
-DEF_HELPER_4(cu24, i32, env, i32, i32, i32)
-DEF_HELPER_4(cu41, i32, env, i32, i32, i32)
-DEF_HELPER_4(cu42, i32, env, i32, i32, i32)
-DEF_HELPER_5(msa, i32, env, i32, i32, i32, i32)
+DEF_HELPER_4(mvcos, void, env, i64, i64, i64)
+DEF_HELPER_4(cu12, void, env, i32, i32, i32)
+DEF_HELPER_4(cu14, void, env, i32, i32, i32)
+DEF_HELPER_4(cu21, void, env, i32, i32, i32)
+DEF_HELPER_4(cu24, void, env, i32, i32, i32)
+DEF_HELPER_4(cu41, void, env, i32, i32, i32)
+DEF_HELPER_4(cu42, void, env, i32, i32, i32)
+DEF_HELPER_5(msa, void, env, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_1(stpt, TCG_CALL_NO_RWG, i64, env)
 DEF_HELPER_FLAGS_1(stck, TCG_CALL_NO_RWG_SE, i64, env)
 DEF_HELPER_FLAGS_3(probe_write_access, TCG_CALL_NO_WG, void, env, i64, i64)
@@ -320,28 +320,28 @@ DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci128, void, ptr, cptr, env, i32)
 
 #ifndef CONFIG_USER_ONLY
-DEF_HELPER_3(servc, i32, env, i64, i64)
+DEF_HELPER_3(servc, void, env, i64, i64)
 DEF_HELPER_4(diag, void, env, i32, i32, i32)
 DEF_HELPER_3(load_psw, noreturn, env, i64, i64)
 DEF_HELPER_FLAGS_2(spx, TCG_CALL_NO_RWG, void, env, i64)
-DEF_HELPER_FLAGS_2(sck, TCG_CALL_NO_RWG, i32, env, i64)
+DEF_HELPER_FLAGS_2(sck, TCG_CALL_NO_RWG, void, env, i64)
 DEF_HELPER_FLAGS_2(sckc, TCG_CALL_NO_RWG, void, env, i64)
 DEF_HELPER_FLAGS_2(sckpf, TCG_CALL_NO_RWG, void, env, i64)
 DEF_HELPER_FLAGS_1(stckc, TCG_CALL_NO_RWG, i64, env)
 DEF_HELPER_FLAGS_2(spt, TCG_CALL_NO_RWG, void, env, i64)
-DEF_HELPER_4(stsi, i32, env, i64, i64, i64)
+DEF_HELPER_4(stsi, void, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(lctl, TCG_CALL_NO_WG, void, env, i32, i64, i32)
 DEF_HELPER_FLAGS_4(lctlg, TCG_CALL_NO_WG, void, env, i32, i64, i32)
 DEF_HELPER_FLAGS_4(stctl, TCG_CALL_NO_WG, void, env, i32, i64, i32)
 DEF_HELPER_FLAGS_4(stctg, TCG_CALL_NO_WG, void, env, i32, i64, i32)
-DEF_HELPER_FLAGS_2(testblock, TCG_CALL_NO_WG, i32, env, i64)
-DEF_HELPER_FLAGS_3(tprot, TCG_CALL_NO_WG, i32, env, i64, i64)
+DEF_HELPER_FLAGS_2(testblock, TCG_CALL_NO_WG, void, env, i64)
+DEF_HELPER_FLAGS_3(tprot, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_2(iske, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_3(sske, TCG_CALL_NO_RWG, void, env, i64, i64)
-DEF_HELPER_FLAGS_2(rrbe, TCG_CALL_NO_RWG, i32, env, i64)
-DEF_HELPER_4(mvcs, i32, env, i64, i64, i64)
-DEF_HELPER_4(mvcp, i32, env, i64, i64, i64)
-DEF_HELPER_4(sigp, i32, env, i64, i32, i32)
+DEF_HELPER_FLAGS_2(rrbe, TCG_CALL_NO_RWG, void, env, i64)
+DEF_HELPER_4(mvcs, void, env, i64, i64, i64)
+DEF_HELPER_4(mvcp, void, env, i64, i64, i64)
+DEF_HELPER_4(sigp, void, env, i64, i32, i32)
 DEF_HELPER_FLAGS_2(sacf, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_4(idte, TCG_CALL_NO_RWG, void, env, i64, i64, i32)
 DEF_HELPER_FLAGS_4(ipte, TCG_CALL_NO_RWG, void, env, i64, i64, i32)
@@ -365,7 +365,7 @@ DEF_HELPER_4(schm, void, env, i64, i64, i64)
 DEF_HELPER_3(ssch, void, env, i64, i64)
 DEF_HELPER_2(stcrw, void, env, i64)
 DEF_HELPER_3(stsch, void, env, i64, i64)
-DEF_HELPER_2(tpi, i32, env, i64)
+DEF_HELPER_2(tpi, void, env, i64)
 DEF_HELPER_3(tsch, void, env, i64, i64)
 DEF_HELPER_2(chsc, void, env, i64)
 
diff --git a/target/s390x/crypto_helper.c b/target/s390x/crypto_helper.c
index ff3fbc3950..b3cae31920 100644
--- a/target/s390x/crypto_helper.c
+++ b/target/s390x/crypto_helper.c
@@ -18,8 +18,8 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
-uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
-                     uint32_t type)
+void HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2,
+                 uint32_t r3, uint32_t type)
 {
     const uintptr_t ra = GETPC();
     const uint8_t mod = env->regs[0] & 0x80ULL;
@@ -57,5 +57,5 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
         g_assert_not_reached();
     }
 
-    return 0;
+    env->cc_op = 0;
 }
diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
index 13af158748..259b9ca7c4 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/fpu_helper.c
@@ -366,30 +366,30 @@ uint64_t HELPER(lexb)(CPUS390XState *env, uint64_t ah, uint64_t al,
 }
 
 /* 32-bit FP compare */
-uint32_t HELPER(ceb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
+void HELPER(ceb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 {
     FloatRelation cmp = float32_compare_quiet(f1, f2, &env->fpu_status);
     handle_exceptions(env, false, GETPC());
-    return float_comp_to_cc(env, cmp);
+    env->cc_op = float_comp_to_cc(env, cmp);
 }
 
 /* 64-bit FP compare */
-uint32_t HELPER(cdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
+void HELPER(cdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 {
     FloatRelation cmp = float64_compare_quiet(f1, f2, &env->fpu_status);
     handle_exceptions(env, false, GETPC());
-    return float_comp_to_cc(env, cmp);
+    env->cc_op = float_comp_to_cc(env, cmp);
 }
 
 /* 128-bit FP compare */
-uint32_t HELPER(cxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+void HELPER(cxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
+                 uint64_t bh, uint64_t bl)
 {
     FloatRelation cmp = float128_compare_quiet(make_float128(ah, al),
                                                make_float128(bh, bl),
                                                &env->fpu_status);
     handle_exceptions(env, false, GETPC());
-    return float_comp_to_cc(env, cmp);
+    env->cc_op = float_comp_to_cc(env, cmp);
 }
 
 int s390_swap_bfp_rounding_mode(CPUS390XState *env, int m3)
@@ -706,30 +706,30 @@ uint64_t HELPER(fixb)(CPUS390XState *env, uint64_t ah, uint64_t al,
 }
 
 /* 32-bit FP compare and signal */
-uint32_t HELPER(keb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
+void HELPER(keb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 {
     FloatRelation cmp = float32_compare(f1, f2, &env->fpu_status);
     handle_exceptions(env, false, GETPC());
-    return float_comp_to_cc(env, cmp);
+    env->cc_op = float_comp_to_cc(env, cmp);
 }
 
 /* 64-bit FP compare and signal */
-uint32_t HELPER(kdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
+void HELPER(kdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 {
     FloatRelation cmp = float64_compare(f1, f2, &env->fpu_status);
     handle_exceptions(env, false, GETPC());
-    return float_comp_to_cc(env, cmp);
+    env->cc_op = float_comp_to_cc(env, cmp);
 }
 
 /* 128-bit FP compare and signal */
-uint32_t HELPER(kxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+void HELPER(kxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
+                 uint64_t bh, uint64_t bl)
 {
     FloatRelation cmp = float128_compare(make_float128(ah, al),
                                          make_float128(bh, bl),
                                          &env->fpu_status);
     handle_exceptions(env, false, GETPC());
-    return float_comp_to_cc(env, cmp);
+    env->cc_op = float_comp_to_cc(env, cmp);
 }
 
 /* 32-bit FP multiply and add */
@@ -801,21 +801,21 @@ DEF_FLOAT_DCMASK(float64)
 DEF_FLOAT_DCMASK(float128)
 
 /* test data class 32-bit */
-uint32_t HELPER(tceb)(CPUS390XState *env, uint64_t f1, uint64_t m2)
+void HELPER(tceb)(CPUS390XState *env, uint64_t f1, uint64_t m2)
 {
-    return (m2 & float32_dcmask(env, f1)) != 0;
+    env->cc_op = (m2 & float32_dcmask(env, f1)) != 0;
 }
 
 /* test data class 64-bit */
-uint32_t HELPER(tcdb)(CPUS390XState *env, uint64_t v1, uint64_t m2)
+void HELPER(tcdb)(CPUS390XState *env, uint64_t v1, uint64_t m2)
 {
-    return (m2 & float64_dcmask(env, v1)) != 0;
+    env->cc_op = (m2 & float64_dcmask(env, v1)) != 0;
 }
 
 /* test data class 128-bit */
-uint32_t HELPER(tcxb)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t m2)
+void HELPER(tcxb)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t m2)
 {
-    return (m2 & float128_dcmask(env, make_float128(ah, al))) != 0;
+    env->cc_op = (m2 & float128_dcmask(env, make_float128(ah, al))) != 0;
 }
 
 /* square root 32-bit */
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index f6a7d29273..ac05073021 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -431,10 +431,9 @@ static uint32_t do_helper_nc(CPUS390XState *env, uint32_t l, uint64_t dest,
     return c != 0;
 }
 
-uint32_t HELPER(nc)(CPUS390XState *env, uint32_t l, uint64_t dest,
-                    uint64_t src)
+void HELPER(nc)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
 {
-    return do_helper_nc(env, l, dest, src, GETPC());
+    env->cc_op = do_helper_nc(env, l, dest, src, GETPC());
 }
 
 /* xor on array */
@@ -472,10 +471,9 @@ static uint32_t do_helper_xc(CPUS390XState *env, uint32_t l, uint64_t dest,
     return c != 0;
 }
 
-uint32_t HELPER(xc)(CPUS390XState *env, uint32_t l, uint64_t dest,
-                    uint64_t src)
+void HELPER(xc)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
 {
-    return do_helper_xc(env, l, dest, src, GETPC());
+    env->cc_op = do_helper_xc(env, l, dest, src, GETPC());
 }
 
 /* or on array */
@@ -506,10 +504,9 @@ static uint32_t do_helper_oc(CPUS390XState *env, uint32_t l, uint64_t dest,
     return c != 0;
 }
 
-uint32_t HELPER(oc)(CPUS390XState *env, uint32_t l, uint64_t dest,
-                    uint64_t src)
+void HELPER(oc)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
 {
-    return do_helper_oc(env, l, dest, src, GETPC());
+    env->cc_op = do_helper_oc(env, l, dest, src, GETPC());
 }
 
 /* memmove */
@@ -680,14 +677,13 @@ static uint32_t do_helper_clc(CPUS390XState *env, uint32_t l, uint64_t s1,
     return cc;
 }
 
-uint32_t HELPER(clc)(CPUS390XState *env, uint32_t l, uint64_t s1, uint64_t s2)
+void HELPER(clc)(CPUS390XState *env, uint32_t l, uint64_t s1, uint64_t s2)
 {
-    return do_helper_clc(env, l, s1, s2, GETPC());
+    env->cc_op = do_helper_clc(env, l, s1, s2, GETPC());
 }
 
 /* compare logical under mask */
-uint32_t HELPER(clm)(CPUS390XState *env, uint32_t r1, uint32_t mask,
-                     uint64_t addr)
+void HELPER(clm)(CPUS390XState *env, uint32_t r1, uint32_t mask, uint64_t addr)
 {
     uintptr_t ra = GETPC();
     uint32_t cc = 0;
@@ -715,7 +711,7 @@ uint32_t HELPER(clm)(CPUS390XState *env, uint32_t r1, uint32_t mask,
     }
 
     HELPER_LOG("\n");
-    return cc;
+    env->cc_op = cc;
 }
 
 static inline uint64_t get_address(CPUS390XState *env, int reg)
@@ -915,7 +911,7 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
 }
 
 /* move page */
-uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint32_t r1, uint32_t r2)
+void HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint32_t r1, uint32_t r2)
 {
     const uint64_t src = get_address(env, r2) & TARGET_PAGE_MASK;
     const uint64_t dst = get_address(env, r1) & TARGET_PAGE_MASK;
@@ -941,7 +937,8 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint32_t r1, uint32_t r2)
                             MMU_DATA_LOAD, mmu_idx, ra);
     if (exc) {
         if (cco) {
-            return 2;
+            env->cc_op = 2;
+            return;
         }
         goto inject_exc;
     }
@@ -949,12 +946,15 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint32_t r1, uint32_t r2)
                             MMU_DATA_STORE, mmu_idx, ra);
     if (exc) {
         if (cco && exc != PGM_PROTECTION) {
-            return 1;
+            env->cc_op = 1;
+            return;
         }
         goto inject_exc;
     }
     access_memmove(env, &desta, &srca, ra);
-    return 0; /* data moved */
+    env->cc_op = 0; /* data moved */
+    return;
+
 inject_exc:
 #if !defined(CONFIG_USER_ONLY)
     if (exc != PGM_ADDRESSING) {
@@ -970,7 +970,7 @@ inject_exc:
 }
 
 /* string copy */
-uint32_t HELPER(mvst)(CPUS390XState *env, uint32_t r1, uint32_t r2)
+void HELPER(mvst)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 {
     const int mmu_idx = cpu_mmu_index(env, false);
     const uint64_t d = get_address(env, r1);
@@ -999,12 +999,13 @@ uint32_t HELPER(mvst)(CPUS390XState *env, uint32_t r1, uint32_t r2)
         access_set_byte(env, &desta, i, v, ra);
         if (v == c) {
             set_address_zero(env, r1, d + i);
-            return 1;
+            env->cc_op = 1;
+            return;
         }
     }
     set_address_zero(env, r1, d + len);
     set_address_zero(env, r2, s + len);
-    return 3;
+    env->cc_op = 3;
 }
 
 /* load access registers r1 to r3 from memory at a2 */
@@ -1108,7 +1109,7 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
 }
 
 /* move long */
-uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
+void HELPER(mvcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 {
     const int mmu_idx = cpu_mmu_index(env, false);
     uintptr_t ra = GETPC();
@@ -1135,7 +1136,8 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
     if (unlikely(!destlen || cc == 3)) {
         set_address_zero(env, r2, src);
         set_address_zero(env, r1, dest);
-        return cc;
+        env->cc_op = cc;
+        return;
     } else if (!srclen) {
         set_address_zero(env, r2, src);
     }
@@ -1178,12 +1180,11 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
             cpu_loop_exit_restore(cs, ra);
         }
     }
-    return cc;
+    env->cc_op = cc;
 }
 
 /* move long extended */
-uint32_t HELPER(mvcle)(CPUS390XState *env, uint32_t r1, uint64_t a2,
-                       uint32_t r3)
+void HELPER(mvcle)(CPUS390XState *env, uint32_t r1, uint64_t a2, uint32_t r3)
 {
     uintptr_t ra = GETPC();
     uint64_t destlen = get_length(env, r1 + 1);
@@ -1200,12 +1201,11 @@ uint32_t HELPER(mvcle)(CPUS390XState *env, uint32_t r1, uint64_t a2,
     set_address(env, r1, dest);
     set_address(env, r3, src);
 
-    return cc;
+    env->cc_op = cc;
 }
 
 /* move long unicode */
-uint32_t HELPER(mvclu)(CPUS390XState *env, uint32_t r1, uint64_t a2,
-                       uint32_t r3)
+void HELPER(mvclu)(CPUS390XState *env, uint32_t r1, uint64_t a2, uint32_t r3)
 {
     uintptr_t ra = GETPC();
     uint64_t destlen = get_length(env, r1 + 1);
@@ -1222,7 +1222,7 @@ uint32_t HELPER(mvclu)(CPUS390XState *env, uint32_t r1, uint64_t a2,
     set_address(env, r1, dest);
     set_address(env, r3, src);
 
-    return cc;
+    env->cc_op = cc;
 }
 
 /* compare logical long helper */
@@ -1279,7 +1279,7 @@ static inline uint32_t do_clcl(CPUS390XState *env,
 
 
 /* compare logical long */
-uint32_t HELPER(clcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
+void HELPER(clcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 {
     uintptr_t ra = GETPC();
     uint64_t src1len = extract64(env->regs[r1 + 1], 0, 24);
@@ -1296,12 +1296,11 @@ uint32_t HELPER(clcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
     set_address(env, r1, src1);
     set_address(env, r2, src3);
 
-    return cc;
+    env->cc_op = cc;
 }
 
 /* compare logical long extended memcompare insn with padding */
-uint32_t HELPER(clcle)(CPUS390XState *env, uint32_t r1, uint64_t a2,
-                       uint32_t r3)
+void HELPER(clcle)(CPUS390XState *env, uint32_t r1, uint64_t a2, uint32_t r3)
 {
     uintptr_t ra = GETPC();
     uint64_t src1len = get_length(env, r1 + 1);
@@ -1318,12 +1317,11 @@ uint32_t HELPER(clcle)(CPUS390XState *env, uint32_t r1, uint64_t a2,
     set_address(env, r1, src1);
     set_address(env, r3, src3);
 
-    return cc;
+    env->cc_op = cc;
 }
 
 /* compare logical long unicode memcompare insn with padding */
-uint32_t HELPER(clclu)(CPUS390XState *env, uint32_t r1, uint64_t a2,
-                       uint32_t r3)
+void HELPER(clclu)(CPUS390XState *env, uint32_t r1, uint64_t a2, uint32_t r3)
 {
     uintptr_t ra = GETPC();
     uint64_t src1len = get_length(env, r1 + 1);
@@ -1340,7 +1338,7 @@ uint32_t HELPER(clclu)(CPUS390XState *env, uint32_t r1, uint64_t a2,
     set_address(env, r1, src1);
     set_address(env, r3, src3);
 
-    return cc;
+    env->cc_op = cc;
 }
 
 /* checksum */
@@ -1572,19 +1570,19 @@ static inline uint32_t do_unpkau(CPUS390XState *env, uint64_t dest,
     return cc;
 }
 
-uint32_t HELPER(unpka)(CPUS390XState *env, uint64_t dest, uint32_t destlen,
-                       uint64_t src)
+void HELPER(unpka)(CPUS390XState *env, uint64_t dest, uint32_t destlen,
+                   uint64_t src)
 {
-    return do_unpkau(env, dest, destlen, 1, src, GETPC());
+    env->cc_op = do_unpkau(env, dest, destlen, 1, src, GETPC());
 }
 
-uint32_t HELPER(unpku)(CPUS390XState *env, uint64_t dest, uint32_t destlen,
-                       uint64_t src)
+void HELPER(unpku)(CPUS390XState *env, uint64_t dest, uint32_t destlen,
+                   uint64_t src)
 {
-    return do_unpkau(env, dest, destlen, 2, src, GETPC());
+    env->cc_op = do_unpkau(env, dest, destlen, 2, src, GETPC());
 }
 
-uint32_t HELPER(tp)(CPUS390XState *env, uint64_t dest, uint32_t destlen)
+void HELPER(tp)(CPUS390XState *env, uint64_t dest, uint32_t destlen)
 {
     uintptr_t ra = GETPC();
     uint32_t cc = 0;
@@ -1604,7 +1602,7 @@ uint32_t HELPER(tp)(CPUS390XState *env, uint64_t dest, uint32_t destlen)
         }
     }
 
-    return cc;
+    env->cc_op = cc;
 }
 
 static uint32_t do_helper_tr(CPUS390XState *env, uint32_t len, uint64_t array,
@@ -1694,10 +1692,10 @@ static uint32_t do_helper_trt_fwd(CPUS390XState *env, uint32_t len,
     return do_helper_trt(env, len, array, trans, 1, ra);
 }
 
-uint32_t HELPER(trt)(CPUS390XState *env, uint32_t len, uint64_t array,
+void HELPER(trt)(CPUS390XState *env, uint32_t len, uint64_t array,
                      uint64_t trans)
 {
-    return do_helper_trt(env, len, array, trans, 1, GETPC());
+    env->cc_op = do_helper_trt(env, len, array, trans, 1, GETPC());
 }
 
 static uint32_t do_helper_trt_bkwd(CPUS390XState *env, uint32_t len,
@@ -1707,15 +1705,15 @@ static uint32_t do_helper_trt_bkwd(CPUS390XState *env, uint32_t len,
     return do_helper_trt(env, len, array, trans, -1, ra);
 }
 
-uint32_t HELPER(trtr)(CPUS390XState *env, uint32_t len, uint64_t array,
-                      uint64_t trans)
+void HELPER(trtr)(CPUS390XState *env, uint32_t len, uint64_t array,
+                  uint64_t trans)
 {
-    return do_helper_trt(env, len, array, trans, -1, GETPC());
+    env->cc_op = do_helper_trt(env, len, array, trans, -1, GETPC());
 }
 
 /* Translate one/two to one/two */
-uint32_t HELPER(trXX)(CPUS390XState *env, uint32_t r1, uint32_t r2,
-                      uint32_t tst, uint32_t sizes)
+void HELPER(trXX)(CPUS390XState *env, uint32_t r1, uint32_t r2,
+                  uint32_t tst, uint32_t sizes)
 {
     uintptr_t ra = GETPC();
     int dsize = (sizes & 1) ? 1 : 2;
@@ -1764,7 +1762,7 @@ uint32_t HELPER(trXX)(CPUS390XState *env, uint32_t r1, uint32_t r2,
     set_length(env, r1 + 1, len);
     set_address(env, r2, src);
 
-    return cc;
+    env->cc_op = cc;
 }
 
 void HELPER(cdsg)(CPUS390XState *env, uint64_t addr,
@@ -2002,15 +2000,15 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
     tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
 }
 
-uint32_t HELPER(csst)(CPUS390XState *env, uint32_t r3, uint64_t a1, uint64_t a2)
+void HELPER(csst)(CPUS390XState *env, uint32_t r3, uint64_t a1, uint64_t a2)
 {
-    return do_csst(env, r3, a1, a2, false);
+    env->cc_op = do_csst(env, r3, a1, a2, false);
 }
 
-uint32_t HELPER(csst_parallel)(CPUS390XState *env, uint32_t r3, uint64_t a1,
-                               uint64_t a2)
+void HELPER(csst_parallel)(CPUS390XState *env, uint32_t r3, uint64_t a1,
+                           uint64_t a2)
 {
-    return do_csst(env, r3, a1, a2, true);
+    env->cc_op = do_csst(env, r3, a1, a2, true);
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -2119,7 +2117,7 @@ void HELPER(stctl)(CPUS390XState *env, uint32_t r1, uint64_t a2, uint32_t r3)
     }
 }
 
-uint32_t HELPER(testblock)(CPUS390XState *env, uint64_t real_addr)
+void HELPER(testblock)(CPUS390XState *env, uint64_t real_addr)
 {
     uintptr_t ra = GETPC();
     int i;
@@ -2130,13 +2128,14 @@ uint32_t HELPER(testblock)(CPUS390XState *env, uint64_t real_addr)
         cpu_stq_mmuidx_ra(env, real_addr + i, 0, MMU_REAL_IDX, ra);
     }
 
-    return 0;
+    env->cc_op = 0;
 }
 
-uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
+void HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
 {
     S390CPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
+    int cc;
 
     /*
      * TODO: we currently don't handle all access protection types
@@ -2144,7 +2143,8 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
      */
     if (!s390_cpu_virt_mem_check_write(cpu, a1, 0, 1)) {
         /* Fetching permitted; storing permitted */
-        return 0;
+        env->cc_op = 0;
+        return;
     }
 
     if (env->int_pgm_code == PGM_PROTECTION) {
@@ -2152,7 +2152,8 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
         cs->exception_index = -1;
         if (!s390_cpu_virt_mem_check_read(cpu, a1, 0, 1)) {
             /* Fetching permitted; storing not permitted */
-            return 1;
+            env->cc_op = 1;
+            return;
         }
     }
 
@@ -2160,17 +2161,21 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
     case PGM_PROTECTION:
         /* Fetching not permitted; storing not permitted */
         cs->exception_index = -1;
-        return 2;
+        cc = 2;
+        break;
     case PGM_ADDRESSING:
     case PGM_TRANS_SPEC:
         /* exceptions forwarded to the guest */
         s390_cpu_virt_mem_handle_exc(cpu, GETPC());
-        return 0;
+        cc = 0;
+        break;
+    default:
+        /* Translation not available */
+        cs->exception_index = -1;
+        cc = 3;
+        break;
     }
-
-    /* Translation not available */
-    cs->exception_index = -1;
-    return 3;
+    env->cc_op = cc;
 }
 
 /* insert storage key extended */
@@ -2225,7 +2230,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 }
 
 /* reset reference bit extended */
-uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
+void HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     static S390SKeysState *ss;
@@ -2233,7 +2238,8 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     uint8_t re, key;
 
     if (r2 > ms->ram_size) {
-        return 0;
+        env->cc_op = 0;
+        return;
     }
 
     if (unlikely(!ss)) {
@@ -2242,19 +2248,22 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     }
 
     if (skeyclass->get_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
-        return 0;
+        env->cc_op = 0;
+        return;
     }
 
     re = key & (SK_R | SK_C);
     key &= ~SK_R;
 
     if (skeyclass->set_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
-        return 0;
+        env->cc_op = 0;
+        return;
     }
-   /*
-    * As we can only flush by virtual address and not all the entries
-    * that point to a physical address we have to flush the whole TLB.
-    */
+
+    /*
+     * As we can only flush by virtual address and not all the entries
+     * that point to a physical address we have to flush the whole TLB.
+     */
     tlb_flush_all_cpus_synced(env_cpu(env));
 
     /*
@@ -2265,11 +2274,10 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
      * 2  Reference bit one; change bit zero
      * 3  Reference bit one; change bit one
      */
-
-    return re >> 1;
+    env->cc_op = re >> 1;
 }
 
-uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
+void HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
 {
     const uint8_t psw_as = (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT_ASC;
     S390Access srca, desta;
@@ -2285,22 +2293,23 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
     }
 
     l = wrap_length32(env, l);
-    if (l > 256) {
-        /* max 256 */
-        l = 256;
-        cc = 3;
-    } else if (!l) {
-        return cc;
-    }
+    if (l != 0) {
+        if (l > 256) {
+            /* max 256 */
+            l = 256;
+            cc = 3;
+        }
 
-    /* TODO: Access key handling */
-    srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, ra);
-    desta = access_prepare(env, a1, l, MMU_DATA_STORE, MMU_SECONDARY_IDX, ra);
-    access_memmove(env, &desta, &srca, ra);
-    return cc;
+        /* TODO: Access key handling */
+        srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, ra);
+        desta = access_prepare(env, a1, l, MMU_DATA_STORE,
+                               MMU_SECONDARY_IDX, ra);
+        access_memmove(env, &desta, &srca, ra);
+    }
+    env->cc_op = cc;
 }
 
-uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
+void HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
 {
     const uint8_t psw_as = (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT_ASC;
     S390Access srca, desta;
@@ -2316,19 +2325,21 @@ uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2)
     }
 
     l = wrap_length32(env, l);
-    if (l > 256) {
-        /* max 256 */
-        l = 256;
-        cc = 3;
-    } else if (!l) {
-        return cc;
-    }
+    if (l != 0) {
+        if (l > 256) {
+            /* max 256 */
+            l = 256;
+            cc = 3;
+        }
 
-    /* TODO: Access key handling */
-    srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_SECONDARY_IDX, ra);
-    desta = access_prepare(env, a1, l, MMU_DATA_STORE, MMU_PRIMARY_IDX, ra);
-    access_memmove(env, &desta, &srca, ra);
-    return cc;
+        /* TODO: Access key handling */
+        srca = access_prepare(env, a2, l, MMU_DATA_LOAD,
+                              MMU_SECONDARY_IDX, ra);
+        desta = access_prepare(env, a1, l, MMU_DATA_STORE,
+                               MMU_PRIMARY_IDX, ra);
+        access_memmove(env, &desta, &srca, ra);
+    }
+    env->cc_op = cc;
 }
 
 void HELPER(idte)(CPUS390XState *env, uint64_t r1, uint64_t r2, uint32_t m4)
@@ -2594,8 +2605,8 @@ void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t addr)
     env->ex_value = insn | ilen;
 }
 
-uint32_t HELPER(mvcos)(CPUS390XState *env, uint64_t dest, uint64_t src,
-                       uint64_t len)
+void HELPER(mvcos)(CPUS390XState *env, uint64_t dest, uint64_t src,
+                   uint64_t len)
 {
     const uint8_t psw_key = (env->psw.mask & PSW_MASK_KEY) >> PSW_SHIFT_KEY;
     const uint8_t psw_as = (env->psw.mask & PSW_MASK_ASC) >> PSW_SHIFT_ASC;
@@ -2675,7 +2686,7 @@ uint32_t HELPER(mvcos)(CPUS390XState *env, uint64_t dest, uint64_t src,
         access_memmove(env, &desta, &srca, ra);
     }
 
-    return cc;
+    env->cc_op = cc;
 }
 
 /* Decode a Unicode character.  A return value < 0 indicates success, storing
@@ -2952,40 +2963,40 @@ static inline uint32_t convert_unicode(CPUS390XState *env, uint32_t r1,
     return cc;
 }
 
-uint32_t HELPER(cu12)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
+void HELPER(cu12)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
 {
-    return convert_unicode(env, r1, r2, m3, GETPC(),
-                           decode_utf8, encode_utf16);
+    env->cc_op = convert_unicode(env, r1, r2, m3, GETPC(),
+                                 decode_utf8, encode_utf16);
 }
 
-uint32_t HELPER(cu14)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
+void HELPER(cu14)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
 {
-    return convert_unicode(env, r1, r2, m3, GETPC(),
-                           decode_utf8, encode_utf32);
+    env->cc_op = convert_unicode(env, r1, r2, m3, GETPC(),
+                                 decode_utf8, encode_utf32);
 }
 
-uint32_t HELPER(cu21)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
+void HELPER(cu21)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
 {
-    return convert_unicode(env, r1, r2, m3, GETPC(),
-                           decode_utf16, encode_utf8);
+    env->cc_op = convert_unicode(env, r1, r2, m3, GETPC(),
+                                 decode_utf16, encode_utf8);
 }
 
-uint32_t HELPER(cu24)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
+void HELPER(cu24)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
 {
-    return convert_unicode(env, r1, r2, m3, GETPC(),
-                           decode_utf16, encode_utf32);
+    env->cc_op = convert_unicode(env, r1, r2, m3, GETPC(),
+                                 decode_utf16, encode_utf32);
 }
 
-uint32_t HELPER(cu41)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
+void HELPER(cu41)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
 {
-    return convert_unicode(env, r1, r2, m3, GETPC(),
-                           decode_utf32, encode_utf8);
+    env->cc_op = convert_unicode(env, r1, r2, m3, GETPC(),
+                                 decode_utf32, encode_utf8);
 }
 
-uint32_t HELPER(cu42)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
+void HELPER(cu42)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t m3)
 {
-    return convert_unicode(env, r1, r2, m3, GETPC(),
-                           decode_utf32, encode_utf16);
+    env->cc_op = convert_unicode(env, r1, r2, m3, GETPC(),
+                                 decode_utf32, encode_utf16);
 }
 
 void probe_write_access(CPUS390XState *env, uint64_t addr, uint64_t len,
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 7ea90d414a..6c030a06d7 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -101,7 +101,7 @@ uint64_t HELPER(stck)(CPUS390XState *env)
 
 #ifndef CONFIG_USER_ONLY
 /* SCLP service call */
-uint32_t HELPER(servc)(CPUS390XState *env, uint64_t r1, uint64_t r2)
+void HELPER(servc)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 {
     qemu_mutex_lock_iothread();
     int r = sclp_service_call(env, r1, r2);
@@ -109,7 +109,7 @@ uint32_t HELPER(servc)(CPUS390XState *env, uint64_t r1, uint64_t r2)
     if (r < 0) {
         tcg_s390_program_interrupt(env, -r, GETPC());
     }
-    return r;
+    env->cc_op = r;
 }
 
 void HELPER(diag)(CPUS390XState *env, uint32_t r1, uint32_t r3, uint32_t num)
@@ -202,7 +202,7 @@ void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
 }
 
 /* Set Clock */
-uint32_t HELPER(sck)(CPUS390XState *env, uint64_t tod_low)
+void HELPER(sck)(CPUS390XState *env, uint64_t tod_low)
 {
     S390TODState *td = s390_get_todstate();
     S390TODClass *tdc = S390_TOD_GET_CLASS(td);
@@ -214,7 +214,7 @@ uint32_t HELPER(sck)(CPUS390XState *env, uint64_t tod_low)
     qemu_mutex_lock_iothread();
     tdc->set(td, &tod, &error_abort);
     qemu_mutex_unlock_iothread();
-    return 0;
+    env->cc_op = 0;
 }
 
 /* Set Tod Programmable Field */
@@ -250,7 +250,7 @@ void HELPER(spt)(CPUS390XState *env, uint64_t time)
 }
 
 /* Store System Information */
-uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
+void HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
 {
     const uintptr_t ra = GETPC();
     const uint32_t sel1 = r0 & STSI_R0_SEL1_MASK;
@@ -263,7 +263,8 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
 
     if ((r0 & STSI_R0_FC_MASK) > STSI_R0_FC_LEVEL_3) {
         /* invalid function code: no other checks are performed */
-        return 3;
+        env->cc_op = 3;
+        return;
     }
 
     if ((r0 & STSI_R0_RESERVED_MASK) || (r1 & STSI_R1_RESERVED_MASK)) {
@@ -273,7 +274,8 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
     if ((r0 & STSI_R0_FC_MASK) == STSI_R0_FC_CURRENT) {
         /* query the current level: no further checks are performed */
         env->regs[0] = STSI_R0_FC_LEVEL_3;
-        return 0;
+        env->cc_op = 0;
+        return;
     }
 
     if (a0 & ~TARGET_PAGE_MASK) {
@@ -394,11 +396,11 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
         }
     }
 
-    return cc;
+    env->cc_op = cc;
 }
 
-uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t order_code, uint32_t r1,
-                      uint32_t r3)
+void HELPER(sigp)(CPUS390XState *env, uint64_t order_code, uint32_t r1,
+                  uint32_t r3)
 {
     int cc;
 
@@ -407,7 +409,7 @@ uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t order_code, uint32_t r1,
     cc = handle_sigp(env, order_code & SIGP_ORDER_MASK, r1, r3);
     qemu_mutex_unlock_iothread();
 
-    return cc;
+    env->cc_op = cc;
 }
 #endif
 
@@ -503,7 +505,7 @@ void HELPER(stsch)(CPUS390XState *env, uint64_t r1, uint64_t inst)
     qemu_mutex_unlock_iothread();
 }
 
-uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t addr)
+void HELPER(tpi)(CPUS390XState *env, uint64_t addr)
 {
     const uintptr_t ra = GETPC();
     S390CPU *cpu = env_archcpu(env);
@@ -519,7 +521,8 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t addr)
     io = qemu_s390_flic_dequeue_io(flic, env->cregs[6]);
     if (!io) {
         qemu_mutex_unlock_iothread();
-        return 0;
+        env->cc_op = 0;
+        return;
     }
 
     if (addr) {
@@ -539,7 +542,8 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t addr)
             qemu_mutex_unlock_iothread();
             g_free(io);
             s390_cpu_virt_mem_handle_exc(cpu, ra);
-            return 0;
+            env->cc_op = 0;
+            return;
         }
     } else {
         /* no protection applies */
@@ -553,7 +557,8 @@ uint32_t HELPER(tpi)(CPUS390XState *env, uint64_t addr)
 
     g_free(io);
     qemu_mutex_unlock_iothread();
-    return 1;
+    env->cc_op = 1;
+    return;
 }
 
 void HELPER(tsch)(CPUS390XState *env, uint64_t r1, uint64_t inst)
@@ -669,7 +674,7 @@ void HELPER(stfl)(CPUS390XState *env)
 }
 #endif
 
-uint32_t HELPER(stfle)(CPUS390XState *env, uint64_t addr)
+void HELPER(stfle)(CPUS390XState *env, uint64_t addr)
 {
     const uintptr_t ra = GETPC();
     const int count_bytes = ((env->regs[0] & 0xff) + 1) * 8;
@@ -693,7 +698,7 @@ uint32_t HELPER(stfle)(CPUS390XState *env, uint64_t addr)
     }
 
     env->regs[0] = deposit64(env->regs[0], 0, 8, (max_bytes / 8) - 1);
-    return count_bytes >= max_bytes ? 0 : 3;
+    env->cc_op = count_bytes >= max_bytes ? 0 : 3;
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index e243624d2a..1d90cb2efb 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -190,7 +190,6 @@ static TCGv_i64 psw_addr;
 static TCGv_i64 psw_mask;
 static TCGv_i64 gbea;
 
-static TCGv_i32 cc_op;
 static TCGv_i64 cc_src;
 static TCGv_i64 cc_dst;
 static TCGv_i64 cc_vr;
@@ -212,8 +211,6 @@ void s390x_translate_init(void)
                                   offsetof(CPUS390XState, gbea),
                                   "gbea");
 
-    cc_op = tcg_global_mem_new_i32(cpu_env, offsetof(CPUS390XState, cc_op),
-                                   "cc_op");
     cc_src = tcg_global_mem_new_i64(cpu_env, offsetof(CPUS390XState, cc_src),
                                     "cc_src");
     cc_dst = tcg_global_mem_new_i64(cpu_env, offsetof(CPUS390XState, cc_dst),
@@ -385,7 +382,8 @@ static void per_breaking_event(DisasContext *s)
 static void update_cc_op(DisasContext *s)
 {
     if (s->cc_op != CC_OP_DYNAMIC && s->cc_op != CC_OP_STATIC) {
-        tcg_gen_movi_i32(cc_op, s->cc_op);
+        tcg_gen_st_i32(tcg_constant_i32(s->cc_op), cpu_env,
+                       offsetof(CPUS390XState, cc_op));
     }
 }
 
@@ -589,41 +587,46 @@ static void set_cc_static(DisasContext *s)
     s->cc_op = CC_OP_STATIC;
 }
 
-/* calculates cc into cc_op */
-static void gen_op_calc_cc(DisasContext *s)
+/* calculates cc into new_op */
+static void gen_op_calc_cc(DisasContext *s, TCGv_i32 new_op)
 {
-    TCGv_i32 local_cc_op = NULL;
+    TCGv_i32 old_op = NULL;
     TCGv_i64 dummy = NULL;
 
     switch (s->cc_op) {
     default:
-        dummy = tcg_const_i64(0);
+        dummy = tcg_constant_i64(0);
         /* FALLTHRU */
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-        local_cc_op = tcg_const_i32(s->cc_op);
-        break;
     case CC_OP_CONST0:
     case CC_OP_CONST1:
     case CC_OP_CONST2:
     case CC_OP_CONST3:
+        old_op = tcg_constant_i32(s->cc_op);
+        break;
     case CC_OP_STATIC:
     case CC_OP_DYNAMIC:
+        tcg_gen_ld_i32(new_op, cpu_env, offsetof(CPUS390XState, cc_op));
+        old_op = new_op;
+        break;
         break;
     }
 
     switch (s->cc_op) {
+    case CC_OP_STATIC:
+        /* We loaded the correct value, and it is saved. */
+        return;
     case CC_OP_CONST0:
     case CC_OP_CONST1:
     case CC_OP_CONST2:
     case CC_OP_CONST3:
-        /* s->cc_op is the cc value */
-        tcg_gen_movi_i32(cc_op, s->cc_op - CC_OP_CONST0);
-        break;
-    case CC_OP_STATIC:
-        /* env->cc_op already is the cc value */
+        {
+            QEMU_BUILD_BUG_ON(CC_OP_CONST0 != 0);
+            tcg_gen_mov_i32(new_op, old_op);
+        }
         break;
     case CC_OP_NZ:
     case CC_OP_ABS_64:
@@ -640,7 +643,7 @@ static void gen_op_calc_cc(DisasContext *s)
     case CC_OP_LCBB:
     case CC_OP_MULS_32:
         /* 1 argument */
-        gen_helper_calc_cc(cc_op, cpu_env, local_cc_op, dummy, cc_dst, dummy);
+        gen_helper_calc_cc(new_op, cpu_env, old_op, dummy, cc_dst, dummy);
         break;
     case CC_OP_ADDU:
     case CC_OP_ICM:
@@ -657,29 +660,21 @@ static void gen_op_calc_cc(DisasContext *s)
     case CC_OP_VC:
     case CC_OP_MULS_64:
         /* 2 arguments */
-        gen_helper_calc_cc(cc_op, cpu_env, local_cc_op, cc_src, cc_dst, dummy);
+        gen_helper_calc_cc(new_op, cpu_env, old_op, cc_src, cc_dst, dummy);
         break;
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-        /* 3 arguments */
-        gen_helper_calc_cc(cc_op, cpu_env, local_cc_op, cc_src, cc_dst, cc_vr);
-        break;
     case CC_OP_DYNAMIC:
-        /* unknown operation - assume 3 arguments and cc_op in env */
-        gen_helper_calc_cc(cc_op, cpu_env, cc_op, cc_src, cc_dst, cc_vr);
+        /* 3 arguments */
+        gen_helper_calc_cc(new_op, cpu_env, old_op, cc_src, cc_dst, cc_vr);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 
-    if (local_cc_op) {
-        tcg_temp_free_i32(local_cc_op);
-    }
-    if (dummy) {
-        tcg_temp_free_i64(dummy);
-    }
+    tcg_gen_st_i32(new_op, cpu_env, offsetof(CPUS390XState, cc_op));
 
     /* We now have cc in cc_op as constant */
     set_cc_static(s);
@@ -750,6 +745,7 @@ static const TCGCond nz_cond[16] = {
 static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
 {
     TCGCond cond;
+    TCGv_i32 cc_op = NULL;
     enum cc_op old_cc_op = s->cc_op;
 
     if (mask == 15 || mask == 0) {
@@ -856,16 +852,19 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         account_inline_branch(s, old_cc_op);
         break;
 
+    case CC_OP_STATIC:
+        account_noninline_branch(s, old_cc_op);
+        /* FALLTHRU */
+
     default:
     do_dynamic:
         /* Calculate cc value.  */
-        gen_op_calc_cc(s);
-        /* FALLTHRU */
-
-    case CC_OP_STATIC:
-        /* Jump based on CC.  We'll load up the real cond below;
-           the assignment here merely avoids a compiler warning.  */
-        account_noninline_branch(s, old_cc_op);
+        cc_op = tcg_temp_new_i32();
+        gen_op_calc_cc(s, cc_op);
+        /*
+         * Jump based on CC.  We'll load up the real cond below;
+         * the assignment here merely avoids a compiler warning.
+         */
         old_cc_op = CC_OP_STATIC;
         cond = TCG_COND_NEVER;
         break;
@@ -934,7 +933,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_STATIC:
         c->is_64 = false;
         c->u.s32.a = cc_op;
-        c->g1 = true;
         switch (mask) {
         case 0x8 | 0x4 | 0x2: /* cc != 3 */
             cond = TCG_COND_NE;
@@ -950,10 +948,8 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
             break;
         case 0x8 | 0x2: /* cc == 0 || cc == 2 => (cc & 1) == 0 */
             cond = TCG_COND_EQ;
-            c->g1 = false;
-            c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_const_i32(0);
-            tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
+            tcg_gen_andi_i32(cc_op, cc_op, 1);
             break;
         case 0x8 | 0x4: /* cc < 2 */
             cond = TCG_COND_LTU;
@@ -969,10 +965,8 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
             break;
         case 0x4 | 0x1: /* cc == 1 || cc == 3 => (cc & 1) != 0 */
             cond = TCG_COND_NE;
-            c->g1 = false;
-            c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_const_i32(0);
-            tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
+            tcg_gen_andi_i32(cc_op, cc_op, 1);
             break;
         case 0x4: /* cc == 1 */
             cond = TCG_COND_EQ;
@@ -993,7 +987,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         default:
             /* CC is masked by something else: (8 >> cc) & mask.  */
             cond = TCG_COND_NE;
-            c->g1 = false;
             c->u.s32.a = tcg_const_i32(8);
             c->u.s32.b = tcg_const_i32(0);
             tcg_gen_shr_i32(c->u.s32.a, c->u.s32.a, cc_op);
@@ -1413,6 +1406,8 @@ static DisasJumpType op_addu64(DisasContext *s, DisasOps *o)
 /* Compute carry into cc_src. */
 static void compute_carry(DisasContext *s)
 {
+    TCGv_i32 cc_op;
+
     switch (s->cc_op) {
     case CC_OP_ADDU:
         /* The carry value is already in cc_src (1,0). */
@@ -1421,12 +1416,12 @@ static void compute_carry(DisasContext *s)
         tcg_gen_addi_i64(cc_src, cc_src, 1);
         break;
     default:
-        gen_op_calc_cc(s);
-        /* fall through */
-    case CC_OP_STATIC:
+        cc_op = tcg_temp_new_i32();
+        gen_op_calc_cc(s, cc_op);
         /* The carry flag is the msb of CC; compute into cc_src. */
         tcg_gen_extu_i32_i64(cc_src, cc_op);
         tcg_gen_shri_i64(cc_src, cc_src, 1);
+        tcg_temp_free_i32(cc_op);
         break;
     }
 }
@@ -1574,12 +1569,14 @@ static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 static void save_link_info(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 t;
+    TCGv_i32 cc_op;
 
     if (s->base.tb->flags & (FLAG_MASK_32 | FLAG_MASK_64)) {
         pc_to_link_info(o->out, s, s->pc_tmp);
         return;
     }
-    gen_op_calc_cc(s);
+    cc_op = tcg_temp_new_i32();
+    gen_op_calc_cc(s, cc_op);
     tcg_gen_andi_i64(o->out, o->out, 0xffffffff00000000ull);
     tcg_gen_ori_i64(o->out, o->out, ((s->ilen / 2) << 30) | s->pc_tmp);
     t = tcg_temp_new_i64();
@@ -1590,6 +1587,7 @@ static void save_link_info(DisasContext *s, DisasOps *o)
     tcg_gen_shli_i64(t, t, 28);
     tcg_gen_or_i64(o->out, o->out, t);
     tcg_temp_free_i64(t);
+    tcg_temp_free_i32(cc_op);
 }
 
 static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
@@ -1783,21 +1781,21 @@ static DisasJumpType op_cj(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ceb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_ceb(cc_op, cpu_env, o->in1, o->in2);
+    gen_helper_ceb(cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_cdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_cdb(cc_op, cpu_env, o->in1, o->in2);
+    gen_helper_cdb(cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_cxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_cxb(cc_op, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_cxb(cpu_env, o->out, o->out2, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2097,7 +2095,7 @@ static DisasJumpType op_clc(DisasContext *s, DisasOps *o)
         break;
     default:
         vl = tcg_const_i32(l);
-        gen_helper_clc(cc_op, cpu_env, vl, o->addr1, o->in2);
+        gen_helper_clc(cpu_env, vl, o->addr1, o->in2);
         tcg_temp_free_i32(vl);
         set_cc_static(s);
         return DISAS_NEXT;
@@ -2120,7 +2118,7 @@ static DisasJumpType op_clcl(DisasContext *s, DisasOps *o)
 
     t1 = tcg_const_i32(r1);
     t2 = tcg_const_i32(r2);
-    gen_helper_clcl(cc_op, cpu_env, t1, t2);
+    gen_helper_clcl(cpu_env, t1, t2);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t2);
     set_cc_static(s);
@@ -2141,7 +2139,7 @@ static DisasJumpType op_clcle(DisasContext *s, DisasOps *o)
 
     t1 = tcg_const_i32(r1);
     t3 = tcg_const_i32(r3);
-    gen_helper_clcle(cc_op, cpu_env, t1, o->in2, t3);
+    gen_helper_clcle(cpu_env, t1, o->in2, t3);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t3);
     set_cc_static(s);
@@ -2162,7 +2160,7 @@ static DisasJumpType op_clclu(DisasContext *s, DisasOps *o)
 
     t1 = tcg_const_i32(r1);
     t3 = tcg_const_i32(r3);
-    gen_helper_clclu(cc_op, cpu_env, t1, o->in2, t3);
+    gen_helper_clclu(cpu_env, t1, o->in2, t3);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t3);
     set_cc_static(s);
@@ -2174,7 +2172,7 @@ static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
     TCGv_i32 m3 = tcg_const_i32(get_field(s, m3));
     TCGv_i32 t1 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t1, o->in1);
-    gen_helper_clm(cc_op, cpu_env, t1, m3, o->in2);
+    gen_helper_clm(cpu_env, t1, m3, o->in2);
     set_cc_static(s);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(m3);
@@ -2217,7 +2215,7 @@ static DisasJumpType op_cs(DisasContext *s, DisasOps *o)
        produces the output CC value, thus the NE sense of the test.  */
     cc = tcg_temp_new_i64();
     tcg_gen_setcond_i64(TCG_COND_NE, cc, o->in2, o->out);
-    tcg_gen_extrl_i64_i32(cc_op, cc);
+    tcg_gen_st32_i64(cc, cpu_env, offsetof(CPUS390XState, cc_op));
     tcg_temp_free_i64(cc);
     set_cc_static(s);
 
@@ -2260,9 +2258,9 @@ static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
     TCGv_i32 t_r3 = tcg_const_i32(r3);
 
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        gen_helper_csst_parallel(cc_op, cpu_env, t_r3, o->addr1, o->in2);
+        gen_helper_csst_parallel(cpu_env, t_r3, o->addr1, o->in2);
     } else {
-        gen_helper_csst(cc_op, cpu_env, t_r3, o->addr1, o->in2);
+        gen_helper_csst(cpu_env, t_r3, o->addr1, o->in2);
     }
     tcg_temp_free_i32(t_r3);
 
@@ -2290,7 +2288,7 @@ static DisasJumpType op_csp(DisasContext *s, DisasOps *o)
     /* Are the memory and expected values (un)equal?  */
     cc = tcg_temp_new_i64();
     tcg_gen_setcond_i64(TCG_COND_NE, cc, o->in1, old);
-    tcg_gen_extrl_i64_i32(cc_op, cc);
+    tcg_gen_st32_i64(cc, cpu_env, offsetof(CPUS390XState, cc_op));
 
     /* Write back the output now, so that it happens before the
        following branch, so that we don't need local temps.  */
@@ -2368,22 +2366,22 @@ static DisasJumpType op_cuXX(DisasContext *s, DisasOps *o)
 
     switch (s->insn->data) {
     case 12:
-        gen_helper_cu12(cc_op, cpu_env, tr1, tr2, chk);
+        gen_helper_cu12(cpu_env, tr1, tr2, chk);
         break;
     case 14:
-        gen_helper_cu14(cc_op, cpu_env, tr1, tr2, chk);
+        gen_helper_cu14(cpu_env, tr1, tr2, chk);
         break;
     case 21:
-        gen_helper_cu21(cc_op, cpu_env, tr1, tr2, chk);
+        gen_helper_cu21(cpu_env, tr1, tr2, chk);
         break;
     case 24:
-        gen_helper_cu24(cc_op, cpu_env, tr1, tr2, chk);
+        gen_helper_cu24(cpu_env, tr1, tr2, chk);
         break;
     case 41:
-        gen_helper_cu41(cc_op, cpu_env, tr1, tr2, chk);
+        gen_helper_cu41(cpu_env, tr1, tr2, chk);
         break;
     case 42:
-        gen_helper_cu42(cc_op, cpu_env, tr1, tr2, chk);
+        gen_helper_cu42(cpu_env, tr1, tr2, chk);
         break;
     default:
         g_assert_not_reached();
@@ -2656,9 +2654,10 @@ static DisasJumpType op_insi(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ipm(DisasContext *s, DisasOps *o)
 {
+    TCGv_i32 cc_op = tcg_temp_new_i32();
     TCGv_i64 t1, t2;
 
-    gen_op_calc_cc(s);
+    gen_op_calc_cc(s, cc_op);
     t1 = tcg_temp_new_i64();
     tcg_gen_extract_i64(t1, psw_mask, 40, 4);
     t2 = tcg_temp_new_i64();
@@ -2667,6 +2666,7 @@ static DisasJumpType op_ipm(DisasContext *s, DisasOps *o)
     tcg_gen_deposit_i64(o->out, o->out, t1, 24, 8);
     tcg_temp_free_i64(t1);
     tcg_temp_free_i64(t2);
+    tcg_temp_free_i32(cc_op);
     return DISAS_NEXT;
 }
 
@@ -2755,7 +2755,7 @@ static DisasJumpType op_msa(DisasContext *s, DisasOps *o)
     t_r2 = tcg_const_i32(r2);
     t_r3 = tcg_const_i32(r3);
     type = tcg_const_i32(s->insn->data);
-    gen_helper_msa(cc_op, cpu_env, t_r1, t_r2, t_r3, type);
+    gen_helper_msa(cpu_env, t_r1, t_r2, t_r3, type);
     set_cc_static(s);
     tcg_temp_free_i32(t_r1);
     tcg_temp_free_i32(t_r2);
@@ -2766,21 +2766,21 @@ static DisasJumpType op_msa(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_keb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_keb(cc_op, cpu_env, o->in1, o->in2);
+    gen_helper_keb(cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_kdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_kdb(cc_op, cpu_env, o->in1, o->in2);
+    gen_helper_kdb(cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_kxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_kxb(cc_op, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_kxb(cpu_env, o->out, o->out2, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3420,7 +3420,7 @@ static DisasJumpType op_mvcl(DisasContext *s, DisasOps *o)
 
     t1 = tcg_const_i32(r1);
     t2 = tcg_const_i32(r2);
-    gen_helper_mvcl(cc_op, cpu_env, t1, t2);
+    gen_helper_mvcl(cpu_env, t1, t2);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t2);
     set_cc_static(s);
@@ -3441,7 +3441,7 @@ static DisasJumpType op_mvcle(DisasContext *s, DisasOps *o)
 
     t1 = tcg_const_i32(r1);
     t3 = tcg_const_i32(r3);
-    gen_helper_mvcle(cc_op, cpu_env, t1, o->in2, t3);
+    gen_helper_mvcle(cpu_env, t1, o->in2, t3);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t3);
     set_cc_static(s);
@@ -3462,7 +3462,7 @@ static DisasJumpType op_mvclu(DisasContext *s, DisasOps *o)
 
     t1 = tcg_const_i32(r1);
     t3 = tcg_const_i32(r3);
-    gen_helper_mvclu(cc_op, cpu_env, t1, o->in2, t3);
+    gen_helper_mvclu(cpu_env, t1, o->in2, t3);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t3);
     set_cc_static(s);
@@ -3472,7 +3472,7 @@ static DisasJumpType op_mvclu(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mvcos(DisasContext *s, DisasOps *o)
 {
     int r3 = get_field(s, r3);
-    gen_helper_mvcos(cc_op, cpu_env, o->addr1, o->in2, regs[r3]);
+    gen_helper_mvcos(cpu_env, o->addr1, o->in2, regs[r3]);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3481,7 +3481,7 @@ static DisasJumpType op_mvcos(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mvcp(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, l1);
-    gen_helper_mvcp(cc_op, cpu_env, regs[r1], o->addr1, o->in2);
+    gen_helper_mvcp(cpu_env, regs[r1], o->addr1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3489,7 +3489,7 @@ static DisasJumpType op_mvcp(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mvcs(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, l1);
-    gen_helper_mvcs(cc_op, cpu_env, regs[r1], o->addr1, o->in2);
+    gen_helper_mvcs(cpu_env, regs[r1], o->addr1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3516,7 +3516,7 @@ static DisasJumpType op_mvpg(DisasContext *s, DisasOps *o)
     TCGv_i32 t1 = tcg_const_i32(get_field(s, r1));
     TCGv_i32 t2 = tcg_const_i32(get_field(s, r2));
 
-    gen_helper_mvpg(cc_op, cpu_env, regs[0], t1, t2);
+    gen_helper_mvpg(cpu_env, regs[0], t1, t2);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t2);
     set_cc_static(s);
@@ -3528,7 +3528,7 @@ static DisasJumpType op_mvst(DisasContext *s, DisasOps *o)
     TCGv_i32 t1 = tcg_const_i32(get_field(s, r1));
     TCGv_i32 t2 = tcg_const_i32(get_field(s, r2));
 
-    gen_helper_mvst(cc_op, cpu_env, t1, t2);
+    gen_helper_mvst(cpu_env, t1, t2);
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t2);
     set_cc_static(s);
@@ -3659,7 +3659,7 @@ static DisasJumpType op_nabsf128(DisasContext *s, DisasOps *o)
 static DisasJumpType op_nc(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 l = tcg_const_i32(get_field(s, l1));
-    gen_helper_nc(cc_op, cpu_env, l, o->addr1, o->in2);
+    gen_helper_nc(cpu_env, l, o->addr1, o->in2);
     tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -3693,7 +3693,7 @@ static DisasJumpType op_negf128(DisasContext *s, DisasOps *o)
 static DisasJumpType op_oc(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 l = tcg_const_i32(get_field(s, l1));
-    gen_helper_oc(cc_op, cpu_env, l, o->addr1, o->in2);
+    gen_helper_oc(cpu_env, l, o->addr1, o->in2);
     tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -3979,7 +3979,7 @@ static DisasJumpType op_rll64(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_rrbe(DisasContext *s, DisasOps *o)
 {
-    gen_helper_rrbe(cc_op, cpu_env, o->in2);
+    gen_helper_rrbe(cpu_env, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4075,7 +4075,7 @@ static DisasJumpType op_sqxb(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_servc(DisasContext *s, DisasOps *o)
 {
-    gen_helper_servc(cc_op, cpu_env, o->in2, o->in1);
+    gen_helper_servc(cpu_env, o->in2, o->in1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4084,7 +4084,7 @@ static DisasJumpType op_sigp(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
     TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
-    gen_helper_sigp(cc_op, cpu_env, o->in2, r1, r3);
+    gen_helper_sigp(cpu_env, o->in2, r1, r3);
     set_cc_static(s);
     tcg_temp_free_i32(r1);
     tcg_temp_free_i32(r3);
@@ -4215,8 +4215,11 @@ static DisasJumpType op_srnmt(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_spm(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_extrl_i64_i32(cc_op, o->in1);
-    tcg_gen_extract_i32(cc_op, cc_op, 28, 2);
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    tcg_gen_extract_i64(tmp, o->in1, 28, 2);
+    tcg_gen_st32_i64(tmp, cpu_env, offsetof(CPUS390XState, cc_op));
+    tcg_temp_free_i64(tmp);
     set_cc_static(s);
 
     tcg_gen_shri_i64(o->in1, o->in1, 24);
@@ -4322,7 +4325,7 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
 static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEQ | MO_ALIGN);
-    gen_helper_sck(cc_op, cpu_env, o->in1);
+    gen_helper_sck(cpu_env, o->in1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4391,7 +4394,7 @@ static DisasJumpType op_stpt(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_stsi(DisasContext *s, DisasOps *o)
 {
-    gen_helper_stsi(cc_op, cpu_env, o->in2, regs[0], regs[1]);
+    gen_helper_stsi(cpu_env, o->in2, regs[0], regs[1]);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4492,7 +4495,7 @@ static DisasJumpType op_stcrw(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tpi(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tpi(cc_op, cpu_env, o->addr1);
+    gen_helper_tpi(cpu_env, o->addr1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4556,7 +4559,7 @@ static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_stfle(DisasContext *s, DisasOps *o)
 {
-    gen_helper_stfle(cc_op, cpu_env, o->in2);
+    gen_helper_stfle(cpu_env, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4747,17 +4750,19 @@ static DisasJumpType op_subu64(DisasContext *s, DisasOps *o)
 /* Compute borrow (0, -1) into cc_src. */
 static void compute_borrow(DisasContext *s)
 {
+    TCGv_i32 cc_op;
+
     switch (s->cc_op) {
     case CC_OP_SUBU:
         /* The borrow value is already in cc_src (0,-1). */
         break;
     default:
-        gen_op_calc_cc(s);
-        /* fall through */
-    case CC_OP_STATIC:
+        cc_op = tcg_temp_new_i32();
+        gen_op_calc_cc(s, cc_op);
         /* The carry flag is the msb of CC; compute into cc_src. */
         tcg_gen_extu_i32_i64(cc_src, cc_op);
         tcg_gen_shri_i64(cc_src, cc_src, 1);
+        tcg_temp_free_i32(cc_op);
         /* fall through */
     case CC_OP_ADDU:
         /* Convert carry (1,0) to borrow (0,-1). */
@@ -4823,21 +4828,21 @@ static DisasJumpType op_tam(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tceb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tceb(cc_op, cpu_env, o->in1, o->in2);
+    gen_helper_tceb(cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_tcdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tcdb(cc_op, cpu_env, o->in1, o->in2);
+    gen_helper_tcdb(cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_tcxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tcxb(cc_op, cpu_env, o->out, o->out2, o->in2);
+    gen_helper_tcxb(cpu_env, o->out, o->out2, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4846,14 +4851,14 @@ static DisasJumpType op_tcxb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_testblock(DisasContext *s, DisasOps *o)
 {
-    gen_helper_testblock(cc_op, cpu_env, o->in2);
+    gen_helper_testblock(cpu_env, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_tprot(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tprot(cc_op, cpu_env, o->addr1, o->in2);
+    gen_helper_tprot(cpu_env, o->addr1, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4863,7 +4868,7 @@ static DisasJumpType op_tprot(DisasContext *s, DisasOps *o)
 static DisasJumpType op_tp(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 l1 = tcg_const_i32(get_field(s, l1) + 1);
-    gen_helper_tp(cc_op, cpu_env, o->addr1, l1);
+    gen_helper_tp(cpu_env, o->addr1, l1);
     tcg_temp_free_i32(l1);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -4889,7 +4894,7 @@ static DisasJumpType op_tre(DisasContext *s, DisasOps *o)
 static DisasJumpType op_trt(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 l = tcg_const_i32(get_field(s, l1));
-    gen_helper_trt(cc_op, cpu_env, l, o->addr1, o->in2);
+    gen_helper_trt(cpu_env, l, o->addr1, o->in2);
     tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -4898,7 +4903,7 @@ static DisasJumpType op_trt(DisasContext *s, DisasOps *o)
 static DisasJumpType op_trtr(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 l = tcg_const_i32(get_field(s, l1));
-    gen_helper_trtr(cc_op, cpu_env, l, o->addr1, o->in2);
+    gen_helper_trtr(cpu_env, l, o->addr1, o->in2);
     tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -4925,7 +4930,7 @@ static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
             tcg_gen_ext16u_i32(tst, tst);
         }
     }
-    gen_helper_trXX(cc_op, cpu_env, r1, r2, tst, sizes);
+    gen_helper_trXX(cpu_env, r1, r2, tst, sizes);
 
     tcg_temp_free_i32(r1);
     tcg_temp_free_i32(r2);
@@ -4939,7 +4944,8 @@ static DisasJumpType op_ts(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 t1 = tcg_const_i32(0xff);
     tcg_gen_atomic_xchg_i32(t1, o->in2, t1, get_mem_index(s), MO_UB);
-    tcg_gen_extract_i32(cc_op, t1, 7, 1);
+    tcg_gen_extract_i32(t1, t1, 7, 1);
+    tcg_gen_st_i32(t1, cpu_env, offsetof(CPUS390XState, cc_op));
     tcg_temp_free_i32(t1);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -4964,7 +4970,7 @@ static DisasJumpType op_unpka(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     l = tcg_const_i32(l1);
-    gen_helper_unpka(cc_op, cpu_env, o->addr1, l, o->in2);
+    gen_helper_unpka(cpu_env, o->addr1, l, o->in2);
     tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -4981,7 +4987,7 @@ static DisasJumpType op_unpku(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
     l = tcg_const_i32(l1);
-    gen_helper_unpku(cc_op, cpu_env, o->addr1, l, o->in2);
+    gen_helper_unpku(cpu_env, o->addr1, l, o->in2);
     tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -5035,7 +5041,7 @@ static DisasJumpType op_xc(DisasContext *s, DisasOps *o)
     /* But in general we'll defer to a helper.  */
     o->in2 = get_address(s, 0, b2, d2);
     t32 = tcg_const_i32(l);
-    gen_helper_xc(cc_op, cpu_env, t32, o->addr1, o->in2);
+    gen_helper_xc(cpu_env, t32, o->addr1, o->in2);
     tcg_temp_free_i32(t32);
     set_cc_static(s);
     return DISAS_NEXT;
-- 
2.25.1


