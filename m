Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9566E18D9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 02:13:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn72v-0007hZ-9N; Thu, 13 Apr 2023 20:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3U5o4ZAsKCpIwy60D70KF922AA270.yA8C08G-z0H079A929G.AD2@flex--ackerleytng.bounces.google.com>)
 id 1pn72t-0007hK-FX
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:07 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3U5o4ZAsKCpIwy60D70KF922AA270.yA8C08G-z0H079A929G.AD2@flex--ackerleytng.bounces.google.com>)
 id 1pn72r-000396-Ek
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:07 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-54f8d4f1ca1so74699097b3.20
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 17:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681431124; x=1684023124;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gsr9n7GPJt3nQiq4GcQ+TdB+rTZDJHWVuXMgSAc/inc=;
 b=kiDTePLk95tLtwi05EOCo6F4V5CaUODRfRqdJI4Zgzm9FQWvaGZtlrD6yXaeMKkBjy
 8RYIMMqxVwtK8hcqiFL4L6XAaUQuBxXj0Ob3OL8FosXLKFkReuzMoaSCAc6uSho3g0AT
 1Mad+18Vu1ODUbN+2p4Gx7UN/JCMROb9IKSQZwVC0SqUcslnNIKVGAjm6jXtAj4CVyW6
 AubdJjVqBGvAcIQftDMGLDBeWf29B2Tvkh+iboimGU/GxdHwLZqBuIds+tebPgdOIXna
 fQ+8mzrH61gD5Hs3hKsbNr1LXybHaYbyOLpWo62wPHciL4cbfv9pbXLpD+tC0w5oX1yN
 Vaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681431124; x=1684023124;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gsr9n7GPJt3nQiq4GcQ+TdB+rTZDJHWVuXMgSAc/inc=;
 b=EqCvH+C7u03qDU4MANYNY5UjQt17POII14+pM6JczB6peTdzJ9LoX7hTBv6HqIvV/Q
 3dyU2e28H9a0N3dG+EymK4Cn4JHE5BI4Ygj7WRIi09afTlHGmo82QXnkdpa10o/IxRHf
 rKZzIeDYpB7gDbNV8qqKbeHCMqPaOhD5SuBdLJ2TbPSG6WoFJoe2os86Cld/bXgxuXQy
 Jgnyz3QJy2vOqHpcnnjyabfnIU+tvDLAnt+VCCgRUAxXNI01L/Rgcdsd4wNhXSygT53c
 LOW5YfDbM1goXsI0+ESN9NN98qg4ye7TYwinwIIWR4Cbhi05sFfg9OQfZ5eM02ki29k2
 1cAA==
X-Gm-Message-State: AAQBX9f0wulpVgj9gg2226igWbD7JAZK4BdujGJdiLx4bp+6Es6mWMm+
 i8yE+1DrNuMHZWOIqdbrCyS9H8hDKVkWBBYUVQ==
X-Google-Smtp-Source: AKy350aRre2/mW24vntSSS5eHQnqj/lI3imd9ledXWOeS14bBFvJmCzkihwUza6OXJc/lSYwICNxvky6ENjOvWGfVA==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a81:af0c:0:b0:54f:8566:495 with SMTP
 id n12-20020a81af0c000000b0054f85660495mr2640217ywh.1.1681431123807; Thu, 13
 Apr 2023 17:12:03 -0700 (PDT)
Date: Fri, 14 Apr 2023 00:11:52 +0000
In-Reply-To: <cover.1681430907.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1681430907.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <43e1c951125d6700586dbd332c2036db0f2f5f2d.1681430907.git.ackerleytng@google.com>
Subject: [RFC PATCH 3/6] mm: mempolicy: Refactor out __mpol_set_shared_policy()
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com, muchun.song@linux.dev, feng.tang@intel.com, 
 brgerst@gmail.com, rdunlap@infradead.org, masahiroy@kernel.org, 
 mailhol.vincent@wanadoo.fr, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3U5o4ZAsKCpIwy60D70KF922AA270.yA8C08G-z0H079A929G.AD2@flex--ackerleytng.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Refactor out __mpol_set_shared_policy() to remove dependency on struct
vm_area_struct, since only 2 parameters from struct vm_area_struct are
used.

__mpol_set_shared_policy() will be used in a later patch by
restrictedmem_set_shared_policy().

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/mempolicy.h |  2 ++
 mm/mempolicy.c            | 29 +++++++++++++++++++----------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index d232de7cdc56..9a2a2dd95432 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -126,6 +126,8 @@ struct shared_policy {
 
 int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst);
 void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol);
+int __mpol_set_shared_policy(struct shared_policy *info, struct mempolicy *mpol,
+			     unsigned long pgoff_start, unsigned long npages);
 int mpol_set_shared_policy(struct shared_policy *info,
 				struct vm_area_struct *vma,
 				struct mempolicy *new);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index a2655b626731..f3fa5494e4a8 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2817,30 +2817,39 @@ void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
 	}
 }
 
-int mpol_set_shared_policy(struct shared_policy *info,
-			struct vm_area_struct *vma, struct mempolicy *npol)
+int __mpol_set_shared_policy(struct shared_policy *info, struct mempolicy *mpol,
+			     unsigned long pgoff_start, unsigned long npages)
 {
 	int err;
 	struct sp_node *new = NULL;
-	unsigned long sz = vma_pages(vma);
+	unsigned long pgoff_end = pgoff_start + npages;
 
 	pr_debug("set_shared_policy %lx sz %lu %d %d %lx\n",
-		 vma->vm_pgoff,
-		 sz, npol ? npol->mode : -1,
-		 npol ? npol->flags : -1,
-		 npol ? nodes_addr(npol->nodes)[0] : NUMA_NO_NODE);
+		 pgoff_start, npages,
+		 mpol ? mpol->mode : -1,
+		 mpol ? mpol->flags : -1,
+		 mpol ? nodes_addr(mpol->nodes)[0] : NUMA_NO_NODE);
 
-	if (npol) {
-		new = sp_alloc(vma->vm_pgoff, vma->vm_pgoff + sz, npol);
+	if (mpol) {
+		new = sp_alloc(pgoff_start, pgoff_end, mpol);
 		if (!new)
 			return -ENOMEM;
 	}
-	err = shared_policy_replace(info, vma->vm_pgoff, vma->vm_pgoff+sz, new);
+
+	err = shared_policy_replace(info, pgoff_start, pgoff_end, new);
+
 	if (err && new)
 		sp_free(new);
+
 	return err;
 }
 
+int mpol_set_shared_policy(struct shared_policy *info,
+			struct vm_area_struct *vma, struct mempolicy *mpol)
+{
+	return __mpol_set_shared_policy(info, mpol, vma->vm_pgoff, vma_pages(vma));
+}
+
 /* Free a backing policy store on inode delete. */
 void mpol_free_shared_policy(struct shared_policy *p)
 {
-- 
2.40.0.634.g4ca3ef3211-goog


