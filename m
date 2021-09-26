Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378ED418B6B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:29:26 +0200 (CEST)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUceD-0002d6-6A
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccJ-0000LS-7R
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccH-00058J-AK
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d21so46364837wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2W0DjczmO00zs6me7cCuH7cvWlENeBJiJjnuJqxx7ic=;
 b=f2GnhHn0L/+gczIPwFeeDG/VOHGy5shwhm/t5bY+DsDjAvSW8ChtmWkwu09Cgz5iPY
 tuQ+ZfVRrO40T7ShLZMAsQB051MIrJPQXRsCSa3TdDsY0gWJ6YGPsucLcPF0UV7FOtOb
 jI9ZzH7Ed3KTRc3+Kt9YNmxlsOlisV977dMIioo3q1kGb/kkXrq8vX0t/VuqBP4NG44a
 K04Y2MloOxXxo1hly9FL/1M20pupCHRWYNBiJusc7vWr/QThxhz2BeqDIoYhTKSuoYDb
 cpK0JaDQ2Bqh2ni2qwTtpSzFmBgZK6fzlUhuX3LBj6sdtWkbDId8NwF06IgMrKMxdpvZ
 rdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2W0DjczmO00zs6me7cCuH7cvWlENeBJiJjnuJqxx7ic=;
 b=0lqlW5k3PJFlzE3WxQ1DVF14K1jGLQv3QYsf8yF2M8JuO+uhX7LEIMwz8DAGenQMPN
 /onEkdLGwAFzEdYzGhdjFgjn9bk4kxc7hAP2VxFb5OTcZfrZKX5iuqD4EP65Ge9EqYrn
 O2uEB6nJtdVYzr5+OCHpoNZbkuIi/gU9ta7mjX7H3fMFUS5BByNLA289p1tfnIaou4Hg
 7oyduzH7Hle9qpu61TiUILyxVBoGCajzK7HRUuV2MbSq28KCjjDce+fePU9Ro85uv6ul
 GOgdeJe7+pVE6ambaQ4iXxyaKdcaya6KvUNqgdtjiZl3JI94RFQ3wQd2bT8wkOjml5kp
 W30Q==
X-Gm-Message-State: AOAM533dHDBIxEwGeN4xLIS2+OLZWkCXxiFkcX4MmpLMTPFetGS+x5lD
 OmoHpiDhdrogTntApOvRvVUi+u1Stx0=
X-Google-Smtp-Source: ABdhPJwRJu/LGw8uWoWxq2vn5EWhb+hv8SBOYDggT1CHJPZNXu/cX9+Vg1G8Io6/GtsPy9ZyMSlCqw==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr23535886wri.355.1632695243746; 
 Sun, 26 Sep 2021 15:27:23 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a25sm18738909wmj.34.2021.09.26.15.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/40] accel: Simplify qemu_init_vcpu()
Date: Mon, 27 Sep 2021 00:26:37 +0200
Message-Id: <20210926222716.1732932-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

cpus_register_accel() already checks for ops->create_vcpu_thread
being non-NULL, so it is pointless to re-check for it in
qemu_init_vcpu().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840b..646326b24fd 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -604,7 +604,10 @@ void cpu_remove_sync(CPUState *cpu)
 void cpus_register_accel(const AccelOpsClass *ops)
 {
     assert(ops != NULL);
-    assert(ops->create_vcpu_thread != NULL); /* mandatory */
+
+    /* Mandatory non-NULL handlers */
+    assert(ops->create_vcpu_thread != NULL);
+
     cpus_accel = ops;
 }
 
@@ -626,7 +629,7 @@ void qemu_init_vcpu(CPUState *cpu)
     }
 
     /* accelerators all implement the AccelOpsClass */
-    g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
+    g_assert(cpus_accel != NULL);
     cpus_accel->create_vcpu_thread(cpu);
 
     while (!cpu->created) {
-- 
2.31.1


