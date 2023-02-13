Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48663694FAD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:47:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoI-00018c-Gs; Mon, 13 Feb 2023 13:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoG-00017e-G1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoE-0008S7-FA
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bu23so13250387wrb.8
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeDWNjpVkKdLbShBUyGUp3JADBIyaux21T6WZ6Gmeuk=;
 b=wyGNJ1e9rn/cDhznCSVxUi9QrvUJeeLe8uPIVaQFHCRyHTpKxt2Ypmp10tI6tUxfB0
 sRoKpqNXV7RKip9Zc4kvT8+TygwQdjYtYghtf+HCqxiYCo41uqy5VuWVd4IJaE0LFjao
 E0mbxveHTg9HG2TAjcMMZVRKAivzx/2x9wDzJJgE+YhRsm5baDHC6JBA5I1cuQvgh/zj
 3mlprAZ9z/U0phbuPrcs8ylB2nhWVEyHQ9jQEHR1eCu3/3AMAm54xj1XDz+Z0krnMl3H
 EkrRuQ8Kx+o9+VFy0QP5L8SQf0Gxz3lzHBa0iHHVSR3mzhyraF5058ynu7rE8/5/LX6C
 iSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JeDWNjpVkKdLbShBUyGUp3JADBIyaux21T6WZ6Gmeuk=;
 b=uZwcHTgMk0oCtF39RATeBZCX4o0DegQk2tYJP7eYTI1fVycdBfDhJu0tgLk/QVI98P
 dKAkITN8bMuB2Cjnbriane2JQBxGtW+zUfVrDLBfgwEnOp5aiXlpJfAuERYGopFgq1N4
 ABBymGicJeB7WValiCf/eRJI5DgMzwgo/VaiuBrQUE3MwFNrL8trFiKQDHnr0BAPUvVa
 bsOH71TvCrBku6820huRW40RKhwFrlrLa6aMnWyheArfjrk9M1oVdLN+tqtspUz915Dn
 Jq1iG9ZQr3s8ziX5FJe65EFSZ5CWdeHIWKB8fEiKzqaXw3K0nGN7NEay8B1nviVSvv7S
 39Aw==
X-Gm-Message-State: AO0yUKVUL/0/sWoY5km7enjKA5kwr5PWOLwAbgNb9cjwkIL/raCC3rbW
 cbpVZxzs6M2OVyh4SMyvkTuJ3ykS6Wt+NDPZ
X-Google-Smtp-Source: AK7set/MQgoBNoqrrPeAqBp71FtJAW50sAiDiEq9GDKq+W4U1A3FYyyT6lXdSuXvj8jhF1TXO0W77w==
X-Received: by 2002:adf:e7d0:0:b0:2c5:586b:f53d with SMTP id
 e16-20020adfe7d0000000b002c5586bf53dmr4442166wrn.48.1676313852972; 
 Mon, 13 Feb 2023 10:44:12 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d7-20020adfe887000000b002c551f7d452sm5849414wrm.98.2023.02.13.10.44.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 06/14] hw/ide/qdev: Replace DO_UPCAST(IDEDevice) by
 IDE_DEVICE()
Date: Mon, 13 Feb 2023 19:43:30 +0100
Message-Id: <20230213184338.46712-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use the IDE_DEVICE() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/qdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 6ae2627a56..1ead62fd18 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -133,7 +133,7 @@ IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
     qdev_prop_set_drive_err(dev, "drive", blk_by_legacy_dinfo(drive),
                             &error_fatal);
     qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
-    return DO_UPCAST(IDEDevice, qdev, dev);
+    return IDE_DEVICE(dev);
 }
 
 int ide_get_geometry(BusState *bus, int unit,
-- 
2.38.1


