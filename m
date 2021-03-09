Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C0F331BAD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 01:31:48 +0100 (CET)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJQHr-0004T1-SJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 19:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJQE3-0000N7-Bg; Mon, 08 Mar 2021 19:27:51 -0500
Received: from mail-pj1-f47.google.com ([209.85.216.47]:39557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJQE1-0006Lf-Uq; Mon, 08 Mar 2021 19:27:51 -0500
Received: by mail-pj1-f47.google.com with SMTP id
 lr10-20020a17090b4b8ab02900dd61b95c5eso1740018pjb.4; 
 Mon, 08 Mar 2021 16:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgU+W/R3FIydwYpBsWZV504V0tYBh/ETkHkfv0+pIB0=;
 b=kGVXfhQmIWpRSiH4FuK3m9tBlvit0qhK+Uwr0C7AgR4BPUIZJB7ZazOq3LviX+/RZC
 tYmYAaEDQOqe54BmLaQfmsOKNQDtiP7DyaQlAV1uUC1gSUaii9iwL3Q8EnwSZPB1C2Uh
 pVXYcC5zpPCj0GQ4hF2mB6HOg/Dn0M+AeGthuowGCz95oz+Njbyy3sqOskAiCuQbny4E
 NkEyAZ6x1aIVlSNRGORGash0PkxQXpG4VAT+Ipmjb0IRZBxhN3OxrpyZCz/hzuWZMvzy
 hKwkw9kUpLu6YnZELa1QdIzJo/3HbJIulsB1C2+BsQ+azO/XaXuUCTnW9jX9AbnyuGxg
 eG6g==
X-Gm-Message-State: AOAM533qyZa8akkwDWhfCRKOdG23V2GvHcVGzmfBR7y12k3jj1bX/H7B
 Qg4lpQ4mdyrUAsyWuqXOOo9DcM43QzY=
X-Google-Smtp-Source: ABdhPJxRns3ugxCglDlwtx6+/plmylnkbK9+G0q+hlVHxF8uwIL0RviqHkWmky7yqU5Cn3G4b4Z2TQ==
X-Received: by 2002:a17:90a:f28e:: with SMTP id
 fs14mr1609100pjb.100.1615249668112; 
 Mon, 08 Mar 2021 16:27:48 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.215])
 by smtp.gmail.com with ESMTPSA id d2sm466764pjx.42.2021.03.08.16.27.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 16:27:47 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] block: check for sys/disk.h
Date: Mon,  8 Mar 2021 16:27:39 -0800
Message-Id: <20210309002741.85057-3-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210309002741.85057-1-j@getutm.app>
References: <20210309002741.85057-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.47; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Joelle van Dyne <j@getutm.app>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some BSD platforms do not have this header.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 meson.build | 1 +
 block.c     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 0e53876f69..ba0db9fa1f 100644
--- a/meson.build
+++ b/meson.build
@@ -1153,6 +1153,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
diff --git a/block.c b/block.c
index a1f3cecd75..b2705ad225 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if defined(HAVE_SYS_DISK_H)
 #include <sys/disk.h>
 #endif
 #endif
-- 
2.28.0


