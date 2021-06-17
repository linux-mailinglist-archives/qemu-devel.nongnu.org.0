Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722B43AAFDC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:34:19 +0200 (CEST)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoPi-0005j1-F1
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNB-0002a1-0h; Thu, 17 Jun 2021 05:31:41 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoN8-00060W-Vg; Thu, 17 Jun 2021 05:31:40 -0400
Received: by mail-ed1-x52a.google.com with SMTP id u24so3017693edy.11;
 Thu, 17 Jun 2021 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0+AwUXW3F+3xw6jgijJ3i774wGZg+ICftnnBWgQ9fA=;
 b=Sp/voqCK4St+zItPkwDM9X8sXGTpdFyHS5ZFLpz1DD1rZQbtHo1+0MqzwPO/2JlYFj
 jBPUaRrXIGr1klCt3yYEdgD905fKOFABPTaUFminHXdvJfiR+3xvpQJwRIrYG5tVIuKC
 EyW0gcphH2epeYuigNw5c8fyyptrEl3S7IuZdJO4qsQULe+y2XhHGaSlrZg0DDBxswsi
 FiT/WSf+L1dxBZi+5tmh2giBdAaKlyt8g2p0rkOfNXAUfrpvq4NFxKflq3kAG4nxytsa
 VAKNy7pB2dkHrtC0q2vIbq6Il6d12gunb41Jy7lJoZaAQVyj2zVfx193zOWtW/BqWhCq
 WTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R0+AwUXW3F+3xw6jgijJ3i774wGZg+ICftnnBWgQ9fA=;
 b=ph+3jEECuY6/o3n2ORGEVYL62tal0knjo72Gmu5TDbDDj9Nza99tWzGYjxtwTBP5Yw
 GAtjWHHh8optSIrG+rclrYk6TE63JUeYph2ZpyvYGbv1N1oBpZz8nkTZSpgxTLq6U39b
 LtAmCSvWeb8xzbVMDH37TnNq/l5SLhz30sT0KQDNOAnVxlIcKD7W/J2FgZcuB/G51fnv
 M3dVRddUEKlDcvYRkxwYBAgDzUNdj9D8ErZbZ5eNlykLHUCmgy1vajMppus1eszzdvkH
 8DplKJ/wWWuqdHhtpyzn1qkylxKWR0nIcasgvrduo/04lVg6gGO9frh+zU+TacIqcmRa
 YLwQ==
X-Gm-Message-State: AOAM530vt8b9gZtpWL/gQ7RRyVfe3AH21+MCfVeXIMt6u73LVVah4s8G
 nL5o7lQGHL7ZETi44P4q9LwCgqkLQSY=
X-Google-Smtp-Source: ABdhPJwhuEaCHDhjlb9MuZOn+u978Ean1I1gAx4fJnQEnJUXXdwdBpoVeanSymqgmrhJwn6CuSq18g==
X-Received: by 2002:a05:6402:28a:: with SMTP id
 l10mr5178173edv.365.1623922296680; 
 Thu, 17 Jun 2021 02:31:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/45] vl: Fix an assert failure in error path
Date: Thu, 17 Jun 2021 11:30:51 +0200
Message-Id: <20210617093134.900014-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

Based on the description of error_setg(), the local variable err in
qemu_maybe_daemonize() should be initialized to NULL.

Without fix, the uninitialized *errp triggers assert failure which
doesn't show much valuable information.

Before the fix:
qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

After fix:
qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20210610084741.456260-1-zhenzhong.duan@intel.com>
Cc: qemu-stable@nongnu.org
Fixes: 0546c0609c ("vl: split various early command line options to a separate function", 2020-12-10)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 326c1e9080..feb4d201f3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
 
 static void qemu_maybe_daemonize(const char *pid_file)
 {
-    Error *err;
+    Error *err = NULL;
 
     os_daemonize();
     rcu_disable_atfork();
-- 
2.31.1



