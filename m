Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03266DD860
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:54:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBdt-0006AT-Lh; Tue, 11 Apr 2023 06:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBds-0006AK-6F
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:54:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBdq-0003ob-KZ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:54:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id i27so7064091wrc.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681210465; x=1683802465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=juWeoxsq2iunUJMeZOTtTiJOJ2lGo37mDUAfeUL69BE=;
 b=Tk8d4ItcilknI22FXVs07CzqpGdgaCvqcYLXCgzGHPHB41Ad+4wBi0v5s6fs8sWdRv
 RyPmFNtQUU/QSsdLsm9JBNicm66VJryNVgRQ5TNnUdbnwbffB3nykPMoLcpeN2Vxo/Hx
 SQJ7m4R9UPfBDvLE1B+fafKxwAsn5UbEjoO1t0teRlY5ujrFqZ0IdHQsclN2ZAHnAi2o
 ikyqK0zFDW1PAoRUimYEzuN/0sdWvZoG5DYLPxEDQOCwNEht5jlR1wlQq9u49TnC/Uo/
 JsU9YDsTRk+7UoTdSUZS7P8tRbs3f8DfK8GoPZMagSnYEbv6DK0bG/nO7d+npbNRJMK+
 fZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681210465; x=1683802465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juWeoxsq2iunUJMeZOTtTiJOJ2lGo37mDUAfeUL69BE=;
 b=e34fhKSPyyql3EqnaVFKT/SBaBCw8Bfm2psElHfDTUN71OBLhf7puvzwKP7IQgT6ie
 4H59JR8jlCG2SU7ZgLYIiQFdnsY51T9RyHuEMA7WizE7YqoiG69BiW3VPZW5C7sDbNW+
 L00ixTUmdE1hsjCW6S2gQe3Q5x8oMNsM5A7m7wd/yp2lLNCv+DTHNLNXM7D/7USca3KX
 w2vstlEt+FquObNjbQ1fHMG4cyzfFQ5WWR3GszLfoU3H7pk94hFBjzltZnpsR4i8RJqv
 t5MDdwZpiVNQWJjysqKRiWUTW44e15CsZZsGZXNs3NdLEzzfOUJfyUB74RQYRNdQod/h
 YbYA==
X-Gm-Message-State: AAQBX9dDZRkBOKdww6pgVeLXuPBF7Y2YhAdJPHRd1agDESfLU5M9Sp7N
 tUpqVvMLBMvlEiN/mvc0IClmNLazfIU3L3oj9UI=
X-Google-Smtp-Source: AKy350Y2JUfr1Fjo6R5hNBU5sWnrQZfBlIU5x9D32QxMq461OGG7R4TnaXQ5MXgBZ4EeCkUAu8m/Fw==
X-Received: by 2002:a5d:4b0e:0:b0:2d3:fba4:e61d with SMTP id
 v14-20020a5d4b0e000000b002d3fba4e61dmr9898531wrq.12.1681210465301; 
 Tue, 11 Apr 2023 03:54:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a5d4d4f000000b002cfe685bfd6sm14328017wru.108.2023.04.11.03.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:54:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] docs/devel/kconfig.rst: Fix incorrect markup
Date: Tue, 11 Apr 2023 11:54:24 +0100
Message-Id: <20230411105424.3994585-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In rST markup syntax, the inline markup (*italics*, **bold** and
``monospaced``) must be separated from the surrending text by
non-word characters, otherwise it is not interpreted as markup.
To force interpretation as markup in the middle of a word,
you need to use a backslash-escaped space (which will not
appear as a space in the output).

Fix a missing backslash-space in this file, which meant that the ``
after "select" was output literally and the monospacing was
incorrectly extended all the way to the end of the next monospaced
word.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/kconfig.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index cc1a456edf0..ac9453eba90 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -274,7 +274,7 @@ or commenting out lines in the second group.
 
 It is also possible to run QEMU's configure script with the
 ``--without-default-devices`` option.  When this is done, everything defaults
-to ``n`` unless it is ``select``ed or explicitly switched on in the
+to ``n`` unless it is ``select``\ ed or explicitly switched on in the
 ``.mak`` files.  In other words, ``default`` and ``imply`` directives
 are disabled.  When QEMU is built with this option, the user will probably
 want to change some lines in the first group, for example like this::
-- 
2.34.1


