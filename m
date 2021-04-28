Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B63036DE4C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:28:47 +0200 (CEST)
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnzS-0002TM-36
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnei-0001tj-Ev
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbneh-00071u-2w
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id h4so54798042wrt.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAxtd3FVfWCgth1vFkPSMi25H2dRcEPTe7zUFtCCWjA=;
 b=CnkQ2Op8ogWF5y1SwU+LaQktzNys7YUqKNNyFydopx23A8Ty7f6LFhgZanDzfgFgV9
 KCuHyGzcmj1+J+sY4XHGGYM1VoCCc+LKqyzKg5rr5xrirPAAmvOZ2iF0wthfNglw/4Q6
 52V3KiL/tWIZiqMe5Ngbmn8J13iJGiHLtkTQVml93V19CmKBLaLT8ZRhtEkP9RfO00IO
 UPlLWuSw1CcL75wCCIGvszrcMOIyqkjGjC6Xi6FZoP2gAsVr9CzEsT50M01pPJyAppoe
 GCAs035gfBOoEmCRo8/5C82udNq5293wfEwetsKnKDH/IOe6TANwAB/Z3YF62dMapUQh
 omBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hAxtd3FVfWCgth1vFkPSMi25H2dRcEPTe7zUFtCCWjA=;
 b=Bs+cbDge9GB31dboMTcjyYIKKwn75VQtbaqNPSBUMnaOEOwPm0PaN4tkcq1ONAubra
 P3n7r4YRp5PINBbZp3UgQt46bXhMn0IRt7tpOADCiiYNk8+DVfjzNP9wptWMg0rUWDXm
 sPGddlHgVQTZZ0UBJ0/WJgTv+Y3SLrePb32oE5kT24VM6ILqnezxEA1/GcDcioroqC9y
 X/AOh8gTk7/6Y08hCbhs/j45zLVH5l+ZUbfF2DTl77pa8K75EonILtsPPxwLPqM/KXS4
 urVWzcgsd2A+bZH7rUhhXLt4XDehuCdCF3JkX4LYLHZWRs+d/5XQWyuDu2Lh0/KSGAdH
 XAmA==
X-Gm-Message-State: AOAM531a37elMs5fi+9MqfxtGV75D8UuPO/Q2HzUUVylhOEDoVRDxmsF
 QwYGeiEkm7HifBOschbHQLP4vf/JCeWZ5A==
X-Google-Smtp-Source: ABdhPJw/lQxgIIG9D+U7YFLeRLILz+qlin6PANt55ffntMy9grNhHiYfN5E9PtJyJfLDH47whEoDwQ==
X-Received: by 2002:a5d:6787:: with SMTP id v7mr29038579wru.386.1619629637005; 
 Wed, 28 Apr 2021 10:07:17 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p10sm438233wrr.58.2021.04.28.10.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:07:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/30] gitlab-ci: Add KVM mips64el cross-build jobs
Date: Wed, 28 Apr 2021 19:04:10 +0200
Message-Id: <20210428170410.479308-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new job to cross-build the mips64el target without
the TCG accelerator (IOW: only KVM accelerator enabled).

Only build the mips64el target which is known to work
and has users.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 2d95784ed51..e44e4b49a25 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -176,6 +176,14 @@ cross-s390x-kvm-only:
     IMAGE: debian-s390x-cross
     ACCEL_CONFIGURE_OPTS: --disable-tcg
 
+cross-mips64el-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: mips64el-debian-cross-container
+  variables:
+    IMAGE: debian-mips64el-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --target-list=mips64el-softmmu
+
 cross-win32-system:
   extends: .cross_system_build_job
   needs:
-- 
2.26.3


