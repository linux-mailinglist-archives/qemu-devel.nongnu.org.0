Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1856A439E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5S-0004c2-1i; Mon, 27 Feb 2023 09:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5M-0004KL-LS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:36 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5K-0007kC-OP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7219829wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9GFKdcMFj1FbbqNf8MLldWaJ19+a9ZLIPHXMk3Oc+v8=;
 b=Pn29liBznCh3bqVJxqECr5BumQu8BUlkpI3mE9+x0hpk6dzhZDMjSwt3AneR1e7lEL
 kom7tO9oF13fUsuiLTaVRsHxXQg+d0vvlu7ow5P/GvWx3t+rpJGtOyPkDdRK/xJ4zsas
 FhJRQfuBzuyS30HDSW4LXA07e0m+LwGMlG+8WRHg6qC8Sazi/rZd/GuTqtimyL0i4Kiy
 oodetQj6TMvojP0aFZFt88n/ProeK1+bV6AYqR0wnvx6FUd2RRPUC8agzMZ0ufWjaHiC
 I7/5aJfstMD73riOMpmr0zOEF/qV/buxyfxIijrXKq7H6jEFg14AnYkIGUcEH+7ClBmO
 SOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GFKdcMFj1FbbqNf8MLldWaJ19+a9ZLIPHXMk3Oc+v8=;
 b=xomgrT7u/5SJ4z6cf2nHWkIGTAnm+tBN+In40787f0fafPjyQF2bzOQUIf0u6uVno4
 SAmbJp6eaqK7Ksr4EkjtPGs38yCDxMxsvYFUgEtcWu3dxAMgyNcVZfUxqDJWb3OD3QV9
 J9N6vdkF5BMWCybEpFCjVIigU4e9WtCtLbRPfttYJPhVBUoXUPFiACqDH32l5lpR309K
 7cm/uK+LRdiw0kYasPK/gm1v42Io3GF5ofX3+owH8P6dgK8IpPis34rcljKXCBzDF8I7
 5tBY+7CC2Y2kYdUDksTo+SDZU4fKOoHnIc048aIrwK53cphI/05AqOEj7bS36Hwj1gFz
 RDwg==
X-Gm-Message-State: AO0yUKWQFutRGEgGkVeL6aPyuGt/iGF4jz9c+Rm5s2F4gxc+QLhyUO3G
 yOjr9YK7DpAcWnhKXwBSADrjdPr/lzl50XrQ
X-Google-Smtp-Source: AK7set+jhhKuXuvdEi24Wx/WgP6OBP9xr9/lzF05VMaBwOxYkJy6ElV+hVeCjpI67si/ydqHtbcXMg==
X-Received: by 2002:a05:600c:1c93:b0:3ea:e4f8:be09 with SMTP id
 k19-20020a05600c1c9300b003eae4f8be09mr9823781wms.30.1677506553076; 
 Mon, 27 Feb 2023 06:02:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d6690000000b002c559626a50sm7047023wru.13.2023.02.27.06.02.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:02:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 013/126] target/loongarch/cpu: Remove unused "sysbus.h" header
Date: Mon, 27 Feb 2023 15:00:20 +0100
Message-Id: <20230227140213.35084-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
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

From: Bernhard Beschow <shentey@gmail.com>

The cpu is used in both user and system emulation context while
sysbus.h is system-only. Remove it since it's not needed anyway.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221217172907.8364-3-philmd@linaro.org>
---
 target/loongarch/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e35cf65597..3882e970b4 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -13,7 +13,6 @@
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
-#include "hw/sysbus.h"
 #include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
-- 
2.38.1


