Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE862F118A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:35:05 +0100 (CET)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvTU-0004Fg-EJ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvPQ-0000u9-QY
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvPM-0006Ck-5e
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610364645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=+KIfK90vCRZwS+VDkKBvSVdDYYfZBVwlDNCXOaexfwc=;
 b=Y9Wmv7aPdpFEVMkURQWRdT3+6pBna3CGEYrCEm5q9c926Gno3Re4KlUBM3mkHFvy03oOZY
 AoBS/2MzIIxGE2qlk3rWO8/59tMOiLZdb+sJ+13OfwORowbgOzkT3J5RVRYVdQX/NrVKCH
 CUNwe99P21viPIrDqfvaOWmtHAlPuAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-5OEqv2zgOCWselDhFsendQ-1; Mon, 11 Jan 2021 06:30:43 -0500
X-MC-Unique: 5OEqv2zgOCWselDhFsendQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A46802B6A
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:42 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E18021972B
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:41 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [RHEL7 qemu-kvm PATCH 3/3] Fix tcg_out_op argument mismatch warning
Date: Mon, 11 Jan 2021 12:30:37 +0100
Message-Id: <96033fbea8ab38a769c0ac9c23a217b4b5d32864.1610364304.git.mrezanin@redhat.com>
In-Reply-To: <cover.1610364304.git.mrezanin@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

There's prototype mismatch between tcg/tcg.c and tcg/aarch/tcg-target.c.inc:

tcg.c:

    static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                           const int *const_args);

tcg-target.c.inc:

    static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                           const TCGArg args[TCG_MAX_OP_ARGS],
                           const int const_args[TCG_MAX_OP_ARGS])

This missmatch cause warnings on GCC 11:

    tcg/aarch64/tcg-target.c.inc:1855:37: error: argument 3 of type 'const TCGArg[16]' {aka 'const long unsigned int[16]'} with mismatched bound [-Werror=array-parameter=]
    tcg/aarch64/tcg-target.c.inc:1856:34: error: argument 4 of type 'const int[16]' with mismatched bound [-Werror=array-parameter=]

Only architectures with this definition are aarch and sparc. Fixing both archs to use
proper argument type.
---
 tcg/aarch64/tcg-target.c.inc | 3 +--
 tcg/sparc/tcg-target.c.inc   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 26f71cb599..fe6bdbf721 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1852,8 +1852,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 static tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                       const TCGArg args[TCG_MAX_OP_ARGS],
-                       const int const_args[TCG_MAX_OP_ARGS])
+                       const TCGArg *args, const int *const_args)
 {
     /* 99% of the time, we can signal the use of extension registers
        by looking to see if the opcode handles 64-bit data.  */
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 6775bd30fc..976f0f05af 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1294,8 +1294,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 }
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                       const TCGArg args[TCG_MAX_OP_ARGS],
-                       const int const_args[TCG_MAX_OP_ARGS])
+                       const TCGArg *args, const int *const_args)
 {
     TCGArg a0, a1, a2;
     int c, c2;
-- 
2.18.4


