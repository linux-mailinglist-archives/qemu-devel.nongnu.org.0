Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC35BE6DE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:19:25 +0200 (CEST)
Received: from localhost ([::1]:52244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oad9p-0005n6-11
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYT-0000Xp-A5
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:42 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYR-0004o8-T5
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:41 -0400
Received: by mail-pl1-x629.google.com with SMTP id iw17so1960583plb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TC94REF6/wVyMzkhGTjrwMtg+rAjCgxxkZ7wM7vEeao=;
 b=kZdITtmH6gBDVTAwQNPgrxkwsLVjqw0sYPXzTTQq0W7ld9tspaqgrD32K9r9yOTXqU
 X85q4Cg6j9FoqarltVlv7nwUcgjKR0uluLuadNNUEiYuLQLQxhkJY7+d4IoGmIqgLfQZ
 dltXpLRnr1PfwnU8J3KCaVCw7yE3g802BMvz5vYgiYAHz0Bo1/ZuUkQPrTjDa9jEDG8Y
 kYmGm5MUubxWaCtQu4kL2RK0p1RJZs6yL1NDjUbEx3R2BH5bN1+MK576OJpekv9tUupB
 shspapoB/IKKbOpy8ptoUJayGLZu6Tej0rt874kp8B1ZubjtFJRxpv91yf24c1Ubo7Ym
 BM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TC94REF6/wVyMzkhGTjrwMtg+rAjCgxxkZ7wM7vEeao=;
 b=vZbyZM1M0Ck5Jj/YAQjZGO+i+9hOyciGX8lCK/ca/z0Ol8uIYrpNe5gMAEQtnizX71
 gkHFS7vJZVd57ORJIuPOjMaPqSpoPJhur2dPnUJTPyuzDLhpYyWU0g3lh9XI37n1EbPj
 O4WA3pTKHkJyIrGIM9qPH4v7b5cSRB7A3Thf5GczDQs0ZLjqmSnoJDZLgHM7enTkvKqL
 5wPHuUsGPmznXFsD09j/ROhIpZg0MLffrCKbAB1RpEgYzHDSAKZsZDFoeH8siRfW49JW
 1L6jH6UXUfRQlQRJEB8zYpDhDzc6kbt7aqh5e0gCkWv4Q+4aK2bf41rJXQUdWDVRtogi
 I7cA==
X-Gm-Message-State: ACrzQf0ZG5S6dbf7e1PjOttTpwpWRLno4O20ekdMaLVXywwne7EYhfQQ
 +Qn8FyFctCt2FrSdQOAVjPj9e2GZLkQ=
X-Google-Smtp-Source: AMsMyM4BLP85HHCxa0PpeQljz4Jt5sRP5kzSm+G1ffysMEXZMcECgPcAqFIuoS25Lse++yZieX0CXg==
X-Received: by 2002:a17:902:e805:b0:178:230b:57e3 with SMTP id
 u5-20020a170902e80500b00178230b57e3mr4291154plg.102.1663669958268; 
 Tue, 20 Sep 2022 03:32:38 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 09/39] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Tue, 20 Sep 2022 18:31:29 +0800
Message-Id: <20220920103159.1865256-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
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

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Change to use g_mkdir()

 fsdev/virtfs-proxy-helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 2dde27922f..5cafcd7703 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 #include <sys/resource.h>
 #include <getopt.h>
 #include <syslog.h>
@@ -639,7 +640,7 @@ static int do_create_others(int type, struct iovec *iovec)
         if (retval < 0) {
             goto err_out;
         }
-        retval = mkdir(path.data, mode);
+        retval = g_mkdir(path.data, mode);
         break;
     case T_SYMLINK:
         retval = proxy_unmarshal(iovec, offset, "ss", &oldpath, &path);
-- 
2.34.1


