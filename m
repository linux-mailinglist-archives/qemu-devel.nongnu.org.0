Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCDA5774FE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 09:37:38 +0200 (CEST)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCyqQ-00071h-1A
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 03:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCymp-0001bR-Uw
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 03:33:55 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCymo-00052y-9m
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 03:33:55 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f65so8022299pgc.12
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ylb4woiWl7rRdOJRD6I0pk2qnNC5s/O1KGQ+3BsXcPM=;
 b=JoiUQe3tQH1lAzO3H38djXU3xg6c71EkYXvoP81XmKgAIhhp6mcmJTt8I3xM4FA9xN
 cNeh5TR7FL/03ROA+G6N6DAKQqZcigsCT014rlEL4zCIx4Wj6R2sWyg2y403YXutO9zg
 V8HZrpt9oUyswgUSfst+6g5hx7lP1w0ORBPp0bQfpN77OH9hzbfW5uWc7piEk8vaPbll
 /jWMTe4xtf5YrcRwgLAGiaiLDuoZhGyrZHbhhKIqDuqE5VDNW4Smgr9/xbG2D0FFw4cA
 SJ+Ym9Dw61809PhmtxDib/wyzQSpj3r2c7R4Sx66Ewrzu27DMJU11DbSRiY4GD7T6cVm
 UhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylb4woiWl7rRdOJRD6I0pk2qnNC5s/O1KGQ+3BsXcPM=;
 b=t6ZFZn/Fe4Gl6WZzcIC1BAAFf6qLIjgUCp8tvrnWiQi/GCqwlnN/eeXb/2h4NrRPWT
 Ok1O3LEYUZtwQjoKabv84LBxutInlKyaUiRw60l9BMA4P7bJxdHWfhKvrvloFy/uT7tc
 bbVWhNuZwhB7btnHhr9MAIX3axTz2Lwu6irhNzeq5zt0K3C4NzHxMakWfr5wBVVqZXsg
 Ip4xy5tzdlDYukE+Gpo4Y3ABrqnd3BFoeCzCjOZIHklUv3MzKP2jnDarOm1HV6GBfyTb
 2sQi39Euf7LoHXuLF3Ypwc5adR02RAPm/yrQW6jRVRsGGPPOIi5kohaiTPLndeaDDjsG
 XxJQ==
X-Gm-Message-State: AJIora9a341Fn409eHaB9hgNwi9E//hpiEBu4/7Si4tU/RyWiSBz4YpZ
 +YoSyF+F4nsEeMZ/w48o7EGMYxZ0nqE=
X-Google-Smtp-Source: AGRyM1t5SqS26/cW0ft4MUehAGP7V3Jy9T7M3aZ54MTt7v4sZSo1mVR8AWSftqqFNfWfRA0uF3Wqjw==
X-Received: by 2002:a65:6a05:0:b0:3db:27cb:9123 with SMTP id
 m5-20020a656a05000000b003db27cb9123mr19591543pgu.497.1658043232479; 
 Sun, 17 Jul 2022 00:33:52 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ece4:54e6:b565:8dcd])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b0016c4546fbf9sm6793364plh.128.2022.07.17.00.33.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 17 Jul 2022 00:33:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 2/3] Revert "main-loop: Disable block backend global state
 assertion on Cocoa"
Date: Sun, 17 Jul 2022 16:33:39 +0900
Message-Id: <20220717073340.25830-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220717073340.25830-1-akihiko.odaki@gmail.com>
References: <20220717073340.25830-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52a.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


