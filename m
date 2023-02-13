Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B2A693ED3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:13:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxP-0000wh-Ub; Mon, 13 Feb 2023 02:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxM-0000sI-V7
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:57 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxL-0001mt-En
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10563173wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeDWNjpVkKdLbShBUyGUp3JADBIyaux21T6WZ6Gmeuk=;
 b=dlEV6i/vpB5jizGkEZriREb5mm6/PbmR09qw+yNoAxt9+icoW8iEy5C395JiR5cTo7
 JqnCQY7udpEamijvPylmt7r9tdcBmdYgFd2DXizqKFKvP8TFVF1E0DOs53knoSJwd1/I
 TEZUp85eDBL/tWiDRrtJWisIoF03pJcKtVlH46Xc1ta7CNfi2DUfv6cZOUj3tfABaUAw
 5LcIEuyVozYQFbZbqHt48Wu6YLy8JV4GoErOlnsGi4YqYWxOphdBXJbEJkaQ+n8aV5nc
 KqldCR4ITjgBBsxEyIi+ZfCB+o2maQToIbUWRgkNXZ3GV5RhuoFWXzIL9kDvvk4HZeIH
 aSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JeDWNjpVkKdLbShBUyGUp3JADBIyaux21T6WZ6Gmeuk=;
 b=pVo8fpDnZgDHSUCrMyIP6/sbN9OVID304ccopzO8iTOlFmRWZlymTuTi4GqFLU+Xgk
 L0Q1vROwABLWm57eHrGeGYUVcYZH683x0cKShdUTJqt0m1VhvSrDcUNNAcUX3EqCxX/q
 GzG5euCFpDp5QOW5fQ1RwjxuVzMhy4ii5u0kyVpM739+7QTcWJcf34X5P8FLaDHtIA2A
 sscgjOt12DlnSzeQ3NEHqDX0bBMv1d8aa5HcjL0+7s3bOHTHX35Tlw1wtWAFJUM/7crt
 X4i4UtxGW9VtD+lQTom1FhBmO3BAsZief/XMJF9rZg/8qFQRpZWckhs9wGEzcug9NtOX
 r5yg==
X-Gm-Message-State: AO0yUKXE5XWWp55Q7tDtCCq2CFEPgTy5+yILiBLHk5iaNR8k0QvB8CBu
 CvyF+9O8IdsVZ4Z9FuPIHWFi4Txi8beaAJb1
X-Google-Smtp-Source: AK7set8l02uaqF1giFIqXjhLH4vB8FQaMb7PvXJBV+SjStfhT1WVgIeiEq9cg3oOcXLEUm3wSsgkQg==
X-Received: by 2002:a05:600c:4386:b0:3df:94c3:4725 with SMTP id
 e6-20020a05600c438600b003df94c34725mr18034618wmn.38.1676272133800; 
 Sun, 12 Feb 2023 23:08:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c4eca00b003dec22de1b1sm14022202wmq.10.2023.02.12.23.08.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 06/19] hw/ide/qdev: Replace DO_UPCAST(IDEDevice) by
 IDE_DEVICE()
Date: Mon, 13 Feb 2023 08:08:07 +0100
Message-Id: <20230213070820.76881-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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


