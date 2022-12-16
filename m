Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A4064F42F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:33:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Imt-0005zh-7t; Fri, 16 Dec 2022 17:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Imp-0005yt-HN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:35 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Imn-0004ZL-Qb
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:35 -0500
Received: by mail-ej1-x634.google.com with SMTP id n20so9383086ejh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onv9U82TXSCn9/lZOsBgvSuM1dZGKCW/DDceT29frZo=;
 b=Ky4iUHJlIfCfLsoL60cSkI2b4RH5kaJWH7u1YjPsKd5vB2IsV955ZBjKeQbx4fqYeI
 4605/+ORXY6xUdzg/B2mu+kCIF4Hj28cGGXKzaQRry59U+ULfbYzi/6t3aAVQvnxCqEt
 y9ajqv645neBKAF6cyCnmUdpSu8LWPjieD3AnDoHqJFk1xHBPQHMk0rsS+kW3/BKeFBp
 E9GuxclM8wAnhWKl3nDJ5ELc9KZaxca7YCz6qtkKjAnaXsl/htrumlQvneazzbpQQTaK
 GWzP9zn8ghTz4kztjl5KF9WK3Ri4yLnySCBAvPqwFm13OQkkU+pUWHfhuduumIRsIDzL
 ZcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onv9U82TXSCn9/lZOsBgvSuM1dZGKCW/DDceT29frZo=;
 b=USDMe6v6ahccv25uL5G/UCx5NwGqPhKE6wJ86TWf15znliN4nTm9b+kPj/2D5fUUCi
 CrkyDmOpwrJ+qupTyxTEkeQXlRtJt2vm/77XaNTEepMgqrJXKWRo3Tb/A0Xx2Lakx2aJ
 V52EgGwmXzvYGHEdFjmoi3R5wnekOc115qpFrALbfS0FlrfyilglH8RnYtPRxZr/nLCF
 uhMNOr2p+cjkbiPd6/Zidtu/DqesQhBLDzFJ+gXfMokEEKSVaplLAWqwn7NnkcfQF1eU
 plqkpfhBKGH1vK4KghIWcyyFYiGLKxQhsJyfXMbWiVy4MW3IoV0FdzK/+EwtHlKU2xzE
 AT3A==
X-Gm-Message-State: AFqh2kpC/rvRrZ37j6x21h0LVL55dIuGK3gujA9OG4b3JEXnPC77oehW
 lEltabWmNRy6/gBC84m9jrEDb8ksi0B81o9DNAM=
X-Google-Smtp-Source: AMrXdXvVJ7MFT/wlpKssdiyDsQ2ooocTbBsdco7g2Val/Wjrgmy7bj9LvomubxJXiygqYSjklTykgg==
X-Received: by 2002:a17:907:1b28:b0:7f7:a985:1838 with SMTP id
 mp40-20020a1709071b2800b007f7a9851838mr1014329ejc.44.1671228152085; 
 Fri, 16 Dec 2022 14:02:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170906670e00b007c0f45ad6bcsm1279023ejp.109.2022.12.16.14.02.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:02:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 5/5] hw/i386/x86: Reduce init_topo_info() scope
Date: Fri, 16 Dec 2022 23:01:58 +0100
Message-Id: <20221216220158.6317-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220158.6317-1-philmd@linaro.org>
References: <20221216220158.6317-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
---
 hw/i386/x86.c         | 2 +-
 include/hw/i386/x86.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..b6ba0b2d00 100644
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


