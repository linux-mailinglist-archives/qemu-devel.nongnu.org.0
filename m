Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C76BC2AC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbWZ-0003zT-B6; Wed, 15 Mar 2023 20:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UGMSZAsKCoclnvp2wp94yrrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--ackerleytng.bounces.google.com>)
 id 1pcbWW-0003yx-QN
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:16 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UGMSZAsKCoclnvp2wp94yrrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--ackerleytng.bounces.google.com>)
 id 1pcbWU-0007c1-UE
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:16 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 s20-20020a056a00179400b005c4d1dedc1fso174321pfg.11
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 17:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678926672;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hT7y2XaFexWW4GTLeQpLaRg79NNFfwA0Go2glRLgBd0=;
 b=Nz5kUB5UsktVLM+1ioYn0/f+EE3tG8bYDmBZ7k4J/Gt/p5gTfQtvXXnoIclpQPuDya
 iUSZv4Ya8c29iPtlOA7O8kWfsasypPc8z6XfRhbOcsmBwYKUvOolqz9fQyk7NgQiLh/7
 c/HaSbFKMHr9gsoqPFgvukhunTri9uzxM+/T1bb2dlQR9ihIBftzfIgbbB2EA9ig0QfN
 QH/Qst7Frnk64y0MYkI8/9p+OMNZJnbfWHBkKL+LoqwoHnfU22JRu1wnbHr5/KauoW4g
 wseQ2RJb2qNMKAO2J1HN6p/Ws+7+zkBAtzloNtEG5key9qZ2BL1aJc7RLJD21ClZZS8U
 CQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678926672;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hT7y2XaFexWW4GTLeQpLaRg79NNFfwA0Go2glRLgBd0=;
 b=qFoVzw1YupFMw9liq1cjy3tmxe68gz9PdVs6zEaKbwhJA1d8544wTBSOwIoPxG6gS0
 F3agvrmkh9ZcPdMMa6el+3B6UzNpE4uJJCR98r99c58p/DkWf2o/PuRakhk9FucFZye0
 QE/T+Q97T+FlksuzQCjLWIGXnVUIfslD3gDtPwWe70AkvHWtVa7j0Q8MbQOyZoQpsxyP
 x44IbUFSTcPjo+mB7p+5R8Vw9zVscWTEAVgtt9b3Ws86TwAQ5P/KhOZE7kHSXU7VZiHb
 87CgfLWlM6+COsQzWhJVatA+QB408X9H95zMVEJqsfCHGjmZ3Y9O6Bqf8IBtMsc/bwTZ
 TO2w==
X-Gm-Message-State: AO0yUKXJj04asuav3VnPnE6qPtNGk3iAaRJozPK5Fis2WY61Yqkouu+f
 /XXUNLZFt6QaZANzj8yoT4aZJaYEmEzMmSf8RQ==
X-Google-Smtp-Source: AK7set8RzBYOsHbOBr2r5L/IBVJur+dXP5lqulE2m7qrJjHyB4MEFVa/vv90/0ZD7J2Luh92QLgQMrMQJM0g7dhFsw==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:90a:ea89:b0:237:2516:f76a with
 SMTP id h9-20020a17090aea8900b002372516f76amr548955pjz.2.1678926672510; Wed,
 15 Mar 2023 17:31:12 -0700 (PDT)
Date: Thu, 16 Mar 2023 00:30:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <cover.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 00/10] Additional selftests for restrictedmem
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
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3UGMSZAsKCoclnvp2wp94yrrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--ackerleytng.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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

Hello,

This is a series containing additional selftests for restrictedmem,
prepared to be used with the next iteration of the restrictedmem
series after v10.

restrictedmem=C2=A0v10 is available at
https://lore.kernel.org/lkml/20221202061347.1070246-1-chao.p.peng@linux.int=
el.com/T/.

The tree can be found at
https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-additional-=
selftests-rfc-v1/.

Dependencies
+ The next iteration of the restrictedmem series
    + branch: https://github.com/chao-p/linux/commits/privmem-v11.4
    + commit: https://github.com/chao-p/linux/tree/ddd2c92b268a2fdc6158f82a=
6169ad1a57f2a01d
+ Proposed fix to adjust VM's initial stack address to align with SysV
  ABI spec: https://lore.kernel.org/lkml/20230227180601.104318-1-ackerleytn=
g@google.com/

Ackerley Tng (10):
  KVM: selftests: Test error message fixes for memfd_restricted
    selftests
  KVM: selftests: Test that ftruncate to non-page-aligned size on a
    restrictedmem fd should fail
  KVM: selftests: Test that VM private memory should not be readable
    from host
  KVM: selftests: Exercise restrictedmem allocation and truncation code
    after KVM invalidation code has been unbound
  KVM: selftests: Generalize private_mem_conversions_test for parallel
    execution
  KVM: selftests: Default private_mem_conversions_test to use 1 memslot
    for test data
  KVM: selftests: Add vm_userspace_mem_region_add_with_restrictedmem
  KVM: selftests: Default private_mem_conversions_test to use 1
    restrictedmem file for test data
  KVM: selftests: Add tests around sharing a restrictedmem fd
  KVM: selftests: Test KVM exit behavior for private memory/access

 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/include/kvm_util_base.h     |   4 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  46 ++-
 .../selftests/kvm/set_memory_region_test.c    |  29 +-
 .../kvm/x86_64/private_mem_conversions_test.c | 295 +++++++++++++++---
 .../kvm/x86_64/private_mem_kvm_exits_test.c   | 124 ++++++++
 tools/testing/selftests/vm/memfd_restricted.c |   9 +-
 7 files changed, 455 insertions(+), 53 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_kvm_exit=
s_test.c

--
2.40.0.rc2.332.ga46443480c-goog

