Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DDE4AB7FB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:54:44 +0100 (CET)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0jM-0000km-18
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNj-0006Ez-D2
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:19 -0500
Received: from [2a00:1450:4864:20::42c] (port=45965
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNh-0007Bt-VD
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:19 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m14so23207959wrg.12
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lpGeFSPnxNjU9KBC1fpvy5OO+8NnRnkO3XQ2LG2wTo=;
 b=m7eptIRiJz0cv7V6jYVvcJUAPRIN7pqCUJxEQaK9RvFKYok7xVxA7SGkh3jipAY9kd
 oSAq007wx+1KhwcKGOwPMyzTVk7bf4zxKh/I9xbgpio5fhvbPZ6EGDJiAxoK65ypbq9E
 5Fhr5/wLyM64AEqD38kvT5cmI3KNy8i1UB5qxAzfiI3AFxWzeDdpk/CTY3Xg1FkiZWC6
 9xvlQyILHdCBJmdrn/NInDJAE/hA3Ywm1al+yFgek/oltvhSywXI3p4WC6xRWUIqA1Mi
 /XGH13z5Kz2YP+Ekfv3QRHqYoJY4s1wLiYv3SQPiHX+LISRxkHRJnNrAmjws0TYyd0v5
 xAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9lpGeFSPnxNjU9KBC1fpvy5OO+8NnRnkO3XQ2LG2wTo=;
 b=ANoNKNuxLGQ55py3F9sSD14Y9iuJwmPQftCAT3zTW0mU8pSf/TSESKmxrGtgPHKceQ
 IQkWqnPuCWM7zS+0akDzhu11QM0Cz0j5CMKqTLJRhHa696kBRM8H5ZxA0vxS3IXiSg9U
 c9aS3LH6QCE9LkMBitcLO1xlX0pOg8xmIgqyLkVjRmha+mX4C3z4d6It5bfiwQeYMZFe
 LVUwz5p271x1tqED9FWVXrulV3r+D69UTST5wNzD8svc5k6jhn9zZfZbchY1xZnVGWhz
 7fLsZE406qwRK423nSSs2aaYPjZIpPPN3RxrBP7YIxrGstx4knrlcEchDU+bn4mQk3uW
 Qrsg==
X-Gm-Message-State: AOAM532a+k9nJqzbWTvR8vg+8a/KiLIaw1f7/9qHLQdQ8C2HMOgfVRYm
 d+W2QM+OKNu6OapCme6psYTik8z1n6o=
X-Google-Smtp-Source: ABdhPJy/rmGE/u66K4pcxb//OHVne/Gv6RA7UA7pduhjflUkUNF9Ee4JqHCVgunntKh+QHgtjs9G+A==
X-Received: by 2002:a5d:6486:: with SMTP id o6mr8507447wri.454.1644222496626; 
 Mon, 07 Feb 2022 00:28:16 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p15sm3135512wma.27.2022.02.07.00.28.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:16 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 4/9] qtest: Add missing 'hw/qdev-core.h' include
Date: Mon,  7 Feb 2022 09:27:51 +0100
Message-Id: <20220207082756.82600-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


