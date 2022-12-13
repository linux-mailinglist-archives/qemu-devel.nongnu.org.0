Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDE64B3FC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 12:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p53I5-0004Mt-EU; Tue, 13 Dec 2022 06:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hl-0004En-2p
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53Hg-0002M4-My
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso6149552wmp.3
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 03:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPcaRWNFIdHgL4Agw3bLPMXjpJEvtjfKceSBqOCWiZ8=;
 b=ZyCgUPJrz5Iip+F7AKUpq5gydtWyE+QfBqFERy/2A6+8jzTRMkDJaHwI0loUsYSChq
 uGjUZgv6WWiPf+WBN9g4PQQ9zoBOK4Y/0Veys2HxTm69z/4Rk7bgNBTp04oLDnkmmxXb
 IFhKI5BRK0Mu1Iypc2StKgkNlFMAO/2jPnEmxj47oWjtv7sCZ1kM79ER/2ZqO7YazsRV
 NSG6BR1QupCpgL5oNRj4E3b6OHHYKUeJBcUKe7wXmb8MEUQUtHiRYTvzT9gGYO31SUNT
 l1QTkUdpUaGlYN56qf5AJvx5YMbtTzSU0CosDF0ipw3pc6dSbE2jfGlHnuV2dDmVXPoq
 zeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPcaRWNFIdHgL4Agw3bLPMXjpJEvtjfKceSBqOCWiZ8=;
 b=WdCwza8LTykDR4MnwVg5we17UQ86s8bQ0aW5X/IWD9JzoS1MjXhOdlJVT8qcifo6na
 a+DItM61HwSkR9xR9wXBY3TzuSkivdX8XAsoA6NymKMYGVZOoj0punPlIfzd2WKBb433
 1CLvww5vCi1g6ANQBDVgTpI+TxV5/eKoViKQjVFOvPsF+7HaJG6ninGCa2hOKb+NbsVl
 NaaTJhfyhPFWLfoGAxk12iW1eawO7tDgwm4zyrO6HH01pnNGIxqxO085+S8Yl61dLOcN
 ZU7aIrLzoNZqkOOdGIAaxpTWRMP7yb9aBnNpUoav0cFyYUq8Y1UugPd+VZyN1M0mMpdn
 kq8w==
X-Gm-Message-State: ANoB5pkR0OcyohGMgBLHGfwS3q+xoiUqG+MEv4Sj500HZtzSp5a3ydVi
 xSiVgd8ez1FvwRPSwlp55Z99B2yIMofFBYOP60U=
X-Google-Smtp-Source: AA0mqf6zwB01exsjDXTADwtMWSg6xDRYsC2V9LTdW6Vqo/xydS1+briyRNiaqNtgqJBX/ApAWiAafg==
X-Received: by 2002:a05:600c:35c6:b0:3c6:e61e:ae8b with SMTP id
 r6-20020a05600c35c600b003c6e61eae8bmr18909659wmq.27.1670930235022; 
 Tue, 13 Dec 2022 03:17:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c444a00b003cff309807esm13523209wmn.23.2022.12.13.03.17.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 03:17:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Jonah Palmer <jonah.palmer@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 1/6] hw/virtio: Add missing "hw/core/cpu.h" include
Date: Tue, 13 Dec 2022 12:17:02 +0100
Message-Id: <20221213111707.34921-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213111707.34921-1-philmd@linaro.org>
References: <20221213111707.34921-1-philmd@linaro.org>
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

virtio.c uses target_words_bigendian() which is declared in
"hw/core/cpu.h". Add the missing header to avoid when refactoring:

  hw/virtio/virtio.c:2451:9: error: implicit declaration of function 'target_words_bigendian' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    if (target_words_bigendian()) {
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..5817f4cbc9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -25,6 +25,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qom/object_interfaces.h"
+#include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
-- 
2.38.1


