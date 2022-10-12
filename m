Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4BC5FCAB8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:36:38 +0200 (CEST)
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigar-0000FX-Ov
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSc-00029I-HJ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSa-0002wQ-Ml
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665599284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noJzKbbdefCfLpUbj0cOlOZkwGegKHgpzZnm4rGIAwY=;
 b=WlTpP40Rg1rdjzsxTjBMfE9kPLh/AOq4PO1DTWq5ierpH2dqQgdLjoBrj14Q+FB2coPB9T
 JlblvRIrffCjnK8iZwgJBqugQRC+5xwH2VXLCDSh6Lw4PECn6GBBHaA4LYjBEL3e+czd18
 fexJZBZk9AEwONp3Fq8INQ5MGqhemdI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-BlR0IwCVOzy7CvJNFGb3GQ-1; Wed, 12 Oct 2022 14:28:02 -0400
X-MC-Unique: BlR0IwCVOzy7CvJNFGb3GQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 538D0804186;
 Wed, 12 Oct 2022 18:28:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E30E40449D5;
 Wed, 12 Oct 2022 18:28:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/s390x: Fix emulation of the VISTR instruction
Date: Wed, 12 Oct 2022 20:27:54 +0200
Message-Id: <20221012182755.1014853-3-thuth@redhat.com>
In-Reply-To: <20221012182755.1014853-1-thuth@redhat.com>
References: <20221012182755.1014853-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The element size is encoded in the M3 field, not in the M4
field.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1248
Fixes: be6324c6b734 ("s390x/tcg: Implement VECTOR ISOLATE STRING")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate_vx.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 3526ba3e3b..b69c1a111c 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2723,7 +2723,7 @@ static DisasJumpType op_vfene(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_vistr(DisasContext *s, DisasOps *o)
 {
-    const uint8_t es = get_field(s, m4);
+    const uint8_t es = get_field(s, m3);
     const uint8_t m5 = get_field(s, m5);
     static gen_helper_gvec_2 * const g[3] = {
         gen_helper_gvec_vistr8,
-- 
2.31.1


