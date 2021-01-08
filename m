Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88812EF500
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:41:33 +0100 (CET)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxttN-0001Ou-08
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxton-00050t-J4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:49 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtol-0002xB-6P
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:49 -0500
Received: by mail-wm1-x329.google.com with SMTP id 190so8163463wmz.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HmFO2WrrsiJDYKi0WtVF2XWZwmueRlAIM1cBOWRgQrQ=;
 b=nXqMUgrCk6eCrtfsPVS0jHCJDZ5lJHxUh6XY42fCiapuRUOFw2UVv4aTdhcZb//oyn
 yMGnXjgL/YPICsYI3WkbGexk99LEegt4kRpCIHoxfCReY1vVsfWb53uW2CRLvcnqNs54
 8q3SaHO9UqMXNtWpY7D9rR++BZcyWJ+fJ8IbxYkUuVggdlImDEETb03/QHyynbIAiVpK
 OEm9NLkaw+hn6mp4EXrtkiG41OFcQpixXoeWRI1aEyCBGWdgIimrihit0DmELJFxLD3u
 1jbRrDubLVlyDAO/7oVFUvnb9zq3ITdrIGRiml1HOl3QN7wS+wZQn1J96gXgiWQUQN4j
 Pa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmFO2WrrsiJDYKi0WtVF2XWZwmueRlAIM1cBOWRgQrQ=;
 b=qLDNh8LHqs/NfGaWQ+Dp6RRNK521dHzqFF0bgGlluK1sjUQgigGBHyhLllfLLNY/ql
 zIlW1CuYYZKmG5ZJMGZXYhpp6XPp73KFbZBa8hCZB45N5z9VbyFKLawzpfXpnMcuAyjP
 8C5c5+BrmpFRZlhenheL4E1brY1GWbq83T86cNxOspo9UDfN5omga449+h5CO/BGEiYF
 qiE2TEoNv3KYUZHn+ZRNNbGv/00/XgXnIU6S33wiZ+E+wK9to4t2a6YA+ZxXYXZiB5H7
 6TdKQG2cl24O5WEXulVP0B8a00b6yg4IUbyuZCAgUcaZvIhLKZllg0LYDUDQLNBuhs4L
 mMBw==
X-Gm-Message-State: AOAM533C5agvvnEPofWfhTWit2HKxMpK0x1YlQwEHllkQutZMv5mrsUw
 S9dkaZetOWXvWIWKb/1JOep9H/fnBcQ2Ww==
X-Google-Smtp-Source: ABdhPJzZRyQ9Uit4S1fJOtTFUeM9o0BgUDqmunUBJy5HFAM+szb+JIENcw0QpbzkZtIEAgnJcvLiIQ==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr3413609wmc.167.1610120205002; 
 Fri, 08 Jan 2021 07:36:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] exynos4210_pwm: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri,  8 Jan 2021 15:36:14 +0000
Message-Id: <20210108153621.3868-17-peter.maydell@linaro.org>
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
exynos4210_pwm_init function, so use ptimer_free() in the finalize function to
avoid it.

ASAN shows memory leak stack:

Indirect leak of 240 byte(s) in 5 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
    #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
    #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
    #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
    #6 0xaaabf56a36cc in exynos4210_pwm_init /qemu/hw/timer/exynos4210_pwm.c:401
    #7 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #8 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #9 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #10 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #11 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110
    #12 0xaaabf6552708 in aio_bh_call /qemu/util/async.c:136

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_pwm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index de181428b47..220088120ee 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -410,6 +410,16 @@ static void exynos4210_pwm_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void exynos4210_pwm_finalize(Object *obj)
+{
+    Exynos4210PWMState *s = EXYNOS4210_PWM(obj);
+    int i;
+
+    for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
+        ptimer_free(s->timer[i].ptimer);
+    }
+}
+
 static void exynos4210_pwm_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -423,6 +433,7 @@ static const TypeInfo exynos4210_pwm_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210PWMState),
     .instance_init = exynos4210_pwm_init,
+    .instance_finalize = exynos4210_pwm_finalize,
     .class_init    = exynos4210_pwm_class_init,
 };
 
-- 
2.20.1


