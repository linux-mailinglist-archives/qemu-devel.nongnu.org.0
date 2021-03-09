Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6233277B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:48:10 +0100 (CET)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJciX-0001ky-Ll
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJchW-0001LM-1K
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:47:06 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJchU-0004G0-79
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:47:05 -0500
Received: by mail-ed1-x534.google.com with SMTP id dm26so20132271edb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcK/2jjSRhgYCHWQF1KkIFwILgjiubXjMmZkZUi/zM4=;
 b=N3Vq1pH3WxfgEYT4O5v0gJbkceq0I453NBRI6ddcSLZk9uCNXmyLXOOVXvUrKGoRDG
 EGHB+5GKvlHEfFRI6ktHvu89fngzeuFfIWPDAZlx3sHfLiyczT83zm5Q1vAibQTI57P4
 yhMQOPCueIUn1HYlQH4r6pdfc9gyl1fLsp7p+PGU7fhmHfQwLm7qbCO2zMQu7JRW1B2P
 aivIk4Gj+cbQ6F0r852Ss3a5swOMleBC/YdDISotVtostHY35K4YAyHADfs2UOVd3+fH
 ZGqeuWMTAftuBJsFB4EC+8X2MQ0XIF6gQHgMccgvylx5IgCkmEkaJXJEzCmZcoU6SKZy
 vH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GcK/2jjSRhgYCHWQF1KkIFwILgjiubXjMmZkZUi/zM4=;
 b=YaSCrEZt+VkcKzpi7GesiNbZ7TPgA5XXkToL3tyHTL0fFMmr8P0vTxTqQp1fdQHYB/
 TUqlyLdgEMDdKPAAB2jaD1XuvzFKlQW4ZzKfNOaadUyLn4LOuVsuCLNPDPb9BxqvQ4yG
 NkQtPxT/J11paJhwXhZgW88EAsyBqdt6VhAtPNYHmMgp5iacxRCCR0qb0qMF60KupyAn
 kdhziNKz4SpasoCPUhkAyLzC5QZ6bZkgpcSKcgZoYLCRX5Here4SFlD/aLgc/iy58/u4
 usAaSLlAxljZC/G4Zc0exztZeEhvmi4qs9wSZt89Mf4FzEr8jfiTIAogQA+d3Fi5ilj3
 VfGw==
X-Gm-Message-State: AOAM532bkbOmHbMJ+kWuQtNg9isjtMS+OvlTwZYMOxB5trz7pOP+8x54
 irOHhAsVDXXkwOM1wnY8tLJlF+i4yZo=
X-Google-Smtp-Source: ABdhPJwUImF7qx0AH9fe8OtkD358NPnnjfFJiq/kOzP5gsl9RMfDWy3GN+pUBQR1ElJyUlo3ni7L5A==
X-Received: by 2002:aa7:cf02:: with SMTP id a2mr4158809edy.59.1615297621644;
 Tue, 09 Mar 2021 05:47:01 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 y16sm8660948ejk.43.2021.03.09.05.47.01 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:47:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Revert "accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot"
Date: Tue,  9 Mar 2021 14:47:00 +0100
Message-Id: <20210309134700.186694-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 3920552846e881bafa9f9aad0bb1a6eef874d7fb.
Thomas Huth reported a failure with CentOS 6 guests:

../../devel/qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f88a52393f..ffce83f1a7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -673,10 +673,6 @@ out:
 #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
 #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
 
-/*
- * As the granule of kvm dirty log is qemu_real_host_page_size,
- * @start and @size are expected and restricted to align to it.
- */
 static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
                                   uint64_t size)
 {
@@ -686,9 +682,6 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
     int ret;
 
-    /* Make sure start and size are qemu_real_host_page_size aligned */
-    assert(QEMU_IS_ALIGNED(start | size, psize));
-
     /*
      * We need to extend either the start or the size or both to
      * satisfy the KVM interface requirement.  Firstly, do the start
-- 
2.29.2


