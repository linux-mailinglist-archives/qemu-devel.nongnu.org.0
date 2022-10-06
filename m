Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E765F6B30
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:06:13 +0200 (CEST)
Received: from localhost ([::1]:39382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTNy-0008Eg-C3
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfD-00046R-0m
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfA-0005zK-WA
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:54 -0400
Received: by mail-pj1-x1035.google.com with SMTP id b15so2035049pje.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=Mbe0YRPg+SP1Yn8F5xaZMeUHbIohGr+hv2RhxllCPLRAupUWD49KZvkVZyNv2j6gDR
 hSjCevRlZZwHachTRd+DbyeyfEAPRYy9TwPnZ3oEZYNbHeZX4okAomdixdDebGMzSWKn
 qqC3VQtNpZNa4V9KPJII7RH63+88q3ywGwvchsVpx5GBBWy5zNUnUGkB0GOCeo1VD2ft
 3Qpja6GUl6IlZ75SV2b7dRa3/eo5LyfBvdmksWEj09ULmZDYrtl5/n7Ll2Z9n6baR8uu
 Op3Cs9lIig7wCZ9RJkJTDB26GoJew+iCNo+Hxt2kLyv7uW07DAvt+8DSnqbNFqyBxHZx
 U7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=SUuV3EcX6pXzYOsF0U0r+6D6kRz0SPjfpsBSVqSFhDSpKLrHh+YiUypp5D6U8+JV+z
 uPW8NnLN8+vgy253LHEIrM2Dq6/tCUaKZPX7y4+WMma7QigQjZqyO408gAMqV0eJFArX
 Z5n/pK0KptAX04RDJobxiSIFv2iCsijmCsGZeBQKgXZvh7dQviiaLl2fnjG6H6hyCO6t
 0Cp0DKuRjkInPrG9MGDdQ0tCTkfXo136U4jIg0LWg5VCQUPMmWkqag+kfMyYAfCU4C4p
 DJUDMAr0deTbYSMuusQxeX5MAkhWTfS4XTvsorBsxzl0KOI1+e3zaRLaDZfzuc0MPBcR
 YXuw==
X-Gm-Message-State: ACrzQf3f/l/jUZU6KtyH7w9RkeFEz76RVc5HWpXx6vf49wblvDJesLwM
 rvF2CV2RSfzS88QJ7Y3xuGJY8pV9U94=
X-Google-Smtp-Source: AMsMyM6aaJOd86h1SNils3iqsHhdgsqHGGQcT7WzjK6RRmZhfoiCseimrlf5L2QGhtu113jqrjLMvw==
X-Received: by 2002:a17:90a:d14d:b0:205:e77d:dc91 with SMTP id
 t13-20020a17090ad14d00b00205e77ddc91mr11010820pjw.20.1665069590409; 
 Thu, 06 Oct 2022 08:19:50 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:49 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v5 06/18] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Thu,  6 Oct 2022 23:19:15 +0800
Message-Id: <20221006151927.2079583-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
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
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---

(no changes since v2)

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


