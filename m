Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A333AE02
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:56:56 +0100 (CET)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLj1z-0007GB-EN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj0A-0006N7-Mc
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:55:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj08-0004jV-57
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615798498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NLPQjSwAbIWUR/2McXaCrbUuUoWIOeytzoO4pvASgqM=;
 b=eLwdQi9SdLDGqeyrxgiU2SE8Ci8ht4wpEJrD16ddNSQANARFb1RGSZfNViW4cKHCVERQGo
 CDA1B4QLYYMXSh5yZZE2CtywGKAbWVdKY7Fsd7waYztvIrW4l02nFc1RaJhBSx8RRAe2Ex
 23HUY0Esb7GmCdLqtNcwg2cawXofPCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-UoJm8xVMOHq1cFauD9_dbg-1; Mon, 15 Mar 2021 04:54:56 -0400
X-MC-Unique: UoJm8xVMOHq1cFauD9_dbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B211800C78;
 Mon, 15 Mar 2021 08:54:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A163A62A03;
 Mon, 15 Mar 2021 08:54:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/2] target/s390x: Implement the MVPG condition-code-option
 bit
Date: Mon, 15 Mar 2021 09:54:47 +0100
Message-Id: <20210315085449.34676-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v6 -> v7:
- "target/s390x: Implement the MVPG condition-code-option bit"
-- Fix PGM_PROTECTION for QEMU_USER_ONLY (overridden by patch #2)

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


