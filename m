Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2125EC1E8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:56:01 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9Bw-0002sl-J2
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RO-0002pI-ER
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RM-00050q-Ps
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:54 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l9-20020a17090a4d4900b00205e295400eso413360pjh.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=aIL7psVDzTxyXdfGTHyLPIZdEZsdOJKrdrj/Qow4zL77qmUZdW9NEwOaOs6wQW32/M
 gYkbOf/5Bne0DcUfmqv9NkBsNThq0kRXI0Y4tvgZcW2Y1/dklFiZAu+wgXuSxC6KbrAs
 boI8eNX1+cE4RlFKJcPnr5+j95AZSNX1SNGzpuBVjBev8gjq/xpwwCmLkNh4NGS28P30
 WmbHuUcL2HqobUtZ8LMCwCMJRN3Bds/2Yk4I7UQiXiqDtw2kWIFxKzdTDO7UYUOKUv1L
 H5r0cbtcpvKklu1USUK34YqIDsL6T+5U3ggveuT4lzSMRTcJOrCQNM0GIxvHN6zsE5x6
 gyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gkhXgeI8VVKYUE8bIuW2cVwuIZ0uivwbyCoudHIFJ54=;
 b=4T5PQefDnDBK+J1opyxjMxBqrvuUTMfhi0WQxab/EFKGs2V4pPHGxFM8G3XQRyqgQi
 VklhRIlaHty0NFvhTVmEgbu2G+mSZprDboZ1qSsq8a+2F6znwu/2DOvl3Sh87UioLXXi
 6VmY5oTcXMvVc2FeCptbWRYp+F8Guo9TBaZkwlTIE2rPN9a4WEEx3Vpzf7etrSXPktg/
 QrihmSnx4KUVvGoShmmQbDAb8t7i714jNU0sj7yd6KzpouXVKopMS5v8SvwWgyajqnQa
 p3AN669ErzoYRlbg0buuy+Qg+abujPYmJM5dp8JcWOPrtHjY0y4Pg7q++2LyB6gk/ZSX
 mTGw==
X-Gm-Message-State: ACrzQf3Zczs+C4KxEwGCNGhYeft5H8iO85yRs/JfYpHQCPMVs4RYhG6Q
 GccjlCfWDWKtVWllUySt6c4Kxwr7/rY=
X-Google-Smtp-Source: AMsMyM7jzJabzfNLbL2Z4gKunbSd+XQGC8xc4Tck2Q+joN1N7eHzICxOb/CelqSqXv+5hBzcsCC3Qg==
X-Received: by 2002:a17:90a:2b0c:b0:203:b7b1:2ba2 with SMTP id
 x12-20020a17090a2b0c00b00203b7b12ba2mr3990073pjc.34.1664276871226; 
 Tue, 27 Sep 2022 04:07:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v4 26/54] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Tue, 27 Sep 2022 19:06:04 +0800
Message-Id: <20220927110632.1973965-27-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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


