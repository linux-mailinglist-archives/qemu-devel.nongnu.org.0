Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBCE5E642B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:50:17 +0200 (CEST)
Received: from localhost ([::1]:39204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMam-0004sF-Nd
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanglei002@gmail.com>)
 id 1obJ7z-0007vh-Iz
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:08:19 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhanglei002@gmail.com>)
 id 1obJ7x-0007Ny-UK
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:08:19 -0400
Received: by mail-io1-xd2d.google.com with SMTP id y141so7261040iof.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=pNefjDFqKvE7IGauanhq+yEjfFXj+c9KUR7M+2vN2jM=;
 b=Fhq3hkop47FxsiPMfY4HLYVQm9i0dsHmmAR/VvN9Vb9w9gWRq7Ia55Yn4pSSxAuETt
 VFBt+WJjxVQt8Qi1Hycj/x5DEapGipQ9PBZlkx0GxjfGQMg/nsA0bhEw91Dm3/RknATD
 P/KoxK5w8A1JzguvvCgbyK84+QXYjyinC8hRrhKliHHQYUBeFUdWjc55pSB9pTKvm3Xk
 dNlu60HVmkev/mUyJYbx/R3e4/8Gj62VfpD2yDXbYmlephJVwWCyiDpB58yFCULoHYH3
 dXM6BGtKgZdXGiqcPB3FxSEZWf/0dILxeKX+vth8L15oo6lRbl6Hy3KkJ/TtTKs3iq57
 sMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=pNefjDFqKvE7IGauanhq+yEjfFXj+c9KUR7M+2vN2jM=;
 b=fg0zYCHXi90QTblSVK/DjFZn3qLskSIeWbZJRQ0Rd+JvdG9E5LImNtFX55wU6Niha0
 bRJWDy6nhTdJA5So/GAXW2qzKOq3G8nn0Q1+vd+GV5gbUV1XzJB8Ml98cEWH8zx/46MA
 Wu6TeMIuqyJT+7QtW/hwu/MiAeb1wJt/wiyHyz3IeDpuA6haZuQbtorWT7rpk11SSKE7
 40WysVi/q1hjHpTLKWZt2qy4Kt6jY2TnWAZhoSC6IZjZWXdxQ+NZo14Lp35AIiAjz4EU
 xdtDnOIAuAwjuVVk4f2vCM0y3td366spBPjY+NDMSL8r4ZsWH1qOpx11jgZL5HJqrZXl
 cDFA==
X-Gm-Message-State: ACrzQf3O9Cl33GP14nMcAgkq2s1QnqCKk/k0UZ6mHNMDo1lj2CwOwW7e
 zDnZo/LuiBQqOoT8pNrlapbrfMv5v2o=
X-Google-Smtp-Source: AMsMyM6haxbPPN7nqnvxz38pBz3gnP+9fiCLQPI53gmP4uqN9Ta1ax4n87Lh5mVNQsm98tbKzoC5oA==
X-Received: by 2002:a05:6638:d88:b0:35a:d32d:76a4 with SMTP id
 l8-20020a0566380d8800b0035ad32d76a4mr1516248jaj.70.1663841295071; 
 Thu, 22 Sep 2022 03:08:15 -0700 (PDT)
Received: from localhost.localdomain ([168.63.252.132])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a056e0213d100b002f6699c86eesm1694561ilj.68.2022.09.22.03.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 03:08:14 -0700 (PDT)
From: Ray Zhang <zhanglei002@gmail.com>
To: qemu-devel@nongnu.org
Cc: Ray Zhang <zhanglei002@gmail.com>
Subject: [PATCH] target/i386/kvm: fix kvmclock_current_nsec: Assertion
 `time.tsc_timestamp <= migration_tsc' failed
Date: Thu, 22 Sep 2022 18:05:23 +0800
Message-Id: <20220922100523.2362205-1-zhanglei002@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=zhanglei002@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Sep 2022 09:12:18 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New KVM_CLOCK flags were added in the kernel.(c68dc1b577eabd5605c6c7c08f3e07ae18d30d5d)
```
+ #define KVM_CLOCK_VALID_FLAGS						\
+	(KVM_CLOCK_TSC_STABLE | KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC)

	case KVM_CAP_ADJUST_CLOCK:
-		r = KVM_CLOCK_TSC_STABLE;
+		r = KVM_CLOCK_VALID_FLAGS;
```

kvm_has_adjust_clock_stable needs to handle additional flags,
so that s->clock_is_reliable can be true and kvmclock_current_nsec doesn't need to be called.

Signed-off-by: Ray Zhang <zhanglei002@gmail.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a1fd1f5379..9eeee91c2f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -157,7 +157,7 @@ bool kvm_has_adjust_clock_stable(void)
 {
     int ret = kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
 
-    return (ret == KVM_CLOCK_TSC_STABLE);
+    return (ret & KVM_CLOCK_TSC_STABLE);
 }
 
 bool kvm_has_adjust_clock(void)
-- 
2.37.2


