Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A8567BCF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 04:17:43 +0200 (CEST)
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ubm-0002Ia-3t
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 22:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o8uXp-0008Ve-Jk
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 22:13:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o8uXn-0007iw-SB
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 22:13:37 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso8493310pjc.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 19:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klW5l721zkRtbV2/1qgZifBW4d5CZpXzNC6YAnMqrO0=;
 b=WXq9tCMTrkQl9EyJV6A2+JCdHc4WNDDer409V7FaBudpdGw9in5VGGkdWu0JeVf4kL
 o4eZfDy06PWfqYNYa6+KFYWCDlf6pF4mYo5xmdOMv+Dbqc/MLvAu5Wx1gJaCo4fPHaZi
 UMiDKvIEe1zF1AgK8ic384QOgfJJroEfHuKMOA9YvCdEjGWTpjsyucFevUoxGx4gknmA
 v2fsP2zqQWB5tzt8AxuXVgGyhoUJqsxDYobBzWP+xRs4XIy43rnWfhASCbUuPrKFvLLN
 TDC7yIx/kUIE59v7mo0a6XVfe+h+vw5qs2Wg920hTXVst5AaLEHRkWecrID3iXGo7n86
 +2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klW5l721zkRtbV2/1qgZifBW4d5CZpXzNC6YAnMqrO0=;
 b=VxrET0M167X/97/C0PEJ3XEJwku87hqFYel9uRERlijxDRZjpZ/+r3UwPq2JvF+KEw
 655C7/0ESK12dgk+UnTKjcPhwDtLPhe/hsbO2Nk2rAn1Ls0wgTlxacdSemosWj19tmnu
 BBZ2lZBz+ymD6oLbHjHopdpxS1xBFbDs/tJcO0zddaynC4qcjfFlbEn1yNfQlWL4X/Ao
 HQtwE2YcSUFrADdjR7U5muanB8etAblw5p0psO96rVlZYoJ9mpiz/tRxlbTNzDorlrAm
 6152NIWwQlDi5YGUxekeyZgxZ/kEYnJj9bDpzMgvBAZFHEg9F/y6+sEPgYYwui0lRmdN
 JF4w==
X-Gm-Message-State: AJIora/e+X4LSyyMkh78SNgu7aNaGb0tj3K0m1yl4/yre73rk25S45/d
 F8AvqJw2xzt/N/zc0QShEO46HhFEeds=
X-Google-Smtp-Source: AGRyM1v+KYjsixBEJ/YU8718/fOt0z5bwbJQIU/VkRYpUbEVBT/DZMv+/9VLTDrQxp4Hx5ouxqXXBg==
X-Received: by 2002:a17:902:b598:b0:168:b0b2:f05a with SMTP id
 a24-20020a170902b59800b00168b0b2f05amr44684636pls.0.1657073614121; 
 Tue, 05 Jul 2022 19:13:34 -0700 (PDT)
Received: from localhost.localdomain ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 ij21-20020a170902ab5500b0016bedcced2fsm3334071plb.35.2022.07.05.19.13.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Jul 2022 19:13:33 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH 2/3] Revert "main-loop: Disable block backend global state
 assertion on Cocoa"
Date: Wed,  6 Jul 2022 11:13:21 +0900
Message-Id: <20220706021322.22570-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220706021322.22570-1-akihiko.odaki@gmail.com>
References: <20220706021322.22570-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
---
 include/qemu/main-loop.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 5518845299d..0aa36a4f17e 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -280,23 +280,10 @@ bool qemu_mutex_iothread_locked(void);
 bool qemu_in_main_thread(void);
 
 /* Mark and check that the function is part of the global state API. */
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
 
 /* Mark and check that the function is part of the I/O API. */
 #define IO_CODE()                                                   \
-- 
2.32.1 (Apple Git-133)


