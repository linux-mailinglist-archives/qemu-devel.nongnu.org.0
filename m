Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA9652347
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e3C-000720-SN; Tue, 20 Dec 2022 09:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e3B-0006yw-4q
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:57:01 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e39-0004kv-Lh
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:57:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 131-20020a1c0289000000b003d35acb0f9fso1244593wmc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3O/TmPP9Jg8STxRQ7xCVDl3tcpFcYurVNtfZxqpXk4=;
 b=KVZ7UZklCQdPZdBie5057P3rlP+0MEXxziNTCa4FkiV0BWFDd3cN322tzrR4+m3Rmu
 sTEPQvWml9zQqNfa6cJoo8HQmtse3s0Q0DbbWTvuAfJISwwoXRh/aNSb8TPNumtpthDp
 YRM2rKhjOlOqJbdUirS6sTEeMAJP+t1VP3F+xRStNcyWOHqjEjIShJcqc353kTVHN/VX
 OUK0sI6RyW2I34DcgbcoTvaRxpkbWlRTxmnirBN/tITaDi9B4NG9c33mvEMm2GAw0UiQ
 2yUK8URIhPLUEkWimITTEejH0kHoLCWF/KlxwGiwRqXVZH/DGr2zaR7Q+E9TGAfygJAK
 YZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3O/TmPP9Jg8STxRQ7xCVDl3tcpFcYurVNtfZxqpXk4=;
 b=v8mDoh2iEoKAcAHPsMVQtOgfVcbY2ONsS2V5p2JOHFX6ht0sBmV7D4ZcVLjcZhHPRn
 H0er/teNxwdytwFbYSw1B03YRiHZpo09xcewOGa2+QtwTSukXvJOHqP/BIE8TZ2AZnPu
 yIp+9Ws4u+6Os0hpsJBMkcAbo08UAuZqkpUoFKML6L/INTY7mdnTS8fHGrE5ajXmLUTy
 uyi3mNx0DqR0bL3ulf6p1uY+dGeHtrYJsuXhrxyHC/1DQdiA8fBGxN7v40sv8AkIKndb
 AVwHqODx8WbMpsrP/zfasxAZ50CGgc9SVAXfy0jnOEzuto3RwASqjTo0wagA0m2k/djY
 OX+w==
X-Gm-Message-State: AFqh2kpm6NAfAQJAKMZS0SrnlCuEnWBzSvI4izyw/LRhr2hU7Y77MUoP
 Ceol+8+mv7MQezvCOEyPuMMjgdQ9ntaaf6uGDbE=
X-Google-Smtp-Source: AMrXdXsi1nMSWpxVfHZjzugp25C4+HT/5hS8EvcGgrWnk+D2kVCmJt7vDvJ6a7S6NfEs0xAJ14+oWg==
X-Received: by 2002:a05:600c:1e84:b0:3d3:5cd6:760 with SMTP id
 be4-20020a05600c1e8400b003d35cd60760mr4702308wmb.20.1671548217991; 
 Tue, 20 Dec 2022 06:56:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm30842762wmq.27.2022.12.20.06.56.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:56:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] hw/core: Only build CPU reset handlers with system
 emulation
Date: Tue, 20 Dec 2022 15:56:25 +0100
Message-Id: <20221220145625.26392-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220145625.26392-1-philmd@linaro.org>
References: <20221220145625.26392-1-philmd@linaro.org>
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

In user emulation, threads -- implemented as CPU -- are
created/destroyed, but never reset. There is no point in
providing the sysemu/reset handlers there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 7a4d02b6c0..ce6fdb0064 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -3,7 +3,6 @@ hwcore_ss.add(files(
   'bus.c',
   'qdev-properties.c',
   'qdev.c',
-  'reset.c',
   'resettable.c',
   'vmstate-if.c',
   # irq.c needed for qdev GPIO handling:
@@ -15,6 +14,7 @@ if have_system
   hwcore_ss.add(files(
     'hotplug.c',
     'qdev-hotplug.c',
+    'reset.c',
   ))
 else
   hwcore_ss.add(files(
-- 
2.38.1


