Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDB4ABE97
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:34:46 +0100 (CET)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH3EC-0007FA-Pt
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangnan.light@bytedance.com>)
 id 1nH387-0002ct-F8
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:28:27 -0500
Received: from [2607:f8b0:4864:20::435] (port=34484
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangnan.light@bytedance.com>)
 id 1nH382-0002Un-73
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:28:24 -0500
Received: by mail-pf1-x435.google.com with SMTP id v74so12675608pfc.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 04:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=XPtQmQ4HLhKExkdat+401j0pSyWlHdlBdWvVuPYsq70=;
 b=g6LxR6M0tJ4PNwimX45PMvnl+fYYB/4SaoBWdHhVCV4a6+36X/kyK5z/3krAyVeqOa
 nUDe350yiYScEkdbduahlbCqU8yz0H9aR76ZAVl2fU5ZS/mrtmiVWuY0QBENCYdXUgAK
 NZUSWW7OmCwrb7/7sUxtnppbLWXkWzKddfLVNp/wfmdkOuOsIk2lak7kr7hThkpHyS/E
 5n9rgmB8Ey21QWVc0+7kFQ1WK9wsuqV9e2fF38FYrlQvFlIz4CaN0XlgGpeQ9cBBRq3Q
 Dvta1eBYTiCa7g2LjP3xxlXm8W0qwlYrNyMMNG6ZV4bCLYBPgAY5RyUhOT/t3cyEjEH5
 bzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XPtQmQ4HLhKExkdat+401j0pSyWlHdlBdWvVuPYsq70=;
 b=46+7p4Pj7Hxw83qXYRHmcbFqcRiecgd3DJsg7kZ6OFoaaaytU62AyWSLkX/nLchewu
 DkypUFNMcXVElZyFG5v7LpI2GkkobeQkNrHmpwlFl/Z/JOcklWEwBgcZmZpDsRjkON6e
 4RTZ7BC0SAufGYpvIIZB+90YhSGpBe1Cd7WWYwSSWOXeNcYVVanmXE7k8G3jwGJffWyn
 C9UY+lHJT1WI6EFE2jlUgjKdaSD6fojEbbLO+uRJk79kvXK8MTLncxtZ9BxsZD+dpSns
 QueIrKq6vNkmoO/XCP0Qr2gIMzCIscp+LqDYcLGslcul2em50n1rjlr0Qy3P3sRsFRPk
 6+NA==
X-Gm-Message-State: AOAM531oLAVQh/G2Vr7LPFgvMGavYwSQelBblYhDe5jgdnHAK+Xtwl3P
 t2EcOa9Je0FesqCemcuqEnRN5w==
X-Google-Smtp-Source: ABdhPJxCFcw7s619q1lZ8ZdAnruj2LDWK+3DycXGX7PJL/eeFZf6gvo06MxMxBFuKhwYkjd1BX73fA==
X-Received: by 2002:a63:7355:: with SMTP id d21mr9164370pgn.222.1644236900080; 
 Mon, 07 Feb 2022 04:28:20 -0800 (PST)
Received: from n248-145-203.byted.org. ([121.30.179.115])
 by smtp.gmail.com with ESMTPSA id f22sm12205675pfj.206.2022.02.07.04.28.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Feb 2022 04:28:19 -0800 (PST)
From: Nan Wang <wangnan.light@bytedance.com>
To: pbonzini@redhat.com,
	mtosatti@redhat.com
Subject: [PATCH] kvm: drop work around for kernel header typo.
Date: Mon,  7 Feb 2022 20:28:14 +0800
Message-Id: <20220207122814.4044094-1-wangnan.light@bytedance.com>
X-Mailer: git-send-email 2.11.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=wangnan.light@bytedance.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, "wangnan.light" <wangnan.light@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "wangnan.light" <wangnan.light@bytedance.com>

Kernel header once had a typo(linux commit caa057a2cad6), qemu have to work around it with
hardcode macro(qemu commit 6f131f13e68d). Now kernel fix it(linux commit 766d3571d8e5),
so we can remove redundant code.

Signed-off-by: wangnan.light <wangnan.light@bytedance.com>
---
 target/i386/kvm/kvm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..f65ed37591 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2403,10 +2403,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         int disable_exits = kvm_check_extension(s, KVM_CAP_X86_DISABLE_EXITS);
         int ret;
 
-/* Work around for kernel header with a typo. TODO: fix header and drop. */
-#if defined(KVM_X86_DISABLE_EXITS_HTL) && !defined(KVM_X86_DISABLE_EXITS_HLT)
-#define KVM_X86_DISABLE_EXITS_HLT KVM_X86_DISABLE_EXITS_HTL
-#endif
         if (disable_exits) {
             disable_exits &= (KVM_X86_DISABLE_EXITS_MWAIT |
                               KVM_X86_DISABLE_EXITS_HLT |
-- 
2.11.0


