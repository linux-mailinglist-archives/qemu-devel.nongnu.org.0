Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03174F9B7E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:19:50 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsGz-0001Ws-Rj
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs8A-0005uh-3A
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:43 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs85-0006lz-SN
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 66so8263836pga.12
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uF55zfRGZGLp8oLCUwGZ2krUtjYw224zyy5ygc5qPWk=;
 b=NlwNUeVCyxb7ItVcIltGpJyHzhVNzc0ZHhepU3i4ESrq16jNz8a0s80mElM1lGtlqS
 DFnGTJcxy8/4GZoJlTr4gEyA71RYzvGGU6Rsqd3VHfb+jOe8ExZtIXvCOpFgQWPFUIfC
 ot6srAcaizYYlyiZ53KeBRdCGH5tWuEfhxuViWP6EI3I3l7ypfr0akmNJ8zgOIYNpN0D
 7NrD656Qczji/28SjBdieDWg73fxD3bt/n47J+omrV3T8OFAG2AP86oMZOQOikoFQcSs
 YaNQHpnici23zeZoEUH5E6CayjjJ+9F4Bb+qhfI3oBSvEObreJLryRw708SWyr+2th5Y
 P0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uF55zfRGZGLp8oLCUwGZ2krUtjYw224zyy5ygc5qPWk=;
 b=H6/7NHgAWsNCwKURqnbVGge2LY7BOzwYIYL0CeIhWiOE7y5uKsCikbRgnuL0tehG1i
 n5Ulzekye8ik42gzaU+ZLw9ifr00oglofB9H84idiYqtD5Lc07Emp6WHnYxTHyvuK6Zg
 T/4RZmqpygKiwCGDgRwbnvAoP8O1Mn6YtxnRtKLYqMMSCwzX+J9kSLWaTLI24h4eXRlM
 prRaaWWyCu8Kwcc3obPDNMp9v/4nSmB/2h1M3Na8gOCNC2kBXFWlL0ELEGOKzp5cqcxy
 ty6rMEhDg7sL9hfNs5xkjkL+g6U8Yn2F69GMUxEXvzAZIlcarZpjwZzGFizUH8kpEKLf
 fNWA==
X-Gm-Message-State: AOAM531RtNw03TRnLndzs7BBefx5Rp3YKJJqp0bi2O9q18egvhdBN4vo
 uC3HxQsb2KkNZmVgerI7yNY=
X-Google-Smtp-Source: ABdhPJzNDdMZxWoZIgh1s9jrHB3kemX/ADYtDERtR6TVW0jZ/UZ7kNcWswXUxwzSTtCePN5dtlpt3Q==
X-Received: by 2002:a05:6a00:2887:b0:4fa:e10c:7ca with SMTP id
 ch7-20020a056a00288700b004fae10c07camr20687868pfb.9.1649437830431; 
 Fri, 08 Apr 2022 10:10:30 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 k15-20020a63ab4f000000b00381eef69bfbsm22263494pgp.3.2022.04.08.10.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:10:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] fsdev: Enable 'local' file system driver backend for
 Windows
Date: Sat,  9 Apr 2022 01:10:12 +0800
Message-Id: <20220408171013.912436-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408171013.912436-1-bmeng.cn@gmail.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Only 'local' file system driver will be supported for Windows host.
'proxy' or 'synth' are not supported.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/qemu-fsdev.c | 2 ++
 fsdev/meson.build  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fsdev/qemu-fsdev.c b/fsdev/qemu-fsdev.c
index 3da64e9f72..e1cc677ad8 100644
--- a/fsdev/qemu-fsdev.c
+++ b/fsdev/qemu-fsdev.c
@@ -81,6 +81,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#ifndef CONFIG_WIN32
     {
         .name = "synth",
         .ops = &synth_ops,
@@ -100,6 +101,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#endif
 };
 
 static int validate_opt(void *opaque, const char *name, const char *value,
diff --git a/fsdev/meson.build b/fsdev/meson.build
index b632b66348..2aad081aef 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,6 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_WIN32', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
-- 
2.25.1


