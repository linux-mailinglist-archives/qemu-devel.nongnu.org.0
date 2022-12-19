Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6107C6510FE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jd3-0001al-NV; Mon, 19 Dec 2022 12:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jd1-0001XX-Gu
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jcz-0008JS-UD
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m19so6895878wms.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWAUPEHbEMdLnDIOFAMljqQ3bxfgcSl7wuSDWpPnUAI=;
 b=RFtDCHqw/rvTGNluRvEIQzZyTnuYaicshgLDpfvXvjDtn+6k4EzOZMssY6TwwQVa2g
 sTmqxANwYRWTpWJe87vzPDiOe8s6O6dP42hq1BrRSpmOA4tx5IfRbD92xlZjiD8WmtwI
 RilMrwjaU4uRs76I/ZCvvfhTWEITJMJpHxgmwGDHFQ/lA4HWy7ifC566vj3zL2tbI7TF
 SfUyrOHnV0o1i+0K9PBS2pjBTLT+gzF7DsclQZ5QjYTtDeLtLncY+Rc3rm3JeYJ4oPgt
 0wIAs0WaPwIgWUSMrCaK70Q8sJ3wt7h1fre4SG6n4j4X8FOmikDLIGdV6/x/nfV1uoSj
 zDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWAUPEHbEMdLnDIOFAMljqQ3bxfgcSl7wuSDWpPnUAI=;
 b=dtfHSU5r1T/qAUlyHIOWRpVpkbjBKTroKnBGgWIbMtpJG6QJ+/QPDwq8qiz3q1uXXn
 uI1ke5qQ0jlKBAf21hzC5lJod2yHpXHc82rsh/M0ywhQKZjAvuMC6vtfwNTe7+u0YEjF
 Iz7n8nFctkliH00sdRJ2TaUhwyeq/n/5HpnEr+QenMGYZH/cpKEuKv8XGDEJd7vf/9re
 N0RKkclsYT0MywlhEJncIT1JZN6j11shif2afaWa4IrGMHRgrbcJdmwmQDMcfESw71re
 lsRL19Te2e73xuLmYGXxdPS24Sv44Hvtelp9RpNVw+M+z4SJyBUjM/mozPReogk/icsG
 oaEg==
X-Gm-Message-State: ANoB5pm59LzJhiA0SLXx94gja24rX8Tg8692BYVt1XW85PfVWUCtgvaq
 UTTkPbUPCbbCuQzDmxUdozE1XDjlrudnaRniQCo=
X-Google-Smtp-Source: AA0mqf5burEAvhOC72FcEWZx4G7IOlq5F8P5w/9CF+vFYX0bcycilB5XNEfbseUDIFQhgKRBdT6vlA==
X-Received: by 2002:a05:600c:4f85:b0:3cf:7925:7a3 with SMTP id
 n5-20020a05600c4f8500b003cf792507a3mr33044982wmq.24.1671469716426; 
 Mon, 19 Dec 2022 09:08:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003b4868eb71bsm22725258wmq.25.2022.12.19.09.08.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 09:08:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 5/5] tests/unit: Restrict machine-smp.c test to system
 emulation
Date: Mon, 19 Dec 2022 18:08:06 +0100
Message-Id: <20221219170806.60580-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219170806.60580-1-philmd@linaro.org>
References: <20221219170806.60580-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Philippe Mathieu-Daude <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f432..51f453e6c4 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -46,7 +46,6 @@ tests = {
   'test-uuid': [],
   'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
-  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
   'test-interval-tree': [],
 }
 
@@ -134,6 +133,7 @@ if have_system
     'test-util-sockets': ['socket-helpers.c'],
     'test-base64': [],
     'test-bufferiszero': [],
+    'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
     'test-vmstate': [migration, io],
     'test-yank': ['socket-helpers.c', qom, io, chardev]
   }
-- 
2.38.1


