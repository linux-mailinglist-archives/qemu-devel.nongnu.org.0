Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B2D5EE4A3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:52:35 +0200 (CEST)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcAa-0007gs-Ev
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odc7X-0004Y9-8i
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:49:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:54329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odc7R-0006TP-RG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664390954;
 bh=0wAfRuqRXm6UYnnUf+5fqHk4mCJEck3Gd1tyiYO555E=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=IdiwRREZKKc/jE0lVg67UytyZLj4LANYFAFWmb4dbYR2yb1SHZLVllFpCCr82gPMm
 VPmmPaa1tQp5hhg7XvpEOPigANBMq0pRx43qG4TcsQJa1XstL3L5Y3SXEbIkodFM4q
 RwwndZFf+TODvmVbz+TwaHUmWKV9QZdjZjSn3W3k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.180.135]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf0BM-1pB0vg2NQ2-00gWgX; Wed, 28
 Sep 2022 20:49:14 +0200
Date: Wed, 28 Sep 2022 20:49:13 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2] target/hppa: Generate illegal instruction exception for
 64-bit instructions
Message-ID: <YzSXKYBpJ2XeO+1C@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:fYpiKarELmXUGjFb0wqIzQAU5ccscydX1/kreoVhzafVQWUc9/B
 /uZUhKfAVsWxu+dU8HWDjyRD7Dk6XJ/Juhnsp2+RY/Uf7bsw20DoSErxYmWgCwFpTkuYoeM
 vX1OYIQXkYkzCDmJeA0r4DYOpHKbeVZ0YKjdsnJ7V7e8PWBrbRTWYfmjc5xRrMSrXOT1aXu
 UHrwf83uVNcxZf4B0S4cQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:upUQPAiOS88=:/zA8tWhXKJjjcclKsDAPXo
 tLKbGzK+LERd1hsNFYWBJKr3+FmSdnwMoi2VaPeXJi3vyZvQbKlSLVATz5w/m9h9+GMqYJnG7
 7nPmXbaTfCOw6yP19wQvl0SXvocYIc1mBywxyeB7BFvaNp1XO3YuNNgCWXNJd+fOA0Z6fIpcT
 Ow9vLYCa2Jd+Us42YXr/1rGR5NZtO0CWLDxcTlcGtv9WL5qO24Odt5R3LmNWaD7hNsPd9Iffs
 lou9FLccazRhn+Z47kDHtfJJpuTDW5ZgbdR6JD6C8s4kdP22Pv/egbHQzT18TZnXGwRaSm1IW
 uxfnuiRVjfcAJUPToCzZWQiImoISN2dnudCP6hEEHnqc8qSt4TFwucISxa0iJtt9TE20xe6t7
 IMkJepfrbosXJ2n3soAG4wI9GHkCm3udlNK1dTLfXmtlTvlZ91GFjHb/nkz9dm1uK3d9W8mCT
 g+I/pAq6325PajWgguvN2Wx+cs38ARvGcA/cxwnZ07b+K/84ne8mJmztT9YB+rOI4kipqtRRT
 n0w0pWjJDkZkn6/zJjVFd/x4Lfd99dCsfLnpQnU1YS/kRD746bPFWSZ5sy2h+J0GqwJcYPiOB
 4Rx95laVs5qsYn4OW8OFIWFrLtlvt4GslRiMuQiOhoguJF4pr7WCg2o4iA/oEAXnPEy4ST0Kl
 kY4JEEyg5XXs6TWGzae3QStht0RL5qrS/MWfptFJbVuJMGq20r6pkeGKno+a2AQswdEefXW+Y
 YjtOXa0UC3kLvPtKYm8PLlKyc9STUa58ayBGrS959jTSKjSAMntzKKrHxg0CiDVBpp3rghPEB
 E+/kKP2d4ljyZKWN5O33kGOmSaN3ZeKo3NnnuRzulyZvj7PqP8DeRTXIoNmbBIbQK9VUEW8ot
 Jgl2GQ1JzDph/McHg/RkDRSrPCgHoHEF9dacTIifBzxfgSDfzMVhdPa2xfgr5dU8A9NI7jecI
 FJ4rAFnB6rnl3RnqkVtnboPGYfp5iwGY7Jgoxpewf3DIjXTjJQVEiOSGeD74mbQqksNyGuGUP
 jp4f5VeQmkb8cSFdSp2qSDTAVnw4YP6zdQ/eZsTLBM0MwilWZimoAIgeYCFoGPhVgeQEk+1zd
 zZUjn2peD1Lh6jqcLjpGqMXwL/a2URvbpfG+nuS9PRDS5GG9KgNcVUgsU9kT+rzVZsEh7FJpb
 TIwKneBSrQ9OC8T5fClxt4Fyxh
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu currently emulates a 32-bit CPU only, and crashes with this error
when it faces a 64-bit load (e.g.  "ldd 0(r26),r0") or a 64-bit store
(e.g. "std r26,0(r26)") instruction in the guest:

ERROR:../qemu/tcg/tcg-op.c:2822:tcg_canonicalize_memop: code should not be=
 reached

Add checks for 64-bit sizes and generate an illegal instruction
exception if necessary.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
v2: Move checks to trans_ld() and trans_st() as suggested by Richard

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 8b861957e0..a32036c4ce 100644
=2D-- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -2899,14 +2899,22 @@ static bool trans_cmpiclr(DisasContext *ctx, arg_r=
ri_cf *a)

 static bool trans_ld(DisasContext *ctx, arg_ldst *a)
 {
-    return do_load(ctx, a->t, a->b, a->x, a->scale ? a->size : 0,
+    if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && a->size > MO_32)) {
+        return gen_illegal(ctx);
+    } else {
+        return do_load(ctx, a->t, a->b, a->x, a->scale ? a->size : 0,
                    a->disp, a->sp, a->m, a->size | MO_TE);
+    }
 }

 static bool trans_st(DisasContext *ctx, arg_ldst *a)
 {
     assert(a->x =3D=3D 0 && a->scale =3D=3D 0);
-    return do_store(ctx, a->t, a->b, a->disp, a->sp, a->m, a->size | MO_T=
E);
+    if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && a->size > MO_32)) {
+        return gen_illegal(ctx);
+    } else {
+        return do_store(ctx, a->t, a->b, a->disp, a->sp, a->m, a->size | =
MO_TE);
+    }
 }

 static bool trans_ldc(DisasContext *ctx, arg_ldst *a)

