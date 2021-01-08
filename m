Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5772EF2FA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 14:24:43 +0100 (CET)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxrkw-0007IZ-Rh
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 08:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxrhU-0005ld-57
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxrhO-0002eb-9E
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610112059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5gSG9SgXlAJZFFwSunzJ7h/OK6L5MCQapob9rtlXa5c=;
 b=GAK0u2OLucfVY5MjgWArcIuHxPzh5tyiJdRz8NtraLVJL4yis4T08IV8gNBukneGPGefrD
 Iu+Du3VcQB0PGvzSO9haesg7ILsCTA7MR8Z7L5IvNnS2rUxENymzxmRDI+pQAxwNDKB0kh
 Hdyn+UPn4Fl3OTR9LRJHprXnmrOHX3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-e51DwyXaOt2wY4plZSXtVw-1; Fri, 08 Jan 2021 08:20:58 -0500
X-MC-Unique: e51DwyXaOt2wY4plZSXtVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE56B107ACE3;
 Fri,  8 Jan 2021 13:20:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-168.ams2.redhat.com [10.36.114.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D958F5D9C0;
 Fri,  8 Jan 2021 13:20:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] s390x/tcg: fix booting Linux kernels compiled with
 clang-11 and clang-12
Date: Fri,  8 Jan 2021 14:20:45 +0100
Message-Id: <20210108132049.8501-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Decided to pull in already separatly sent patches. The last patch is
not required to fix the boot issues, but related to patch #3.

Latest version of the patches available at:
git@github.com:davidhildenbrand/qemu.git clang

v1 -> v2:
- Add 's390x/tcg: Don't ignore content in r0 when not specified via "b" or
  "x"'
- Add 's390x/tcg: Ignore register content if b1/b2 is zero when handling
  EXEUTE'
- "s390x/tcg: Fix ALGSI"
-- Fixup subject
- "s390x/tcg: Fix RISBHG"
-- Rephrase description, stating that it fixes clang-11

David Hildenbrand (4):
  s390x/tcg: Fix ALGSI
  s390x/tcg: Fix RISBHG
  s390x/tcg: Only ignore content in r0 when specified via "b" or "x"
  s390x/tcg: Ignore register content if b1/b2 is zero when handling
    EXECUTE

 target/s390x/insn-data.def | 10 +++++-----
 target/s390x/mem_helper.c  |  4 ++--
 target/s390x/translate.c   | 33 +++++++++++++++++----------------
 3 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.29.2


