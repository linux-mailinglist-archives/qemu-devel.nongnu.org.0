Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89B76A3F7F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaog-0000D2-LX; Mon, 27 Feb 2023 05:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWaod-0000Ae-00
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:33:07 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWaob-00017X-C5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:33:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id e37so3177241wri.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T5QrXjCnkZQWEnorfm93cOZ0CvMRvt1Koa0vUL8aXog=;
 b=O1mbz4wcmK9lkhKfxQsvYbxwzeTLvCQJUAHJ4wbQEcgks3umVE2IYnAKG1lmP1Yebh
 v+7ej9hA6r+3CFwwgr7iYjb3N0MR23NjVfWf6MmKDcJjgNH7n62sK5ubttD+h4ELJc0z
 W02hbkRE49QYBI0a9rDpyuVHeFzyOe8JelvGBZr7Q6Vb40mVZlHYc3ME/jMnjUv2xZvW
 6BJ2O8xeVD5gdXaKqsQQUPOua1DoElXYQC6rQjp3ahQ6zlA0LJMOtLGQn/OAMxUa5l3I
 69u/YPa4V5CK+Jeul2nxY566ARytF9t9JoVJIHVfZljoOZ7GhEw3pHJK5NuLNMXcVoBG
 jjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T5QrXjCnkZQWEnorfm93cOZ0CvMRvt1Koa0vUL8aXog=;
 b=4d9IduIPVZrFKt63PUCSRx5KhBqCLeUehrIgD2+JJsO7D7TPOpWuAx+Zx6cd4muh0K
 DJfoBid7w0giJS7GqE8qq+ufA3f9/BQyeiKF9WrqI0xrQD6l27XpDOREBQHaaMwOpgL/
 dIjpc3jOZvMYMMi2HggM7hLO4mb2LDVJB7AKEIUp9jNsH4najo/c7/Hi2GOxa9ih6dVR
 d7ODdP0Stg3hRrrFPZGmu9UbA3HexVJ0fYMSWw5uo/y2q+1p/47OMV6iaRDM5utT0RSw
 0UhDCCKaVvK21yHwbb+1Rt8Jg4UX2TIXH4Saw+4CtDb7ak82gtT6zF/bPMVmAGQtC1eM
 h+xw==
X-Gm-Message-State: AO0yUKVloVtR3NkxCEB6cDjWMoGkEldlK9MTTK/dkD8TXMqNDzAfOKC7
 3R8wU7XwcX3tpgb53LLXAP9AZAPIBwbNobbX
X-Google-Smtp-Source: AK7set/UWNNq4hLUvLmuQqY+qRQvtVE3DXzQiLDXrj0Yi7GaStah/F5zO4Dsu/uzLoTh0rYLuRIIsQ==
X-Received: by 2002:a5d:6743:0:b0:2c7:a3b:4e76 with SMTP id
 l3-20020a5d6743000000b002c70a3b4e76mr14425404wrw.6.1677493980598; 
 Mon, 27 Feb 2023 02:33:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056000018100b002c54fb024b2sm6762276wrx.61.2023.02.27.02.32.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 02:33:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/vfio: Build various target-independent objects once
Date: Mon, 27 Feb 2023 11:32:56 +0100
Message-Id: <20230227103258.13295-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Remove the unused 'exec/ram_addr.h' from migration.o.
This was the only reason this file is built per target.
Move other target-independent objects to meson's softmmu
source set.

Philippe Mathieu-Daudé (2):
  hw/vfio/migration: Remove unused 'exec/ram_addr.h' header
  hw/vfio: Build various target-independent objects once

 hw/vfio/meson.build | 13 ++++++++-----
 hw/vfio/migration.c |  1 -
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.38.1


