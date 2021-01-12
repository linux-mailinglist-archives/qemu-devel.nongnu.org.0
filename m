Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A72F376C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:44:38 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNif-0003ub-U4
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG2-0003Zo-B3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:03 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG0-0004s1-5g
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:01 -0500
Received: by mail-ed1-x52c.google.com with SMTP id h16so3155633edt.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ai6Dke2w38UTjcYZCpwJxxn4izLkmiEXd15tKX5teqg=;
 b=ifbxgapAI6iOvxaoeOmO6PWum2uVHr3cpL7XrijStMqJLOUrcbAXSgXX4sEhAmI6jl
 h0aFk2rrnuT+xEy7U975CJ4v+0LATBnO+d3gfRHWl+vq2BB/toXFNV6ZRBC6tJplsy18
 dV4H1D5psVyp1QPOdN+3JK1VbaDKF9AUtwjQTXsbZSrVNOW7oja3+hFgbgJelSgVnN7D
 OiMfO4KoFOKe/Q/ffB+oLAqukWPhIDlwTyZfGop4cs8IvDz3sucM/+jLetRetXSUfAvl
 8N/Nm1YFTWOqznAtrMPUjfCE3eb1D9MvfaHZzpuNJa11KAfYxjyqgjMqjqTvTf+yU9AK
 FxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ai6Dke2w38UTjcYZCpwJxxn4izLkmiEXd15tKX5teqg=;
 b=lt9KMZ1DxaX6CATUZpU5wPpT3EVZwbVGZ9b6GURM9ndPOjYcMqr3lJ8gS6MAGSk3yW
 +W2pItD921/D9PXt5h8/LZV5vV3nXQLhB9KHqLEHCjzch1we7FuvqLIOjgnXVZVocrsV
 9B1sWSKVAWKyyxamYs2Bvo1AuOS+YHVq9A95M3mKTSbp5wOVkJWpVGXPc6aENgxG/Lv6
 IVY0CE+RAD/unJkX8TLinggy0qikxht6k8NDu6xL8PgcudDNyP0Pv8GUu2XO/LleK7jt
 s2w0s6gKUipreEL8HLSZgeAhmEDS5Fr4Mp5j8dvv+C90eZWOTDgjBCBW8E2abD/gfCKE
 rTVw==
X-Gm-Message-State: AOAM530UbApJ1RZ3Q/VkTDitUTocQbeDWZUFd/ekkXJ5NB4R3c70/ZcA
 3k/8pbf709RuR5/GtPXO8ZON+b2uGc5gow==
X-Google-Smtp-Source: ABdhPJxex0S6ehLHG55IM9eg3JQxLt9UQd7Wn2Gsw12qO0gfvEKrQ8hNdwoxg90uil7EnvyMIAqIFg==
X-Received: by 2002:a50:c209:: with SMTP id n9mr117406edf.123.1610471698511;
 Tue, 12 Jan 2021 09:14:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] whpx: move whpx_lapic_state from header to c file
Date: Tue, 12 Jan 2021 18:14:37 +0100
Message-Id: <20210112171450.791427-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

This struct only used in whpx-apic.c, there is no need
expose it in whpx.h.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20210107101919.80-6-luoyonggang@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/whpx/whpx-apic.c     | 7 +++++++
 target/i386/whpx/whpx-internal.h | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
index 1d330bf749..bba36f3ec9 100644
--- a/target/i386/whpx/whpx-apic.c
+++ b/target/i386/whpx/whpx-apic.c
@@ -20,6 +20,13 @@
 #include "sysemu/whpx.h"
 #include "whpx-internal.h"
 
+struct whpx_lapic_state {
+    struct {
+        uint32_t data;
+        uint32_t padding[3];
+    } fields[256];
+};
+
 static void whpx_put_apic_state(APICCommonState *s,
                                 struct whpx_lapic_state *kapic)
 {
diff --git a/target/i386/whpx/whpx-internal.h b/target/i386/whpx/whpx-internal.h
index 8cfaaef141..908ababf6d 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -13,13 +13,6 @@ struct whpx_state {
     bool apic_in_platform;
 };
 
-struct whpx_lapic_state {
-    struct {
-        uint32_t data;
-        uint32_t padding[3];
-    } fields[256];
-};
-
 extern struct whpx_state whpx_global;
 void whpx_apic_get(DeviceState *s);
 
-- 
2.29.2



