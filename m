Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B94A8D2E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:26:32 +0100 (CET)
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFigZ-0002XV-Hf
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:26:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwZ-0004IW-8N
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:01 -0500
Received: from [2607:f8b0:4864:20::429] (port=47057
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwR-00061m-OQ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:55 -0500
Received: by mail-pf1-x429.google.com with SMTP id i17so3045456pfq.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sP7Ygr3KOhweObu1GSFi+Gm2T3Yd9wOfYj+MYupKOxE=;
 b=JJKkjY8uBNRpqQlCq6x275ERYhYbgPLtxin8mHGtcqW0dJdKqx0OzMvA9wt2DbiPsW
 onYLWRtJ1Nb5ZL50z25r42B1L8DdxaxOS+kJkuGCZlt+0QFdPUErVL2eVPe6IUut77Vw
 JQnrzAugpSoZ1UCtei7JHBBp42CLFrdk+rV0QIWxwv70m6r3d0knDZ0BAPGPeC3pxjGB
 CraAPSkEwnRFKw/oP1aEBIa5RV41VAXbvsZ8ZoEcI9XCSeZoBSd2FQUDShaH6rIigzbJ
 cxDjluhVv1Ot3qdMO5jZdx90s4WLEViH396Nh86uKB3wys/lYR39QixNV1Raa5H/b1um
 aMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sP7Ygr3KOhweObu1GSFi+Gm2T3Yd9wOfYj+MYupKOxE=;
 b=CcVzL0EZlS1HJ4I5JDAD327KC/iakSC++xR8rn4L2mbqz7UWVsdmz5hCuDGCnFXCt8
 1gW4wVbwfZToErG2HTSm7gz22H4qMQJ3EPmq/zqr7RWNTsRWIPRPiuHRlAIeDIt6dG7a
 hpeQSGog5/afiIzTELR0WlohL2OcIOjGs3nTMUHVee9lWAtFTkfWy64qSHzM3v0+MumG
 tYnJKTYNSsL7NiuF6IRHccwpuLawSRKGRWhOveICoUuKlnYuyBZq0F63GoqGZPBWPsn7
 voEGmP8tfOxM6xpBEMXBS0BqVLycBnVQoKvIHrOnaFH7gwsRzVUHqpvahFTLjgxkCZVq
 oX7w==
X-Gm-Message-State: AOAM531PXudTeAzwHIeHO3n3VA+2qIByvUrLGRAY5sD5i66AOE656rBc
 ajxDyBRVUQtBXZSYA0DIriRYvCd5JCc=
X-Google-Smtp-Source: ABdhPJwG0q9+DdyfjO3uGDhgTnRcLKq+RMEpvMXWiyf/v4Ensd+VT0CB4tJiG8kacIlNjUHypRD9nA==
X-Received: by 2002:a63:d1:: with SMTP id 200mr16804039pga.402.1643917128914; 
 Thu, 03 Feb 2022 11:38:48 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y20sm30914672pfi.78.2022.02.03.11.38.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:38:48 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 05/10] qtest: Add missing 'hw/qdev-core.h' include
Date: Thu,  3 Feb 2022 20:37:58 +0100
Message-Id: <20220203193803.45671-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Add "hw/qdev-core.h" to avoid when refactoring include/:

  softmmu/qtest.c:404:9: error: use of undeclared identifier 'NamedGPIOList'
        NamedGPIOList *ngl;
        ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/qtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 72751e1fd8..8b7cb6aa8e 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -19,6 +19,7 @@
 #include "chardev/char-fe.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
+#include "hw/qdev-core.h"
 #include "hw/irq.h"
 #include "qemu/accel.h"
 #include "sysemu/cpu-timers.h"
-- 
2.34.1


