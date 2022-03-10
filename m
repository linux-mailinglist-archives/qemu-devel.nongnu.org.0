Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74214D47CD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:12:52 +0100 (CET)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIb5-000238-RV
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:12:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA7-0007GU-Ap; Thu, 10 Mar 2022 07:45:00 -0500
Received: from [2a00:1450:4864:20::336] (port=41531
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA5-0005Ig-GE; Thu, 10 Mar 2022 07:44:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so3335618wmf.0; 
 Thu, 10 Mar 2022 04:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFGOgVAYDA+OTcd7yIQGvRjXavxhLP1/OZGLRQXwCrY=;
 b=hRYLTyv2P2Wnkn5i2teUGTeALemhG3UoMKIkntyfGN6OreJ/EWQga1T3GV8J57ajDo
 j4uSy77U7/RMIKmiYSvIAldw07GmM8gWMjlzebsKKW8qlUMDuQIBofbOfOpmgM+3RQOm
 TLOmw8a4XEhw60SEqkMMJS3ittRBUH8n0c61NacPUiospUq5pdTjeeeCtyGO89+nWouu
 eSQHBTU5E6YoLpNC5l64+ohdoMOhHh7jDx1pzzDMfxT+vT0TSy6QNbAnayZojUDokep7
 m+/FGRzJ4A+VYBMSiJIbisJRlrp8GKsfXJ8cjnto4U1eqvJpqxSBD5XUKQLcGv8+wIm4
 EeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VFGOgVAYDA+OTcd7yIQGvRjXavxhLP1/OZGLRQXwCrY=;
 b=gxcXpkUhoKg5HoeZUQ56kMaryR7qxQ8wWp7EImb+TnNvEuz7O+NVUIaKgcFq2q+2cW
 QcaYT+hpP5m8ZErBvnP8IaUMK4Owq+hKwIY5UcuIeLR3ru0wM9lRPIdjsocQaRfrDFvo
 yK9LZ+wXnqqLONVcSMprMSPp4OefJAIQVhtkBgpvKbGdtbwlcd2UoAUkYVANn8S/bmjW
 oR8Vu05aMBQYvWxH7IyePP6UkS8zUjfNjHnDlg+hRC5V6EH4EnYQLmFKS6Vlcx9hRHU9
 aQIUgDNF9S/lg6NZX3vGZuD7+Uc4MKIRR0afcm665hJVCUYZPnKo0tqEclJHQKWDU7FQ
 2t0A==
X-Gm-Message-State: AOAM530WHiQJqPkOjWgFPUTCKFLm1nuZRidjydiYt8vnjUfA6whxvbnC
 xuAN4mmJE9aGROaDjqvhV+9sUqojvew=
X-Google-Smtp-Source: ABdhPJyhV5aZupEog4llgI2EQTUlXV2qOb1YgKmV+wjrdStL3MyHUoZynxO8jJsb7PoyyN43hZW+vA==
X-Received: by 2002:a05:600c:26c8:b0:389:a542:c20b with SMTP id
 8-20020a05600c26c800b00389a542c20bmr11462325wmv.46.1646916295754; 
 Thu, 10 Mar 2022 04:44:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/35] qemu_co_rwlock_upgrade
Date: Thu, 10 Mar 2022 13:44:11 +0100
Message-Id: <20220310124413.1102441-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index c0541171d4..9674e8e3e3 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -552,23 +552,39 @@ CoroutineAction qemu_co_rwlock_wrlock(CoRwlock *lock)
     return CO_INIT_FRAME(qemu_co_rwlock_wrlock, lock);
 }
 
-#if 0
-void qemu_co_rwlock_upgrade(CoRwlock *lock)
+CO_DECLARE_FRAME(qemu_co_rwlock_upgrade, CoRwlock *lock, CoRwTicket my_ticket);
+static CoroutineAction co__qemu_co_rwlock_upgrade(void *_frame)
 {
-    qemu_co_mutex_lock(&lock->mutex);
+    struct FRAME__qemu_co_rwlock_upgrade *_f = _frame;
+    CO_ARG(lock);
+
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_mutex_lock(&lock->mutex);
+case 1:
     assert(lock->owners > 0);
     /* For fairness, wait if a writer is in line.  */
     if (lock->owners == 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
         lock->owners = -1;
         qemu_co_mutex_unlock(&lock->mutex);
     } else {
-        CoRwTicket my_ticket = { false, qemu_coroutine_self() };
+        _f->my_ticket = (CoRwTicket){ false, qemu_coroutine_self() };
 
         lock->owners--;
-        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
+        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &_f->my_ticket, next);
         qemu_co_rwlock_maybe_wake_one(lock);
-        qemu_coroutine_yield();
+_f->_step = 2;
+        return qemu_coroutine_yield();
+case 2:
         assert(lock->owners == -1);
     }
+    break;
+}
+return stack_free(&_f->common);
+}
+
+CoroutineAction qemu_co_rwlock_upgrade(CoRwlock *lock)
+{
+    return CO_INIT_FRAME(qemu_co_rwlock_upgrade, lock);
 }
-#endif
-- 
2.35.1



