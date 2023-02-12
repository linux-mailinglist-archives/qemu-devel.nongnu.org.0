Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F138E693AA6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCq-0005Yd-Jn; Sun, 12 Feb 2023 17:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCp-0005Xf-1g
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:23 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCn-00042O-Hw
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id o15so7139061wrc.9
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2VknmEn3fmBwvpwvDl4brQssg/rA4ds5kYNPCQi2wo=;
 b=NAnShSrG3bvpsgcAUn3PIfOzm8ENnXSVBU4aWjYnslxrwPjlGIKeGiXegkBTAKj1XF
 9ZpaqBPCq2zv+spNAHgtevK70pSJKDuLsyyDSelFP6ZovIfeUD6uZLukPIUFwhg6yMFe
 FlETZpGB6Ab8Fdu0106HERa+dCV7fkk8cra8eEz/ddo4SUKwBQEO8MxXMDI11XgKHZ3K
 CP4CT+0R41GqI0XhAghF343ab/U1uDirpZp3z+vaK3+xcuwGAiPnWv6pIZHNYoBNG9+3
 suqPsne/z+2cvy0Z7HPELLHE/M9++sVsvPKqfcyAufMRZzE9ARhAFfhIjk1Bb4dDUBJ0
 yS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2VknmEn3fmBwvpwvDl4brQssg/rA4ds5kYNPCQi2wo=;
 b=DPnVRHAuEXg3jKBwU4ptw99hQ/fee5yt0YxNilM7ZhWd9SOaICgS+Btd+LawiXJlbf
 hJdRni0c7rdILrS7pcJGrd/fBQMMDfssxTCp0+1Y45h8tcGr9jC3oCFsDBUqwSyi9zya
 N0vMIcLT6lJGJfUT512/1/zQd1DYIyIFuqiZpMd7615/IiWmMArPnuBfPDWJQaBcUjCs
 rIfCEQBQ3soRQJY5B3cQkcDNYOvZsrSKy7nulfNllILc0IVOxy6Ni3l3qzkbNyhT8522
 c28wWmWUnfsxNBPFKtbYQ2ieB/hsmRjA/d4O2Mtp/Qnt7QZ9jiFuAZp9zoysche+g8QD
 z5uQ==
X-Gm-Message-State: AO0yUKUjEbY7tm301GgtVQwX03/lXRd2JCWPy8ozGbLaNCacazkptsqG
 Gg/dRJJpZj2xCKEGcMHsYltrdg==
X-Google-Smtp-Source: AK7set9RrZ6tQ4pcNxRLdqsYd22maxbTEIm2gPvJDKztQGN2NrXYotngXVwhZGy6IGmMvFOuhger8A==
X-Received: by 2002:a5d:6188:0:b0:2c5:49e1:b2cb with SMTP id
 j8-20020a5d6188000000b002c549e1b2cbmr7664822wru.37.1676242340343; 
 Sun, 12 Feb 2023 14:52:20 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d6549000000b002bfd524255esm2483149wrv.43.2023.02.12.14.52.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 06/19] hw/ide/qdev: Replace DO_UPCAST(IDEDevice) by
 IDE_DEVICE()
Date: Sun, 12 Feb 2023 23:51:31 +0100
Message-Id: <20230212225144.58660-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
index 96582ce49b..c96a25e955 100644
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


