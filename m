Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78C3BB9CB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:04:51 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KX3-00007F-QS
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0KW8-0007mm-2E
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:03:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0KW4-0006rG-90
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625475826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FcO7oHeF+1x6jFGmOHhvPGwU3OhDUIsfwx504HI2+Wo=;
 b=JZ+PbB6tgiBAfuq8s8wMrKnke5JNLUgli+oIeMWDsUxuHForjYpIciLPB1WiplGb17UMuv
 vaf/Y5Y2Ygiv009/tKDTeLNjhFv1mCjaTOy74F14L9HOe7U6dEnejC9chuwR4x22ublhV2
 KCvYITj0Kq07x/kxYadrSBaJAKn4mQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-NoNeVyIJOoG1lslTbGlAjw-1; Mon, 05 Jul 2021 05:03:45 -0400
X-MC-Unique: NoNeVyIJOoG1lslTbGlAjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D899F92B;
 Mon,  5 Jul 2021 09:03:44 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 964C15C1A1;
 Mon,  5 Jul 2021 09:03:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] s390x/tcg: Fix m5 vs. m4 field for VECTOR MULTIPLY SUM
 LOGICAL
Date: Mon,  5 Jul 2021 11:03:41 +0200
Message-Id: <20210705090341.58289-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The element size is located in m5, not in m4. As there is no m4, qemu
currently crashes with an assertion, trying to lookup that field.

Reproduced and tested via GO, which ends up using VMSL once the
Vector enhancements facility is around for verifying certificates with
elliptic curves.

Reported-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/449
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/translate_vx.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index a9d51b1f4c..0afa46e463 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -1783,7 +1783,7 @@ static DisasJumpType op_vmsl(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 l1, h1, l2, h2;
 
-    if (get_field(s, m4) != ES_64) {
+    if (get_field(s, m5) != ES_64) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-- 
2.31.1


