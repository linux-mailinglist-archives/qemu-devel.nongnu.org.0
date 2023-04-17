Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16D6E4E78
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:41:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuQ-0002LW-1o; Mon, 17 Apr 2023 12:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuN-0002K0-4b
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuL-0001NQ-LW
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id gw13so14135947wmb.3
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749648; x=1684341648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/0TyOdhBrDuhL5XsvOLjbBITyKIzOif+YMbpV7tsp0=;
 b=kAlj5jqI0dAAXVWDiiK9X0L5c8FVL/8w/3V5yWyc5MslJ4Xkv+gTFIN4Ul5mnuZgpG
 Q2h66MH9BY0h5tGV55YVVS1e1oFxFbWAB+cB2t40f5D6NWlwuaPMuKU6WzoBr6SIdJa3
 2jQnDTgq7LRxZhjgXaHm2PcIWJPvr9AEK5gS0e7Szrdanpjw95yCF8eCR+RXa+2B/33Z
 fiVHLHOPaJnQgS1nUw4z5xz8JnDRS6aS1Fs6w8YMbYbjjt5hdlO5BaOAk284D5QbkVeT
 cS435lFE5XLRPliP69yK7z/GOmFgyjdufZlbEKhrM69+n11Kv1dBwQ6FeKwrKLNNb3sG
 P3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749648; x=1684341648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/0TyOdhBrDuhL5XsvOLjbBITyKIzOif+YMbpV7tsp0=;
 b=MsR3GFGe7H2cxd4T9crhNpCSg7zBdLSClFL/oaeTmX9PMkO8wBSdNa0wl9FoDv9xoz
 5zdh1sMxkulUh/FEJpqXkwODiy2pl8FXOE0o0yhTw4CwjOwZuv8GJrvTsiDmsHMzYcJS
 vnRzx6+4vFJ5QQgBaqQpgQKvCHAjBwoH2HxUIutJM3KQ7tT08xrG8iWo4k3PYKK2FnsB
 Bd2ECh+vKBRmDUym48w9FTjXYFvyWAViwmU+Vbgmn+pwqvallOUK5IWiMVsdFYOjkdYc
 AJAfa8fCLFRnjgglqBxmqJJiP99KdhC1sqp4SNA4v+i4R76KXVb18XhsiKii0Mvv/k/P
 31BA==
X-Gm-Message-State: AAQBX9f7lwbTku6jq/N4sG2VRuZ7cjAgfzRteQ1zZsBfJBNZE53wQ4mg
 LejcBfTBWTiUQ4ODv7ayc76ew0831UJyKujPu8E=
X-Google-Smtp-Source: AKy350YiOQ+PocfvZd1X28ZO3eJ7OxJR9fyuE53JmkIhzFNnB76Rc4qEB2sSjVvdQ3ETfd2IZl4wtA==
X-Received: by 2002:a05:600c:2288:b0:3eb:29fe:f911 with SMTP id
 8-20020a05600c228800b003eb29fef911mr10891445wmf.13.1681749648121; 
 Mon, 17 Apr 2023 09:40:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 09/10] qapi/run-state.json: Fix missing newline at end of
 file
Date: Mon, 17 Apr 2023 17:40:40 +0100
Message-Id: <20230417164041.684562-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The run-state.json file is missing a trailing newline; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Noticed this because my editor wanted to add the newline
when I touched the file for the following patch...
---
 qapi/run-state.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 419c188dd1a..9d34afa39e0 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -663,4 +663,4 @@
 # Since: 7.2
 ##
 { 'enum': 'NotifyVmexitOption',
-  'data': [ 'run', 'internal-error', 'disable' ] }
\ No newline at end of file
+  'data': [ 'run', 'internal-error', 'disable' ] }
-- 
2.34.1


