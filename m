Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF44757AD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:21:31 +0100 (CET)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSLi-0001Wh-O2
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:21:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRif-0007AV-19
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:09 -0500
Received: from [2a00:1450:4864:20::429] (port=42981
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiZ-0008Sh-E2
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id c4so37353474wrd.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hhMYipSwn2eG/b+4IrljLjNjCQxUpkJwZAkhclx3/mk=;
 b=z6EGwv649E4JN+CwBINKq0vDHUKGNsUv0kpdoAllXJGuOWLIDMw4pZKQhjZ1pP1m+A
 6OYCTeNm1yphx9P51KeC94N6Ma2u2NTxdp5ghVXSrXQ9U3iNUWMmUsvAy1/TmaQXtl5E
 BdDcBJzChghIlQqdbbgEfIW4pFAJ3u9uVjJsvoAi1q8dmrGdpF1zZRmgPwZweBm3TMyW
 DQ1Cj0zcxbDxI41bW32E3AbWuiCWuMKp7mSwAbhn2yaWKilIwgvXBOWX9Kxfc+OPt6Xv
 XjkMKDHRD/6MRT0OLmqZb8pLSKqKIJixB2NT+KT3Inj8k1NUqRBdMWXme3TzaVKaSU2o
 +KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhMYipSwn2eG/b+4IrljLjNjCQxUpkJwZAkhclx3/mk=;
 b=VtTp2kuhssf5Py7ohAuWH2Y6WOLxaclfEH5rF+5RsYAb6b/7GXwotk5XBoL7UOpOM6
 ndiMlxN6T7sZqCMW+YPAGLDAw+uYS+NFKHMd2aMfIrlgbo2nPJBuglYjKP6ulEmUEnlx
 5S9ljhp4naI/CE/CM/5XjRN21UL9rvQ95kFR0phqfobaTsaTIi0EpdJOE0VK+U9OULoz
 U6ufiFEtJmtpBUSQExyP9dREdQew6ZVkrAnySOmP1JhtNo5ebaLzrangSu+P9p/OVBJO
 tVGSwBsY7TP+2ezXaWnAPkzVMyJaGaFlMIRaY3LEH5JC1UPOaUuOOw3S83l74W548Kd2
 10Cw==
X-Gm-Message-State: AOAM5329mTYZUDgMdkOHX4OnGXC8fsEBm4Ch9CbvOXNpmcEYR31iK2rt
 B7lpg+NPNu7IT4ws1drnFV6kUJLdMzTPiw==
X-Google-Smtp-Source: ABdhPJz//aCwVv/ZUVcU6g+8w2tBqMznaUPreMdz6yhXJC0JVBMgIZylgWUdf8mdXlg77s3S85Mg+A==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr3811934wrv.73.1639564862200;
 Wed, 15 Dec 2021 02:41:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] include/hw/i386: Don't include qemu-common.h in .h files
Date: Wed, 15 Dec 2021 10:40:36 +0000
Message-Id: <20211215104049.2030475-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

include/hw/i386/x86.h and include/hw/i386/microvm.h break this rule.
In fact, the include is not required at all, so we can just drop it
from both files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20211129200510.1233037-2-peter.maydell@linaro.org
---
 include/hw/i386/microvm.h | 1 -
 include/hw/i386/x86.h     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 4d9c732d4b2..efcbd926fd4 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -18,7 +18,6 @@
 #ifndef HW_I386_MICROVM_H
 #define HW_I386_MICROVM_H
 
-#include "qemu-common.h"
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index bb1cfb88966..a145a303703 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -17,7 +17,6 @@
 #ifndef HW_I386_X86_H
 #define HW_I386_X86_H
 
-#include "qemu-common.h"
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
 
-- 
2.25.1


