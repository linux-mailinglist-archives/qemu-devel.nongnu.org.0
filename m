Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BCC484463
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:15:44 +0100 (CET)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lXK-0005sz-Su
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:15:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGh-0007RL-Gv
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:31 -0500
Received: from [2a00:1450:4864:20::530] (port=42965
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGf-0004UZ-Kg
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:31 -0500
Received: by mail-ed1-x530.google.com with SMTP id j21so149431580edt.9
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raXOgou5jVKECUtcQISBg+Quw7i8HlpQqMT1vsPNKj0=;
 b=qrbnDYJDb5mTz89tYnzMC8mjYhowqHXEGUKExV4KntxcqxWCi86RGia241rjXcxcSF
 PMSeQm79XkzBaqhH+lGUk4ilsjNkvwLilFP0ArM1rEoAmOtGn8JQh8UplhU0xm4udeDt
 8pe3mlzEWS1tNzJ8MFU3bHtS1z6lC1Cpwi1sCBLtipHDwWek6RFO+WD3fdtKhIpImpGs
 jOXIQI6SYK7X9IA1QEdoyYkgSOy+9tc5NFmhLCiVQXuIcM5JHlh4FvZdwCYeT+AOuSsu
 7wEiND5IxpDvCbVGSCFVBOdFGkXY7yRdkTQcG1zfh8HUTDmD8S0W7uxZMEiPrcdiPqkD
 gi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=raXOgou5jVKECUtcQISBg+Quw7i8HlpQqMT1vsPNKj0=;
 b=vSba6YANoFVHf/2VJRkGuFXh1wAOho6pL4BjfxhVdnhsWlUZiER03nVKJjmizVOjMI
 7Ax1s6ag7Ab7wf+lrEz7WxJGfKfsrD3jHt5SiDiE8thaSZ2SkTcI+nqQ23p7ooWmIMfL
 usOy732Dp1pN/qQns1xJMUQ0bt+Yb0DHef9VQpoHeSi7qtP4U5/NWz0iSAqROhTtCWoc
 dSx/AZ/JOCbESDhbtDdco1v6kAYmC/7loM0/DHWXsQMY1jp1LRXLm0CEOLqr4U3aFDpW
 HLb2UjusxKFpG1djstrcSfIhXti0f3D/qNxZPqsTKrdQD/Dep2GM9JBesjdL0ia9lig2
 b4VQ==
X-Gm-Message-State: AOAM5317sPKClFyt9FeULCGiV/gZifnfz8SBzMviei6Wf80QgSoDrQq0
 WWRM7SLdKGbR/2Fv+M7vkxRj9p6kWJg=
X-Google-Smtp-Source: ABdhPJxY67lWuj1xSEH3VAGocuM3G5vIcNdpCJA2hVQ40++6Y0Qnb7y2BfhffdHMRT/mKsdkhYlXUA==
X-Received: by 2002:aa7:c641:: with SMTP id z1mr49308282edr.84.1641308308143; 
 Tue, 04 Jan 2022 06:58:28 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] tests/tcg: Fix target-specific Makefile variables path
 for user-mode
Date: Tue,  4 Jan 2022 15:57:49 +0100
Message-Id: <20220104145749.417387-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 812b31d3f91 refactor missed to update this path.

Fixes: 812b31d3f91 ("configs: rename default-configs to configs and reorganise")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211226001541.3807919-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 0f8645f782..ae8004c76e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -33,7 +33,7 @@ all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
 ifeq ($(CONFIG_USER_ONLY),y)
--include $(SRC_PATH)/default-configs/targets/$(TARGET).mak
+-include $(SRC_PATH)/configs/targets/$(TARGET)/default.mak
 endif
 
 # for including , in command strings
-- 
2.33.1


