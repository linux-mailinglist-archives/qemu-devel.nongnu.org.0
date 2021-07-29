Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431EA3DA35A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:49:28 +0200 (CEST)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95Tb-0006Pk-8Y
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Rb-0003ac-C8
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:23 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RZ-0007Yc-Tf
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:23 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gn26so10528664ejc.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0gR4If4geV9J8dvQ27wXatAz2EbMix2f+K8mxX0nUg=;
 b=rIfm+F19ZosTrXNQwW0nF4n2+fV56ShNim36QsqNzOOHvUvvz47DsA3+IbROSzajkc
 uvJtVU0GfYzg3QyiU0UdUd+ENNB7euFYldCzqQohZxUjm0TVxlbCNM4kw0dlakkoYjBh
 hDVSOkRIJQRUKY9q3c/78rzEVaYOSyZD/kklvBWTtc4Xg4i5g3WBkzGSK4Alc68uQgLa
 8DpNRatFcGJzMaDgdEpEaCNaCyULNGx4IBCabrSXpkZVV0tfq61IOPRmuKkOQpPbcrM4
 P7nmbv3IfUSxUC2h7EMKnUFN51EU7kBQWDO6x1oXG3E/GcCvuwXCV/DtgBVWHZPwVJ8g
 H4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h0gR4If4geV9J8dvQ27wXatAz2EbMix2f+K8mxX0nUg=;
 b=mCKyOWBiZsneYHlFofIgWJTFpmCg1ZGUmuAtVKY7plpABDy9n/1GMcumi2tUIK4Rrl
 6GV+aCMZOguyIyrK/HVx2C5IhGMb11bilQQYIf5R39C2n/fo+qaQAXGeLXFl8EiuhapN
 KOZEV8E2Bw0lKXV239tmn9Z24JODs5IKLX8YM2PsRsDcYrpE6dwwlyPCe2DIHCbrNIqh
 eKmjXfSZTGG3gJ+EtYt1OYqV0Ptk2h5lg1gvSMtRMevUdnokFgzL6IkVlkMINmbU6fWK
 jiOxXAxeNBqMuwQb0YIR+GR1qnw7DkZcXoxsTyr8NALYUGq/pbzgoSIzOKDs/mL/h44h
 rMug==
X-Gm-Message-State: AOAM530x4lIa84EXlnJg30fYJouAwXrj7mQjybnRQd7T8qGkftpxTD3N
 f1pnzx8Tx7419GcHki3+hNP4m4QHZKKixQ==
X-Google-Smtp-Source: ABdhPJyV2iVbYqccTFnx03KiwCK+JDBuP9/fAZdM9qQdpUJnw6cv1zihygzxbeScRGGauof+cJ/cPw==
X-Received: by 2002:a17:906:af02:: with SMTP id
 lx2mr4290699ejb.133.1627562840656; 
 Thu, 29 Jul 2021 05:47:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] target/i386: Added consistency checks for event injection
Date: Thu, 29 Jul 2021 14:47:10 +0200
Message-Id: <20210729124713.208422-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

VMRUN exits with SVM_EXIT_ERR if either:
 * The event injected has a reserved type.
 * When the event injected is of type 3 (exception), and the vector that
 has been specified does not correspond to an exception.

This does not fix the entire exc_inj test in kvm-unit-tests.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210725090855.19713-1-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 145511d635..90a9de30f8 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -383,6 +383,9 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
             cpu_loop_exit(cs);
             break;
         case SVM_EVTINJ_TYPE_EXEPT:
+            if (vector == EXCP02_NMI || vector >= 31)  {
+                cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+            }
             cs->exception_index = vector;
             env->error_code = event_inj_err;
             env->exception_is_int = 0;
@@ -398,6 +401,9 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
             qemu_log_mask(CPU_LOG_TB_IN_ASM, "SOFT");
             cpu_loop_exit(cs);
             break;
+        default:
+            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+            break;
         }
         qemu_log_mask(CPU_LOG_TB_IN_ASM, " %#x %#x\n", cs->exception_index,
                       env->error_code);
-- 
2.31.1



