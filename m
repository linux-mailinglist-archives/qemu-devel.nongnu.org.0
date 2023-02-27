Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DFB6A41F7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:46:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcnh-0003XV-OM; Mon, 27 Feb 2023 07:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcn8-0003GS-0Z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:43 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcn5-0001GA-L4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:41 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so6523812wms.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iz98TPI8pAawLZtmAnBjh4eyfxt6fssvCcKRTUKmqs8=;
 b=tJTT79UN+NMChJDxXh9QdGDQd7s5bmoqfu9WDJG0MBgmgOnAKeyZRoUAg1gX78OOoQ
 3mi9b7MyGBVGEHSSSm3t1Ja+SKKm4ECHboqaduQWVK7in7EG+kQT82QERSU1zY8HCUfB
 Ha7LR9pRa6phYbGzuP97rNq+EnoTVA/CZHmf6LsqBb8FogF0QNO/TQgCY/skb4TTLVJK
 UfbrIagrqseusfDzCbxR9uLJFTaPbBjWMn15YIDj+jf2B+UYdwHFlGsmw9q7D2hHAVMX
 JMZ7qg5QHifIIBMo+xyAe1Ot4KxV4yc2I0+zSq4MpGj4wcNPfOBo16wO5nLFcSG//Ww0
 838w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iz98TPI8pAawLZtmAnBjh4eyfxt6fssvCcKRTUKmqs8=;
 b=JVjh8WxOlsA8dwogp2WRTQ6IuEiKzZwyaKsaRnxz5lMSquzkrdHuIZatKRfTbvI1kQ
 JpQK7GfgHwoWbJdA+EzwvK72HcsJ823Ccp2OmE6HlGJTTnsyXtXX2eCYI7XeW+5hXFrl
 OhAAyA0JQP0mR3lADRERjN8lS7+6W6XbzIebX/xrqN7LCUlrNJKLTYRRyF3V7Ed3pUjA
 Ep8l0k0tWL6i/UcU5nogjcJ8Awzg3/0l7Oi2KDPZ179Ievil6827zjI5Py/ktp6Is6V8
 7XfIjW9GHx6UWQVWsd3k0ToPHht5b9UGRsLzEwtk57xpn/BWuqIIE1Nftjbw4z/xJkFf
 R4bA==
X-Gm-Message-State: AO0yUKVe71H4KlWH23E9AXjYo5vQPW/MdaAM3LyyLrwnvrkl8KQ/qXf/
 XTARkmbGXNckZX84UnK1DyyU4WzBQnqBxWjH
X-Google-Smtp-Source: AK7set+0Jt5iWcp4duE0udx0ntubXUEEqEowmb4cMTWo65SNkCsAEm9E2OBgJIUkwVx2+UBYKiLmWw==
X-Received: by 2002:a05:600c:3b9e:b0:3ea:f6c4:5f26 with SMTP id
 n30-20020a05600c3b9e00b003eaf6c45f26mr9473682wms.17.1677501578116; 
 Mon, 27 Feb 2023 04:39:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003eb2e33f327sm10797003wmg.2.2023.02.27.04.39.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PULL 007/123] target/i386: Remove NEED_CPU_H guard from
 target-specific headers
Date: Mon, 27 Feb 2023 13:36:51 +0100
Message-Id: <20230227123847.27110-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

NEED_CPU_H is always defined for these target-specific headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221216220158.6317-2-philmd@linaro.org>
---
 target/i386/hax/hax-i386.h | 2 --
 target/i386/hvf/hvf-i386.h | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
index efbb346238..409ebdb4af 100644
--- a/target/i386/hax/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -49,7 +49,6 @@ struct hax_vm {
     struct hax_vcpu_state **vcpus;
 };
 
-#ifdef NEED_CPU_H
 /* Functions exported to host specific mode */
 hax_fd hax_vcpu_get_fd(CPUArchState *env);
 int valid_hax_tunnel_size(uint16_t size);
@@ -66,7 +65,6 @@ int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state,
                         int set);
 int hax_sync_msr(CPUArchState *env, struct hax_msr_data *msrs, int set);
 int hax_sync_fpu(CPUArchState *env, struct fx_layout *fl, int set);
-#endif
 
 int hax_vm_destroy(struct hax_vm *vm);
 int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap);
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 76e9235524..95b47c1c2e 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -24,11 +24,7 @@
 
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
 
-#ifdef NEED_CPU_H
-/* Functions exported to host specific mode */
-
 /* Host specific functions */
 int hvf_inject_interrupt(CPUArchState *env, int vector);
-#endif
 
 #endif
-- 
2.38.1


