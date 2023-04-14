Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA496E18D5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 02:13:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn72w-0007ha-An; Thu, 13 Apr 2023 20:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Upo4ZAsKCpEvx5zC6zJE8119916z.x97Bz7F-yzGz689818F.9C1@flex--ackerleytng.bounces.google.com>)
 id 1pn72t-0007hC-Kc
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:07 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Upo4ZAsKCpEvx5zC6zJE8119916z.x97Bz7F-yzGz689818F.9C1@flex--ackerleytng.bounces.google.com>)
 id 1pn72q-00038Z-OS
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:06 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 u11-20020a17090341cb00b001a22d27406bso7766063ple.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 17:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681431122; x=1684023122;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BkEj6q2IVKaYOP6wiiRLnj5ts2mBBZa+OIxL/GSTf98=;
 b=hEKe7KJhnbtB7HOx0Et2GGRR4tPoUqzTdWnfUxGGsyi9EoTWrZhVqGnrZvvHuOndFb
 TZMGSQ8vslsUBzDoxn9iNYO9LNL12Zs3VwW97btbxF/u5m0XCRPh93bGl4sbvEzqxT6/
 vZR2E4QR8bsqooC9JFGEbUD4GNGVdkQWEnhHWe0gty7hNJfMUG+x6qUJrqOv1s31GKD5
 /0uqMrvUHdk6drQi8pnb3EXthHB7+IGInrY92tJ9ElhNKYIt+IMYZonjXRQ9OCvmz8n+
 DadYc4CMCAJvwcgOviymbXY411dscM1zCutEA5OdbSJuHP8nTNCFxIaU7gllAACoSnWm
 TMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681431122; x=1684023122;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BkEj6q2IVKaYOP6wiiRLnj5ts2mBBZa+OIxL/GSTf98=;
 b=lOizDRSux9CVTDJe/9lFyeaZ4mpVFIvujxrjqNn9XH0vquUabG/IUYK6nyh0SYKHcI
 pXinClihazKrQJ3bN4cCRi7JMBd0DBYzuzdhpFE3LDvqZyYqn42juhXansVzpKckv0MP
 lXU5MpiIIvR75vtV0EAgGy6gc91cjIyq6S4G0TKjlCn4Uk6j9PjEoOpDnFewbkVfM+OW
 Og8pDRcA3R2iy1OtRM1pjLoPtf55xLAehwgiTSDKxcFfkVVEHrb3YUhuo8owfiSp9eGu
 Tc7qs0HBzIXUVIdrQEsEroRVRpMXxLNhIrnGBjeUJeVa5i8sfUutW27iiEhd/kfzhVaV
 nSig==
X-Gm-Message-State: AAQBX9fAN14NyTmDoqk3mcMmtgZq1wpSW74+OmX5ZhBMhcGUKq1/Ec3+
 Q97Jkofz1xNHn2EGHIYuRUQvRuKgu7QOVAtgsw==
X-Google-Smtp-Source: AKy350avtllPlWwvIfTF15qlG1lqqPqwu/NAHA4tctgmwlguwviMhGUhrJ6084VLBRdQnA8mKuN5Lp3jk9IuHlWLyQ==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a63:1c09:0:b0:507:3e33:43e3 with SMTP
 id c9-20020a631c09000000b005073e3343e3mr240709pgc.7.1681431122125; Thu, 13
 Apr 2023 17:12:02 -0700 (PDT)
Date: Fri, 14 Apr 2023 00:11:51 +0000
In-Reply-To: <cover.1681430907.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1681430907.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <cf43d4daa5e8dba22d2416cf46f586afcff0a33e.1681430907.git.ackerleytng@google.com>
Subject: [RFC PATCH 2/6] mm: mempolicy: Refactor out mpol_init_from_nodemask
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3Upo4ZAsKCpEvx5zC6zJE8119916z.x97Bz7F-yzGz689818F.9C1@flex--ackerleytng.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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

Refactor out mpol_init_from_nodemask() to simplify logic in do_mbind().

mpol_init_from_nodemask() will be used to perform similar
functionality in do_memfd_restricted_bind() in a later patch.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 mm/mempolicy.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index a256a241fd1d..a2655b626731 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1254,6 +1254,25 @@ static struct page *new_page(struct page *page, unsigned long start)
 }
 #endif
 
+static long mpol_init_from_nodemask(struct mempolicy *mpol, const nodemask_t *nmask,
+				    bool always_unlock)
+{
+	long err;
+	NODEMASK_SCRATCH(scratch);
+
+	if (!scratch)
+		return -ENOMEM;
+
+	/* Cannot take lock before allocating in NODEMASK_SCRATCH */
+	mmap_write_lock(current->mm);
+	err = mpol_set_nodemask(mpol, nmask, scratch);
+	if (always_unlock || err)
+		mmap_write_unlock(current->mm);
+
+	NODEMASK_SCRATCH_FREE(scratch);
+	return err;
+}
+
 static long do_mbind(unsigned long start, unsigned long len,
 		     unsigned short mode, unsigned short mode_flags,
 		     nodemask_t *nmask, unsigned long flags)
@@ -1306,17 +1325,8 @@ static long do_mbind(unsigned long start, unsigned long len,
 
 		lru_cache_disable();
 	}
-	{
-		NODEMASK_SCRATCH(scratch);
-		if (scratch) {
-			mmap_write_lock(mm);
-			err = mpol_set_nodemask(new, nmask, scratch);
-			if (err)
-				mmap_write_unlock(mm);
-		} else
-			err = -ENOMEM;
-		NODEMASK_SCRATCH_FREE(scratch);
-	}
+
+	err = mpol_init_from_nodemask(new, nmask, false);
 	if (err)
 		goto mpol_out;
 
-- 
2.40.0.634.g4ca3ef3211-goog


