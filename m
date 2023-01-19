Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF6673546
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:16:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRow-0004eP-8K; Thu, 19 Jan 2023 05:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoC-0003z6-SZ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:15 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoB-0005HV-Bt
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:12 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so840796wms.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGJD4ga3J8xHyk3OZlII0Hth91GC6i661lSTuntqoMY=;
 b=sU/mku+8bdAPvPh/NwGYZAIvmwLPGFZ3THFdmBM7LeshJlWO5fDPuyFzYLHBRshbLu
 9p5TKwQAmNc1mcTFJOeu9pYx34ALHT5bwEyQoQVWSZWdxMwp1GxJZx5IEtBVXhumN97m
 m+9fohXi5pvZDEjvZbGQaNsHZH7xpvWFgGe2/I64RgTjd2v8pEQp4SrcHzolhdQKoXn/
 G9wfg4olJdyZGqc1o/f6eYezrY5/Obpp7K0TR+14pij+LnncAAdnhP6sAKpU69pHqjdD
 9jI9QO47sVmj6d27s94IS82Bf1psyz0NJeyJfETSw+Ls8rf1s2QJDkPXVzSqxriPKUeR
 kGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGJD4ga3J8xHyk3OZlII0Hth91GC6i661lSTuntqoMY=;
 b=24sH3Pt6ButAhI/bfCqCZjed2BiGrM3A5lYzJHwuLvjnA5F9jpoKyjSfPmQjnkB0ST
 zw6p+RAjwuPYBGs1kTK0bX1eKf/ErbCV+re5yO/qHeqiG7sKyVlkh27NbPgLUzqAXdXn
 3blWiEJDMlw02dM4hY391nneV9XQqGQb8ktyW3HWOLOGLC0YS9T0oZSNvMHe1JvDzbe0
 QAhXuOizNyvVdfNaZ2BYdkCvnbLEY43kT8DPZ6jVukhtIjgQLQOlYQeztEoDtl9rzxGw
 R3ALpRBeWW5MrIy7Sj+rPjEpQHmzIiq1ataKjSlrYNYfsQpI6uz88hxME1kymDcna6GU
 eMCw==
X-Gm-Message-State: AFqh2kp7eRL4K/nUemxVrNVwxCRNwK+3pzHCIy63vyGrB2IZfyYFnL+j
 gv1DJ5ln2VF79+kdBYQEq306S//S+7D6XQYu
X-Google-Smtp-Source: AMrXdXtXFCIYSPd9+rhX3Kp0bPwFLaMtXXUQF1Gou/sEwCDxpwYLxszGIdV7ReP8qs1DBNbUFlUk7A==
X-Received: by 2002:a05:600c:3b29:b0:3da:f678:1322 with SMTP id
 m41-20020a05600c3b2900b003daf6781322mr10067606wms.38.1674122769486; 
 Thu, 19 Jan 2023 02:06:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b003c65c9a36dfsm4526130wmb.48.2023.01.19.02.06.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:06:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
Date: Thu, 19 Jan 2023 11:05:35 +0100
Message-Id: <20230119100537.5114-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: CONFIG_HVF is poisoned.

We could pass host config definitions to qtest using:

  diff --git a/meson.build b/meson.build
  @@ -2547,6 +2547,7 @@ foreach target : target_dirs

     accel_kconfig = []
     foreach sym: accelerators
  +    config_host_data.set(sym + '_QTEST', '')
       if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
         config_target += { sym: 'y' }
         config_all += { sym: 'y' }

Then test for CONFIG_HVF_QTEST ...
---
 tests/qtest/libqtest.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 6b2216cb20..31650bdc9f 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -901,6 +901,8 @@ bool qtest_has_accel(const char *accel_name)
                 }
             }
         }
+    } else if (g_str_equal(accel_name, "hvf")) {
+        return true; /* XXX CONFIG_HVF is poisoned... */
     } else {
         /* not implemented */
         g_assert_not_reached();
-- 
2.38.1


