Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1974C6E4F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:36:01 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgC0-0002Pw-HU
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:36:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg65-0007Wg-0W
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg63-00033u-85
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646054990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dynvF/iKean0HkaBjgC3C8YpLF9Bg6djdc4zquMPsrU=;
 b=Cjmbfs0/dysEAbJvtDfdD3vMJW7iwgvfldQ3KaBa/NuR+jQ2JG5Kchh6FzqlQS92TqAWvD
 yAgRLvxxymb0Z46dje+TPVYhBviqyZkrqqwfF3GX7iYloWBydwwspJbtyjGmYZtyeLpYr7
 60BNL+9FjRIGkSlxXG5IrOfLeXyrh04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-hFS_a09GPqqiYcNF7WfN7A-1; Mon, 28 Feb 2022 08:29:46 -0500
X-MC-Unique: hFS_a09GPqqiYcNF7WfN7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46EFA8031E1;
 Mon, 28 Feb 2022 13:29:45 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF7AD7A3F3;
 Mon, 28 Feb 2022 13:29:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] s390x: sck: load into a temporary not into in1
Date: Mon, 28 Feb 2022 14:29:31 +0100
Message-Id: <20220228132936.1411176-2-thuth@redhat.com>
In-Reply-To: <20220228132936.1411176-1-thuth@redhat.com>
References: <20220228132936.1411176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Nico Boehr <nrb@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nico Boehr <nrb@linux.ibm.com>

We previously loaded into in1, but in1 is not filled during
disassembly and hence always zero. This leads to an assertion failure:

  qemu-system-s390x: /home/nrb/qemu/include/tcg/tcg.h:654: temp_idx:
  Assertion `n >= 0 && n < tcg_ctx->nb_temps' failed.`

Instead, use in2_la2_m64a to load from storage into in2 and pass that to
the helper, which matches what we already do for SCKC.

This fixes the SCK test I sent here under TCG:
<https://www.spinics.net/lists/kvm/msg265169.html>

Fixes: 9dc67537 ("s390x/tcg: implement SET CLOCK ")
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
Message-Id: <20220126084201.774457-1-nrb@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/insn-data.def | 2 +-
 target/s390x/tcg/translate.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 1c3e115712..4911952080 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1317,7 +1317,7 @@
 /* SET ADDRESS SPACE CONTROL FAST */
     F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
 /* SET CLOCK */
-    F(0xb204, SCK,     S,     Z,   la2, 0, 0, 0, sck, 0, IF_PRIV | IF_IO)
+    F(0xb204, SCK,     S,     Z,   0, m2_64a, 0, 0, sck, 0, IF_PRIV | IF_IO)
 /* SET CLOCK COMPARATOR */
     F(0xb206, SCKC,    S,     Z,   0, m2_64a, 0, 0, sckc, 0, IF_PRIV | IF_IO)
 /* SET CLOCK PROGRAMMABLE FIELD */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 46dea73357..e21da539e5 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4290,8 +4290,7 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUQ | MO_ALIGN);
-    gen_helper_sck(cc_op, cpu_env, o->in1);
+    gen_helper_sck(cc_op, cpu_env, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
-- 
2.27.0


