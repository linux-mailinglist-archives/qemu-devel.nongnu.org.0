Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2CA70085C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:48:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSBz-0003GI-6p; Fri, 12 May 2023 08:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBj-0003DA-Jx
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:47:59 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBh-0000Kg-Cm
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:47:58 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so18101561a12.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683895675; x=1686487675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sT2zNuv2phtjQU5OPD9fFC2fkypnPs4G6uJZmNeP++4=;
 b=jmcR+QngJ9yjxJrt6wqPTqCbxYcT5VFs/zTzckmwRMErPyNe0GzoXnzHwyCh+TlCwI
 xTO678l5GyJJxhWt62SXEl/4+C03IoMns07Yp1pzGZ0T/kHpdMuaTQ7qyICWKqktYjyH
 NwKzed3yKbusZhdJcMJOKLaDUdy+aUIU5anAmtVdUzwWmOre5EyDN+oZSqTBblbAtxYS
 P/CnEGvsKWX20ImQgVaoMk73T48y5+E0DIxpa3ujwtDx1TLelmAViB4fT1PYQPxZ9eCg
 Y7PQmNspqNcuh+BGBJ12YxZ3tS6x6bBPj/YLSGUHpNPle0HtLIVCdMSeIBhve58yCBwA
 X8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895675; x=1686487675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sT2zNuv2phtjQU5OPD9fFC2fkypnPs4G6uJZmNeP++4=;
 b=MgVu5drMLSy+eVnqXi1Uir8RCBc0nVSGlc9X0o76bLvlibQ0f/bfyYsQkYyuDSqWnW
 wLtYKSoOHmBjSyfHTc9flyog9I9Gl8qEwTRvMvsZxkK0JmTEiUjquJRD+wjwWcZg37nZ
 A66qUsb2ZE8UeqORrZ8mb/MKSgsRN0SXx0xVI+oircvNTP3YzfAQie1NAhITYOayVzLp
 yNjTMMdMAESbRkVeX233qwJv75ea0ncwyBaSIg9nFmetC2b0XT2gKbkpMVjrZ8PgzRA0
 2IVme1ChwsTC2KUS4U2Db5XDYcjVR7YMgWCH8Ba97phdm5voSxWH+9oUL78rPHE2m4DP
 qYBQ==
X-Gm-Message-State: AC+VfDzaX83CsUMcjcum/n+X1/GY8GNwzdLASehVXK5tdOGifpgehlYU
 aYOLscZIP1LCrb/VRdkxS8MhfA==
X-Google-Smtp-Source: ACHHUZ5J3Yoiuz9s2vg2+hPfJqUUIVXP+Hr+awsWZ2F84gWx6oueDemUMGLpTofs+Bc7iv5zH5348g==
X-Received: by 2002:a17:906:4fd1:b0:96a:57fe:3bfb with SMTP id
 i17-20020a1709064fd100b0096a57fe3bfbmr6205686ejw.26.1683895675382; 
 Fri, 12 May 2023 05:47:55 -0700 (PDT)
Received: from localhost.localdomain (178-133-109-64.mobile.vf-ua.net.
 [178.133.109.64]) by smtp.gmail.com with ESMTPSA id
 ze11-20020a170906ef8b00b00965b0eb7b0csm5322585ejb.103.2023.05.12.05.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:47:55 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH v2 2/6] ebpf: Added eBPF initialization by fds.
Date: Fri, 12 May 2023 15:28:58 +0300
Message-Id: <20230512122902.34345-3-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230512122902.34345-1-andrew@daynix.com>
References: <20230512122902.34345-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It allows using file descriptors of eBPF provided
outside of QEMU.
QEMU may be run without capabilities for eBPF and run
RSS program provided by management tool(g.e. libvirt).

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/ebpf_rss-stub.c |  6 ++++++
 ebpf/ebpf_rss.c      | 27 +++++++++++++++++++++++++++
 ebpf/ebpf_rss.h      |  5 +++++
 3 files changed, 38 insertions(+)

diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
index e71e229190d..8d7fae2ad92 100644
--- a/ebpf/ebpf_rss-stub.c
+++ b/ebpf/ebpf_rss-stub.c
@@ -28,6 +28,12 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
     return false;
 }
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd)
+{
+    return false;
+}
+
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key)
 {
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 247f5eee1b6..24bc6cc409e 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -146,6 +146,33 @@ error:
     return false;
 }
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd)
+{
+    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
+        return false;
+    }
+
+    if (program_fd < 0 || config_fd < 0 || toeplitz_fd < 0 || table_fd < 0) {
+        return false;
+    }
+
+    ctx->program_fd = program_fd;
+    ctx->map_configuration = config_fd;
+    ctx->map_toeplitz_key = toeplitz_fd;
+    ctx->map_indirections_table = table_fd;
+
+    if (!ebpf_rss_mmap(ctx)) {
+        ctx->program_fd = -1;
+        ctx->map_configuration = -1;
+        ctx->map_toeplitz_key = -1;
+        ctx->map_indirections_table = -1;
+        return false;
+    }
+
+    return true;
+}
+
 static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
                                 struct EBPFRSSConfig *config)
 {
diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
index ab08a7266d0..239242b0d26 100644
--- a/ebpf/ebpf_rss.h
+++ b/ebpf/ebpf_rss.h
@@ -14,6 +14,8 @@
 #ifndef QEMU_EBPF_RSS_H
 #define QEMU_EBPF_RSS_H
 
+#define EBPF_RSS_MAX_FDS 4
+
 struct EBPFRSSContext {
     void *obj;
     int program_fd;
@@ -41,6 +43,9 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
 
 bool ebpf_rss_load(struct EBPFRSSContext *ctx);
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd);
+
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key);
 
-- 
2.39.1


