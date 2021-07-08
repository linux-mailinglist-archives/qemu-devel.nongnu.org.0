Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4B3C16B0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:56:52 +0200 (CEST)
Received: from localhost ([::1]:57674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WOR-0005GY-Ev
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1VoY-0004uq-M5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1VoW-0000IB-6O
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625757583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8UOuausianCpPWGxdUgya+0i6jSE+3MuZF3J/m/UX4=;
 b=hm4nDFoJpcz5/oUJvTPNogKnZFp/NtnD07JbKzD1+49TjP8XRDIsXzMnMuUDVQ7xuBAZP8
 mzHSC2eOXRLOpv3nllBPc9TdeNr/WHko6y5D5sWF9ob8Bjl+2NwSyNEcU8P82wk8iRSWq8
 cgH2oWyOONESWeMkjdgAmBr1LxwL3ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-Mne4GzruPIC9W5whRiqv6w-1; Thu, 08 Jul 2021 11:19:42 -0400
X-MC-Unique: Mne4GzruPIC9W5whRiqv6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67001084F62;
 Thu,  8 Jul 2021 15:19:40 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-175.ams2.redhat.com
 [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C70BB19C66;
 Thu,  8 Jul 2021 15:19:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/17] s390x/tcg: Fix m5 vs. m4 field for VECTOR MULTIPLY SUM
 LOGICAL
Date: Thu,  8 Jul 2021 17:18:55 +0200
Message-Id: <20210708151909.907124-4-cohuck@redhat.com>
In-Reply-To: <20210708151909.907124-1-cohuck@redhat.com>
References: <20210708151909.907124-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
 Cornelia Huck <cohuck@redhat.com>,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

The element size is located in m5, not in m4. As there is no m4, qemu
currently crashes with an assertion, trying to lookup that field.

Reproduced and tested via GO, which ends up using VMSL once the
Vector enhancements facility is around for verifying certificates with
elliptic curves.

Reported-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/449
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Fixes: 8c18fa5b3eba ("s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL")
Message-Id: <20210705090341.58289-1-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/translate_vx.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index a9d51b1f4cd6..0afa46e4637b 100644
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


