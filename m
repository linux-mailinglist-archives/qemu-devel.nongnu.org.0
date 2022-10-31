Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C76B613790
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:13:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZK-0002Nh-Tx; Mon, 31 Oct 2022 09:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYv-00006x-Pv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0001Ft-Jq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id v1so15890037wrt.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQ3mqyvV0NL98udsiVwGa1NOdzcIa4/RtP/2vDX4TN8=;
 b=p3W8Bxp6EX7kj5KEmlytD2jyvUu5eiuJbEYUErcXczx9gQp5qpBLSSC5AmAgqDuqbI
 0fmbwf9+VcCqrzGGbXWLNY7zAIIpo6wrvUTFOrUrlPvvbBxCf0aEaSc9TMsW6OY3wYif
 IJsYUTHvpfrkAwiD4n0EL1loEMIKuY7vEpAs7c87bx3lB8BfWlNdSBJdV6iPzJgfJyWh
 Y9SpkleopFf9vuYvmjc0YyESVgSpWhwO2XovCcIK5arSw5NjOfpRq9C0GQqHejOrz9wC
 Hr35eQ/EIHORledSIY5pmcF138O4zX/sMpImK75GrtOAJiz3aY11h0ZgQZ5gWoXZmVpZ
 Kerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eQ3mqyvV0NL98udsiVwGa1NOdzcIa4/RtP/2vDX4TN8=;
 b=Z3iEt0+l4WRGdht9z0kwJ7F+dXmWNZHMr23yzhw+/Tnd6QDAArIFIo3yDPePsHl8tx
 anfrOmalJz+e4m7xANSLnCHwjzG61IP+u4fsbRDEMGYDuvxN/1q3Nrh+SWZEsMv+46Yj
 fanSOrtrbOz5s6Qk6OYdkj9Ir0VJNY3+DyFRINjVjILqFtawphPIVX/Eu4cPJI2WtO2n
 ZqYg7LHe7h6BrfCrYOG6OSodj6+LjRvvsjWgrBIsJaG8vDQv79YyBC4/J4zYncUy4ACz
 bTWj0Z89VkPWdXpKC2ej2CLEh7qloFIsdFx7Y86VCSM6fUZztCzzaJrpN32pPY6E1CJx
 Hk+Q==
X-Gm-Message-State: ACrzQf0Mzz1TLAFJ1AmNjynOoxJOwtT2AVz11viptk8TamJhuQU7lsDB
 Izp9Zt/3zRyGcw/MMhLtyNzhjA==
X-Google-Smtp-Source: AMsMyM79iD3mzqDovA7HBv7qDPjHwxq8bI4BIOuzD4KP25ewh7cEFd3eGrApVbSzfrNQ2nq1ibTRsQ==
X-Received: by 2002:a5d:5386:0:b0:236:bec0:d935 with SMTP id
 d6-20020a5d5386000000b00236bec0d935mr4002413wrv.547.1667221825193; 
 Mon, 31 Oct 2022 06:10:25 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a5d56d1000000b0022cc6b8df5esm7133803wrw.7.2022.10.31.06.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E9481FFC5;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/31] hw/usb: dev-mtp: Use g_mkdir()
Date: Mon, 31 Oct 2022 13:09:54 +0000
Message-Id: <20221031131010.682984-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221006151927.2079583-8-bmeng.cn@gmail.com>
Message-Id: <20221027183637.2772968-15-alex.bennee@linaro.org>

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 5831395cef..1cac1cd435 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -14,7 +14,7 @@
 #include "qemu/error-report.h"
 #include <wchar.h>
 #include <dirent.h>
-
+#include <glib/gstdio.h>
 #include <sys/statvfs.h>
 
 
@@ -1622,7 +1622,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
         if (s->dataset.filename) {
             path = g_strdup_printf("%s/%s", parent->path, s->dataset.filename);
             if (s->dataset.format == FMT_ASSOCIATION) {
-                ret = mkdir(path, mask);
+                ret = g_mkdir(path, mask);
                 if (!ret) {
                     usb_mtp_queue_result(s, RES_OK, d->trans, 3,
                                          QEMU_STORAGE_ID,
-- 
2.34.1


