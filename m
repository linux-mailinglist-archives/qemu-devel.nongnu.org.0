Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB37599CF0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 15:36:23 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP2Af-0005HV-PH
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 09:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oP22u-0004i1-Oj
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:28:20 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oP22t-0001zi-0U
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:28:20 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso7546752pjl.1
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PNJRJesXZZQqJUbxS87KqUPXjO+p3EmWgOG4tm1aKkY=;
 b=pkFNZwOHehc/he3NZB0IPqFONEUfxekKCtt/7ye/dQQ3lLb9gHyQwr5rHMYOZpEtyE
 0nEzcEd+LDAb1k95t2ZA6za6tpfmtyUPt/Aq1GoxlYUG29r91nOxi5eT8gjlWYCGaUKf
 /vsA7kYo7CyHBA21HA8iSPuAYyCKFBbVl4K2H2yIkxGLffOy81kNyO9R1ECSTt6Eepn7
 C0pyOXym6p+F9xVVdjWkN+CmpNebs/4MlnLDKCaMegRqQJs31cs5mPP5P9NkXdfch4Rt
 EGdIgGX6h8NHoz94RTRq6b1QU1M/DNHp3GExaNi5gpyeKprOZ8nevtWtVG5WhlxJsIAD
 QaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PNJRJesXZZQqJUbxS87KqUPXjO+p3EmWgOG4tm1aKkY=;
 b=zhgveGznydrKffavqvKbLMrN/vd78Bft+RJ+UMnOJkRyNi1q6InivV++03rdnXTyU/
 tuEUlQlPr1XHVE7hggURHme9HVg+mnoppoIl8Zvf1d2S50BYOaGxbdHrrWJjB0YxPrs2
 vFlJTKzz7H7vGKAdJURF0WkIEoUuHfvOCoujap+jyoze0w6GmWrfVfsoTQIXe+ZnC60w
 PtfUDI7+SnjTChMeBLC2Q37Fsq9ZB3LGND+fc6Gg4SveGsRZPj14d5FWX0GNjWEOgzs5
 F0qOwC8tBPqmf1UD/B3UUbMSzVtAt2m7FpEhiNp2jZbIxhzppZusg+ZJ/dGSWEUHtvTl
 vVkw==
X-Gm-Message-State: ACgBeo3gk0h2O8NwUV4j+e7Xv7NMuqXVwKZr6zBjMbwQqnJQ6r0KXMS2
 z+TMhv2isOlDKd5hHh/mTDj9RFw3tl8=
X-Google-Smtp-Source: AA6agR7U2FJQFVp0M/EhXZIhVQcICOvVASsLd7bThn1nJWdMC1CzRAZlm96EH6+uT2qY3SnNqChHmA==
X-Received: by 2002:a17:902:ef50:b0:170:9f15:b998 with SMTP id
 e16-20020a170902ef5000b001709f15b998mr7386591plx.102.1660915697248; 
 Fri, 19 Aug 2022 06:28:17 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:c4c3:cfa3:24fd:3a7])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b0016edb59f670sm3195005plk.6.2022.08.19.06.28.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Aug 2022 06:28:16 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v5 2/3] Revert "main-loop: Disable block backend global state
 assertion on Cocoa"
Date: Fri, 19 Aug 2022 22:27:55 +0900
Message-Id: <20220819132756.74641-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220819132756.74641-1-akihiko.odaki@gmail.com>
References: <20220819132756.74641-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This reverts commit 47281859f66bdab1974fb122cab2cbb4a1c9af7f.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/main-loop.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index c50d1b7e3ab..aac707d073a 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -284,23 +284,10 @@ bool qemu_in_main_thread(void);
  * Please refer to include/block/block-global-state.h for more
  * information about GS API.
  */
-#ifdef CONFIG_COCOA
-/*
- * When using the Cocoa UI, addRemovableDevicesMenuItems() is called from
- * a thread different from the QEMU main thread and can not take the BQL,
- * triggering this assertions in the block layer (commit 0439c5a462).
- * As the Cocoa fix is not trivial, disable this assertion for the v7.0.0
- * release (when using Cocoa); we will restore it immediately after the
- * release.
- * This issue is tracked as https://gitlab.com/qemu-project/qemu/-/issues/926
- */
-#define GLOBAL_STATE_CODE()
-#else
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
         assert(qemu_in_main_thread());                              \
     } while (0)
-#endif /* CONFIG_COCOA */
 
 /*
  * Mark and check that the function is part of the I/O API.
-- 
2.32.1 (Apple Git-133)


