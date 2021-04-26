Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A4236AAF1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:05:04 +0200 (CEST)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larYV-0003Hc-7Q
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNp-00088R-PX
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:01 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNe-0007bg-24
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:01 -0400
Received: by mail-pg1-x532.google.com with SMTP id f29so2009304pgm.8
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZmiRdz/LH5blkmk2QVMNymQXBH8BUvzoJtxxTW+SeuI=;
 b=PcTx7gnCCykwN7VrFqLd1ZAFjNiePw9pypmIRFQ+JBVn8Cll3A3ZQwxn0dQf62MLmZ
 Ml8xyEfs0sJeZbJdqNUz/CF4RqJCrsU2OTv1zIBamZPafsUru2LuLqa54XiTeSQqDX2c
 f5aGR3sP+ab9bQZVWOF8nTe3PqKg2oGOfXgYFU60G5IvJup3swIWd+OQ/MbZpWlmOr4h
 tmvJCtZm6wgDqNYreA9H0KxpD+LCjwBPWSrewb1ORBNstvu/DnJlb/8KRrn8hBRny7Ra
 FjAljzhHNBO5r4sm8WkTLDj95QvIgh4VGZXdTJ6Ssza/D+MQPLfuAn696xAcLXlk5pAN
 vHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZmiRdz/LH5blkmk2QVMNymQXBH8BUvzoJtxxTW+SeuI=;
 b=Yhcww5YkTTTQDzgQP909QaM+yCTxvA0JTk+utW0ThfCPpKqu7OWc1ObvGRSNylHFLE
 Gh6+rHYOhxKMJmXm3pO+cOQhhFqiarB4pwuQoZXmSI9jQTSDLl8VqobNPOheG0bAQrX2
 f40llwKjz+mdPROuhN1FlGws/50/USLNGe5p5gfezivbLDx3wp7Xufd9AKV/DsKsZUNI
 TsaT0JQ8D85tJL0LubRDwhEPlRUDmztv92lseq0iQ6T3ZpSl2vyVuV1UUXBodSgonRWd
 3fqRXywHhoo2JWXoV1vNw9CqdGx6L7EXNepQhysj8Y3qLUt7nA9jvjExnXXKY+oatOT/
 kwOw==
X-Gm-Message-State: AOAM530feZNAnGGcCp/cTCxAWoGOW1gokYmA/2MIbANExs7JDrX2C3y1
 9I+Sc3DyMr2IpkHeLm/hQzinnstZ9jJ4kg==
X-Google-Smtp-Source: ABdhPJxRNj1Uz9CcG3sXwN6q+ir9IlGMNcGcTfT2PJQVBANEApZc+CvXHJ1Ot8OismExuvPibOvMvg==
X-Received: by 2002:aa7:908d:0:b029:250:81a5:2a3c with SMTP id
 i13-20020aa7908d0000b029025081a52a3cmr15013356pfa.33.1619405628600; 
 Sun, 25 Apr 2021 19:53:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/25] linux-user/sparc: Add rwin_save to signal frame
Date: Sun, 25 Apr 2021 19:53:28 -0700
Message-Id: <20210426025334.1168495-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Stub it out to zero, but at least include it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 59bb449512..4a0578ebf3 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -62,6 +62,7 @@ struct target_signal_frame {
     uint32_t insns[2] QEMU_ALIGNED(8);
     abi_ulong extramask[TARGET_NSIG_WORDS - 1];
     abi_ulong extra_size; /* Should be 0 */
+    abi_ulong rwin_save;
 };
 
 static abi_ulong get_sigframe(struct target_sigaction *sa,
@@ -208,6 +209,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
     __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
 
+    __put_user(0, &sf->rwin_save);  /* TODO: save_rwin_state */
+
     __put_user(set->sig[0], &sf->si_mask);
     for (i = 0; i < TARGET_NSIG_WORDS - 1; i++) {
         __put_user(set->sig[i + 1], &sf->extramask[i]);
@@ -303,6 +306,11 @@ long do_sigreturn(CPUSPARCState *env)
         unlock_user_struct(fpu, ptr, 0);
     }
 
+    __get_user(ptr, &sf->rwin_save);
+    if (ptr) {
+        goto segv_and_exit;  /* TODO: restore_rwin */
+    }
+
     __get_user(set.sig[0], &sf->si_mask);
     for (i = 1; i < TARGET_NSIG_WORDS; i++) {
         __get_user(set.sig[i], &sf->extramask[i - 1]);
-- 
2.25.1


