Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDED9674F61
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImgo-0004cV-3u; Fri, 20 Jan 2023 03:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgj-0004bM-4S
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:23:53 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgh-0004Ym-L5
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:23:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso3062738wms.3
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wur4svIjiQz2AhES/kPc/sLE88sCvtXVfBZRncbaNl8=;
 b=Tsd8yw8gjM9WiWFw1u+nhbOAlviY0vi1LROWylW2VzuI+GjIQLkfcFkOj0qWq4cMgi
 Ax69DOAlk87lTdD+yBFpWtmq6aLQkJApghGcFerFyX1zI+TfzTJj5qfiye/VTAzc2ApM
 TiioFwe5eIOPy9Wa/zNbXrzsVPX5Ol3mvuBXfQeJ9FINgzwYBGnDARrlwu/rslyymbDp
 5dYc1jBdQxGIWTLm3TpABQ3BwNA8+n8PmfcxnDV/4lQa2ysYTWD2dwvb+kJ+31CrhE78
 Wx5dSAKoR1euHRiWhboQjM111/r7IhS+4bOObXRRUd7lmu3TSjh5y8OFSjCE0KQ5I8UZ
 gKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wur4svIjiQz2AhES/kPc/sLE88sCvtXVfBZRncbaNl8=;
 b=RGlieFiqjNvOhGmD1YBVKwM+E7pkP0z1KwM5b480UASRlEcrR8PSsYb1B9ye5WqFV8
 vZ3ki+4V1TVrXJAPInvO1EJ8P9NcxpxYBZBLKGPeaz6Xvsfg+mQ+t0CVOQAQ1RXcU2a9
 l4dL3VY9WJo69ChuwxP0ebe77+IkeQrVhiz1h74Ce4LkwIb3I2YLGVkibMlk2ZIazwDQ
 KVBxNPHWYTDlQcRKdeDoJ6cdJ19oaVFfG2aNKIbvWzTfXTnDrrMJtmUW2i7+/AOhpQmb
 FMQRDcjE1DQGpvQ58qSp8BYW/lB3DP55MyokcthMFbDGri/vi6q5euWruUZM6CkgxEK4
 k3cw==
X-Gm-Message-State: AFqh2kqqJuYbOC+GvtzVi7Boe8nkUG2BihOfQMHzUM8vINaI7thKcXM1
 2lvQqEV9kYGrzO/AwhfShlaJXgoIKqktcSgk
X-Google-Smtp-Source: AMrXdXtkJ1jqB1i3+J7XJoKLCAWgrZIbC9+CEu5oqMd2BfXeESU6BsC6DedPr2M5YwP28x+UXo5ABA==
X-Received: by 2002:a05:600c:1d8a:b0:3db:f0a:cfa1 with SMTP id
 p10-20020a05600c1d8a00b003db0f0acfa1mr9825757wms.9.1674203028581; 
 Fri, 20 Jan 2023 00:23:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003d96efd09b7sm1729432wms.19.2023.01.20.00.23.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:23:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 01/11] tests/qtest/boot-serial-test: Constify tests[] array
Date: Fri, 20 Jan 2023 09:23:31 +0100
Message-Id: <20230120082341.59913-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/boot-serial-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index b216519b62..3aef3a97a9 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -139,7 +139,7 @@ typedef struct testdef {
     const uint8_t *bios;    /* Set in case we use our own mini bios */
 } testdef_t;
 
-static testdef_t tests[] = {
+static const testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
     { "avr", "arduino-duemilanove", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "avr", "arduino-mega-2560-v3", "", "T", sizeof(bios_avr), NULL, bios_avr},
-- 
2.38.1


