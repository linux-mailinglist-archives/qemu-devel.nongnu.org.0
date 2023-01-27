Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF7567E942
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQT2-0006ao-Cb; Fri, 27 Jan 2023 10:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSb-0006Qt-Fg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:13 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSX-0007lL-3f
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j36-20020a05600c1c2400b003dc39cb9c33so1342911wms.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUGz5LpQ3EDL/VJ3l1j+YJ+y/POf2GoDlmEHrO+uK2A=;
 b=wXyJZGPRtmBDbVtTRWtQpdOWsoVhXY8Xn/2X3IF+mR+L8+eJcOAYqOy6PKvxnuh9hk
 SxHS1tLb37F0Neh5H+FgpqZ65Yhgxf8rpEwVVY6SrVhyhdBmq8hP1ptHr9+BhGB+Br1J
 /5sitb2htqalTdGWN06JCHHi5gSusbW3f+kMP30VIYea0vk8Nqo/nGBt+LKDW+sEBekB
 VF4Fy6oK1OEbWiW3hz/59KN78yVAVtg45HuttMnOhGVOkwWDfx0v1TBs0W5ULmIjyRhq
 QDJ1J8nEe1bCqoN8pN9uaYbG0pWFOQtuvrneRYL51xiad/t+yNWFxCSycrLCWTXBfF7Z
 QVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUGz5LpQ3EDL/VJ3l1j+YJ+y/POf2GoDlmEHrO+uK2A=;
 b=Umeu4SiLgZrUNj9pJgm0BC3JjdW4o9KyjQxnelmk28vOo8ZQzwDTNihI9bEH8Zjpx0
 NW4JZO7zs11XbufzKaQGGAyJy0f+D4xDVWhvCxXQmvU6WcO47WjUwv+/GbH10mfVcR0l
 Vd7ye9Q9dorrfIiNle+kyDzc8+PLi4k3puJ+lJgX+j1CHX5DZO6ddbla7G5iFAqp8LhB
 ERvrVL1GXiwOMBqMbsnZvWtc8fH67vErNVMKy1crZxKd7JXF2yXxLZHO0S1zzwmamWoe
 qYieYuQsn9SS16keQkEBKzq3ia82E8OtY8T/N/ox04gCfigJ+eNUIGrlu9RucLOE9Hoi
 12hQ==
X-Gm-Message-State: AO0yUKUYloGe+Z48Cnxg01n4rZpDB0LGs0aKJZodskbDXriWpXsOFi9w
 5YUjyknYQMlpnLFTuBqYLToQ5w==
X-Google-Smtp-Source: AK7set8gfQYjQ+GYxO80U7CUehAz2XW16FvZhYy4OJlItng3MUCW4ws9HcFwY3tNs5fcwHLaGW+Ubw==
X-Received: by 2002:a05:600c:198d:b0:3dc:1031:14c4 with SMTP id
 t13-20020a05600c198d00b003dc103114c4mr14786447wmq.14.1674832567445; 
 Fri, 27 Jan 2023 07:16:07 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:06 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 15/16] target/arm/kvm: Disable Realm reboot
Date: Fri, 27 Jan 2023 15:07:28 +0000
Message-Id: <20230127150727.612594-16-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
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

A realm cannot be reset, it must be recreated from scratch. The RMM
specification defines states of a Realm as NEW -> ACTIVE -> SYSTEM_OFF,
after which the Realm can only be destroyed. A PCSI_SYSTEM_RESET call,
which normally reboots the system, puts the Realm in SYSTEM_OFF state.

QEMU does not support recreating a VM. Normally, a reboot request by the
guest causes all devices to reset, which cannot work for a Realm.
Indeed, loading images into Realm memory and changing the PC is only
allowed for a Realm in NEW state. Resetting the images for a Realm in
SYSTEM_OFF state will cause QEMU to crash with a bus error.

Handle reboot requests by the guest more gracefully, by indicating to
runstate.c that the vCPUs of a Realm are not resettable, and that QEMU
should exit.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8655d9041..02b5e8009f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1071,7 +1071,8 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 
 bool kvm_arch_cpu_check_are_resettable(void)
 {
-    return true;
+    /* A Realm cannot be reset */
+    return !kvm_arm_rme_enabled();
 }
 
 void kvm_arch_accel_class_init(ObjectClass *oc)
-- 
2.39.0


