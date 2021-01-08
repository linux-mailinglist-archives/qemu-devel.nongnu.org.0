Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02642EF530
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:54:21 +0100 (CET)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu5k-0006Qo-V4
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtop-00052B-Fv
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:52 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtol-0002x5-53
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id q75so8786560wme.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7IobhQX/+A6TtX0qjdoX990irSdLhMNlwbzyQmtsQK4=;
 b=nV1Qjr7ZEWE/8+auGX64xRbYO7GPkSyw3leoi+2nVtd5wSaN6nXUejUai/51PPX0Gq
 aZ7oOyaJY7mLmtW6ZdboHkbAroSMTQgXxc4U8QyV8aoDvVXZb7zja0C4TKFYqaHmS0Yg
 kzVUzQiT3AXUiN6jyV3Fv4OLgjdZymYS/jZjnWLkKlj+7lpx7zFpzvNnG4TuhfyKCvyA
 ka3trWKiqUohDCfQvqr2G8YReiGk8xkZT78K3CfxxpQulWN/iOTt5ZG2TqYY3mB5P92n
 5V4oQiDUPRax3kpd3Zm4DXab7t0jLgLoXORwcQ2NMMR/Wt/rJFq90pjxAf4ZsUe24+Wz
 82fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IobhQX/+A6TtX0qjdoX990irSdLhMNlwbzyQmtsQK4=;
 b=Hneo2+8FGS73alvoJcABXarQFthBn2e1YVoNveA+KukFMB3beOofXnrmFcxL5qCEoA
 DoqbZiW08ebgOhcRxhYhf1hNjJgiZwGo6YFLUlgRusx5nkb/LwXHhGwQwYOvpJKMfbdM
 fZLNI7axTS2VceetFJdxTd45FbO4xQGM6tfbNeddSIOnvi6iwQYVYsCnAE5WLRVX5r8E
 BEUj63xO2y7AG8KkrQu/4iYLJnx1D9NgJEue/goRTEAsarhrSTij7ZJ0DFH/x2BNafWv
 GU83jyGymOTebnt0rpFknuz7nEfUmHjLf4jPAw6p9UqtwlvOfvxlwYzeFKcFAFpJkDm+
 55tw==
X-Gm-Message-State: AOAM532J8iJxyryTSKRG7a8nC9moYnYwVZa6XL/GN2TtXWXLqGbQoyHt
 YxYh9Sn0dLZ3EMnifoq0DXoRWYqRr2XsnA==
X-Google-Smtp-Source: ABdhPJyB4dqb9QE2DhqlVEg+1yo3DlDoptQXf1kFirkFEafLJ1Wm3o+Cm8kJir8tduex9xjI665a+w==
X-Received: by 2002:a1c:b742:: with SMTP id h63mr3517550wmf.122.1610120204044; 
 Fri, 08 Jan 2021 07:36:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] exynos4210_rtc: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri,  8 Jan 2021 15:36:13 +0000
Message-Id: <20210108153621.3868-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
exynos4210_rtc_init function, so use ptimer_free() in the finalize function to
avoid it.

ASAN shows memory leak stack:

Indirect leak of 96 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf57b3934 in exynos4210_rtc_init /qemu/hw/rtc/exynos4210_rtc.c:567
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #6 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #7 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #8 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110
    #9 0xaaabf6552708 in aio_bh_call /qemu/util/async.c:136
    #10 0xaaabf6552708 in aio_bh_poll /qemu/util/async.c:164
    #11 0xaaabf655f19c in aio_dispatch /qemu/util/aio-posix.c:381
    #12 0xaaabf65523f4 in aio_ctx_dispatch /qemu/util/async.c:306

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/rtc/exynos4210_rtc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index 4c976244786..45c0a951c44 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -584,6 +584,14 @@ static void exynos4210_rtc_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void exynos4210_rtc_finalize(Object *obj)
+{
+    Exynos4210RTCState *s = EXYNOS4210_RTC(obj);
+
+    ptimer_free(s->ptimer);
+    ptimer_free(s->ptimer_1Hz);
+}
+
 static void exynos4210_rtc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -597,6 +605,7 @@ static const TypeInfo exynos4210_rtc_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210RTCState),
     .instance_init = exynos4210_rtc_init,
+    .instance_finalize = exynos4210_rtc_finalize,
     .class_init    = exynos4210_rtc_class_init,
 };
 
-- 
2.20.1


