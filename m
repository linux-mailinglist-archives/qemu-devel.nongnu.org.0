Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831CE54CE6B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:19:44 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Vk7-0007G8-J3
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VO3-0007yt-1y
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:55 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VNz-00087u-4v
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f9so10819483plg.0
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RstUhdC3yStpN5pP+KDeayTFcII2tvBMXL7ceshu/m8=;
 b=jkxmwm5qHHaJyYdOyKvxX9agUYm8gmD+4fbP3F0TPMXOIrNT2TDfRjiy2cTmijJ4GY
 ekP/JOCRjuFqLE5bfzKSvcqofioxzE+SmcGxXLntI9Na2eiuM6h495tpLzNl/xncYBa3
 qGEzdX5oKmQgfoIvf3/0I/8AolQBiRY7lGX4hT5WbZ4jrLpwW5ILSjFFwq1h6VnlSMrl
 G/w28zkNqQBlYOSXwUB3THmKoIqqVQeSK09O6eIA/aOgzuiGATWxAzsIbXgacTAHKQWo
 PB31Ja/In2xk6AXh7AeQuXqrvuibIBtcWr0C2RXprlfrIgkWAZPombJgX7qmeEsNjVkr
 661Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RstUhdC3yStpN5pP+KDeayTFcII2tvBMXL7ceshu/m8=;
 b=X9rS9gYQeWeZljjuIT45MAO8N/FdSijOnphJdvUi3mJL82xdICh4PO00lkrqZ5iwNR
 PrOi+Dr355yOuUT257larBCvvQQ5RTH9fZMqkxw1YOZ4nkyNAIaoS5PstrzmeIAcLiZd
 ykZQyB0Ctu/cY1Tb9NqKthZPokb2F74JGoFlAfQjolv9nk8AYajuHItoauhM08nnDRWg
 xgirZamsimYiKw+GlyEOBiO176ScRQVSj35ncRt2zgJEsioSgaaAIZASqcyjYlkCZNc9
 tUb6e9fYJy+SvLaCxf3zULenGOKztIYNTRvX8crfpo5saV0sEfnu+f6e/zA9oIsoBjnt
 Q1rA==
X-Gm-Message-State: AJIora/xv8FY4ZtKHrZbIPS82Af3iv5KUvbtVVrE1ytCZZjV9ZfTpuIp
 LwK3g1e7DfViM5M/Wv+tjrY=
X-Google-Smtp-Source: AGRyM1tkPvqXbUDUtF5TeJb2PhfLFIBeGal9Xe0w2rBaL2t0cBEv2wQsGK8EMCxscsQtlLmWltknew==
X-Received: by 2002:a17:90b:3a90:b0:1e6:a203:c7dd with SMTP id
 om16-20020a17090b3a9000b001e6a203c7ddmr11200463pjb.144.1655308609556; 
 Wed, 15 Jun 2022 08:56:49 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 a34-20020a056a001d2200b0051874318772sm9860038pfx.201.2022.06.15.08.56.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 08:56:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v6 1/7] datadir: Simplify firmware directory search
Date: Thu, 16 Jun 2022 00:56:28 +0900
Message-Id: <20220615155634.578-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615155634.578-1-akihiko.odaki@gmail.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62b.google.com
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

The old implementation had some code to accept multiple firmware
directories, but it is not used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 softmmu/datadir.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 160cac999a6..2a206f2740a 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -105,15 +105,8 @@ static char *find_datadir(void)
 
 void qemu_add_default_firmwarepath(void)
 {
-    char **dirs;
-    size_t i;
-
-    /* add configured firmware directories */
-    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
-    for (i = 0; dirs[i] != NULL; i++) {
-        qemu_add_data_dir(get_relocated_path(dirs[i]));
-    }
-    g_strfreev(dirs);
+    /* add the configured firmware directory */
+    qemu_add_data_dir(get_relocated_path(CONFIG_QEMU_FIRMWAREPATH));
 
     /* try to find datadir relative to the executable path */
     qemu_add_data_dir(find_datadir());
-- 
2.32.1 (Apple Git-133)


