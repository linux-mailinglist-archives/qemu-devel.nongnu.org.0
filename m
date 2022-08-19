Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A8599ECF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:53:06 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4Iz-0002K0-7m
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46D-0005le-JE
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46A-00066e-Jt
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id b5so1346653wrr.5
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zDPOe1uObuxexnvyi+yesTMCr3hQR4+1gwfCM4+5LO0=;
 b=RXQ76h/CA4jXaZNLn4RwOVYu677lB4hoozg2SBc4RHoTFmiTJIej9SSYL6KQ3x0gtK
 iigSVbLLxoI0WM1jY7zka1QCXUXbirtltrZBy7KhZtINLjbIfccQzXx/D8iSJnaXGnjj
 yjccdRi7agGWSMhjEhvfxkarVciTFnCVxe2Cgvi5Y6fRFEWq/Nd16H5SOnU+KiGDZKDw
 EpMnKgb6SAnpfhJ7uoY0pFclRFUNh7HxkAvY8EAS7wdbYDbrbCYjaTtUdpZlHLzyFmHP
 94o04J0hrNW9IsI8BrVmIg+ZXRm0drvgBrl8VxM+VBYHf3a06nImVJ3gkvdbJayN6IYg
 f4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zDPOe1uObuxexnvyi+yesTMCr3hQR4+1gwfCM4+5LO0=;
 b=chv0h1A2Hs/ER5BEdYfs175CkmwAjIjwM7zngwD6C2uBiqrEhDTkLxwoNf/83jCpqw
 NicDTsDLv2hmZxHF1nmLfFxqtk1sMgPjxHpElmB+rq7MS4nuiOgdCNYWhDpOxFGi8Ada
 3b3w+ppk2lMgFgEy56g5AQGpoQFEkhfZz7sEQ+tQ3a/mIJdLXGlPKj5AzIDc2WXxRyAH
 qgI743ObHr4E2fkWp10Mv2ALfHIynaTDEU+RpQesnFJEHgtgfAGJ8UXI+xk8OlPTANqS
 rq26dj9mKHfUA65jIjNB799xZ9JZByMXR1u7qYD3lLvkEjGmU1pGlfH6mC+XHzPHyT+u
 onsA==
X-Gm-Message-State: ACgBeo3Cl0tqgcqsN2xTjzj2e0ZZkrAIUp2DqflsTfr75Sq/gYDIwyLe
 A1/6Z5a0YS0AjlRWSM849bGBj8H7OKJdeA==
X-Google-Smtp-Source: AA6agR5A6GZoW3JsZOQPJd9YZK+EiySrV8mTBieN7MIq9baZBH1YjZY0w0pnTUVqmnlPXQpFaFAAtg==
X-Received: by 2002:a5d:5711:0:b0:225:2884:cc88 with SMTP id
 a17-20020a5d5711000000b002252884cc88mr4537239wrv.141.1660923589234; 
 Fri, 19 Aug 2022 08:39:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 11/11] tests/unit/test-vmstate: Avoid dynamic stack
 allocation
Date: Fri, 19 Aug 2022 16:39:31 +0100
Message-Id: <20220819153931.3147384-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/unit/test-vmstate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index 72077b57800..541bb4f63e3 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -87,17 +87,16 @@ static void save_buffer(const uint8_t *buf, size_t buf_size)
 static void compare_vmstate(const uint8_t *wire, size_t size)
 {
     QEMUFile *f = open_test_file(false);
-    uint8_t result[size];
+    g_autofree uint8_t *result = g_malloc(size);
 
     /* read back as binary */
 
-    g_assert_cmpint(qemu_get_buffer(f, result, sizeof(result)), ==,
-                    sizeof(result));
+    g_assert_cmpint(qemu_get_buffer(f, result, size), ==, size);
     g_assert(!qemu_file_get_error(f));
 
     /* Compare that what is on the file is the same that what we
        expected to be there */
-    SUCCESS(memcmp(result, wire, sizeof(result)));
+    SUCCESS(memcmp(result, wire, size));
 
     /* Must reach EOF */
     qemu_get_byte(f);
-- 
2.25.1


