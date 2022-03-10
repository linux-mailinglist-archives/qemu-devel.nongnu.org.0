Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0C4D47FA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:23:22 +0100 (CET)
Received: from localhost ([::1]:42522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIlF-0006li-ES
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA4-0007Bl-Oe; Thu, 10 Mar 2022 07:44:57 -0500
Received: from [2a00:1450:4864:20::32f] (port=37753
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA3-0005I6-9v; Thu, 10 Mar 2022 07:44:56 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so5372930wmj.2; 
 Thu, 10 Mar 2022 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtfLq8CDDAN+OsDz6ySOeMkfeiJ4VTMTdljzWdf/3D4=;
 b=Z/6fdqrQoT3cph0upoUUQ/sE7ernLtwaAp9tae9R/NY/ceVseZ0IzLHEPczEFxkbh8
 nl4mn2V7UaSxWIhjC2MrS9cpoBf68Cb20mCuzMD2u6KE7rVzDCcdOMEnD5gpvtFckUTJ
 lUV54Wuj4zgXFt/hlYOiw0cKFLByiiruwF35orS8Mgirj2ZFn/YpCwkuoCtNF7iDRLng
 ayKGPRWsfQ0mm3KE3gVvErKwjHOCCAOc+lYCCaGQHRRf7bkKFCLn4Og0VOrhvu5eLUpQ
 D9CQ4AA5/nDYghJUt+m+NRagC9POKpqwSaIXmQYW1SCcAxYvjWPf5+YyrO9x05iqHDow
 mQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NtfLq8CDDAN+OsDz6ySOeMkfeiJ4VTMTdljzWdf/3D4=;
 b=wRx/3HuihhTj8sofYKhkK6burTrLK7bi+9ilz0n4fk8plRUCtLGMJlCyE1eexYvNyx
 SJZaclir70mHWUyIdZZIASAbBjtSOIUuFGMXu9D8M14ga1JMg1OOVe9Ai4NpR6imLHga
 lRhrEoHM9/pQmDQHAWxqH1hn3H8asXkpPEvzPHDv/2jqXpi7XTHLD6+F89fk4LBz8X4T
 pm4HO8VJic7D4SAbiKmvwjyOGkrVmON5SlVhFVjsoK/Ec2ThzNAbsDPjC2wttuhKNP7c
 QHeq4t+zCDWLNEY4NA6F/+2gK7SkYhWqIrTB4tRmmoepQmJqct+JR0gP45MvB6QKjQp9
 Mxvg==
X-Gm-Message-State: AOAM532V/JaX63b3sqFDhMdpcQ6hXtfTxeoCY1+SWUWF2+F67aqqiFo8
 mOW11V+lFFJD8rTpO/6xoT8HOrhTt+U=
X-Google-Smtp-Source: ABdhPJysoCyOTauiW3Nb0zShL8Uvt0IACYT4TwlCT3wmCWfqy6hrjWT0QNXqYVySfFEwRO8lnt0Jdg==
X-Received: by 2002:a1c:e916:0:b0:37c:f44f:573 with SMTP id
 q22-20020a1ce916000000b0037cf44f0573mr11710627wmc.179.1646916293563; 
 Thu, 10 Mar 2022 04:44:53 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/35] qemu_co_rwlock_downgrade
Date: Thu, 10 Mar 2022 13:44:09 +0100
Message-Id: <20220310124413.1102441-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
 util/qemu-coroutine-lock.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index c164cf6b15..5a7b99cfaf 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -484,17 +484,35 @@ CoroutineAction qemu_co_rwlock_unlock(CoRwlock *lock)
     return CO_INIT_FRAME(qemu_co_rwlock_unlock, lock);
 }
 
-#if 0
-void qemu_co_rwlock_downgrade(CoRwlock *lock)
+CO_DECLARE_FRAME(qemu_co_rwlock_downgrade, CoRwlock *lock);
+static CoroutineAction co__qemu_co_rwlock_downgrade(void *_frame)
 {
-    qemu_co_mutex_lock(&lock->mutex);
+    struct FRAME__qemu_co_rwlock_downgrade *_f = _frame;
+    CO_ARG(lock);
+
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_mutex_lock(&lock->mutex);
+case 1:
     assert(lock->owners == -1);
     lock->owners = 1;
 
     /* Possibly wake another reader, which will wake the next in line.  */
-    qemu_co_rwlock_maybe_wake_one(lock);
+_f->_step = 2;
+    return qemu_co_rwlock_maybe_wake_one(lock);
+case 2:
+    break;
+}
+return stack_free(&_f->common);
 }
 
+CoroutineAction qemu_co_rwlock_downgrade(CoRwlock *lock)
+{
+    return CO_INIT_FRAME(qemu_co_rwlock_downgrade, lock);
+}
+
+#if 0
 void qemu_co_rwlock_wrlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
-- 
2.35.1



