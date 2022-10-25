Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF760D83C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:54:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onTgg-000630-NO; Tue, 25 Oct 2022 19:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgf-00062Y-HC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgd-0003AU-Vj
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z14so10175787wrn.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh73FyzeCa96lyMftRBslatxPlyeRzpgoLs0z6zLidE=;
 b=HMVOiDeE3V1JH++uUgxjWnJW6G4ec7mcKLTYRfvpLG82g/ZjrgGM9eU7ZiHSLMlaDb
 MoVyuElbihL4e2VoHFCSkv445EQUXLJrgjrFnjq9368SEOsHa7/o3ToJB/+usB5R0ob/
 MPlSNE1xsTo4k1I7q16mhgQiNbIyiRIQRJnvak1MG0uFmiC82JPqLJwOTxSTo3T9qE17
 IoDqwdsauryDeBZkOnyy2ynIwaOPf9Qt10fpQJn+pSOHQamjxoHdF/fOvstmUdg4sgL8
 NeZZ7u2PIVcB1dONLXWPJAwZOPiDo7fhA+tAtx0e7YQuL/RnuePNzjlJli8odrQryf4l
 vNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vh73FyzeCa96lyMftRBslatxPlyeRzpgoLs0z6zLidE=;
 b=g5irH+9O62H/kzd6wejNQa3HIMxm4qt8B7BsIg78W9krucpGqcpuIsUDYZ8sX5JiYY
 PZdIdDYnTJHezM4j/C8v0rVyuoh9uR1k5UyKj6/oSvn4Ldp1gpnwEUSJ7TxhsFiqDs/y
 pUQ0AS1oJcLodnzSpJzgkatEIzjzf4j6tcrElEHQvjwEsQ3FsWcjAZeIrG0nRJaJt8qK
 t9ZUKSRhgM5WYdIa4qs/0UUBiUMfaiSUNsxh0x1JBRrxV2lugX5vgiezr+qnNEAJ1+nC
 bk0jRUeCbU/37eabuS5kajWiXKDwMc/9DOx/NGZ4H8T/ukGXcC0stbvEmqM/hMOwjIIh
 OaVQ==
X-Gm-Message-State: ACrzQf2zKVmScbl3m43+AaksQj6khaz/Lqm98kjjvkKUralTBvw5Vtf1
 Wv9u23ITLvfQhWIF217muvBadaou4FI29/LX
X-Google-Smtp-Source: AMsMyM7atsIWnHxc5tlGKhKd2SER+6gCpgUemRSoyAux99kZnvCJlQ4Hqegz7AUMclEs+CQ/k9WlIQ==
X-Received: by 2002:adf:e84a:0:b0:236:5f2d:9027 with SMTP id
 d10-20020adfe84a000000b002365f2d9027mr13170317wrn.89.1666741823233; 
 Tue, 25 Oct 2022 16:50:23 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a056000050200b0023662245d3csm3718909wrf.95.2022.10.25.16.50.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Oct 2022 16:50:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] target/tricore: Rename csfr.def -> csfr.h.inc
Date: Wed, 26 Oct 2022 01:50:06 +0200
Message-Id: <20221025235006.7215-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025235006.7215-1-philmd@linaro.org>
References: <20221025235006.7215-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We use the .h.inc extension to include C headers. To be consistent
with the rest of the codebase, rename the C headers using the .def
extension.

IDE/tools using our .editorconfig / .gitattributes will leverage
this consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/{csfr.def => csfr.h.inc} | 0
 target/tricore/translate.c              | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/tricore/{csfr.def => csfr.h.inc} (100%)

diff --git a/target/tricore/csfr.def b/target/tricore/csfr.h.inc
similarity index 100%
rename from target/tricore/csfr.def
rename to target/tricore/csfr.h.inc
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a0558ead71..f02090945d 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -388,7 +388,7 @@ static inline void gen_mfcr(DisasContext *ctx, TCGv ret, int32_t offset)
         gen_helper_psw_read(ret, cpu_env);
     } else {
         switch (offset) {
-#include "csfr.def"
+#include "csfr.h.inc"
         }
     }
 }
@@ -418,7 +418,7 @@ static inline void gen_mtcr(DisasContext *ctx, TCGv r1,
             gen_helper_psw_write(cpu_env, r1);
         } else {
             switch (offset) {
-#include "csfr.def"
+#include "csfr.h.inc"
             }
         }
     } else {
-- 
2.37.3


