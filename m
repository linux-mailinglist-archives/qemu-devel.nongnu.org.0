Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008034D4814
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:31:40 +0100 (CET)
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSItH-0005wA-3Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:31:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9W-0006bT-Gt; Thu, 10 Mar 2022 07:44:23 -0500
Received: from [2a00:1450:4864:20::42f] (port=37519
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9U-00059i-IZ; Thu, 10 Mar 2022 07:44:21 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q14so7786580wrc.4;
 Thu, 10 Mar 2022 04:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cBZTbExiCYKj3VfEz2N2nz7XUaXwl3lG9di4rcEwsYk=;
 b=fzq40MSt9ngkqD7fL1f19b6QKisFMP0oIcIQsB2+zr7VpE7+PNx34tiqkZtwBXbeRp
 +rZ0V8ANEnG2UVNGkRDLUgivGN9WUglh/q8xtuiWUFN1g1psZsHMZypHvSggqhtymqMp
 Ky2SXs+AelTi9ucdWSIG3YDZ+/GbWAEH/DWSh/8wJvsDSvoVQBAGKT5kvKxiZ+r6WB1e
 YOmEGRdGQ3tiCOFhsJODlixvrcIztYRovOLwq83oRHvKE2JR0KLcatz4Q9kTsgHBypm0
 0SZue0A4gbejVWN1/8vl0v13vPvuqeb5qH7t48xQHOrcELb+GCfs5L6hDNkBYyH7WsoV
 8XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cBZTbExiCYKj3VfEz2N2nz7XUaXwl3lG9di4rcEwsYk=;
 b=sIQ7h8O2Ig4dR87eQlcEyY9DoB9V5f+vXKfav/ohaxY1PE0mVW8wjppIOhP3NAZSze
 TAN9hJN+sENKIWAXDI+SwurXz+F4KLWvCpNw9RSrIyDIe//9Vem6LBCxWQAz5dtchbX2
 3/gvGHNRVtdvFOj/Va+oQubafZjViVJuasrZ92vGnBeD4t47ZqaNk78Bjlh+rzAvDrMy
 2ZDMUYUMsOEsNde92LSdZOdM8fYdT5hP51PIK9M4SshxSPZ3PBHfz6VcqAPdDx5hIMsv
 DzVjlQbFHO0iOMKI4BAJZm3OC8LTtY407hIfEmy+oXIyREb1F6x1znkdINwO17n+XTyF
 eVww==
X-Gm-Message-State: AOAM532sXCWhVNNFH+oviYKR25/6nrGPQDmMXhK1hPEfsWqnAyF0QA8M
 IfQ65HiGZ6+/8vCk3WtgYjBbBvoFlEk=
X-Google-Smtp-Source: ABdhPJxNzCPI7CATy0vuq1yjaWxFsXFfUeiQrXfqc/ai2ZLMef5QLWtZXXZ61m3JeOXWFN+qo0SFPw==
X-Received: by 2002:a5d:64e3:0:b0:203:85ed:49a2 with SMTP id
 g3-20020a5d64e3000000b0020385ed49a2mr2742432wri.483.1646916258378; 
 Thu, 10 Mar 2022 04:44:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/35] coroutine: add missing coroutine_fn annotations for
 CoRwlock functions
Date: Thu, 10 Mar 2022 13:43:39 +0100
Message-Id: <20220310124413.1102441-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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

CoRwlock can only be taken or released from a coroutine, and it
can yield.  Mark it as coroutine_fn.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c828a95ee0..da68be5ad2 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -261,7 +261,7 @@ void qemu_co_rwlock_init(CoRwlock *lock);
  * of a parallel writer, control is transferred to the caller of the current
  * coroutine.
  */
-void qemu_co_rwlock_rdlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock);
 
 /**
  * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
@@ -270,7 +270,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock);
  * to the caller of the current coroutine; another writer might run while
  * @qemu_co_rwlock_upgrade blocks.
  */
-void qemu_co_rwlock_upgrade(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock);
 
 /**
  * Downgrades a write-side critical section to a reader.  Downgrading with
@@ -278,20 +278,20 @@ void qemu_co_rwlock_upgrade(CoRwlock *lock);
  * followed by @qemu_co_rwlock_rdlock.  This makes it more efficient, but
  * may also sometimes be necessary for correctness.
  */
-void qemu_co_rwlock_downgrade(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock);
 
 /**
  * Write Locks the mutex. If the lock cannot be taken immediately because
  * of a parallel reader, control is transferred to the caller of the current
  * coroutine.
  */
-void qemu_co_rwlock_wrlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock);
 
 /**
  * Unlocks the read/write lock and schedules the next coroutine that was
  * waiting for this lock to be run.
  */
-void qemu_co_rwlock_unlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock);
 
 typedef struct QemuCoSleep {
     Coroutine *to_wake;
-- 
2.35.1



