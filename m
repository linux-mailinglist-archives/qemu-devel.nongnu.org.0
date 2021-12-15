Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE8476378
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:39:22 +0100 (CET)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxb3Z-0006XO-9e
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:39:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq6-0003tl-DO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:26 -0500
Received: from [2a00:1450:4864:20::32b] (port=56042
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq4-0004FG-3Z
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p18so17466460wmq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hUNrN9uHkfzYtcU/lmbYwUY1su+Sn0pIebovtCYOG/c=;
 b=Wc4Kj7R3P3uHh7IHShljD7Yqsmi2sXxHz2zxsbTkCgsyVyzSFxaZmpK1nBGfJSrklt
 wY+DYDu7IWq/+D9L7F2tlyOAXFJASQ8K+ivOzI6aCaY75kh0YYhRDZwUZNjqtXI1U/Io
 mT3Pvz/OtVnpJRkBWILwISyZ0HZ9ipMehyNJffMvrXv3PF3c/AUKI5GrM+x7pY5Ne88V
 GNhV8L3Id2l3sP8I3NUMcODMMx9jSSPPrsu3DKLdGMSgFVDPaSZTJ/y9okO1gnbws+L9
 MT9k7d1D4ERUWjFje4dmWgykPo6X16Mhl3mUkPj8zkQSumTmYufvfWztPRn4ynzIcrrU
 PV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hUNrN9uHkfzYtcU/lmbYwUY1su+Sn0pIebovtCYOG/c=;
 b=ErsPXHq5jOzMnmu1vUN1d0MLfDi2zoMUuWpK152V5BAiHmPjWkc4MmAyCkOQh/qI13
 21HVStDCnmTlEHr0xAcP4hU9aeQD37UCeUplxkQyQ1QU4aCF8Ku818+zH3+W25kSUjFO
 evl0ywSTfOwKVC/oS77hJxsi+VQrMiGW08LkOIS6xHGbbK0EZAWC+8CQW2GKu7O+aE/v
 5q4bdEXfSFjlitrh/pNi0ykcGRqhTsz0HtFQXqoSTVzyY24rnQymgfZrazwrFyrgnDtf
 ZTP62Rj/QMQ0ZxaHPEZ18b+KLvSU+ecZ+0/YV/rVtm+Je54qe5XoIOtdEQj1ao3+mxbs
 Trtw==
X-Gm-Message-State: AOAM533unskQw9HtJdfWABH/6GgJVdqlWk0IvrJuzVdYSGBadEZyolEg
 h1j1byjKejPeZ7AGaudx0dwPLa859ZI=
X-Google-Smtp-Source: ABdhPJyc0THrKX4/q7X5M3KYDRGXK31yQpSmXVXGZWTmS9+zQOsdnM39cZopqe+Yz4uQciIg4bkv9Q==
X-Received: by 2002:a1c:287:: with SMTP id 129mr1814559wmc.49.1639599922899;
 Wed, 15 Dec 2021 12:25:22 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] kvm: add support for KVM_GUESTDBG_BLOCKIRQ
Date: Wed, 15 Dec 2021 21:25:11 +0100
Message-Id: <20211215202515.91586-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Use the KVM_GUESTDBG_BLOCKIRQ debug flag if supported.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[Extracted from Maxim's patch into a separate commit. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211111110604.207376-6-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 2f5597572a..0e66ebb497 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -61,6 +61,10 @@
 #endif
 #define PAGE_SIZE qemu_real_host_page_size
 
+#ifndef KVM_GUESTDBG_BLOCKIRQ
+#define KVM_GUESTDBG_BLOCKIRQ 0
+#endif
+
 //#define DEBUG_KVM
 
 #ifdef DEBUG_KVM
@@ -2574,6 +2578,15 @@ static int kvm_init(MachineState *ms)
     kvm_sstep_flags = 0;
     if (kvm_has_guest_debug) {
         kvm_sstep_flags = SSTEP_ENABLE;
+
+#if defined KVM_CAP_SET_GUEST_DEBUG2
+        int guest_debug_flags =
+            kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG2);
+
+        if (guest_debug_flags & KVM_GUESTDBG_BLOCKIRQ) {
+            kvm_sstep_flags |= SSTEP_NOIRQ;
+        }
+#endif
     }
 
     kvm_state = s;
@@ -3205,6 +3218,10 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
 
     if (cpu->singlestep_enabled) {
         data.dbg.control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP;
+
+        if (cpu->singlestep_enabled & SSTEP_NOIRQ) {
+            data.dbg.control |= KVM_GUESTDBG_BLOCKIRQ;
+        }
     }
     kvm_arch_update_guest_debug(cpu, &data.dbg);
 
-- 
2.33.1



