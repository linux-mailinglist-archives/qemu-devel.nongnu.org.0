Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2D4A5B39
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:32:55 +0100 (CET)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErP2-0003nw-2Z
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7s-0005Bz-Hm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:11 -0500
Received: from [2607:f8b0:4864:20::131] (port=40613
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7o-0003aY-N1
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:08 -0500
Received: by mail-il1-x131.google.com with SMTP id s1so13949848ilj.7
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NIF+VNOgCO38jAUQ1Bkp9EJCrwItP3MwODBXv1s0NcU=;
 b=b2s2CVgcTgwmwVimrW33vAVvVSHeSYPSerghqonH/h62gafDKGcQVkBZKNv0AkHOLZ
 iW9xB6CVhe2NhNR10RBNG4HgDywZGSDoI9Fg9saqlTxvrjkZOGYvVrQlFAyC3s5tuHpm
 7rIid+Zbv8Rw8tcm4S7omTM9StFGvDu2YM3WckzkULcCA4WmnwLep8hG6j78MTo4uFHc
 jpeWytb1TUgzCOzH0sZSS6PLr5tDS+jn96YI2/PhYBUw/HvuOx51ELcToLInfjX0IQ9a
 tZlROa6XgRK3hi5h4b2svnGs/E8JgObK7jCsMCQT40fHQeQG0tAMkoq4BYdTj8k/kygI
 YfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NIF+VNOgCO38jAUQ1Bkp9EJCrwItP3MwODBXv1s0NcU=;
 b=PP/Ut2Lah/3twa24Rb7bHfyN9ozZGsyNjUnefU3CLc7baGdXZ32g58mRjqXbMcNOU6
 8DcKBUOz18Gbiqme/A9YsIbJsdECXVIK/j8EwvjUe8plnXagNOOR1If+uQZAH+YWc9wD
 sGYKgDOh+cdm14k0SuMAJCTUHL2GbRtaR7PYYfVfuQ4FVG0BtOyYxrr9MPeboyWhhSo4
 ch7edltarCYDFUlijevBef1tZVkXkNuVlkMhgpp3nT+xnE7LSsa9AXbSX9mVOl6DGkZp
 7hGHYKenG3eBOpVtIpnPCTqh7/+lDhaWCLyCvEN/jZ6ow4hoEvted7rGN7bbTZ68KPJt
 a8tg==
X-Gm-Message-State: AOAM532Uxz2eiBjgwKqxmrckcElW6PFYEdyJQ2X97+VBok/t3qtaVruI
 Pj+eoADteM/lpxtywwkZwVMPxPv7+IWAQA==
X-Google-Smtp-Source: ABdhPJzWQbHKji6NYDcB/eUhwBF3j/7x3BkdNkVL6bijCnJRJJDS5vfcEvA0AV/Bf+IVoWXXMqlWYA==
X-Received: by 2002:a05:6e02:1605:: with SMTP id
 t5mr6640974ilu.17.1643714103421; 
 Tue, 01 Feb 2022 03:15:03 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:03 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/22] bsd-user/freebsd/os-syscall.c: unlock_iovec
Date: Tue,  1 Feb 2022 04:14:48 -0700
Message-Id: <20220201111455.52511-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Releases the references to the iovec created by lock_iovec.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c21759ae7ce..d49945f0fcc 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -167,6 +167,29 @@ struct iovec *lock_iovec(int type, abi_ulong target_addr,
     return NULL;
 }
 
+void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
+        int count, int copy)
+{
+    struct target_iovec *target_vec;
+    int i;
+
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
+    if (target_vec) {
+        for (i = 0; i < count; i++) {
+            abi_ulong base = tswapal(target_vec[i].iov_base);
+            abi_long len = tswapal(target_vec[i].iov_len);
+            if (len < 0) {
+                break;
+            }
+            unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
+        }
+        unlock_user(target_vec, target_addr, 0);
+    }
+
+    free(vec);
+}
+
 /*
  * do_syscall() should always have a single exit point at the end so that
  * actions, such as logging of syscall results, can be performed.  All errnos
-- 
2.33.1


