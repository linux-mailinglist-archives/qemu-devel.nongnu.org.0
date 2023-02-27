Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF2A6A43D7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:10:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe7U-0003Vp-L4; Mon, 27 Feb 2023 09:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7S-0003Mw-6A
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:46 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7Q-000827-Oy
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id bw19so6310966wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hqZbA/VxjYps6TlZPucyPAJK2NQRYopiLwtGGc2bqQI=;
 b=iD9WZ4G4RiqSx4nmA1C7z2o4SR4zuBBqV2rnZoa/HXx9aBO3Iw/fHzINbxN0ekAlwq
 S8o6Z4Lhu2sF90EPpLjEHX9nh4NeRWGuIAxdHSHwnJQoAW1VPweXU8SJ17h/qx+4XoZP
 lnOA7f6bjSiKY1vbMeLvjI5Tv2Vg4TpEZbQZqA+DToBJ/mGqvUUZn7iLkpvdo2+0n5zD
 P9oq0VGKYeuXaNZmVjSbNBnCrMwCyo8jwSbGIzFP4RU9DqRQ9Du7vM8VFnqefW3sHoH6
 q2Cy8ZCfXca7RQ+le46utAVRa1RkX3BWji4Wd1TyaaaSOCx/yWamAfozEBFXDh+9HdQu
 yEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqZbA/VxjYps6TlZPucyPAJK2NQRYopiLwtGGc2bqQI=;
 b=fJhfOS+LC0cZc+Q7nEcwmNCb9XA1AJKlS8mtV5D5odqh1cVxndMyGKofSWLHZWuqM8
 /SLE/ftIHWd1peYk8xEk/Inp/pXtusNRZmzjIfhWh8HpobFXFzID7ruGSrXLo9L7YhO7
 pulkkJECmn5oJxJsA7JjdOwkp0QggGHnftnZpGSC7gwCo+6mDfMg5I+uv2uJQ/VXezM7
 Br2V+oKLOShha4+nG/VW6US2ywpA0pc0oxyc4dnCoRmCBedO45QZEwbybJ0U2C4P0O/B
 fjb5O9V/FVI2p31jj5xCnTiUEl8VwOJufr5t1K43Hdwq6plCT9g2e7Y8BF7jUucVKHrD
 Y5hg==
X-Gm-Message-State: AO0yUKXMp34uBtsW8XimLDE/Qj9TKU09qy7JCdmRFmLdSgN5mm2N5r7Z
 pSLhoLH4CrzH5/exQlh222ZZCM0AqrlJ4tH6
X-Google-Smtp-Source: AK7set8I0kpscfqBuRKFBPxwXzT5NzjJJ3dwkxKUJtHGI7/RyGgXZ50i/D04m9SaYV+2RI9u873VEw==
X-Received: by 2002:adf:ef06:0:b0:2c7:da1:4694 with SMTP id
 e6-20020adfef06000000b002c70da14694mr12989686wro.62.1677506683236; 
 Mon, 27 Feb 2023 06:04:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b002c706c754fesm7259928wrp.32.2023.02.27.06.04.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 037/126] hw/qdev: Constify DeviceState* argument of
 qdev_get_parent_bus()
Date: Mon, 27 Feb 2023 15:00:44 +0100
Message-Id: <20230227140213.35084-28-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

The structure is accessed read-only by qdev_get_parent_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230212224730.51438-2-philmd@linaro.org>
---
 hw/core/qdev.c         | 2 +-
 include/hw/qdev-core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..43d863b0c5 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -330,7 +330,7 @@ bool qdev_machine_modified(void)
     return qdev_hot_added || qdev_hot_removed;
 }
 
-BusState *qdev_get_parent_bus(DeviceState *dev)
+BusState *qdev_get_parent_bus(const DeviceState *dev)
 {
     return dev->parent_bus;
 }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..f5b3b2f89a 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -715,7 +715,7 @@ static inline void qdev_init_gpio_in_named(DeviceState *dev,
 void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
                      const char *name);
 
-BusState *qdev_get_parent_bus(DeviceState *dev);
+BusState *qdev_get_parent_bus(const DeviceState *dev);
 
 /*** BUS API. ***/
 
-- 
2.38.1


