Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81E39A818
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:17:01 +0200 (CEST)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqxo-0000jW-Kc
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu3-0002FT-82
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu1-0005Rt-8l
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id c5so6583616wrq.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HH81j5I+nn0sGSIPvlymA5OV7omrfdBZUURJAJAqCcY=;
 b=oW8xtR9VBrPztk/cTN4LLXbGDhSGom+DFMne+lBwg8QM2t2FcjXYYd6VL4VDMUV4Mu
 MFuRHBirPPf0FvRCUzxtJQOUeNs3NK5imQxEhXap5oO/iUrNZM2bqcvxSDzIIFdi1FDp
 5WSCB+zd+AJgKcNBFfrjErlmxkYpjU/iU93uN5dGB5UFdPFGN0198yabRA6dKjJ7wwn8
 Zno0cyTVj6+U65yBefbZPfAzj3sAWgK8grT6XBeMkk6eKRnWL3mhZnjX7OQ6rhXi/Yuq
 BxhPoOzq9mmfQ+ojK8vt+OVPaFoZzgmrOjkSzegZvBKYaNAafTzQVk9XY3M31NWwciUl
 krBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HH81j5I+nn0sGSIPvlymA5OV7omrfdBZUURJAJAqCcY=;
 b=JPMbxvV8yhJZUiibhfRj3HHdBThNnNd8xjJ74hNcdrTiaogtgWWjsJEoaEcdGH9nSw
 NsEEmtReAYGI64pSeDt3nHy1h0YaBvFjGuL/w7WmTfJGONpcwZn9wxoVr0cERoCTO0xb
 qX8zV3TbSsajPfBA7RzHWJXTAqxY+KMUKB7cFFRVyMc3irGy+7Q8Q0C1ir4P9A7kjtSu
 DJExsg73Tq1FhLLu7i3urXa1wQb1FV28L1G8DW5Yy/S+mm4J/T9JVCL4WVELFvg4Ek2N
 LTzt8d9LqDDyMipHh6oiC/K68wEkd9EqfnhX2Oh6Bpz7lqs8J/acyRBlmM+mxeE+oTL5
 jGwQ==
X-Gm-Message-State: AOAM531GbyK/Q/Q4IlGqjDehXUUG2zIo6hgbGYHsqr3lJNBQ0BPiqxYn
 YuyY4SGIBeT4OJPeAcxJKXU5fg==
X-Google-Smtp-Source: ABdhPJxWbFuvb4Kh+lqfoDKTWo9zfD3cjep+B0m9KfNmD276cuTtlLerEppQCfyXF/zjxpbLi4/yhg==
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr13659wrc.273.1622740383960;
 Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Use acpi_ghes_present() to see if we report
 ACPI memory errors
Date: Thu,  3 Jun 2021 18:12:59 +0100
Message-Id: <20210603171259.27962-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
References: <20210603171259.27962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virt_is_acpi_enabled() function is specific to the virt board, as
is the check for its 'ras' property.  Use the new acpi_ghes_present()
function to check whether we should report memory errors via
acpi_ghes_record_errors().

This avoids a link error if QEMU was built without support for the
virt board, and provides a mechanism that can be used by any future
board models that want to add ACPI memory error reporting support
(they only need to call acpi_ghes_add_fw_cfg()).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 37ceadd9a9d..59982d470d3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1410,14 +1410,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     ram_addr_t ram_addr;
     hwaddr paddr;
-    Object *obj = qdev_get_machine();
-    VirtMachineState *vms = VIRT_MACHINE(obj);
-    bool acpi_enabled = virt_is_acpi_enabled(vms);
 
     assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
 
-    if (acpi_enabled && addr &&
-            object_property_get_bool(obj, "ras", NULL)) {
+    if (acpi_ghes_present() && addr) {
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
-- 
2.20.1


