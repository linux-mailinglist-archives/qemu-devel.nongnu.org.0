Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28143C5E4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 11:00:04 +0200 (CEST)
Received: from localhost ([::1]:60496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfemx-0007Tl-0w
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 05:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1mfel6-0006LT-4h
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1mfel2-00073B-LK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635325082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7XNJDqCZEDCIw9t6wGU4jTuys067a4XVkzZQSqSPp/s=;
 b=ghqopFs1mm+8MMhclmR+9xniJpEcv4KWpsBhZU2LYKqeVaPKLNDUNa2HSuk5FyeJyiBpiX
 vXc3o7Ep++WsKbA+VsYNMyZsnb8urqAGIIGop52iYBgdoeIywzrQlJA8gfkawTWzSmWv+k
 xvLDwupDpM13Q/nKjNRHAhcbT3nh3UE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-IPH9IbkuMcSfihYScvYquQ-1; Wed, 27 Oct 2021 04:56:48 -0400
X-MC-Unique: IPH9IbkuMcSfihYScvYquQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C639EC1A3;
 Wed, 27 Oct 2021 08:56:47 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (unknown [10.40.192.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D71DD1980E;
 Wed, 27 Oct 2021 08:56:31 +0000 (UTC)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix tcg_out_vec_op argument type
Date: Wed, 27 Oct 2021 04:56:29 -0400
Message-Id: <20211027085629.240704-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newly defined tcg_out_vec_op (34ef767609 tcg/s390x: Add host vector framework)
for s390x uses pointer argument definition.
This fails on gcc 11 as original declaration uses array argument:

In file included from ../tcg/tcg.c:430:
/builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:42: error: argument 5 of type 'const TCGArg *' {aka 'const long unsigned int *'} declared as a pointer [-Werror=array-parameter=]
 2702 |                            const TCGArg *args, const int *const_args)
      |                            ~~~~~~~~~~~~~~^~~~
../tcg/tcg.c:121:41: note: previously declared as an array 'const TCGArg[16]' {aka 'const long unsigned int[16]'}
  121 |                            const TCGArg args[TCG_MAX_OP_ARGS],
      |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
In file included from ../tcg/tcg.c:430:
/builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:59: error: argument 6 of type 'const int *' declared as a pointer [-Werror=array-parameter=]
 2702 |                            const TCGArg *args, const int *const_args)
      |                                                ~~~~~~~~~~~^~~~~~~~~~
../tcg/tcg.c:122:38: note: previously declared as an array 'const int[16]'
  122 |                            const int const_args[TCG_MAX_OP_ARGS]);
      |                            ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixing argument type to pass build.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 tcg/s390x/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8938c446c8..57e803e339 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2699,7 +2699,8 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGType type = vecl + TCG_TYPE_V64;
     TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
-- 
2.27.0


