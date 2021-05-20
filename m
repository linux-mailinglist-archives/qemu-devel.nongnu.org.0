Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F14538A010
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:46:17 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeJq-0008HH-Fr
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxj-0005RM-8P
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0001Ys-6k
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:21 -0400
Received: by mail-wr1-x435.google.com with SMTP id p7so12940434wru.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4v/9OYPB+jHGFxocgWm85QsiZNWsRItB2trj79AKSsE=;
 b=YS7dpZ8wyJeZCP0lsoyn1FI23oT8uPsFxCujyU0AHYkpINptrDNTp4LEMSI9VwGoUK
 ulpNwNIrOuArIJ/ntO9h8Un5DTI1MriMP3luTaBY6kZwFpqBnp6CLjDlQQquYgRbreow
 HTWtvNYcvqNIceuTBlDp4Q/+7Yg0y68ZfTTInJIsh3p8rxQfZvq15grlPWx/zkRQ8Z7n
 jxqAYt+ChikdAIePso8UkDEtjIM236YSVU3vQ8woo0/gTK287zX5D8Q2SfbZasURluhx
 DAEL/c5ceSaIA1E8ucdra1id2uMBXxOgLPmiFw+axZIyAMsYxcxrrV/OVaRtUZmiygJE
 mfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4v/9OYPB+jHGFxocgWm85QsiZNWsRItB2trj79AKSsE=;
 b=iI0aroCQ2KfK593x+blYn4TT+vHNUcOFe6S2a3uv/eVpHv8exuhtDrIMbJXQ7UHyfI
 pUEmRW3Ys7MWSs2vsqgT9XGIjD+vUNfOrHhH8Ha9BJEnKs9IrYmFmL5PWM0m0DQ5EggR
 2drQgsnSwOG3EaGMnb+p5ibTHM7G0mH5bQnkurBdYkhxk2KmNubiWblBx6RC3EvVwjU6
 0ShB2VsxLJY2pqLqkBpFyObXca2bUWmvL/g2QHaOdo6EWXUxbAn/TDb8jp8qgkj1k63i
 ZGDWC4ZUTLKhkgM/XFnzK+4FkWCPiMd4lY9kf7kWdY6EejveBHpq8WULORQ+N4ciMzXC
 p4xQ==
X-Gm-Message-State: AOAM532gHvQr+nYdfCEubCloCU99fe5ekigR2hGkwIf40pOJVky35mFs
 UINFMuwnmBSZPP7k42Qvgr6/kYPirmF1OQ==
X-Google-Smtp-Source: ABdhPJx5f6JFWfLz5ObCKOO3DzN5kIi5AfQ3LSQsWUrm3B8hVNg9GWbqhQzwQid/nZeTUjM61lsxrQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr2926995wrv.354.1621498991673; 
 Thu, 20 May 2021 01:23:11 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] tests/qtest/fuzz: Fix build failure
Date: Thu, 20 May 2021 10:22:51 +0200
Message-Id: <20210520082257.187061-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

On Fedora 32, using clang (version 10.0.1-3.fc32) we get:

  tests/qtest/fuzz/fuzz.c:237:5: error: implicit declaration of function 'qemu_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      qemu_init(result.we_wordc, result.we_wordv, NULL);
      ^

qemu_init() is declared in "sysemu/sysemu.h", include this
header to fix.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210513162008.3922223-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/fuzz/fuzz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 04b70e114b..5f77c84983 100644
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
2.31.1



