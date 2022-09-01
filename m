Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF35AA166
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:16:18 +0200 (CEST)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrXs-000771-Tp
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp0W-0000Lb-5g
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:33:41 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:49439
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp0U-0001vp-6y
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:33:39 -0400
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 281IRv2g010380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 14:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1662056902; bh=8t7inFGquta1NGByhzLG9+mJKal1v4Fh4FJB1iWeSEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TSFHPo6Yii1RI/4YJzCXOiD+5LlwUkkTTFFI5n3DsBRZrjflJtTQiDwjqIgjzI32X
 ZryEVDtepvqj66moU/3WmxX4TBMn8x0YIz+J2odsrOg+5LBgzUQ0wPY36Q9O4DyxKO
 /g+yJV65ZvdxnQG8q2wuFy3ZEngmGwJwaZDd1Wf9CTCClJPvwe25e2QLK193B69ptZ
 C9sFXW/uI+cetqg5ssO+YUX1Msmv78p8A2esm45npySguDUu7Qupkf/xUqmqC3qe05
 OLN/ZQ2dQPtSpDzSwFGlVdFn7fCpja5QzDdBshgbyBlIhhSi2NR+Ez6SQYiFNzM8hA
 C7ehC//iWcyBg==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 Andrew Fasano <fasano@mit.edu>
Subject: [RFC 2/4] tcg/plugins: Automatically define CURRENT_PLUGIN
Date: Thu,  1 Sep 2022 14:27:32 -0400
Message-Id: <20220901182734.2987337-3-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901182734.2987337-1-fasano@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=fasano@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 17:11:38 -0400
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

Use plugin filenames to set the preprocessor variable CURRENT_PLUGIN
as a string during plugin compilation.

Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 contrib/plugins/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index df3499f4f2..b7720fea0f 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -34,7 +34,7 @@ CFLAGS += -I$(SRC_PATH)/include/qemu
 all: $(SONAMES)
 
 %.o: %.c
-	$(CC) $(CFLAGS) -c -o $@ $<
+	$(CC) $(CFLAGS) -DCURRENT_PLUGIN=\"$(basename $@)\" -c -o $@ $<
 
 lib%.so: %.o
 	$(CC) -shared -Wl,-soname,$@ -o $@ $^ $(LDLIBS)
-- 
2.34.1


