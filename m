Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F3337E74
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:47:49 +0100 (CET)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKRHf-0005U2-Vy
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKREg-00046s-Du
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:44:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKREZ-0004mN-TR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615491874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7NtbFmCMaQ86N+CtzaUoy8UETstolE7msF+4KvhY24Y=;
 b=CYt9KCN1IBku3CTgt32NSdizIsS+HuOWw2sWzm1DIZguPfBgF3ATtP3dPtQeJOj1C+gr8R
 Gxs/s3Ch4t3EX3IBmYnaMpSaJP9oXB/qQX/1cNph1D4OekpEn9qvnGY1/ezmYbzTJzwcIB
 FVbA5t2juvT24LqEFYXm3WQ7Oq85aPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-aznJHo2mNnCh5Berm3e1RQ-1; Thu, 11 Mar 2021 14:44:32 -0500
X-MC-Unique: aznJHo2mNnCh5Berm3e1RQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D19F18D6A2A;
 Thu, 11 Mar 2021 19:44:31 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCE2E5D9F2;
 Thu, 11 Mar 2021 19:44:26 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/2] target/s390x: Implement the MVPG condition-code-option
 bit
Date: Thu, 11 Mar 2021 20:44:24 +0100
Message-Id: <20210311194426.149044-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on work from Richard and Thomas.

v5 -> v6:
- "target/s390x: Implement the MVPG condition-code-option bit"
-- Better handle CONFIG_USER_ONLY
-- Factor handling out into s390_probe_access().
- "target/s390x: Store r1/r2 for page-translation exceptions during MVPG"
-- Store tec only for !PGM_ADDRESSING

v4 -> v5:
- Don't realy on TLB_INVALID_MASK
-- Check against tlb_fill_exc and return the exception right away
- Handle !CONFIG_USER_ONLY
-- Check against haddr
-- Properly store vaddr to env->__excp_addr and return PGM_ADDRESSING
- Exclude tlb_fill_tec/tlb_fill_exc for CONFIG_USER_ONLY
- While at it, tackle r1/r2 indication as well

KVM unit tests continue working as expected.

David Hildenbrand (1):
  target/s390x: Store r1/r2 for page-translation exceptions during MVPG

Richard Henderson (1):
  target/s390x: Implement the MVPG condition-code-option bit

 target/s390x/cpu.h         |   5 ++
 target/s390x/excp_helper.c |   3 +
 target/s390x/helper.h      |   2 +-
 target/s390x/insn-data.def |   2 +-
 target/s390x/mem_helper.c  | 160 ++++++++++++++++++++++++++++++-------
 target/s390x/translate.c   |   7 +-
 6 files changed, 146 insertions(+), 33 deletions(-)

-- 
2.29.2


