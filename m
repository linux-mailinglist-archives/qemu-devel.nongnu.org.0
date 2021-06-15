Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC83A85BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:57:18 +0200 (CEST)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBRF-0004PK-Cd
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFB-0006Dx-7C
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEi-0000yI-6w
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id d184so14438759wmd.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ye94kK+c9X5Qdb3oLfHimMsgJSBTnBwqNDEcye+BmeI=;
 b=zUDKzUg96lKBS+ea+oADsB4zFQev42TOYH+3dADxqndLJ7Rf4CdvGIxA8Is4/GftuI
 xFVRGHNXs+m3M3D/2bUtx+c1112aBeQMdO0DYmfUaOvhkE+qO8k/695TTFAebTSLQUSi
 IM6GX+bEu5kt6UTJVo+b1n4mBsKU/S4uDDmUn56XFUSGmra0CyTrNBDrQ+zLN9XpAPhq
 /Y5ePIwzzzi6hSYxom/fbkjzfGoEq7QREzFoRuuJlTWqDtZtn16DGXkCFyqGOeIdbMJN
 Gw+SIWfdU+R5MDWxggBz8DfnEcTdCaJvRd5v6JpfEkDUxYFztJF5ADkyuKs+4zlhZXLx
 2tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ye94kK+c9X5Qdb3oLfHimMsgJSBTnBwqNDEcye+BmeI=;
 b=h2luqmh84McoYyt5h3yTuTPNtmav4wJGV7FR6Q97tLs7a6c2L6zA2V/CJc0ZkiBUw5
 sxncJaDXaW/hWCpaZ7r9qmH1qw15waKPrY0ASfVTKtLVXMypnxSXMiPUmAVgHqO0fFcB
 W/M4nO0onY5TS5DmX4tr6icbzTzPwjcFCCEOEjpEQE8PR8jdf/WGr8wPE2x0C1Ff6aVO
 Sp5/tRJu7PjUFjqnNvwCQUL/il4wQeJ2QpeBeYMP7oETxlgwV8rN0ZpB4psTDSCJHNp+
 22lKdb/AokP4Wogy9uPglbf9k/9XKQY5YlDJjCRaUXcS80mCQsydf45FJSPqikDUoz2Y
 m9rA==
X-Gm-Message-State: AOAM532jgytpf0h0uH9OEbOygDvg1iazmgSlmhC0C/X5OHVSuJHyJ2nB
 R3ppXVfYo4OV0WHb2wPjB0mfMXoaqMSHHw==
X-Google-Smtp-Source: ABdhPJws+trw+0vA78ec/xTdEX7WApxcph8AUN3eizGIguDtypMceNG4ns9YUSAbiUaj5Rrez/TUVg==
X-Received: by 2002:a7b:cde1:: with SMTP id p1mr5846719wmj.13.1623771856066;
 Tue, 15 Jun 2021 08:44:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/28] target/arm: Use acpi_ghes_present() to see if we report
 ACPI memory errors
Date: Tue, 15 Jun 2021 16:43:48 +0100
Message-Id: <20210615154405.21399-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

The virt_is_acpi_enabled() function is specific to the virt board, as
is the check for its 'ras' property.  Use the new acpi_ghes_present()
function to check whether we should report memory errors via
acpi_ghes_record_errors().

This avoids a link error if QEMU was built without support for the
virt board, and provides a mechanism that can be used by any future
board models that want to add ACPI memory error reporting support
(they only need to call acpi_ghes_add_fw_cfg()).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Message-id: 20210603171259.27962-4-peter.maydell@linaro.org
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


