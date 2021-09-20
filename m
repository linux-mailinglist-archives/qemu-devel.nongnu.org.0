Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21AF4128AD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:12:15 +0200 (CEST)
Received: from localhost ([::1]:40908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRWI-0003qU-RA
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6g-0003e6-43
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6c-0002CP-NB
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id u18so31835213wrg.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GnKfjoq+otyiJmny5QHC7t7xnub0O32xM8y+f0O0Xns=;
 b=aUG3VnS8PRspHNNsOlFg/xGnuK52cKOH8eUfMyNhWuErtW8JyHzAYl2rRXRuNfZkid
 pw1uoIqysdVB8NFfZUOSLr0tdcFns2qyySDb+MjJScyFrYmyJCWmC4YnTYwxNZUyum1M
 dkHM6ohRRZG5KEaOzpLSKo1PRAjwzDCdeGqdYAvjGqXUtxvCkexlBY8PPuTNMP88noeX
 +tjjqEO2udVh4pZjWApSNK0pc4Vo5AP8F6CfeL0t6RE3YKhFlU945KCTyDEraRlgaI9Y
 XNkHiA4rbH07eDXOjwoA+g5oJ8KsSu2SvT7aCxDQg3i3K8ewWZs+l+GqE1fRX9f1twBb
 0m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GnKfjoq+otyiJmny5QHC7t7xnub0O32xM8y+f0O0Xns=;
 b=zVJKUhgrWy+hgLkgUl+3eihLJIJOXMNxvdU6ZAwH7DL63ne+Vr4h8FtLg03+V7ep4a
 Fx0GM0IflGz9eJOTZh+e36vsC6JgVzxo9UbqWpzicQvFTBrhrql4Rh06a4DGcNN3SBMe
 2velR6+Xb/jp0sMDpEHiy+euzgFZzgAMbmqV0g9459m/wLiH9xe2vvIaTtBJcV2SYb4L
 9D54ZqriWQEwPCEY4EwjoUXr/7l6TwpteExuSjkbfHBTS/EPbucjw3LWVP2JLrAChpyN
 wNn4V8ZmH+ttsbuKP4Bf/szjX1s+JtTKyXKd12pc8pjn6IIhLGDYmSD4YGnhevCxdTgH
 mFmQ==
X-Gm-Message-State: AOAM533x1O1/4BK78C6BGlPYs9uKISBmJ0DEbdKAfCE5CevOcGB6cPBH
 dkqF3qNzw7ULG+qqNBcNG+CKL2ZdwU4=
X-Google-Smtp-Source: ABdhPJzY/ycWivqFKfqWMk7aAEpoCHSvw3d9eXkG5jy1eJOAwUYHZObjQJ+PopXfyIUx4iRKKD5bFA==
X-Received: by 2002:a05:600c:40c4:: with SMTP id
 m4mr1128249wmh.100.1632174339522; 
 Mon, 20 Sep 2021 14:45:39 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i2sm16681225wrq.78.2021.09.20.14.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/31] target/avr: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:27 +0200
Message-Id: <20210920214447.2998623-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d70e34dd54..6d51f91ca2c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -195,6 +195,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .has_work = avr_cpu_has_work,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
@@ -211,7 +212,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-- 
2.31.1


