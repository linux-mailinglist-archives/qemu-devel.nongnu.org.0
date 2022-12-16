Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97364F3F8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:21:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6ImY-0005ut-HJ; Fri, 16 Dec 2022 17:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ImW-0005uM-JP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:16 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ImU-0004Wv-Ss
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:16 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ud5so9283478ejc.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rw+OSreaYKaK01l9H3rpbBUYYZyWmIr/QVbzMY71n0k=;
 b=VOC2qmf7OPpDFDVkWgHbPSeEIJAC/EmuHhZKqqyjCBX5xnJNdOE4bv5OoRgHIE88r8
 7ek6EjPAwNrBLL6V5uvSCSkwIRRqpOI5d/tNz754ajBMGPEdsKU5MyqBXLzRwM+B4ISI
 0NrlMLKZC3vaOK39Nvsman4fh1Uf49PwpnIIZl/7VzPp1ZncmRkkH7N9YKVP3W7tIdbJ
 Va8GNZ1nlI9jHNSX8pJ+cuOS7K4jBshECa6ELozToGz75/M401G3HfVp2xl7rmHJMEQl
 RCk3pDLy3csARaFZvvaZFq782lrRqIaySQNAneXX8u0N1PpR1JeIWqO4tSaxposP8G8O
 fADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rw+OSreaYKaK01l9H3rpbBUYYZyWmIr/QVbzMY71n0k=;
 b=D/NEpYILjadHFmuqP87IIJHlLkRhUCrf+EuEJnBMjq+zL98CIyuqZh0Dxuyo2uyXoU
 buPW5KnBmBYJw3mNQKgoSoFNxJRfOzdPpYen3d/0Y3MVNVbEw7wPreneol3ITQ8j8/wi
 WLmfn+MlunW1PGfyv/Lc88J0sqBCV5JsCZriLCiGdFqvL2YliIl9ZlZMZJOf71Z/1ZdT
 SB6jQ0gq5/30ZFtO7wto+ZVDeIP/aifRindyEeBKjTjR8ezg/Q+0ZoXOjcYNqRosavBN
 jmZNDTyZGxKDqn3GQiT5yFxG910skDVa4cRJyo43bKed6RMfsmOweETL5dGJwkKpzef0
 52sw==
X-Gm-Message-State: ANoB5pn33iZyvlKhhOPVt1toqzK+RYq5LBwrXskZaDzLIvWzeM7A6INk
 cZlx0L2OdFOgLQ8EDCcDIP0uB72KqMwCa3gDSKE=
X-Google-Smtp-Source: AA0mqf7RA2oUxQRwnmkk9bvP1/0IDp3tPQ2jRy/yD+kcQ/9AIKzpuVdqm8QaDJMPBJCjBKcmUiNqgQ==
X-Received: by 2002:a17:906:6ad7:b0:7c1:ac8:399 with SMTP id
 q23-20020a1709066ad700b007c10ac80399mr14403774ejs.55.1671228133933; 
 Fri, 16 Dec 2022 14:02:13 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ku10-20020a170907788a00b007c0d4d3a0c1sm1278537ejc.32.2022.12.16.14.02.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:02:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] target/i386/cpu: Remove dead helper_lock() declaration
Date: Fri, 16 Dec 2022 23:01:55 +0100
Message-Id: <20221216220158.6317-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220158.6317-1-philmd@linaro.org>
References: <20221216220158.6317-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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

Missed in commit 37b995f6e7 ("target-i386: remove helper_lock()").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f729e0f09c..9824b7f8f2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2313,9 +2313,6 @@ static inline void cpu_set_fpuc(CPUX86State *env, uint16_t fpuc)
      }
 }
 
-/* mem_helper.c */
-void helper_lock_init(void);
-
 /* svm_helper.c */
 #ifdef CONFIG_USER_ONLY
 static inline void
-- 
2.38.1


