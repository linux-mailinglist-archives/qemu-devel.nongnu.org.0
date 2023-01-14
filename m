Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841066AD4B
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 19:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGlRr-0007Hc-9s; Sat, 14 Jan 2023 13:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pGlRp-0007HP-CG; Sat, 14 Jan 2023 13:40:09 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pGlRn-0003n3-DK; Sat, 14 Jan 2023 13:40:08 -0500
Received: by mail-lf1-x131.google.com with SMTP id f34so37435742lfv.10;
 Sat, 14 Jan 2023 10:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MsHX5UEju+lzhwooYvdRwiB/qSc/iNAZ8yKoVJZ9+84=;
 b=Aw7S07lpzS9Eo3jd68XoVLqtU6xaXu519qdcSqb4A6XIn42+c0PVIkG0idSsInI9ou
 N83Ul3/Ue7CJI5fEF78Shheg4XwWiEpuva/Y6++BI8KV5OAjQaSPP8I7qk2zWUw3cjCT
 RFdtEHaz+Q3qcoKFA3rKhqx1H8ifuFScnT5dGFR1ysVoGFA1GcEG0O0779JnM6yJ0iud
 ac9gs0f95y15n2KFoBgoy0ETSRH5Y9qIFGy+6r2mV0lySDpSuYIpIRHBo+UUC+2yGQMn
 k8nFCPOrQre509B1twKKrVoWjkAWdoh5JKkK8y8cieVWuIJoe2tfTQIMsz+l2tN5TEFq
 74iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MsHX5UEju+lzhwooYvdRwiB/qSc/iNAZ8yKoVJZ9+84=;
 b=Cuuutk3mBGVyIZG2keJbaRj7JOQjocOM+g2RYa+krA9uxf9eJiRyvACTrmWQ/lFbSL
 Z+R4KCbnpLEB6DYNW9V8NjxB8M2clbF6RldkLcH9Se5/70oLrD9RYtc3EM7z7tHcpK+j
 oaqDtMCxhsR9aaX8UR8N7EBoKeC8BiB7/ajIz2ALZBOfo/os7ok2Jzi9UqzIqVjAHSdW
 woerpNLzqGhsCLZmkzC6VPeFlEuqQo/4RPDT13vcnoEb3xF8nTU10rlicLInlCAaAE+x
 0ySfWulYuTPhaq3P0dZeHWwR8+JGRdpKX6W/g9z7bhBzGTW+GC8lU5EiwKFDD0OIFTh4
 +o3g==
X-Gm-Message-State: AFqh2kr0Z/DU/v4SAhGZFLNEpKHOxc6ickiaJ9LR3E3jsodnDQuAGQRx
 Irc2KPC2JwAyIC98qscJ6QI=
X-Google-Smtp-Source: AMrXdXsbYkFRp08yBI+378Db9QZ3scZw4s2+g1HOJoq3nc/4ox8diPC97j5KpIYv27TI7yxXNUcJ/A==
X-Received: by 2002:a05:6512:3b0c:b0:4b1:4cc1:5ac6 with SMTP id
 f12-20020a0565123b0c00b004b14cc15ac6mr27388075lfv.49.1673721604895; 
 Sat, 14 Jan 2023 10:40:04 -0800 (PST)
Received: from Arturss-MBP-2.lan ([87.246.149.32])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056512238f00b004cb3fbc7925sm4352185lfv.77.2023.01.14.10.40.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Jan 2023 10:40:04 -0800 (PST)
From: Arthur Sengileyev <arthur.sengileyev@gmail.com>
To: arthur.sengileyev@gmail.com
Cc: sw@weilnetz.de, jsnow@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, bmeng.cn@gmail.com
Subject: [PATCH v2] Windows installer: keep dependency cache
Date: Sat, 14 Jan 2023 20:40:03 +0200
Message-Id: <20230114184003.76193-1-arthur.sengileyev@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=arthur.sengileyev@gmail.com; helo=mail-lf1-x131.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It should be possible to reuse cache built by previous iteration
to process next executables. Processed dependencies are already
skipped later based on dll name.

Changes for v2:
(1) changed variable name
(2) changed wording in description

Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 scripts/nsis.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 03ed7608a2..7cffba70ff 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -91,12 +91,13 @@ def main():
         print("Searching '%s' for the dependent dlls ..." % search_path)
         dlldir = os.path.join(destdir + prefix, "dll")
         os.mkdir(dlldir)
+        deps_cache = set()
 
         for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
             signcode(exe)
 
             # find all dll dependencies
-            deps = set(find_deps(exe, search_path, set()))
+            deps = set(find_deps(exe, search_path, deps_cache))
             deps.remove(exe)
 
             # copy all dlls to the DLLDIR
-- 
2.39.0


