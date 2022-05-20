Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5C52F1E2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 19:49:54 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6l7-0004uk-Nz
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 13:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6hT-0002bd-R3; Fri, 20 May 2022 13:46:07 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6hR-0002DP-Pn; Fri, 20 May 2022 13:46:07 -0400
Received: by mail-ej1-x632.google.com with SMTP id wh22so16784164ejb.7;
 Fri, 20 May 2022 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+6xNQGU+o4w9wXJ3n1vviWp3ar1enMx7bE5W8kNOiU=;
 b=Hg85X0TvMlgOv2QHtTUTyYb9mDMOB4MIN78P9RbLWmQAoDko6E7UnB0AS3RE7jA7xE
 btCJMHQXo4Hdv3Y4EnOoJP7HHIlD+M6o6UYWzEwKrbWV3E2w/cIei8bt7Idx2oHX/6m1
 xzEmEQgm5hqNetPWqxwNUX80xnuMDXKRzZtp+vzlfwqBine5uFoZs7NFIwMPedQZHyVR
 tDttDdt9GlZ1A4gyhAT1KUXPBX1eGdsexi/eYtHrPV/6/ULxj0/U1pn5TiIr2bVPNgGj
 B5p6RRMJ7BW2YtJlTPatg3eG/8RVQ3YDFMZk7+af8ryeHnZozp1eB2Do5n2LTfuu9/Pb
 WbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+6xNQGU+o4w9wXJ3n1vviWp3ar1enMx7bE5W8kNOiU=;
 b=AEDO1yjPffqZijEqUBOvTDkIKP6kA+ZDg53GQyenOzX6YYEDw+r1fkRc85+iYcKdxs
 N3J9C5UfEGGdTutbqooLv9X8hfsiXZ0yTGwaJiFsc3NdhOQLeMI+fzRvH3I+9eghXcFg
 CGDdo0HSzU5VGzTPiayH5RQVsJ0H1nv6d6pTjHHr9wv3uARSNtdoio+ZW5ZkPE4LdZDR
 1EU807SVaXljJdEcuAjfOSk4GLLeuI4isBtuU1Kpppjp2+Rk0rtWqfSAs6nY0re72KKk
 CD2vv8hsjkjPRvpZZMpgVuxjs4YRWjGOAXwPDWNT/2x8Rwa40Z41ok5kYfqMncshO+9c
 Q7fg==
X-Gm-Message-State: AOAM5313qUXFQoLg5yyuacfM38EdYK5bJSt85jkpbbP+j9pJAS7zUmdH
 WI/5khQfTqrT64qfKLBrHvKtx04zMiY=
X-Google-Smtp-Source: ABdhPJxJPmh4+WpTlt7EuC5YncIAgVAIn0pHvH1jQdvfoGuMtWcAh6yzwG0kLbnqQNwI7EbF7UGocQ==
X-Received: by 2002:a17:906:685:b0:6fa:8e17:e9b5 with SMTP id
 u5-20020a170906068500b006fa8e17e9b5mr10194510ejb.522.1653068763820; 
 Fri, 20 May 2022 10:46:03 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 h22-20020aa7cdd6000000b0042abb914d6asm4410209edw.69.2022.05.20.10.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 10:46:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/2] hw/i386/microvm-dt: Determine mc146818rtc's IRQ number
 from QOM property
Date: Fri, 20 May 2022 19:45:36 +0200
Message-Id: <20220520174537.5827-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520174537.5827-1-shentey@gmail.com>
References: <20220520174537.5827-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 3b004a16540aa41f2aa6a1ceb0bf306716766914 'hw/rtc/
mc146818rtc: QOM'ify IRQ number' mc146818rtc's IRQ number is
configurable. Fix microvm-dt to respect its value.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/microvm-dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 9c3c4995b4..a5db9e4e5a 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -208,7 +208,7 @@ static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
 static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "motorola,mc146818";
-    uint32_t irq = RTC_ISA_IRQ;
+    uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", NULL);
     hwaddr base = RTC_ISA_BASE;
     hwaddr size = 8;
     char *nodename;
-- 
2.36.1


