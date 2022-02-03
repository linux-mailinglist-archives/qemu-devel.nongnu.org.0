Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842404A8D23
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:24:40 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiej-00006c-RQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhw4-00048w-Fc
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:28 -0500
Received: from [2607:f8b0:4864:20::52e] (port=44992
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhw2-0005w1-OH
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:28 -0500
Received: by mail-pg1-x52e.google.com with SMTP id h23so3103034pgk.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EURcAZ+pcodrKmqo6OvXQcoabRjwok8NBs/zUyaBsFE=;
 b=T1MrIPu3tJvXbG3StasHcwd0oGI2LF+HLy2goysVboFKWaQIPh3pPwsBO/r/mIvAYx
 DXKQAGhPljQBgdydr3C/j1Xltf60XZCoHbUUA1DwXm+tlPOi0qGy5Az3d12Kc7vqXl+u
 IEamu3xOolfbObTRBo3VVqP/tgFf8Nkgm7Gt/2hYbiy9+eGRgNMEzW314soY/jgkLXcU
 Dt3OC4WvPlz9USwcgEQSDdv4URnmIVvNKH+ITc8yspno40k3Efo1Ixcn4DbdJkEoLSnq
 3uX0Ky0ZO4HCofYMrrwYQ5uDlSjA446w81wBe3kY3WYOcQN8Sa99ulHJPhwgxu0CfcB7
 4X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EURcAZ+pcodrKmqo6OvXQcoabRjwok8NBs/zUyaBsFE=;
 b=BVoadeiIVXeoCxr2+IUo82qCiZPfTXyWSJ7IywazxEer1qETPE8RJ9Fy6M+J1jYBRV
 wdxvpSVMm5BvKx7FmJpu5clGgg4liURR9smMm7sbqjIemCD0Lspy+T0DbBhnFaJvPZui
 Dq10iCYPaJ+mzCElwG4TV4Xb5C5I4T8hhHpgCNxhkZv9KcES915n+Cu9nQCT6KkW7Dzi
 hE3ATIRvMnslUmCUkY3yCoZXodo7CQ7EoiHGSbGiXA9WIhCdvNtSms7H0oUHnUu4kisK
 iPRX/GqC0kcesat+gnoc3yCSISyGbPs/rfzD5aLZ60S6hCBaxOlGUUs+QLx+slg191jR
 Tc+A==
X-Gm-Message-State: AOAM530btiaDGjYvH4i/NZWOzP/9cZOL1VuMjzplFfT5cuwru3LFxKzZ
 QRrKuEeMH3oA/TRj8Z7M7sWokB+oN8I=
X-Google-Smtp-Source: ABdhPJw7D4ih0HIiwykuIi/kAXmaoYESUiOwSiQ/bVMml9pYWcA/ySGGi5DqYPmwf4iIEDyM3xzXTg==
X-Received: by 2002:a63:5144:: with SMTP id r4mr29267697pgl.382.1643917105229; 
 Thu, 03 Feb 2022 11:38:25 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i10sm3027311pgm.30.2022.02.03.11.38.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:38:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: [PATCH 02/10] hw/remote: Add missing include
Date: Thu,  3 Feb 2022 20:37:55 +0100
Message-Id: <20220203193803.45671-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52e.google.com
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

Currently "qemu/error-report.h" is implicitly included, however
if headers in include/ get refactored, we get:

  hw/remote/proxy-memory-listener.c: In function ‘proxy_memory_listener_commit’:
  hw/remote/proxy-memory-listener.c:183:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Werror=implicit-function-declaration]
    183 |         error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
        |         ^~~~~~~~~~~~
        |         error_report_err

Add the missing "qemu/error-report.h" header to avoid that.

Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
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


