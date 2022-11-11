Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6E626146
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:36:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYsC-0007zE-LB; Fri, 11 Nov 2022 13:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYrl-0007pC-De
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:35:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYrg-0007OO-4K
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:34:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso3650979wmp.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9jGL/FUfAGFTfK5rC1/vlTivx143+0Q3Bji1lhCRr0=;
 b=jV89u6VyjjKDtLneJt5fS9UV2mCgXTocsWf31iKNM2xoZsDGxM5sw6zgwCVqVs6Y2M
 7E/H/nRgJJ3fEa6DHcxszXDkHLn+h9maEi2NSyalttYU+6JS2xF2TJHgFeXfHx20z0RK
 PxcSozAJ+7GJaToOyiHNOOU1RPSJ76wOk9k3VWXyfLbIHLhFQiuai0uETtR6n1vZXCj6
 aBThDJM9AzHJy3hNaSSci5zjiWyKBx27vmFnCaTzSrUR8QjZ8t3d0yzLB6CLFggVtqMe
 kYIP4nf5rZJAWKkP9G9lIEgbokKjhQi/M8vmLA8dvz/JRUdFNLdEABrn5gofil0kL9vm
 8OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9jGL/FUfAGFTfK5rC1/vlTivx143+0Q3Bji1lhCRr0=;
 b=b8XfaXgUpawM1k8s0dWaxhc/GZa0xHDJYLsttHCEqzbCOWYkZ99oZ5QU69pggcuKW/
 5GFe3BI6zCrV93HLtSoP8Un37XRw7nyR6aRybLdJ/kmKfUdq1eEFwz4f1qf6sMl7lCTq
 tErIr0CmqfyVFK45iwRaBpGaZUBQoBylX9RGW8gKc4IuurhT//KCYylbVw3Lk62DYQLG
 CR8cd9Sdm/lNvJQtSNr9NYMCZdd9Uyu0slLSZpnNuVjX3vFCQboW7dQ6OYYRJDOgu1z9
 ZzyqRJitLct+gipm3Dd48xXzCfF9lIEge8bUg3omKQ4xSSVqngFSzCFVGumz3Q2WGRZR
 zmdA==
X-Gm-Message-State: ANoB5pmBqlE+P/oJlQNh43dw5uKH9IOZ9WIoT0ZN+U7w6zG8BvwtrE5Q
 93NqckFKyMMWbbjl9MlXVBUx/Q==
X-Google-Smtp-Source: AA0mqf4HiG+4YkOls4Q5nuipJaZYjXv+TrKFHGyeeAE26LnkqWZCxI4CfMYQjHncYPAqT8bXQezzlw==
X-Received: by 2002:a05:600c:5022:b0:3cf:96da:3846 with SMTP id
 n34-20020a05600c502200b003cf96da3846mr2103417wmr.10.1668191694600; 
 Fri, 11 Nov 2022 10:34:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfe381000000b0023662d97130sm2523569wrm.20.2022.11.11.10.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:34:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18D891FFC4;
 Fri, 11 Nov 2022 18:25:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v5 14/20] hw/audio: explicitly set .requester_type for
 intel-hda
Date: Fri, 11 Nov 2022 18:25:29 +0000
Message-Id: <20221111182535.64844-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

This is simulating a bus master writing data back into system memory.
Mark it as such.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/audio/intel-hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index f38117057b..95c28b315c 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
 static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
 {
-    const MemTxAttrs attrs = { .memory = true };
+    const MemTxAttrs attrs = { .requester_type = MTRT_PCI, .memory = true };
     HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
-- 
2.34.1


