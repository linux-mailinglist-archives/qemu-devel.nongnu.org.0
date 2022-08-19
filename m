Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B06599EC1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:45:02 +0200 (CEST)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4BB-0000X7-Vq
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP468-0005dh-1I
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP45y-00063h-3e
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id bs25so5624730wrb.2
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Xeh2vqFOTw5s3hqoNhblRj1bcX1xyzRqQ8DX799pYws=;
 b=lTiOZM14C4pzD56g9hfva+qxBUzAabBWDLJN5hR2r8kR9DGDCGl9eBb37fdOHRGpUR
 w8y2AR8hA3b4fZi27JxSkFjT2oprxw9C6nGqd4yjE4Eafp0//ZITFsbdfi9qyTffPTkj
 DbD0bFwOW28DlJGhQAVHKoBV5V8pUhAziQSFVvpctj6+hao4KHGfcWKIypYlGKrPqndn
 bYysnjn3QaOpgzMngCOga8dF1+atqw/eQ/PmhxwhxJ+sCw1O+oT7CLSSPpfYsUJMNM3n
 5tPj4S48j7KTHY3MyJNH5kN0wlBokmlwOnr6WUgzzLa2k3OwxmEQb1WVGTklXQHczk5s
 3khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Xeh2vqFOTw5s3hqoNhblRj1bcX1xyzRqQ8DX799pYws=;
 b=Lb+qlxHzR14NBmm8z7gxhJWjzFFd8bqYnjn4dhC4y9tv0UkyDm/kiYvHOPE67SiimA
 rckkbo5jxKvM0hzTkupvgoKYcERvq2/41xoCWfcV1s9kQAaohyAQ8USUqXklKuwhaJ5h
 ykOcFn21d4iJRJGWCsaw/SjjjAMrdXhjW+5bQvAXpyIgQpB8sY2gO3kfBdf4NJ40KiHl
 dDp+O5VzSlME7Z2RAm+09N5K6ON465uutlKmGUm2A8R11knWQiTpN5Mh7N2kWfIsfLhk
 NvrSuWzxFb5PGeLypcD9GlwNJawpi0rs2MSyddjagymDwSBogmtGLbzomDUUCoUOQgxt
 +08Q==
X-Gm-Message-State: ACgBeo0mvtYZCR9nnvv2v8C1iMOyb2vd4s/OsTtbVuglJtw0c1AZnG7p
 5rAbLuJTuKxBx4UEkoV+1pMnDYN9fcOXAw==
X-Google-Smtp-Source: AA6agR5lmc0U/0M92Vfeii6kNDiMUCRzy09lOo9WtpDoF9W4wBSwR2fq+7z2qzvwFcQ+LQrxAnsHUg==
X-Received: by 2002:a05:6000:1541:b0:222:cf65:18d7 with SMTP id
 1-20020a056000154100b00222cf6518d7mr4464252wry.659.1660923575950; 
 Fri, 19 Aug 2022 08:39:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:35 -0700 (PDT)
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
Subject: [PATCH v2 01/11] chardev/baum: Replace magic values by X_MAX / Y_MAX
 definitions
Date: Fri, 19 Aug 2022 16:39:21 +0100
Message-Id: <20220819153931.3147384-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Replace '84' magic value by the X_MAX definition, and '1' by Y_MAX.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 chardev/baum.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 79d618e3504..6d538808a0f 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -87,6 +87,9 @@
 
 #define BUF_SIZE 256
 
+#define X_MAX   84
+#define Y_MAX   1
+
 struct BaumChardev {
     Chardev parent;
 
@@ -244,11 +247,11 @@ static int baum_deferred_init(BaumChardev *baum)
         brlapi_perror("baum: brlapi__getDisplaySize");
         return 0;
     }
-    if (baum->y > 1) {
-        baum->y = 1;
+    if (baum->y > Y_MAX) {
+        baum->y = Y_MAX;
     }
-    if (baum->x > 84) {
-        baum->x = 84;
+    if (baum->x > X_MAX) {
+        baum->x = X_MAX;
     }
 
     con = qemu_console_lookup_by_index(0);
-- 
2.25.1


