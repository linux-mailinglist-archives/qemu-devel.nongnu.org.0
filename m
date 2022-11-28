Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A763B330
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozkjK-0002kQ-Rf; Mon, 28 Nov 2022 15:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjI-0002iN-VK
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:27:52 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjH-000282-E4
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:27:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id h11so11548838wrw.13
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 12:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYHeDZzoQ050kMmL2gly3nfjXqnhqur/NbBZzIah+Ds=;
 b=ccCR2XTZcBw9ShSgpCejQy2uisoWvlZZgFVH1NT0rjNoe4GP+M3xgQHVqUWNXaCk5I
 9RRKHXH37Wa/+t9wrDf7lFEtvyWiNMwXnffy2sR/+vXUFiExXCt+7gAEgHtAzEqDNvcu
 V+kbUUwknfynKPWcVKspgOuNbNbI3u545c5aChlOEPYtZ/+KY/38yI9OoQBI6oL0z7/l
 9WfvqZOtVbKhfDNpSaKxwSQnISCxostbkNBS+wsdxu4w5GgW5sv+m8BYKFkNdpB5Kwjp
 VnLle+9y1RZ/rxfQzDdMnTEbvqPa078uILGyQPoTps3u0V/vwjhc8DawlsZdunEo/23r
 xg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYHeDZzoQ050kMmL2gly3nfjXqnhqur/NbBZzIah+Ds=;
 b=iE8pOWp7g6WaWefDKgKn4xRufBW5Wi4I+365j6f2aY0xu4SIUFZ951G5vYQvDFOiva
 n5swo9OinVODtz98z7g42mlWd/z0VT5uw4bhQbPB2Y6JG/9aKCy3J2UhW0Y94iIBMgK+
 VxTDSP12bRLaatOPveDSWZ1O4reaG1zk1+5nZFapqq6Alt/o6Y/Z49F0MBFgo4n04r1N
 ySPNDvvUnuv8O2zBTFrCPxZMubNkcgL8QgV/f3XNcfyTAdALNRzsvM8NzJSYZTlZ296w
 kRwtPj3RNJcLJZpv5zyZd9w/SkaUiBYBlsm+8su/ueetdfCgl4Xl7E7FViD6IwLpW8LR
 wq4Q==
X-Gm-Message-State: ANoB5pmudBKlKGMPbDHBuAHIiQLanJVpD10All+xR1epxhe8aKTkehad
 Qlk0m7SP6WglP3A3AZPLhNNqrXsCnTDasg==
X-Google-Smtp-Source: AA0mqf6v4lKNgzuESFs8dciZt83wjZg2bTNYSFG541VofbYpGGHXBaf9JJ+5yg7vX8XCqQebW69WQQ==
X-Received: by 2002:a5d:58c6:0:b0:242:da2:7f50 with SMTP id
 o6-20020a5d58c6000000b002420da27f50mr7191656wrf.507.1669667268990; 
 Mon, 28 Nov 2022 12:27:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adff8c6000000b002258235bda3sm11229189wrq.61.2022.11.28.12.27.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 12:27:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-7.2 v3 1/5] hw/display/qxl: Have qxl_log_command Return
 early if no log_cmd handler
Date: Mon, 28 Nov 2022 21:27:37 +0100
Message-Id: <20221128202741.4945-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128202741.4945-1-philmd@linaro.org>
References: <20221128202741.4945-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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


