Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56137FB68
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:22:50 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhE6r-0007m7-Ss
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhE4Q-0005hP-7C
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhE4O-0006FF-IA
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620922815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nmblD/IV3Gv2eK11z3q3zt0LycvGlgfOv6QbUmJ389k=;
 b=MX85xyeQuw35lDi2zBi2rFX1CkiSBtS/ZB4n2qAUVEp9q2NL6B1fHbhQziytRQvjcQ861b
 P2HC5XOm9Ax4rNrqRpzXItoKch4FCmwPVR44Jh/pUqBrgOtzRfOLo1y0bQQdgkoXaJbrdX
 YOZ98U0HWUFeSYCvvD6tkiEBlrc4bwU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-rWsk7-0wN2-0KC6dW4e_rA-1; Thu, 13 May 2021 12:20:11 -0400
X-MC-Unique: rWsk7-0wN2-0KC6dW4e_rA-1
Received: by mail-ej1-f70.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so3161495ejw.22
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmblD/IV3Gv2eK11z3q3zt0LycvGlgfOv6QbUmJ389k=;
 b=c8hY39M/pm1ekm/h8+fVsktexf8EOLvjQwdEo6aiW2YyRsmDJIBXby0MUKGd9D1TrR
 fnRL03+pTSxu61F0U+WURYPk5sCQ5CbzOJx4+OixO3c5nttnLyTKRTpRoWyX94CTWzSD
 AZQexzb9J8fSawZwKqWe9K8N3deo1PbP0/gRo72QpvH3ctXcUdxE/HLdad+sbXWecgWo
 +uRDQ4FN8hkvOBEj3IqlKXArFJ+EGfRP1BNK4VODeNGBlihCrgFNLAMYo0lmajYenGnb
 NBf9cuoKvrMKdFYYlW/BdCUG4AE9r6LKzZoOQboO6FBU3hxQdqRn7OUbg5pX/nu+X9WW
 yj/w==
X-Gm-Message-State: AOAM530vIkaa4aYCSfoqKAai/tV1iKbawCUXETYYSLbGi4KW8QIQKfCa
 DqTbZHI7gV3wR5iQAcjwZikhGFVidDDooSOST7wBmsLXJw9r7SixlZ53+j3ZF3JZGMQ9k6KIXaX
 D4zd6xKvOC4SpCZWZu4JBU3/JfY1rOqNtKJBPPuU7EWkU4W1CbSnVX0+CVX1YuSyr
X-Received: by 2002:a17:906:31c6:: with SMTP id
 f6mr44798535ejf.446.1620922810279; 
 Thu, 13 May 2021 09:20:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkCju0LJndMLsl/q9gO1Rv3uWoIpOwiAZBV5Yu0WCSLQBwfC1+4EiZStJXM2MexC4rTwp29g==
X-Received: by 2002:a17:906:31c6:: with SMTP id
 f6mr44798512ejf.446.1620922810099; 
 Thu, 13 May 2021 09:20:10 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r15sm2515434edp.62.2021.05.13.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:20:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/fuzz: Fix build failure
Date: Thu, 13 May 2021 18:20:08 +0200
Message-Id: <20210513162008.3922223-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fedora 32, using clang (version 10.0.1-3.fc32) we get:

  tests/qtest/fuzz/fuzz.c:237:5: error: implicit declaration of function 'qemu_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      qemu_init(result.we_wordc, result.we_wordv, NULL);
      ^

qemu_init() is declared in "sysemu/sysemu.h", include this
header to fix.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz/fuzz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 04b70e114bf..5f77c849837 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -16,6 +16,7 @@
 #include <wordexp.h>
 
 #include "qemu/datadir.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "qemu/main-loop.h"
-- 
2.26.3


