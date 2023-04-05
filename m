Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1A6D74E8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 09:02:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjx8O-00063V-Sp; Wed, 05 Apr 2023 03:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pjx8M-00063E-Eo
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 03:00:42 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pjx8K-0000A5-5x
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 03:00:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so36389983pjb.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680678037; x=1683270037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qPRFwKC0gXiS5Rg8n85QktEu/lNIzCFdJjuESlckR0o=;
 b=SVda6U5D52648wSx5kbkoZ+vqFkJjtYWKFeiFL2mdxIId2VlQ0l/PWUczuyjBaiZlF
 YX2pv+q6Fh0H9+XPdbrG7z4ye0M/+Qt+gurpd3D/pDdfWjIvADWmLlWE9dFyqrwEYL49
 DDSCDZR4HSj+g0Ti3i4AQEox/BGKpaBm9A/t1STRAsF8cGCINf6H8MdeU9xAGb8JF+Gd
 tAHRNdx6zzGwN7sBfLqSds6CQCZKJG3GTL25h8wch/ut4hLl9ew/zFciLGrZuUoEUtFV
 3eth6NVJA/342glKB2O1sXqYB/sHCSXajHcC05u2CxuNjFQQmMgCa2C9z1v2GiHW0tfr
 8SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680678037; x=1683270037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPRFwKC0gXiS5Rg8n85QktEu/lNIzCFdJjuESlckR0o=;
 b=WVpg1lu4awBCUlWQB2jprCtKoip7SS75G+kiBHPp3AETiECYkPm2VBxpI7Poclr70F
 ZdltCoGekKhqzvTLw8gMDMC9u9gQ0+YCKNdofL3n4KReRrDucLSp092NF08fkwyZOV03
 1VesRNuQbsDG8u5apTavpnwqiTVBqMMdY5iLrihlTlBLo9jLhcIfIAdnJbZcqpeJUpln
 8GB2msA/oGJu02i6cwWblzOpz/mlDbtwM4hD+DXB28M4LSphK4dZb8I58Q5U6RkkdpYb
 4A2cyTmntMduGba84+eN3N74tbIkWxDBjPLKPlNo9aQfyEYSaVT8Et84z/Cc8tWJkQSO
 Nldg==
X-Gm-Message-State: AAQBX9cW9j3GL4w/rrZLza0ifl4saKX/vkXLg+ORgBakL8Ij88VCdPF5
 YbMkhhahtXIgeL8Lo53Th16nWW01pWUQmz9PQBUfNA==
X-Google-Smtp-Source: AKy350ZInka90cN3uJO21f7BRQWKBiN3estcOmuGnrG0LCCQ7hdqlBFCrYNS1SakxKKOv5nmgLM3yw==
X-Received: by 2002:a17:902:c7d5:b0:1a1:d24f:a5f6 with SMTP id
 r21-20020a170902c7d500b001a1d24fa5f6mr4841876pla.46.1680678037530; 
 Wed, 05 Apr 2023 00:00:37 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a170902860500b001a1a82fc6d3sm9361771plo.268.2023.04.05.00.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 00:00:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] configure: Avoid -Werror=maybe-uninitialized
Date: Wed,  5 Apr 2023 16:00:30 +0900
Message-Id: <20230405070030.23148-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The configure script used to compile some code which dereferences memory
with ubsan to verify the compiler can link with ubsan library which
detects dereferencing of uninitialized memory. However, as the
dereferenced memory was allocated in the same code, GCC can statically
detect the unitialized memory dereference and emit maybe-uninitialized
warning. If -Werror is set, this becomes an error, and the configure
script incorrectly thinks the error indicates the compiler cannot use
ubsan.

Fix this error by replacing the code with another function which adds
1 to a signed integer argument. This brings in ubsan to detect if it
causes signed integer overflow. As the value of the argument cannot be
statically determined, the new function is also immune to compiler
warnings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 configure | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 05bed4f4a1..cf72a4121f 100755
--- a/configure
+++ b/configure
@@ -1737,13 +1737,9 @@ if test "$sanitizers" = "yes" ; then
   # detect the static linking issue of ubsan, see also:
   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84285
   cat > $TMPC << EOF
-#include <stdlib.h>
-int main(void) {
-    void *tmp = malloc(10);
-    if (tmp != NULL) {
-        return *(int *)(tmp + 2);
-    }
-    return 1;
+int main(int argc, char **argv)
+{
+    return argc + 1;
 }
 EOF
   if compile_prog "$CPU_CFLAGS -Werror -fsanitize=undefined" ""; then
-- 
2.40.0


