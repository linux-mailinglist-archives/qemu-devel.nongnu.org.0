Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1C2F1B29
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:40:10 +0100 (CET)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0Ej-0006aA-4a
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kz0Db-0005Jk-Cb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:38:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kz0DZ-0000Wt-Qv
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610383136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DGbPaWnR70XP7MMK7wqAevOFZZsKsskPK6FLiZ8RhAo=;
 b=EFm6ZZYwvzgQw/z0zYSYEKKnKOy5AbFD/CaVr8i5LlpQDtCSLQ+EafpEbSfeKPwFOc4vjG
 rQnXh8PE6CnjzjFXk5GNqnmpHxVYwgWXtRgy5K9mcXB0gVejJgubXL3H5WU8wsSpxuOVmP
 l1IwljAEMsEovCzvUmcA6lWLHdejCME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-DrGwrbKUO9aMx-YuPKAE1Q-1; Mon, 11 Jan 2021 11:38:53 -0500
X-MC-Unique: DrGwrbKUO9aMx-YuPKAE1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA1578144E0;
 Mon, 11 Jan 2021 16:38:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-103.ams2.redhat.com [10.36.115.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8C4E1971A;
 Mon, 11 Jan 2021 16:38:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] s390x/tcg: fix booting Linux kernels compiled with
 clang-11 and clang-12
Date: Mon, 11 Jan 2021 17:38:40 +0100
Message-Id: <20210111163845.18148-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Heiko Carstens <hca@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes booting current upstream Linux kernel compiled by
clang-11 and clang-12 under TCG.

Latest version of the patches available at:
git@github.com:davidhildenbrand/qemu.git clang

v2 -> v3:
- Add 'tests/tcg/s390x: Fix EXRL tests'
-- "make check-tcg" with v2 revealed two buggy tests
- Added RB's/Tested-by's

v1 -> v2:
- Add 's390x/tcg: Don't ignore content in r0 when not specified via "b" or
  "x"'
- Add 's390x/tcg: Ignore register content if b1/b2 is zero when handling
  EXEUTE'
- "s390x/tcg: Fix ALGSI"
-- Fixup subject
- "s390x/tcg: Fix RISBHG"
-- Rephrase description, stating that it fixes clang-11

David Hildenbrand (5):
  s390x/tcg: Fix ALGSI
  s390x/tcg: Fix RISBHG
  s390x/tcg: Don't ignore content in r0 when not specified via "b" or
    "x"
  tests/tcg/s390x: Fix EXRL tests
  s390x/tcg: Ignore register content if b1/b2 is zero when handling
    EXECUTE

 target/s390x/insn-data.def  | 10 +++++-----
 target/s390x/mem_helper.c   |  4 ++--
 target/s390x/translate.c    | 33 +++++++++++++++++----------------
 tests/tcg/s390x/exrl-trt.c  |  8 ++++----
 tests/tcg/s390x/exrl-trtr.c |  8 ++++----
 5 files changed, 32 insertions(+), 31 deletions(-)

-- 
2.29.2


