Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546065F248
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMf-0001LU-KM; Thu, 05 Jan 2023 11:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM7-0000dt-6R
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM5-0007Q6-LZ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o15so28449113wmr.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sztR4J95IadKOvZP/cP3UWW/HHhoPYqwE6deb2jD44g=;
 b=V89avodALBG+HAp3Jpemx9sCEevME0VO5vRDIdF5wpl3NCPuqkcn+SvkJbWQZaeG9H
 /4w0zEhING3rfOpSUXyDf+HHLuQ4YSnikoVuH0aLdho3jOunObcdQtxBuv2W0PxkdkaO
 m5zONhos8GLcEoDoCpM7M0NPK9kWI7aIyFPMgdCfU39rnw5HxCrYyxRWaMOcZNVXzaib
 fdc3K0rp55sV/nE+kLtWVpF3yV/aJCfwHMLeuVjidGA3GnPvBUc7WKrHJg7mSArXOs6+
 cth5SBqVPF3qtigChUholTcSmzmR/7aKN2FCqwKuEv34uTIl+ovzpO1kL9KEnR9jCJ/X
 GuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sztR4J95IadKOvZP/cP3UWW/HHhoPYqwE6deb2jD44g=;
 b=diz1UatoCE5Ci8YZldSmninqL+bgvqdmOmHsqBbmjUo1IK/ljhJHixx1jm+6x0zuRP
 phbAaiXGa2EvEv8wOFovFWYAEx7NhRJ89hFli1gRLPlflnEjZ5Xg9Ck2US/kveUO7uEM
 I7xOTMirsUuy/5NPNZiEqX81gfmVf4YjwOHz+sSdRdM+07TwLR8S0hmIPayQrI3SDSVT
 knUPV7uu+gQDkOMdNM/xGadjbelGprfqTopAFQdh5N1F4A6hyFaKdW8qfb9/XjAkxvXQ
 0YbTB/Vg4G7dVwf+3ne1d7ZqHUqSLIiuGihtQDUICDLgX9/LCdxOID1P22SXq4xsOUxp
 K3Vg==
X-Gm-Message-State: AFqh2kreq7Nl7z0WBsaJ6ItJZHjyuUEMCk4KuWMwrO5FcNqlx05q5ymu
 ndNDji07+Xu9mvxbZe70HFx9l9QVPA3YkdzJ
X-Google-Smtp-Source: AMrXdXsQlRc7TWvkuPkzzpka+k+J7ZNP80j2wPyIVm1wfq8EuAMbYFXuZTHAQoTIg+CzHB+f3x8UyA==
X-Received: by 2002:a05:600c:1914:b0:3d2:2fa9:cffa with SMTP id
 j20-20020a05600c191400b003d22fa9cffamr36549096wmq.25.1672937076839; 
 Thu, 05 Jan 2023 08:44:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/34] target/arm: Remove unused includes from m_helper.c
Date: Thu,  5 Jan 2023 16:44:04 +0000
Message-Id: <20230105164417.3994639-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Fabiano Rosas <farosas@suse.de>

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-id: 20221213190537.511-5-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a7..033a4d92614 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -7,30 +7,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "target/arm/idau.h"
-#include "trace.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
 #include "qemu/bitops.h"
-#include "qemu/crc32c.h"
-#include "qemu/qemu-print.h"
 #include "qemu/log.h"
 #include "exec/exec-all.h"
-#include <zlib.h> /* For crc32 */
-#include "semihosting/semihost.h"
-#include "sysemu/cpus.h"
-#include "sysemu/kvm.h"
-#include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
-#include "qapi/error.h"
-#include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
-#include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
-- 
2.25.1


