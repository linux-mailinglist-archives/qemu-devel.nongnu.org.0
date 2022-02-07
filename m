Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804B4AB773
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:19:44 +0100 (CET)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0BT-0000fV-I0
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNb-000673-4U
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:11 -0500
Received: from [2a00:1450:4864:20::32a] (port=51937
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNY-0007AF-Qm
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:10 -0500
Received: by mail-wm1-x32a.google.com with SMTP id r131so3707660wma.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qty1f6fSvGGiMyqW41Boveste4KirnUu/W9AgBn+UBs=;
 b=V3QpLZDPdofGVPET1NeNmUCrVftOLJM1ELx8tJV/ti0Z4et2FuO0oAENSU+x/wUTuH
 AWoqGK/udHVstg+CuIGImjNZuMfM4zzP0JXLmp7HZP2ZB6aOaN63WTEHjfdKRFAhMuCf
 Cc5dbM+9mgiydxoDF2mLfJPBfvBqVEZDnrrE9/fG1sP5Wea2co1u9SjepnrwoyQS4br8
 5202lL71SxUlCAB3LgPItcG4ULaPwsj7sMiwreUvDNJGKkic2J/ma3Fagm7hS40wu1yM
 daWIY7ezoQmvcSWZPaE7ZqIdXjyMVadS3zULeKC6nSl1FEkDFMKzWoDRqO70XeYXXV8z
 t5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qty1f6fSvGGiMyqW41Boveste4KirnUu/W9AgBn+UBs=;
 b=6qozuuhZlXtygYa14bZumw1hAEofrz/wiyoKQ1m2Qg/zSRBuk7FpjfrO2y60HPQgkI
 YJEeDjgtcUO309guFjw8rrm0N3+HK3Ht8IiAcZBM8d23sImonSppuMDbaoO3na+UDPun
 QLb9DtbGW1UOIHjUYxS0KbsEdawyJ2tUIAHwm/E606FdSeUtg3E6NFK95qWFwNNOweXd
 PmKstIMvZhswt5UgT++P/JG+Nr+/8YIy15CEJsjgzl5L914406HAS66PUUQYVe4slenB
 RqxURaXgpfQd/l4PbAUH5+0PMoqT++rh5LvC/XUB2eIYSLFkdHoMb3v6C4I4WSJjyH7/
 vWSQ==
X-Gm-Message-State: AOAM533miWze7rnYGVcCUoNPvLJMyaOa2cP4fP75vyFrhdXHlyYGYlS1
 Y0za08vsVP8rFmCgu4ZP0Xvn+p/SSyE=
X-Google-Smtp-Source: ABdhPJxqc55SWUnPzPViwZE00YA9/NKuJuJfTzIkeVAxe642i/LWBgscgxby9RHRv5e8HkovFpMyxw==
X-Received: by 2002:a05:600c:1e1a:: with SMTP id
 ay26mr13293842wmb.75.1644222487265; 
 Mon, 07 Feb 2022 00:28:07 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r17sm18464840wmq.33.2022.02.07.00.28.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:06 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 2/9] hw/remote: Add missing include
Date: Mon,  7 Feb 2022 09:27:49 +0100
Message-Id: <20220207082756.82600-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

Currently "qemu/error-report.h" is implicitly included, however
if headers in include/ get refactored, we get:

  hw/remote/proxy-memory-listener.c: In function ‘proxy_memory_listener_commit’:
  hw/remote/proxy-memory-listener.c:183:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Werror=implicit-function-declaration]
    183 |         error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
        |         ^~~~~~~~~~~~
        |         error_report_err

Add the missing "qemu/error-report.h" header to avoid that.

Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/remote/proxy-memory-listener.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 882c9b4854..0e893f3189 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -16,6 +16,7 @@
 #include "exec/cpu-common.h"
 #include "exec/ram_addr.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/remote/mpqemu-link.h"
 #include "hw/remote/proxy-memory-listener.h"
 
-- 
2.34.1


