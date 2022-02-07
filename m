Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00B4AB690
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:33:51 +0100 (CET)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzSV-0005ak-I5
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysn-00061s-Nl
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:27 -0500
Received: from [2a00:1450:4864:20::436] (port=41476
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysO-0002B3-W6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id k1so6599978wrd.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAqkFjMH6Uy5U+4qThYsEs/+qMc6h2XmQGwMlhvm3jU=;
 b=ZNPzz/dof2ZyxmUZg2kduFJRrEbEMM8e30jdkwHslph3T4arC9ATBbFTcWw3Z7aJLo
 6yv3ZZhKImZAG7Gqdt8RCQG/ZBgTyAOz0UT0J7Q6jt0KwsRTweCCtYlGGQe0zS0fnVy7
 WxJwoSxICaSd+scLOYMGCA4jekLZRKu6fyQqUj/FX9qqGqO7GEq4lfOuwFDSzx4LiyBb
 vyIglxHjaMAVfCUPdhGW83tvOWU05RlqAVyoEdr7jQD13q19hUljVUgxDDjm2RWOipR7
 eyrhPN1XOP0w8rj/h2B7czjjnAshn1etHruPs0AEIUmmqSa68TL2r5E4S3jWJb+LO680
 LrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lAqkFjMH6Uy5U+4qThYsEs/+qMc6h2XmQGwMlhvm3jU=;
 b=ur0fVRZeaQChSY1vHKp+eQz6VEeAfOFyAfbnp+tjuKBsxxfuR4WWRl6R+Wuz68Usgh
 /dJgkweNCJmj7kcM6tkWjAPj1zMDtwpb4PixHVXpynhbsZtBlM+z6JSzWol5VXiq8dD4
 XGg8jL+QUChSx0zc7qLVLYWKJ8dfPVFlugELGigkW7TL4q9xmBCKuPIbiwpdeDv6aiiG
 EQAvug8c8fOMVqQn8yioUiMalrR8e8oQRmz2QvH43syU19Z4hN4tiBqD4ESDZlgjXimP
 PF0260g4ov8pUktbJpavw86ynexJOE8XEefMuUkqz9jlNSIPhZtC/6E2RWE1sE71UPOz
 whIg==
X-Gm-Message-State: AOAM533NWLl1CUKvyJWLtMyrtpjTH5MDBzQxOgHgJVxCrzvMtIqXQuXH
 b3bv49XGGTNgbhZ67zb9x8bUK/NmlJw=
X-Google-Smtp-Source: ABdhPJyuyORsPr82gjgVvxWP8o0YyoyDMLWywgargdVNusMFOxWQR5o7cjiIIl3dz6jpZamJ/0D/sg==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr9330746wrq.253.1644220527665; 
 Sun, 06 Feb 2022 23:55:27 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p8sm10073220wrr.16.2022.02.06.23.55.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:27 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 13/21] softmmu/runstate: Clean headers
Date: Mon,  7 Feb 2022 08:54:18 +0100
Message-Id: <20220207075426.81934-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

Add the missing 'qemu/log.h' header and remove the
unused 'exec/exec-all.h' one.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/runstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b7365a..3cb2758b33 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -30,7 +30,6 @@
 #include "crypto/cipher.h"
 #include "crypto/init.h"
 #include "exec/cpu-common.h"
-#include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "hw/boards.h"
 #include "migration/misc.h"
@@ -44,6 +43,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/job.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "qemu/sockets.h"
-- 
2.34.1


