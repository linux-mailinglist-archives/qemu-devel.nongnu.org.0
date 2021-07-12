Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A23C5C09
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:23:26 +0200 (CEST)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uy4-0001LF-Mk
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2ux3-0000ei-SS
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:22:21 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2ux2-0005fx-6A
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:22:21 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bu12so34267681ejb.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2E/1h7/RoKg4VQ+CqTW0g38KxXfWx7lcegiEW9aNbd0=;
 b=pokoaQBgbBK7zD5QL0EoPjEHPqJo71whxRxWW8rn+gYGBdK0OEAiYceLo/dVx2AcXU
 nsWgTsYjDOe1xR7O48odNuxRklBmc5OCp2ol6rm30smIqsIn1h6A1f1HMLfavp2dm67g
 /ZFrxI3ny7SkV00B9ToPhpo4cepAbyMsXM3KgIqIW8jA3FEewZOScRmFmOR8uKexvr4b
 yBmRgxDMpnfkwh2i4nD0QKSGZBGxxsH58eK7NxbTp0rX7NwntLMbJDPV8UV8rbFKibxK
 UmNlU+8z1FygHCddmGPyimsnAqbt7G3flGq33brCZkcc3EOcrLVbBb6HDa7/kdB0W9TN
 0PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2E/1h7/RoKg4VQ+CqTW0g38KxXfWx7lcegiEW9aNbd0=;
 b=szkB0tajzFuo0G3bWPFg5LrDcdCCJVaJzqNiPTN0QGK1xI7wr2A6072VsGg7Ftoudq
 YipAaNxuOQYRxSn0p/i73YQu/YLq0SFm8da36NeyazS3tCzfMf7Z8bUyTgpZgzpIHbQS
 JAcyMXWGTjRYMO6pCaaMWoEkyw8AZ3Y7kcd530OdlhPrRebso2VpVUk0GUSz7hwZighJ
 cIYodtcFQMzQuwKTqIXsU9eVacmdh0tiAZirDAdrZ4wFVjv0IveaURDXCBVCqHA4b/LB
 4IfInDbw97udqR5SwXZ9yoVTNBWicG7EdXidrCTeCkiwY38j2fqrmZ/UxefLG7QdCcap
 zlmg==
X-Gm-Message-State: AOAM533wFeSJW3U75ZLIJFt2SbWJUDTlhZpxHviJHqM6l5PuVjwyZz9+
 icZzD1Pw2Qb7AWGwmzeCVpEuQIsEoXc=
X-Google-Smtp-Source: ABdhPJz9IYqmQRiMncFIu1kA4p7WJB6siDbEdnTwnOXwuKnHwfvDmLvi6/e35/Ka3wqM87QrgB/y/w==
X-Received: by 2002:a17:906:5d13:: with SMTP id
 g19mr53379847ejt.90.1626092537605; 
 Mon, 12 Jul 2021 05:22:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gu15sm2693209ejb.63.2021.07.12.05.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:22:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] disable modular TCG on Darwin
Date: Mon, 12 Jul 2021 14:22:08 +0200
Message-Id: <20210712122208.456264-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kraxel@redhat.com, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Accelerator modularity does not work on Darwin:

ld: illegal thread local variable reference to regular symbol _current_cpu for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fix by avoiding modular TCG builds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b2e8731410..a1f767e250 100644
--- a/meson.build
+++ b/meson.build
@@ -92,7 +92,11 @@ if cpu in ['x86', 'x86_64']
   }
 endif
 
-modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+modular_tcg = []
+# Darwin does not support references to thread-local variables in modules
+if target != 'darwin'
+  modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+endif
 
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
 install_edk2_blobs = false
-- 
2.31.1


