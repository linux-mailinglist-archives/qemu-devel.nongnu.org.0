Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1665200E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 13:00:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7bFG-0006Di-QT; Tue, 20 Dec 2022 06:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7bFE-0006D5-93
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:57:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7bFC-000434-Fd
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:57:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v7so8554153wmn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0nh9CGZDn5x2efbNBsbQ0pIsuz5St351PYmG6HGCMs=;
 b=zaSLfP7yZa+lDYYUhzkxEteDUdjTiBySFyRJw7JxoDLS6Z+F5pY1SRABlKx5JitPrE
 DwB6zEmunM5MPdn3t9nVsP63aL7y1CD39sVBUrv9w/DDRLeNs1JhJ58mnTlj+JeyQ1ZJ
 4UwcByDO2I+tKoTb2fhwflDp2FEh5mpZvEuL+XqxHVSq7FHRnQxN7AWXHrY2A9FwY7Yo
 eVPjGOAOlchFJjON1Y+QbTMD3xyDIbWPKBLh818Q80bIHDJ5lWUgdOG6eJp7pOW/N9jw
 lmAku2JY41eMVHP5DmfsrPTDD4UDwPBjBZ4RJln8vLWkDced39A3wsBJ9LE+GjDSrEo1
 19Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0nh9CGZDn5x2efbNBsbQ0pIsuz5St351PYmG6HGCMs=;
 b=vj2dO5ta3QuUVHjaNhQ/g0Qoti5sXVpS4CY5Jy80K9FjKbjiBtPAtBfY+zq3PHpin0
 HGayG3gjYnYItZPGJA2nBrBL5opDU7N8Lay4VEh6wSBi019pXeDpds8u4xro5VBJ7Z7r
 8t5ZYU0C8iB9biNXkofFwq07bv4JJrAEv7pCecyZ3tGH2nW+n+MvSFzytPrrO4yi6HOF
 RLvtgtKHGzLQKoEBS0SjGhYdOKgE9ZFyTE5cEspRgQCJrXik8TzwdoI/gwlAXNN0CKkS
 l4h/WO3kve83g/QrEpLRkJqZScaefzdCUE8uqXSSnlswh6yK5r0IrIo5x8lCLzq1+HnI
 kfmw==
X-Gm-Message-State: AFqh2kp3L1EsRxkGSak1vo3/r1fDEFMg2gdW+jeRPAji2nXXwOjc41l+
 LBjKc8uxuWibFj+de8svaAzLVIGcrj7yjuWpw5c=
X-Google-Smtp-Source: AMrXdXtEveXrQaJIZa/4nmSws+q9bG+25n5fMQ0j8Fe/iYBzPWC1pf9vMqOp3DjJeG9fAwRz4yu7xQ==
X-Received: by 2002:a05:600c:5010:b0:3d3:56ce:5693 with SMTP id
 n16-20020a05600c501000b003d356ce5693mr5654107wmr.17.1671537432367; 
 Tue, 20 Dec 2022 03:57:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bi7-20020a05600c3d8700b003d1e051f671sm15253234wmb.9.2022.12.20.03.57.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:57:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] qom/object_interfaces: Fix QAPI headers included
Date: Tue, 20 Dec 2022 12:57:09 +0100
Message-Id: <20221220115709.18508-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-qom.h"
header in a user-emulation-only build.

Commit f375026606 ("qom: Factor out user_creatable_process_cmdline")
incorrectly added a dependency on this "qapi/qapi-commands-qom.h"
header (the QMP handlers are still defined in qom/qom-qmp-cmds.c).
Remove it, and add "qapi/qmp/qobject.h" which declares qobject_unref.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qom/object_interfaces.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index f94b6c3193..7d31589b04 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -2,8 +2,8 @@
 
 #include "qemu/cutils.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-qom.h"
 #include "qapi/qapi-visit-qom.h"
+#include "qapi/qmp/qobject.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qjson.h"
-- 
2.38.1


