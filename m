Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E054CEBA8
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:14:55 +0100 (CET)
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqis-00049s-9N
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:14:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqV9-0000VB-8K
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:46 -0500
Received: from [2a00:1450:4864:20::430] (port=37760
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqV7-0003u5-LE
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id q14so3769794wrc.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GhOTPfCTqWwVhcXiSSkVNRYU+GoIaUdVhUiaU54bjp0=;
 b=dUHJ7z9FvB4uWZEyIxtiAhYpUABBsCV2JXE1FalAL7dTxXGAREn5+TK40tdqG02SF9
 UP7ut1sg+eE/z6t4FRImMXl/cYivFtcFlGsFtLJIl1Ive13NQEIPaRPghJ8t5UwBjh4t
 kKEZ3KDnk3siHqCzEvRnYsq0+hyX+aYUkw9/Lb4ZIfN943ifvjuqioN8alJ4ItwnduE+
 azlhZSwdZFnvftO9EVh6sSbKaaAHzdZWThoA3slBEoZTf7Z+3Rviz55kYyy9gJbAqSmj
 GRo7w8LC0Q+CrEtliM2y1Em76wVzW7NfWo8brzEORVcBd2spy8bBrI6qwc1xAfHjy5u2
 JIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GhOTPfCTqWwVhcXiSSkVNRYU+GoIaUdVhUiaU54bjp0=;
 b=csVcwqQml1cT9aPHpOxvm4nC+Boo90N1oB8dvVTLJwkZ95zKJ2UEmhd9zQY4h3QRpm
 mxvYpuaaGmRkwqKmdY6cO48yT2VPTvunM/ku0PReS+AaH3RunCWYqhzcHgfMiFRiijDc
 7XmbRd9zT/h/2cgn6uuKEej4cYySRJ7OQMeztZBvJekyN03um0KV0Lt56T64vuCoC1S7
 aug09bojDRmipsPwWqGh1YKw1s/MaACRBk04fW3e+ZUigpDMQl+Ha5y9MoaUB2GmwgQV
 LvKSTzuqw9/HHQHdv+fy62r2gSf4D68oLLKuIuaxSHycxkf2U2m+GTYgr4i29dQRxbP7
 gUiA==
X-Gm-Message-State: AOAM532R3f7JkaaJ86yRDZ92nHm3ZRZ89Q00Gfs34fKq6uX94Esday/y
 gLfJ6/P32ehQIpq9OBLJzRPf8XWlWpU=
X-Google-Smtp-Source: ABdhPJzVDVZ3W0arBKDNgCqqFidYKWWiavfAaM16ncY7bwlnCXKmdy/YfrXeBJzAsfnwjJ+FK/nnzw==
X-Received: by 2002:adf:fe8e:0:b0:1f1:e530:11f with SMTP id
 l14-20020adffe8e000000b001f1e530011fmr3891633wrr.674.1646571640128; 
 Sun, 06 Mar 2022 05:00:40 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003899d50f01csm2722395wms.6.2022.03.06.05.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/33] accel/kvm: Simplify user-mode #ifdef'ry
Date: Sun,  6 Mar 2022 13:59:34 +0100
Message-Id: <20220306130000.8104-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Now than we only build this stub with system emulation,
remove the user-mode #ifdef'ry.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-8-f4bug@amsat.org>
---
 accel/stubs/kvm-stub.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5319573e003..7e0fb884b93 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -12,10 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/kvm.h"
-
-#ifndef CONFIG_USER_ONLY
 #include "hw/pci/msi.h"
-#endif
 
 KVMState *kvm_state;
 bool kvm_kernel_irqchip;
@@ -80,7 +77,6 @@ int kvm_on_sigbus(int code, void *addr)
     return 1;
 }
 
-#ifndef CONFIG_USER_ONLY
 int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 {
     return -ENOSYS;
@@ -152,4 +148,3 @@ bool kvm_dirty_ring_enabled(void)
 {
     return false;
 }
-#endif
-- 
2.35.1


