Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FCA6F863F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:54:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxkk-0003OK-2r; Fri, 05 May 2023 11:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkg-0003Lz-Eq
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkd-0008Dn-4M
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f58125b957so1830062f8f.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302021; x=1685894021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSUPI0kqOU4QQe2wmlnWCjPR8JbP43bVwIlQhLoBovg=;
 b=p+uuu3OdeqKErZ7XJLjeIihTSXE/arxZM29ZZYqimh2KpeO7I8/isig7BR3IRHXfwW
 nd8PhBkKfjauFwE2ME4um7FpKd9cubO8kYlly1ht40tiPBWn5J9+abLORCBu9/ko+HYP
 CZjRbBe8jF69plo0ZST+se36gUE/Sgd9VKO5GoWI45ik3pWlFnY0+abqje1gxe4C4w/w
 ZszX+VVWkJ9yL1W0akhys2Aduu6rMIn9Z1A59/FmuiPkI+OP1aUsvUFMWspz1deRCsfN
 kyv5UGMkXmtr2JgYeBqroKhrIw04i/VJdUxOns7j/gekaTSZPQcSA1XEUCRAWDPM8hmm
 nJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302021; x=1685894021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSUPI0kqOU4QQe2wmlnWCjPR8JbP43bVwIlQhLoBovg=;
 b=Ogy0IyjZYfO22fdTw/xQVkGSW31P3ECqoF8NcPTdZdV8psrAHyLh1XrGrfy3W+pdya
 Ld/2D8UGCZxCKgNOTIPSVRF45XDHPsh8Oe4E1jL0fei1qWuCrS/0y/MH/vef5FutagwL
 UqtAZBVZwDG4bddWOQZltChmzymBd+ZsE7mNWwyVks7ds5vnXsRZIPhSZyTX5Jn8roEv
 6mMAFXxkKXI2bTJzca7M/mGpyh7Qe+OwCbBMW7LRT1h1ITop5TrRrcnwLKn7nPfhtv04
 Mt8nFolsoneFx0MbCZ8e5pF3WjMV8NNayD9VN/sojX18SD0WdZL7RoUffkJYEjaxWFws
 yX0g==
X-Gm-Message-State: AC+VfDzjkrW1enF2RlgU6H+JIazZrhlN8ezLe6HGSNLI0J9LlqLcrjXc
 6tAcP1BDARuKsWmBBUghnu3INg==
X-Google-Smtp-Source: ACHHUZ681slEDW2QaRL1oLywMlY2y9Xv+ZzMW2X84BdHqdeyOkO9ipofEMzOz1tSge4F3RRF5uuOog==
X-Received: by 2002:a05:6000:1088:b0:306:3ec8:289d with SMTP id
 y8-20020a056000108800b003063ec8289dmr1846940wrw.46.1683302021596; 
 Fri, 05 May 2023 08:53:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a7bce8e000000b003f182a10106sm8404594wmj.8.2023.05.05.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A703F1FFC4;
 Fri,  5 May 2023 16:53:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 09/10] hw/9pfs: use qemu_xxhash4
Date: Fri,  5 May 2023 16:53:35 +0100
Message-Id: <20230505155336.137393-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

No need to pass zeros as we have helpers that do that for us.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091756.1453057-10-alex.bennee@linaro.org>

---
v3
  - remove stale comment
---
 hw/9pfs/9p.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9621ec1341..991645adca 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -738,15 +738,14 @@ static VariLenAffix affixForIndex(uint64_t index)
     return invertAffix(&prefix); /* convert prefix to suffix */
 }
 
-/* creative abuse of tb_hash_func7, which is based on xxhash */
 static uint32_t qpp_hash(QppEntry e)
 {
-    return qemu_xxhash7(e.ino_prefix, e.dev, 0, 0, 0);
+    return qemu_xxhash4(e.ino_prefix, e.dev);
 }
 
 static uint32_t qpf_hash(QpfEntry e)
 {
-    return qemu_xxhash7(e.ino, e.dev, 0, 0, 0);
+    return qemu_xxhash4(e.ino, e.dev);
 }
 
 static bool qpd_cmp_func(const void *obj, const void *userp)
-- 
2.39.2


