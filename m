Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417C75BE50D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:58:53 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabts-0001nZ-1Q
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYJ-0000Vu-M6
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYG-0004nA-TL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id b75so2323271pfb.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=YplMeX+AByN6qSLzAHixowvrhYpDa+RxmExjk4LfkOzj11QAlPHZwEZCl90NBT/yar
 514KQcFuT/F5yrmeVsvVkzSNhemgo1FdrxZa5XRqLED68EMGJ+FJ5/gPC1eiBTg68rSg
 tu8/NKuHNQpnXKOtVSyGT9/v7P5eAZfiI/di2tJfCb36NwTgiNOjjy3kn52l5Fh7tBKs
 HFen8t/9PCyYv97cnRTFiHRF9C5Ck9DCHH1lRi4DWUoIa1NRz46U14ADvXpRk/xrW6EB
 RgohjhIg2Dav/6q7IcORLpNB2QZAnEWP4OUZ30AjkhbfWCuGkEurJBY0D8CKdzVH2/Bl
 goNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=jmP9NstlnaNUuqRIbUlaRsQ3RWGBhTK7dPW7875aF1YTlUHHsMvmJfEnWIPdh4KRY7
 y1e1ygH2WUGUDdxLRKY4JED2/FU/wa39QQD0EXP12zcpg483/zgffWWh5GH1/EH6srK0
 ZOL90GdirrTSEbdsAR8k2z3X5HYkU/kz7MYrANol32E8bqt3LC7lhXbwwaoa5Edgx6zX
 /kVAh91VR3OJ+qrvGjeayqYcU8YnKIOoUSKQWDIZjLv0x+EgSpPCZv3yuxgeovwI2Pca
 lRBVGweUEDCaJmGwHro535MCIi8OzP8Q4nNqG1qqo2tM43vK9/VgC/a7vOOtyxkaJgYR
 r8xQ==
X-Gm-Message-State: ACrzQf0ROsA7kMelaZsyCiNz2T0mEJrD7snC/KqQV2HvFQJZoKUZbrt3
 5sffesbYqhqa8vRdvyT62/S7c04/U48=
X-Google-Smtp-Source: AMsMyM4PGeh14EDoXck/vy0HlLitjYNYhUvF92u8TeMT8KNgQWxy8nOzZViNeJl6KXhww/3GdN9YKQ==
X-Received: by 2002:a05:6a00:17a2:b0:540:f501:ab76 with SMTP id
 s34-20020a056a0017a200b00540f501ab76mr22998246pfg.42.1663669947343; 
 Tue, 20 Sep 2022 03:32:27 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 06/39] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Tue, 20 Sep 2022 18:31:26 +0800
Message-Id: <20220920103159.1865256-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 util/qemu-sockets.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd2..0c41ca9e42 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     if (saddr->path[0] || abstract) {
         path = saddr->path;
     } else {
-        const char *tmpdir = getenv("TMPDIR");
-        tmpdir = tmpdir ? tmpdir : "/tmp";
-        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
+        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
+                                         g_get_tmp_dir());
     }
 
     pathlen = strlen(path);
-- 
2.34.1


