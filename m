Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13C460D32
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:23:03 +0100 (CET)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXFu-00029X-Oz
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX0b-00087g-UT
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:07:13 -0500
Received: from [2607:f8b0:4864:20::42a] (port=35423
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX0Z-0000c7-QC
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:07:13 -0500
Received: by mail-pf1-x42a.google.com with SMTP id p13so7633505pfw.2
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msn2vYfPMSfmjcvhvCuoNT+Xnj+wzoOeb8IO8wdHfk4=;
 b=kw82d0PzZx/NU24RODRQNp9EjJoXri6HlH5G9ynDnBIkm6pjhe7aq+mDOm+OidfhQN
 Xr82qh9KVfYoZWswkeKNz3FifsXZ33jV7lhB5NSWvKp6iYoCWsb2wAtJck4FWMKGtoXH
 8oE4a5ZA7hYB/lSPXjKzL2c3X6i7mllFUhV+cc3wgusl/AcDKDAoHWoSxR/jXpervALA
 Zb8sWq5zYx3bQvmGWX7iV1CTK2tkNpPmqXDyU6EypxRW440jv3OaSRFBh4JCDL/RzQLt
 i3m67AUWntxvx74WP/piCUjNrPq8yESW1Pp/Tk+He6NeYONaqJ1A7YruVvryyUWkTNNJ
 33vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msn2vYfPMSfmjcvhvCuoNT+Xnj+wzoOeb8IO8wdHfk4=;
 b=MYU9ZZgNlO4Dp0MGcoxwatXnG+hkH4rnl8CQp9XTFNve+qRbCKfFlVZfHROE1bJRVy
 IIwrTunusrj+YkaHk9Ddf0StY9iJ8TJWvabD0SMEPTGoP9ZQCmYw6zqPQduHVN7Bfgk3
 kvqQghfhFjAcq2JiE8vVBR1lWs75viRqBt85CimcljnxXg4oy6bL3QCxatojNAxjQtqB
 Sl//GCycMmdl/7APSc2XdIg4p3coBfJtSlxKjblLsg4wZXsI7S1RHL3fAFi4QCX0ZXn8
 s5BV/KeIYyag6dzu2yKLawvQvYaN5E/6SiJ2lTHtDu0U+4ci/ZGgF5hAHD4rSJHj9UIR
 jmKQ==
X-Gm-Message-State: AOAM531IR7mzDxPb9RNMxQ3FgVOJxKMHq/ysokZ7R8LqLBqEjEMF5Yji
 Xv4x341OQF5khiOeFBcTTS5ntcvHj6l/6gxs
X-Google-Smtp-Source: ABdhPJy9nHdQ38Tv1T6+iHxNriysdBiogjZwzr/q7hGU3yDJOEZuOtk82vlqBVuwDSEivK2q1e1snw==
X-Received: by 2002:a63:f047:: with SMTP id s7mr33408126pgj.389.1638155230462; 
 Sun, 28 Nov 2021 19:07:10 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 42/77] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Mon, 29 Nov 2021 11:03:02 +0800
Message-Id: <20211129030340.429689-43-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0076ce5a0a9..48942129135 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1685,9 +1685,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.25.1


