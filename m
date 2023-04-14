Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E1B6E18DD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 02:13:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn735-0007iQ-0W; Thu, 13 Apr 2023 20:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VZo4ZAsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com>)
 id 1pn732-0007iC-BQ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:16 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VZo4ZAsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com>)
 id 1pn72u-00039T-Va
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:16 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 f66-20020a255145000000b00b7f75c3cafdso1863899ybb.16
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 17:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681431125; x=1684023125;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=W+vIzhvgnDTeM5yLC6D6DMUdvSTbR9axXaSgRhroXf8=;
 b=mW9eVt20/JcXUsgxb+xjqD4VG4js+2q/p5hJJDDZIcnukRm0syQv/TXqiec2heBNck
 /LJ2OaI6hIksRPbp9XAhh99LqDjoZM2pQCkJ+bmJzc8yZHZYkwMAwFEhAsHbl30CzShC
 AnjRJgdI7su71kGpp2x6zyUwFmi0ZsMW7HG1IhDvuRpLPR8dBsIbCcLfLX3bb41Nf7ID
 fPGnb4gcd1xumZwEpzLDR6LXrZNMCwms/UiqwFrs/MG66By8fMMhSBTwwbfU9CItCsXE
 IVTc6CfCREM1gKWUMxH19y2K58Mf0+JvqHllDRZBSVXeFCA0+XBcsiL9bPxv2h5LcfvI
 JjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681431125; x=1684023125;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W+vIzhvgnDTeM5yLC6D6DMUdvSTbR9axXaSgRhroXf8=;
 b=afFH73HA6U7AkHcG+OEXjaPQu5aNmlorE6Hqx6qu68UVhPZVxAzfbyAly1K4MFHp6x
 WcwXKLTQcqbst+Ze0JIHsZFjwc0ElTfg7FcfNk/pOn+qXgcRAoIkz38O8kzKWG0gJU67
 85HS/MDZ4DPGlXmfXrZi52S9BDuBjKMp/KYla0M/ZFQddT/9Q5uzg5hC8IQS5/SkIDjR
 P7/tL5lgsLPkuygKPKaiekRF/2C5Y823EoTUapvdV5siHs8eKYwEynACmkxBnVaiF/HH
 4Fp3NCVEzS1YuvcqonCInSWxS1+7/KUzAfMFGioe2m73//MupkWQu6YQ7PTmcKlXCqvC
 k5pg==
X-Gm-Message-State: AAQBX9cunVGN/hx/JtecnXrYMHZQtjRDkyuN2cTmRd0rv8a1YNV1sSF+
 XH5gpkkGWGFuoPkwsCLaFkH0DeTvB7zEvUOhRg==
X-Google-Smtp-Source: AKy350b34CBn9n2raOJ+zF+ClQSsfsH/2Lr8AcQiejmlqBPjPibu2aqY4QIJU2kHR7dXtCx3CNEm4OqoAAxVmXTquQ==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a81:4328:0:b0:545:4133:fc40 with SMTP
 id q40-20020a814328000000b005454133fc40mr2444452ywa.9.1681431125361; Thu, 13
 Apr 2023 17:12:05 -0700 (PDT)
Date: Fri, 14 Apr 2023 00:11:53 +0000
In-Reply-To: <cover.1681430907.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1681430907.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <17bb8e925c08f27c627cd1f2bbb2714daf590c1d.1681430907.git.ackerleytng@google.com>
Subject: [RFC PATCH 4/6] mm: mempolicy: Add and expose mpol_create
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3VZo4ZAsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

mpol_create builds a mempolicy based on mode, nmask and maxnode.

mpol_create is exposed for use in memfd_restricted_bind() in a later
patch.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/mempolicy.h |  2 ++
 mm/mempolicy.c            | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index 9a2a2dd95432..15facd9de087 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -125,6 +125,8 @@ struct shared_policy {
 };
 
 int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst);
+struct mempolicy *mpol_create(
+	unsigned long mode, const unsigned long __user *nmask, unsigned long maxnode)
 void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol);
 int __mpol_set_shared_policy(struct shared_policy *info, struct mempolicy *mpol,
 			     unsigned long pgoff_start, unsigned long npages);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index f3fa5494e4a8..f4fe241c17ff 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3181,3 +3181,42 @@ void mpol_to_str(char *buffer, int maxlen, struct mempolicy *pol)
 		p += scnprintf(p, buffer + maxlen - p, ":%*pbl",
 			       nodemask_pr_args(&nodes));
 }
+
+/**
+ * mpol_create - build mempolicy based on mode, nmask and maxnode
+ * @mode:  policy mode, as in MPOL_MODE_FLAGS
+ * @nmask:  node mask from userspace
+ * @maxnode:  number of valid bits in nmask
+ *
+ * Will allocate a new struct mempolicy that has to be released with
+ * mpol_put. Will also take and release the write lock mmap_lock in current->mm.
+ */
+struct mempolicy *mpol_create(
+	unsigned long mode, const unsigned long __user *nmask, unsigned long maxnode)
+{
+	int err;
+	unsigned short mode_flags;
+	nodemask_t nodes;
+	int lmode = mode;
+	struct mempolicy *mpol;
+
+	err = sanitize_mpol_flags(&lmode, &mode_flags);
+	if (err)
+		return ERR_PTR(err);
+
+	err = get_nodes(&nodes, nmask, maxnode);
+	if (err)
+		return ERR_PTR(err);
+
+	mpol = mpol_new(mode, mode_flags, &nodes);
+	if (IS_ERR(mpol))
+		return mpol;
+
+	err = mpol_init_from_nodemask(mpol, &nodes, true);
+	if (err) {
+		mpol_put(mpol);
+		return ERR_PTR(err);
+	}
+
+	return mpol;
+}
-- 
2.40.0.634.g4ca3ef3211-goog


