Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078E2EF527
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:52:18 +0100 (CET)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu3l-00049v-91
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtol-0004yX-O0
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:47 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoh-0002wo-8W
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:47 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q18so9457593wrn.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=M1QetWJUJoDE77s/fKEVmCNBI+2lQSp4v7iXPPK7Vd0=;
 b=bCktKPQyMO24w7TiMjvjG01rvArqeE2dMHhNRZvkK34+iDrLfaXYc/kqjzdGk/X77/
 qRMlfJeezV7Wm5DkdG2eA15kqI63XE6ECPobv4eVkBlVHIFHrVUNsfWE6mHNb9vPV0uv
 jgUt49uDm+4pgp/FBCnMopCKAlt6OpRzlQKFJKGHPb97I5FxkVdQnxr7ASgT8GAIFOg9
 AOqo23R5P+pPfCtaQgU+NrhYWrZgGsmDL/AaQZ4l17CToVtMtkIozszC79azga3RmNII
 n3mhTzvrLhahvhNJmoDMIl4VkwB7f6pXzswfUKp9M/aZUbxn+M1oMfti0ml3DKp7dXfj
 jB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M1QetWJUJoDE77s/fKEVmCNBI+2lQSp4v7iXPPK7Vd0=;
 b=HkLOd86Zoa8xbgB+izrlUNIhZSPQFjYGZ3pIA/Cm4XrQVCo4AuRPOFaeNBjwtdWsBX
 R5ZWiYLPaXxowrfqeL9Dr5mflV3WBMWfY/7eYCq3K/31WufD8IWqV9scUnf4fzk+kC13
 G5oKiCdkqHTsXSRGhtzZJr0V91RV0Rorm8gETjOnSsgz4RmKjfJi989ekl5v9j1G14JS
 eNRv6xDc4wqt5+pSt+cIuClvPhU3yitBFdj1LXPeJate3o5N/q4hEzzfV2t5xU5k7ejT
 cnUtp/eWtlDu+cZhUgELkfui7e2BQY6ZQjAzBXbw/E4JF00ZinHTPT7yY10H+KQiEc+A
 3uIg==
X-Gm-Message-State: AOAM530aTDEeQ641AIWHHdV2/48lTi5+NRTwijqoebopetGNvlqZHALj
 3ywPGUks4xGxQvJjNYCHc/lxnSkJmQ7vuA==
X-Google-Smtp-Source: ABdhPJxXi988NmY5XT9D4NMaaMxkCfG28kqybbA6H3wd+Lq3/SL+qSwtaIsWVFnF1NoNpFFaiMg47g==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr4389944wra.68.1610120201773;
 Fri, 08 Jan 2021 07:36:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] digic-timer: Use ptimer_free() in the finalize function
 to avoid memleaks
Date: Fri,  8 Jan 2021 15:36:11 +0000
Message-Id: <20210108153621.3868-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
digic_timer_init function, so use ptimer_free() in the finalize function to
avoid it.

ASAN shows memory leak stack:

Indirect leak of 288 byte(s) in 3 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf5b04084 in digic_timer_init /qemu/hw/timer/digic-timer.c:142
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
    #6 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
    #7 0xaaabf5b40e84 in digic_init /qemu/hw/arm/digic.c:46
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
 hw/timer/digic-timer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index 32612228daf..e3aae4a45a4 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -154,6 +154,13 @@ static void digic_timer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
 }
 
+static void digic_timer_finalize(Object *obj)
+{
+    DigicTimerState *s = DIGIC_TIMER(obj);
+
+    ptimer_free(s->ptimer);
+}
+
 static void digic_timer_class_init(ObjectClass *klass, void *class_data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -167,6 +174,7 @@ static const TypeInfo digic_timer_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(DigicTimerState),
     .instance_init = digic_timer_init,
+    .instance_finalize = digic_timer_finalize,
     .class_init = digic_timer_class_init,
 };
 
-- 
2.20.1


