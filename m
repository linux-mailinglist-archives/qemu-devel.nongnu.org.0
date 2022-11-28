Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A063AA06
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:49:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeV3-0004tP-B0; Mon, 28 Nov 2022 08:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeV1-0004t9-7a
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeUz-0000Hq-6i
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so11674651wmb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYHeDZzoQ050kMmL2gly3nfjXqnhqur/NbBZzIah+Ds=;
 b=kYL3A7aqILslZh5SGQrbc1YKknxmIPXfWsAic8JV3eiYGqioyfBs1QYZIo/8AXiWg2
 uQNo3+QQAiysWtOPy9hfbqC2CteMNFMAFb3Y6ytJtU54YHibyfIyeCw0htqJ9ZJ3qU+u
 NUBh5ZDavUvFSEmB44qTi40s4sweglbNe1UnBuS+Fe+HDCiFkpUlliyWRdcgynkRRKrA
 uK0YksAzKypQe/QPb31YY3D4CP9LlVD6gl61rfrLF/Ztcu9YAMj3S91HzuhaYgiANv7X
 ZUYhSQZ6F1+3PAkdbzxx3SLSg6z+BzO+pdaTPAqFyUdblZPa56XVOtl0bo9A0QxA6fEK
 M12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYHeDZzoQ050kMmL2gly3nfjXqnhqur/NbBZzIah+Ds=;
 b=qnHTv13hOtVD8I2sU1nRtexknntVAF0U2qO7IVldXK8AwRXjUQjbJxAh7B7FH54cU5
 TTGM8M7Gm2uR4oFG6aZE1NVv57njHlQNX6drpvUmuAjukfWisu3Iiyx1fWdS7/7jVnPy
 I0vTkNlbjtoU1HEhPcCp7Jnv/qyYpNJOyosI78NWZDExGoYtjRZfzP9At33zEYfVUXnq
 Pm+iVvPy29Uq19EwIzC3+ib/IiVFzBp89pZ/O8LqHy7ZJqtDFpDHy8T2gnYShVuBxaDA
 qqbDAvLDpDX4hDbVE4HQFjauC1hF/BlZmDiLmq2o1dYlOLvnQ3QVP+ety9FVJY1g/cJ3
 v2aw==
X-Gm-Message-State: ANoB5pmsOMyXD3WEjTXhucI+j3TWT8waeNA/STk7BWSg6xybBtzsoEDe
 RY1ndq+dWQEYyJfKuPn6JUEthA==
X-Google-Smtp-Source: AA0mqf6Ei0MXNrSlqz/ppQBRb1UBW2uc/JNwDJA9jv7WL9kSBr5qJoR/Fb4fy7Z9PTP5RGdKGtcCDQ==
X-Received: by 2002:a05:600c:3b8f:b0:3d0:2485:c06a with SMTP id
 n15-20020a05600c3b8f00b003d02485c06amr27019175wms.26.1669643319634; 
 Mon, 28 Nov 2022 05:48:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b002366f9bd717sm12819084wrw.45.2022.11.28.05.48.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 05:48:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-7.2 1/5] hw/display/qxl: Have qxl_log_command Return early
 if no log_cmd handler
Date: Mon, 28 Nov 2022 14:48:28 +0100
Message-Id: <20221128134832.84867-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128134832.84867-1-philmd@linaro.org>
References: <20221128134832.84867-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Only 3 command types are logged: no need to call qxl_phys2virt()
for the other types. Using different cases will help to pass
different structure sizes to qxl_phys2virt() in a pair of commits.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/qxl-logger.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index 68bfa47568..1bcf803db6 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
             qxl_name(qxl_type, ext->cmd.type),
             compat ? "(compat)" : "");
 
+    switch (ext->cmd.type) {
+    case QXL_CMD_DRAW:
+        break;
+    case QXL_CMD_SURFACE:
+        break;
+    case QXL_CMD_CURSOR:
+        break;
+    default:
+        goto out;
+    }
     data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
     if (!data) {
         return 1;
@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
         qxl_log_cmd_cursor(qxl, data, ext->group_id);
         break;
     }
+out:
     fprintf(stderr, "\n");
     return 0;
 }
-- 
2.38.1


