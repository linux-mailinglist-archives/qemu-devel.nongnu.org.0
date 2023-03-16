Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB386BC2AB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbWc-0003zq-Sc; Wed, 15 Mar 2023 20:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VWMSZAsKCowqs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com>)
 id 1pcbWa-0003zX-6y
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:20 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VWMSZAsKCowqs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com>)
 id 1pcbWY-0007dD-NL
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:19 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 ch1-20020a0569020b0100b00b3cc5b4fa9dso104265ybb.12
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 17:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678926677;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=rreqZKmQJtCTOHmDtxKTKEfGS9dImrAo0RCl95Sk/EE=;
 b=JJueoK7sdFHQHbdAl5nsqaNs4KCHm7sHzvLB42MnoY5lkfM6ZyYxqRBfJSJa8Yj0AO
 a2uaVznX+a7AGF4HtGGnVlQphXnV9jEi1nR4tPRumBxVDCE+WOnyJKaxZt8wQIJXoXkp
 loUdl05RrEtBxZJ1mxGOVb+Igf7OXAXS6g5lENKD5GhCbaaHIbFWr/+X13ZJvgEAeOrT
 ejL8r4WfIiMkFavlKyXDdwKqsnArh0+uyWf18MM3tbJLCmk8NSuRhA6hTr60P2bZx80K
 jj0hiuo3QlpYfzngCqcd5OQKvr0RQN1Z1ORNuOh1qFkI0/mHIDpESFq+n7v7NaT1lIXl
 wVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678926677;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rreqZKmQJtCTOHmDtxKTKEfGS9dImrAo0RCl95Sk/EE=;
 b=2Wwe2DOgHPqBSgwwFmv245nvUc+xz7A3uv6dPpG0lI2rH72FyrCYDUbRJqwTvkWlv5
 dw+t6FH3hHAbd59VSZkg+tEZVaX981HknkFQfvSO6rm1HPIlC4hGMa5aELu+YLJhEerk
 ZxPtwGaiqq66YdDFHDVUF32qJlgnp4jmKOdWkFLOmkMRFzHoenlLyGE0Pbf0yJ3UPAf5
 MgcNgj4ajaXPDuLGjoWGAyugEs3/iScHx5tQynpPh6ncvcaRafD78x/hfymX7LMZD3W6
 5abqOKFqu66slk525xPNwhqGkCvdDaXfIkQncsTwjilPp5mQzCSu6YQFxCU0nIA2JHyq
 YliA==
X-Gm-Message-State: AO0yUKXTpsL6jNrvURoe893ksO5F2nQzuYCI0jju7Gf+TrsIBjKAY4S+
 ZsJWKKE2yiOE5janJccAyOT1q1a58uBm9APM5g==
X-Google-Smtp-Source: AK7set+ivCVtWOdQbcZQUI9O6fTh7qxu3KKcJWd7M8I6rNN0cLeTsP1prymLMADMTsLDtTPgMIN1PCmQzWdKXvBTyw==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a25:e201:0:b0:b2e:f387:b428 with SMTP
 id h1-20020a25e201000000b00b2ef387b428mr12671962ybe.5.1678926677076; Wed, 15
 Mar 2023 17:31:17 -0700 (PDT)
Date: Thu, 16 Mar 2023 00:30:54 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <017a3f68ef7007d72f167f937fabd6d64efb9edc.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 01/10] KVM: selftests: Test error message fixes for
 memfd_restricted selftests
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
 yu.c.zhang@linux.intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3VWMSZAsKCowqs0u71uE93ww44w1u.s426u2A-tuBu1343w3A.47w@flex--ackerleytng.bounces.google.com;
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

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/vm/memfd_restricted.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/memfd_restricted.c b/tools/testing/selftests/vm/memfd_restricted.c
index 3a556b570129..43a512f273f7 100644
--- a/tools/testing/selftests/vm/memfd_restricted.c
+++ b/tools/testing/selftests/vm/memfd_restricted.c
@@ -49,12 +49,12 @@ static void test_file_size(int fd)
 	}
 
 	if (sb.st_size != page_size) {
-		fail("unexpected file size after ftruncate");
+		fail("unexpected file size after ftruncate\n");
 		return;
 	}
 
 	if (!ftruncate(fd, page_size * 2)) {
-		fail("unexpected ftruncate\n");
+		fail("size of file cannot be changed once set\n");
 		return;
 	}
 
-- 
2.40.0.rc2.332.ga46443480c-goog


