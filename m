Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6D3ED8A4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:04:44 +0200 (CEST)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdEJ-0003PB-9P
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8e-0003Kq-BN
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:52 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8a-00062x-8v
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:52 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j12-20020a05600c1c0c00b002e6d80c902dso34631wms.4
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wn5VOuzTj12riqfVnYaRkG+PQKOXcXHYoP+ynL4fbZk=;
 b=Gs71d1rwk9iC+JBhlKqxMkAM6WDI9Y8Po5vDe6nqE3ebsSO3bgRwKx3jv3erPhhWV4
 Iv+7hd9yvc6L06ofFP4dSl5qVn8Q0FxdKa4bVxvcRmIvsKT77V/VZrjrCHyQTnmcwJpH
 a2D/xcOzjWZhPVJ/hnhoswMU79bDZmiXQMylWLju6LPOapeCPaJdBs9xw8Yq0RSF76+w
 VtbMf2YbmE2KndGKWqBiHiHpzc3ggVGBbj3SA72vzNGTIOf+t3zLmOAASXtlnUj49vm/
 QehmMV/fh65gME07TVwX7eoxmR+P5kQpzh9vJr2eLcdlR5OJfZjWb1IUTMgTjiLMiuIf
 zgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wn5VOuzTj12riqfVnYaRkG+PQKOXcXHYoP+ynL4fbZk=;
 b=sypQ68SlnGbT149lSFRnPmKyrLoQJ6vlEjdk6knU4+DWAAkd1+d/ijKjydOSqwpo33
 cP/cVlF62goQAj4folpkKGMHZTzmbY2Vq3NM/EWmZeK7c5msUJoxi9UuHe0JNt/DjdOt
 qv8uQnX395aq84S299jwcTn5Vg0wnsQiutHRUC9Bgf+NOAIN6AB91J8fECGWQ7dBSby4
 CIUIjiDE6dJuBv14bl+jzTOZA8qmxUSpeBZOPNRJcw+CVOpq8Tj6MV0HaRoQeIpJqtye
 TCpBh9HVfVvQoBgNjjmMoJYWqDWGRt7co8mhcB4ObuQelMmHQ3UWdhiuYeL3y7lQAurM
 ueNg==
X-Gm-Message-State: AOAM532UwrpfNkpMAL7lFL6aAcwvYI442AzbE/j4XTUyjVwd2MiUn1tt
 iM9SnZyQIxYKeQx3qh6pQbHWRgkZppKUZw==
X-Google-Smtp-Source: ABdhPJzUCOsR8aWP2GcfT5JnK5j6RyoQAwhgfn+4dFnYZqMNr3Vl6kEGeIHP6fuKyYRmTXb2TzUQTA==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr15607904wmi.85.1629122326973; 
 Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm11855631wrs.29.2021.08.16.06.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/arm/virt: Delete EL3 error checksnow provided in CPU
 realize
Date: Mon, 16 Aug 2021 14:58:42 +0100
Message-Id: <20210816135842.25302-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
References: <20210816135842.25302-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the CPU realize function will fail cleanly if we ask for EL3
when KVM is enabled, we don't need to check for errors explicitly in
the virt board code. The reported message is slightly different;
it is now:
  qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled
instead of:
  qemu-system-aarch64: mach-virt: KVM does not support Security extensions

We don't delete the MTE check because there the logic is more
complex; deleting the check would work but makes the error message
less helpful, as it would read:
  qemu-system-aarch64: MTE requested, but not supported by the guest CPU
instead of:
  qemu-system-aarch64: mach-virt: KVM does not support providing MTE to the guest CPU

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0bb..86c8a4ca3d7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,11 +1852,6 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->secure) {
-        if (kvm_enabled()) {
-            error_report("mach-virt: KVM does not support Security extensions");
-            exit(1);
-        }
-
         /*
          * The Secure view of the world is the same as the NonSecure,
          * but with a few extra devices. Create it as a container region
-- 
2.20.1


