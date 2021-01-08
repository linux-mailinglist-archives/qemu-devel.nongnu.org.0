Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B92EF51A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:48:55 +0100 (CET)
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu0U-0000um-Ao
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtom-000505-TE
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoj-0002wt-HP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d13so9367207wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YNbbCXLYwFs5e3ZlATxT/qWoHe4YgqAQ3sZTdG+49vY=;
 b=lslQ/oaA6zoMf5f2m0k/kyIMQTwVgDrwqSBCamqqTGeMF9hu5hTu35fdV5t/rxGya+
 HiqbLm8+RN2qcBJUD0PiVlZH0ScxO+YMNQTz/g/FjsSZXz3aIz4uufYRlMBQgNPyZeip
 w0VL9ySUwg//Bgo9LIkJol8HSA17A2+vz+g6muVUurBokd41X/DszRbp6fiwUY7UJH6t
 xmGD+FF6By62r7FmxCuHlOkk+ZQa06e2yryOvjsvpL0aYz3yKi3KlsmquE6U+SBzuG6Q
 Y6GtjObbdbCzmTZBSEBPDILevhu3MTOOjdfJC2rvBE1ri+ahItqtNfK70tevKAZZzhwY
 KAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNbbCXLYwFs5e3ZlATxT/qWoHe4YgqAQ3sZTdG+49vY=;
 b=pje9tfWvl6SGqOZ7tGYq+8fLyXTG5Xk5ozCv0ANLv5WXZHJSX9Fp1IedYex73nQaRO
 Ak6feVyFg9Fw3akHcU0NvfN5QFNlpN6NMS36xi5OEvbKlWxZJfJLPpwv18pLdE7fVr10
 8Ov1NSWlJgXH8TITOFlkh59psITbkQYSdpTtVFsfGqUlU4c61orX0GLGA895/BGCy2Gd
 wUbNuMu51rOkMl8JKEiaMjKPgsGE8ojpvuR+3r3jD/NWm1O1I3fzu7JuiQRu1dSgEKGu
 prn56GR6vc6vmT/3UaIEeYP0bUUzReKnmk/q/AdbHyiYtUg0Ke6gUdXc5YhSG6Vm17on
 QFDA==
X-Gm-Message-State: AOAM531SDUFn/aaFGMNu6mz1DXsb+NH0kLTNakxxL2TV0P6k5bUiEIHV
 M8OILbf/loAHI3031sF1jsvIxkF0R+7/AQ==
X-Google-Smtp-Source: ABdhPJxOKlklF6yBOYpvzXxPG/rbtVlPSD0wSlSB8hbYGJucpxL/fX4z+q62pH7zScZfvbAlqamauA==
X-Received: by 2002:adf:e452:: with SMTP id t18mr4047725wrm.177.1610120202880; 
 Fri, 08 Jan 2021 07:36:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] allwinner-a10-pit: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri,  8 Jan 2021 15:36:12 +0000
Message-Id: <20210108153621.3868-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

When running device-introspect-test, a memory leak occurred in the a10_pit_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 288 byte(s) in 6 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
    #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
    #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
    #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
    #6 0xaaabf57415e8 in a10_pit_init /qemu/hw/timer/allwinner-a10-pit.c:278
    #7 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #8 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
    #9 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
    #10 0xaaabf5b94680 in aw_a10_init /qemu/hw/arm/allwinner-a10.c:49
    #11 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #12 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/allwinner-a10-pit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index f84fc0ea25a..c3fc2a4daaf 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -279,6 +279,16 @@ static void a10_pit_init(Object *obj)
     }
 }
 
+static void a10_pit_finalize(Object *obj)
+{
+    AwA10PITState *s = AW_A10_PIT(obj);
+    int i;
+
+    for (i = 0; i < AW_A10_PIT_TIMER_NR; i++) {
+        ptimer_free(s->timer[i]);
+    }
+}
+
 static void a10_pit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -294,6 +304,7 @@ static const TypeInfo a10_pit_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(AwA10PITState),
     .instance_init = a10_pit_init,
+    .instance_finalize = a10_pit_finalize,
     .class_init = a10_pit_class_init,
 };
 
-- 
2.20.1


