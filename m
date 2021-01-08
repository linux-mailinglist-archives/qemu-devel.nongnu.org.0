Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECF2EF522
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:51:47 +0100 (CET)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu3E-0003Vp-Ed
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoo-000521-9E
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:51 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtol-0002xL-JF
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:49 -0500
Received: by mail-wm1-x329.google.com with SMTP id q75so8786673wme.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zAAuZ1tCL604rEihyQT4jKiq0+zkWMxy7qtoZl3QY24=;
 b=W+PddmnBmKGtUChnoxr5PbLa3eLiMEpmG2YtvwniNrabzcuPi3qhK8h0NDuxBA3RgM
 ALpfmLQLefVzvCOn0JH1VSTodUAfxkGqpPNjfQELS3hFvbw5PzEECMYm9CJ7IjG6pRwO
 g6wjI6PdNaWV8jvE2HaRYXmiql0Ei3RnPxTBPCd8X1LPrsuKjrVQ+Jx8TMXSBUQLw3+v
 vpNEvVafg4qeVob5DG15X2O1BM2WrRqUHNYbrf5bPSQMGPM1YSgjwE+vThmIhhrUhD9W
 cyaGVJK5q/cOQH/LIs2vxt9Bj5rF3e+/4YQckd4Gt/srfn+Axu9+Tu/f+b/HTApcce/5
 sC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAAuZ1tCL604rEihyQT4jKiq0+zkWMxy7qtoZl3QY24=;
 b=mMkuiMv/W2ii0lV5biUQmgDqwNyd3Y15c3ZRnyKRWKopqzeQgoLta64iqnnLqqdvBD
 VKWnZZqCooDJIiT9CBt8VQk1QGgJOkZ2gCdaYr0jxUSPWW3098JZBywWwEu83hvbICfO
 gM/+0vocP1w4c00h2US2cL1c7K0EuwEYnmD9CYtyt7SfKeS0dSyE+qj7LwmC03sMtnkV
 B7NBjZ84ZFxL3m/SHY+hHafHXNOpm44eiaipxNI49r/VlTSWh/TdaPuCkfT9DaYwDEmn
 rEiBepzJPXj4nVXJEN7YLzGKMU21sdGnubehJAd8gGBUWABgqXo9PlsHIF4BxlCEMfe7
 gNkw==
X-Gm-Message-State: AOAM5321mtau3eAn7YXlTK6s6/JGps88dWrGkO81wlSsr0RqN9xGSUZM
 PPRPb4B0I0EEgpfk9tkKprQp7LEsp5ALXg==
X-Google-Smtp-Source: ABdhPJwkBPxx5xqdv5I5QdRQvkHPaQN8tsxcIQ1QAuIjDajUTHCc3KYtXfx9wpB6hca5QFPWs46oSQ==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr3626917wmb.98.1610120206132;
 Fri, 08 Jan 2021 07:36:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] mss-timer: Use ptimer_free() in the finalize function to
 avoid memleaks
Date: Fri,  8 Jan 2021 15:36:15 +0000
Message-Id: <20210108153621.3868-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

When running device-introspect-test, a memory leak occurred in the
mss_timer_init function, so use ptimer_free() in the finalize function to avoid
it.

ASAN shows memory leak stack:

Indirect leak of 192 byte(s) in 2 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf58a0010 in mss_timer_init /qemu/hw/timer/mss-timer.c:235
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
    #6 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
    #7 0xaaabf5b8316c in m2sxxx_soc_initfn /qemu/hw/arm/msf2-soc.c:70
    #8 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #9 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #10 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #11 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #12 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/mss-timer.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index 29943fd7446..fe0ca905f3c 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -244,6 +244,18 @@ static void mss_timer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
 }
 
+static void mss_timer_finalize(Object *obj)
+{
+    MSSTimerState *t = MSS_TIMER(obj);
+    int i;
+
+    for (i = 0; i < NUM_TIMERS; i++) {
+        struct Msf2Timer *st = &t->timers[i];
+
+        ptimer_free(st->ptimer);
+    }
+}
+
 static const VMStateDescription vmstate_timers = {
     .name = "mss-timer-block",
     .version_id = 1,
@@ -287,6 +299,7 @@ static const TypeInfo mss_timer_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MSSTimerState),
     .instance_init = mss_timer_init,
+    .instance_finalize = mss_timer_finalize,
     .class_init    = mss_timer_class_init,
 };
 
-- 
2.20.1


