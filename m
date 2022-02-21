Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A365F4BD9F8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:41:44 +0100 (CET)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8wh-0006NO-Nz
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:41:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nM7oK-00059m-6M
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:29:00 -0500
Received: from [2607:f8b0:4864:20::435] (port=39893
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nM7oF-00063E-HC
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:28:57 -0500
Received: by mail-pf1-x435.google.com with SMTP id y11so8698255pfa.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 04:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZZxO6gb/Im6sI82agTzQDGJVjuMb6aX7bhcvH1CHkM=;
 b=hYuhLIhg7vPfRGCj8veUoP+9Q1X2O3mYeL5Lgpt/N2Kdm6zjX9Gr1QfWUvHlSZe6qD
 xJwPKG9TT3dWI0dyzjDXejLMv45WjDR9MwEYamWVIUkj4eTsY3JGVIhmdxwxTfJkCM8q
 uYXovq2tqmiI4SinChDzGsEO1/TN3e13nzFuyDdi8J1JH6F8fLeoUJFcfu749aTGN4o1
 2pWgmU4ExjCX8xYLk5xekknV6auMEDvhABfvDpJp9zA0TVR7X0UE3n+oeVwDficrSX4l
 g4od0thoFIPSWu5B0mcu63aw96UA5sys7e1GHNXcVsgOv8qYJs36Lfp7wxBQYbXDWmgY
 D2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZZxO6gb/Im6sI82agTzQDGJVjuMb6aX7bhcvH1CHkM=;
 b=0u+OT1CGXsetcd2qWuUcOPObF+HtM4Y90vG8UMSwtX8I4/VSCem7CadkxUrLI0e66n
 C8aNBIVgM7I6HNSQOH5/xAHtpWkkGEdsasW67tEWm98kLFDMi61FJveSvOP6YCOarcdK
 XA/ROsBFzX51sDnDBTFQOkDTy4GKeALSokbIA98KbyoVlLQC2QeRwkFJu7Z2iWJSXBGN
 daZ+ClWFst/vL08EDAo6ZB2fP1qhgRG0CSFkLDXmxuZuqyMi9N4dks8U9JWNR+Lj7lJI
 6WOErFPVQNFyi7iI849x57FKgAR23d2+oEKS4wy+WFvpqeNSnUbKNCmHTeiqkRUeTzAN
 HEPA==
X-Gm-Message-State: AOAM5308Kj+G55/DaPpv6b6HaffIKTdZ4DtCgYYChG6+JBW/mCqaOcyv
 y2lSYkNe5gilEIHYaeFBxKvOJg==
X-Google-Smtp-Source: ABdhPJxHsXpsVkU0fzTtf+XdGY1SWkxmPCrwqewv5rgcPCA3az3/Jje9vp8EXBI0oI3BCLc/egzpng==
X-Received: by 2002:a05:6a00:1795:b0:4e1:6e1f:5aed with SMTP id
 s21-20020a056a00179500b004e16e1f5aedmr19910512pfg.70.1645446533497; 
 Mon, 21 Feb 2022 04:28:53 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id c20sm4846609pfl.131.2022.02.21.04.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:28:52 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: pbonzini@redhat.com,
	mst@redhat.com
Subject: [PATCH 1/2] headers: Add pvpanic.h
Date: Mon, 21 Feb 2022 20:27:16 +0800
Message-Id: <20220221122717.1371010-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 2020, linux kernel started to export pvpanic.h. Import the
latest version from linux into QEMU.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 include/standard-headers/linux/pvpanic.h | 9 +++++++++
 scripts/update-linux-headers.sh          | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 include/standard-headers/linux/pvpanic.h

diff --git a/include/standard-headers/linux/pvpanic.h b/include/standard-headers/linux/pvpanic.h
new file mode 100644
index 0000000000..54b7485390
--- /dev/null
+++ b/include/standard-headers/linux/pvpanic.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef __PVPANIC_H__
+#define __PVPANIC_H__
+
+#define PVPANIC_PANICKED	(1 << 0)
+#define PVPANIC_CRASH_LOADED	(1 << 1)
+
+#endif /* __PVPANIC_H__ */
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index fe850763c5..839a5ec614 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -214,7 +214,8 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/const.h" \
          "$tmpdir/include/linux/kernel.h" \
          "$tmpdir/include/linux/vhost_types.h" \
-         "$tmpdir/include/linux/sysinfo.h"; do
+         "$tmpdir/include/linux/sysinfo.h" \
+         "$tmpdir/include/misc/pvpanic.h"; do
     cp_portable "$i" "$output/include/standard-headers/linux"
 done
 mkdir -p "$output/include/standard-headers/drm"
-- 
2.25.1


