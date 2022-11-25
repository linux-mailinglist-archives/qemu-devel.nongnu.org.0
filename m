Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C0638D98
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:42:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaom-0001gU-6D; Fri, 25 Nov 2022 10:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaoj-0001gD-4V
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:40:42 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaoh-0005o2-K5
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:40:40 -0500
Received: by mail-wr1-x435.google.com with SMTP id i12so7387009wrb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 07:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89ZpvryiYhZAje4rWrjV3F2Dni2cZJzpsnzs0iAtxKs=;
 b=fuJ7OZQgYbClEpvKGXKsXwpBvhvhOdUWRVAHCJbvUcbfrQ9S1wosrnD4ak07vFnFJs
 +2jl+Jh3S526B1GBKp02KoLoS/l3ANX7hSSjhlnc/yQkpfoBGX8Kdom+i9jUg2/Cahwg
 L2fFXTtyQYWvZfMZO1TiWoP9Km1YgtzF7EjQ6eOBZynAXritykF3a6Jn60K9oEd/Mbdq
 019I1tYX6OtfqxzACQf7Hnw6oHr2qCegnPmbsrL+spV2O5QPbKCtoLjrinFyHXt0NVEa
 vzFGUkDX/mkbaK+H277eNcOusrQCiTMsNnLnZyNlfeh4D+eEDmYWHQ2greaid8KERWy/
 Einw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89ZpvryiYhZAje4rWrjV3F2Dni2cZJzpsnzs0iAtxKs=;
 b=W8+oI5De1MKaXG6Wsl5qaAFVhDVA4BY/bH+JZyRul5KzBtMy9VoQOpDJL+Eo1zRn6Q
 sVRbuFtv78vEqpSoTsXkKvzBoK1+HJMpQ7xqvLRJ2bu06x8rchqTW08sVnM+hFKXuryD
 i8Jv8ksojYo/Fj72zZUa0K9/o4fegii0X+e+HBejjVdkIZDOHS7a+kGOuJSPBvA+HX9Y
 wEFs0DimsTFj+PTJeurEZQgyEaMib+BUtq7/b7cWdCppnn94CU5qrF9wAowQrpvaDi/n
 In1bdZtmeBtKQkJeIpQVx+W8Jj1GmvbdQ9Oo8VflOBIa9pN1Eo5kfwmF8RTu3AHQxKTP
 /uOg==
X-Gm-Message-State: ANoB5pmZVkO8Mmgq++5s6YwbFXv3oYQV+Y1EN2dRvxPUNLOn5DYo2aFi
 wfRiM3MXU5io505XO7JyxtD2D9H/oDcZyQ==
X-Google-Smtp-Source: AA0mqf77SEg5ecsa3ya1uyADiGBvb89l+7xhJ4k9AyPEZL+6YuJriSWTDm2ExcBNK9PprsFq5CV00A==
X-Received: by 2002:adf:f60f:0:b0:22e:6564:e987 with SMTP id
 t15-20020adff60f000000b0022e6564e987mr23890818wrp.401.1669390837326; 
 Fri, 25 Nov 2022 07:40:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003cfb7c02542sm6072179wmo.11.2022.11.25.07.40.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Nov 2022 07:40:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 1/4] hw/display/qxl: Have qxl_log_command Return
 early if no log_cmd handler
Date: Fri, 25 Nov 2022 16:40:27 +0100
Message-Id: <20221125154030.42108-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125154030.42108-1-philmd@linaro.org>
References: <20221125154030.42108-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
for the other types.

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


