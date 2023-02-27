Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533706A43EC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe7q-0003wx-Mc; Mon, 27 Feb 2023 09:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7e-0003p6-OS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7c-00082r-5d
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7226912wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mJyzaNmEWDD6f28J9cynPLyHkGzHEVC06BDnzv7dYkk=;
 b=WjFxKdjrjG++Bd4xLVGTUS/wop6IXH8EpHE/+cSKZG4py+vTfRUPNkvH6UavriKWJJ
 xhOoZiQqjmeU3Q9v2MIx7gdB9tHgoqFDqtWdEKLOLumjAWN/doYyPjBm7h/4wzDIw1/a
 DKacyAaYxmo8qYkWJ68sa43UU+gEtDS73cCBe6q/3JGoAgoEepCHfCK6MFKJowNQ7/1x
 aYiR7ro7TouxA0MFWrFCNwCPQrXoaRqkp608Kqlj/+ownQV9Qmb2iPSzwiJ7W0b7753I
 7lwN6AEZrN57S+iUiYMo4Aq/K+OzvIcrg2Syd+8yzu9OC8qU0/wrG5kpWcVrRl27VyPH
 pC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJyzaNmEWDD6f28J9cynPLyHkGzHEVC06BDnzv7dYkk=;
 b=z92nAH6vvhx5/fx2MT6B0K3S8PhY9fa05e7B6QohtTW7hvo/FzDSOblIbA7KXq6yb2
 zeXJnhhY0/0yxMOmb4eIlWUrDMvg9wIj1s7gV+al7u4Ld9OdCdwmi9NoD41xBZVDJuQo
 RKUqQKHu6hIVPrDgG2AfFx1zS9ik7nI1LP+MCoSBWjXWMWiR0NmXdtSmyuY+b1d9TMGW
 8QoUXxZttAEJK7EQtZqjLuFy44a0KV4RuU5QLWH+JTfapqrMFXWG8oyrqKl4f0INhTVQ
 R5DUL73WAAtu6SAxLCfUPOm9uLN6zJNdAArgdRtbvXgmZfA3efj6eaJOpM1vO2DjnmNl
 +sKg==
X-Gm-Message-State: AO0yUKUEZRk+1UBjLl9LZhjJTOpa0J5mZMyU+/IvbIZM24GhLkFbxT0S
 OQB6V21YG4D5w70OIbr7/NGe85EoegJ1W6/+
X-Google-Smtp-Source: AK7set9egFGq3ngOYOr+CTL5GCW5IHixpsMQi6VsdOIGYI6w/2wLTtNo9oE/qmWuqOdbhXMgCyh1lQ==
X-Received: by 2002:a05:600c:998:b0:3dc:5b88:e6dd with SMTP id
 w24-20020a05600c099800b003dc5b88e6ddmr19939204wmp.10.1677506693573; 
 Mon, 27 Feb 2023 06:04:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a1c7315000000b003b47b80cec3sm12847780wmb.42.2023.02.27.06.04.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 039/126] hw/i386/x86: Reduce init_topo_info() scope
Date: Mon, 27 Feb 2023 15:00:46 +0100
Message-Id: <20230227140213.35084-30-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This function is not used anywhere outside this file, so
we can delete the prototype from include/hw/i386/x86.h and
make the function "static void".

This fixes when building with -Wall and using Clang
("Apple clang version 14.0.0 (clang-1400.0.29.202)"):

  ../hw/i386/x86.c:70:24: error: static function 'MACHINE' is used in an inline function with external linkage [-Werror,-Wstatic-in-inline]
      MachineState *ms = MACHINE(x86ms);
                         ^
  include/hw/i386/x86.h:101:1: note: use 'static' to give inline function 'init_topo_info' internal linkage
  void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
  ^
  static
  include/hw/boards.h:24:49: note: 'MACHINE' declared here
  OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
                                                  ^

Reported-by: Stefan Weil <sw@weilnetz.de>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221216220158.6317-6-philmd@linaro.org>
---
 hw/i386/x86.c         | 2 +-
 include/hw/i386/x86.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 48be7a1c23..5f28dc8390 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -64,7 +64,7 @@
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
-inline void init_topo_info(X86CPUTopoInfo *topo_info,
+static void init_topo_info(X86CPUTopoInfo *topo_info,
                            const X86MachineState *x86ms)
 {
     MachineState *ms = MACHINE(x86ms);
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 62fa5774f8..5d3047a1d1 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -20,7 +20,6 @@
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
 
-#include "hw/i386/topology.h"
 #include "hw/boards.h"
 #include "hw/nmi.h"
 #include "hw/isa/isa.h"
@@ -98,8 +97,6 @@ struct X86MachineState {
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
 
-void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
-
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
                                     unsigned int cpu_index);
 
-- 
2.38.1


