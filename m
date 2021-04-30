Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F637025C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:46:51 +0200 (CEST)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lca2F-0006FY-1u
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZij-0000Aw-EP
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:41 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiU-00066r-2y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id y2so2972885plr.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=Wklgb60DNZIETuk5vMn+bFI6sm6bBUF3KJrs/PpOZd7A5d12r5jrtVrJ8dldNtUq5r
 w+NS53iGNXsm+phAde55zRYBegkBa2JbRWz12jFvH3Z89F82fS0Z9dXJmLQhpvNyc8te
 Im1j7j1Vpq26b7cxtdh99QywTODFkVMkhXSVveWRYpi4h/+U2yrBJ0mCnc5gbnkKMdmr
 0EuRFxG+kdSn7zNxdAy8rA3iX/L9JhI1pgMxF+zpsfofSk6wYUF89hGWM5QInm8Tyg9g
 X1hGfJyePzosT3Mwh1p7edTWzDuU13W+xWOlYN/TVzAWYcMI8PPxaJLF/eE6s5WoIdvj
 Tr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=dN+vnc66VAEFekAOvRWYjsnwvZ0Ve8PsIfWzGM9XWLxe5K5rvQlyPgZfL56Y32RVHJ
 nRc2LswNACrDEeMcogHXylBI9TjKD8eAi+cIFSmEeP+jZ1zig8FYdT2dX1dL9IfZOFkF
 ImmLLd+V8HfrcYTsxKvHIHb3XSBOZtZlWm13og2mckuFhVFHOu8XL/pOSvJlVNShrpPu
 4d9COdMfjjuY7HRWVR7f6oeb/YOQGQg+J2i/ZYl89wq/ruFFCSRAC3SiY3ucfMxtQ5sa
 DlcwUsI3u3MhyXPdMjOrlZe/0Cqz7t581CSCtOKgt/yJi21L/qAFPKTfo5OslT8k/VqX
 nLNg==
X-Gm-Message-State: AOAM5310QbwGYfT6dOBEEYJbzhVaVhIfrDaT49UGbqvi5HLtgwWEA8NK
 9kVBn6nGraNbw41iIQ62yGjPvMBWuq2RNA==
X-Google-Smtp-Source: ABdhPJwGFAsvbBwwfPiOHNE2wrc2Cvi75wRypifWJZlBO57XZ8Qzq/QCAUcHFNlWQiFI3PwllXLohg==
X-Received: by 2002:a17:90a:d184:: with SMTP id
 fu4mr16422647pjb.79.1619814384729; 
 Fri, 30 Apr 2021 13:26:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 22/82] target/arm: Implement SVE2 bitwise shift and insert
Date: Fri, 30 Apr 2021 13:25:10 -0700
Message-Id: <20210430202610.1136687-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd1..695a16551e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c11074cccc..d74a15d8b8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6428,3 +6428,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.25.1


