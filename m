Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559804D7EBF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:36:25 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTh7n-0002wP-P2
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:36:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3h-0007oG-32; Mon, 14 Mar 2022 05:32:10 -0400
Received: from [2a00:1450:4864:20::42b] (port=36777
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3f-00082l-Gf; Mon, 14 Mar 2022 05:32:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r10so22865681wrp.3;
 Mon, 14 Mar 2022 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oim5iQ8qBT9TSPiOz7152c55oQDOdkTvsjlcgArSA9E=;
 b=HqohyCo27Qv1dCnYneU6AOWVvagd4lO+Cg6W0hCMWJiGJ5grU8SgPr7Jz8CoxwLtUI
 nafxbMG1G0M+/3fQUL9yeSrdXB1OW0hhk5pp66qvNzl8fqsUcEJHob23FrPteolCwMyz
 CFjw6qgdpV7Ihbnjxxqe+eME9Ny1DgTJu5OncByvFv3KKbZ6Jv4MQVQVu2dsISSOfRDy
 avkvR7RZiNspm9DEzmEWVht4/KB1PCssQKn65DmCMo+H0tkrza8KY/Ul+nm1WNIntKGY
 bkcUoF6DvrCnqai/3VFNMhjqAfrqw8kPgbx5gmW1Ps7bpMsxritShmEqClBLGDuARI5a
 XTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Oim5iQ8qBT9TSPiOz7152c55oQDOdkTvsjlcgArSA9E=;
 b=OVVOzBCOTDxc156022Aq+2qiPoOBfpKcRk/4462Pi/M+lkINrq0PeOouS7DEVfpG9y
 z6XeTLP5spdmALvYjerxAQaWPIVhXzNkIBGVlUHdurahTXjBI78WFFaXt6Dn6u6b37vm
 t6xfahrbOL5kJ/CVq26uUpBXlWrxQ/JSGva0DcAxKWz+WgerWli3n07bhwbG/zAsxGNI
 CRlK3Qw2Zl/gH6/eUOv9lR4970iXX2ScQUVIDn7y0+sK9N5DIwBhAsf2MsQPVW8uwGFI
 lUWqHjmiuuX7epV/rXyjrrfw+8hTnCmO5BR7xN78dxSjYAZ75sg8g0qj92ajNOCbBl0C
 j2qQ==
X-Gm-Message-State: AOAM530815I8gXW7x0Sx66kqnzKIok/KamkaEVcgozWppHteMGfM8KMD
 /Jalj3hqIB9MuVNw5MWqSNSkdgkyVfk=
X-Google-Smtp-Source: ABdhPJxG6LUP65ZcLzcHjn/HNCrbBf4EqP8vwrCc6h35xeGe1p+hCUW3bje6COdej/CPQMcNPhbTjw==
X-Received: by 2002:a05:6000:2c4:b0:203:72c9:ef37 with SMTP id
 o4-20020a05600002c400b0020372c9ef37mr15312715wry.387.1647250325891; 
 Mon, 14 Mar 2022 02:32:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 01/16] coroutine: add missing coroutine_fn
 annotations for CoRwlock functions
Date: Mon, 14 Mar 2022 10:31:48 +0100
Message-Id: <20220314093203.1420404-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
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
  * Downgrades a write-side critic section to a reader.  Downgrading with
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



