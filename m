Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F284E9938
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:19:39 +0200 (CEST)
Received: from localhost ([::1]:58262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqDa-0005Cx-Er
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:19:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxN-0001rk-Qr
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxM-0004la-7R
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7pXCjF61d4XC92jWNBorLNqSfo7NsGlj19zgA73IhE=;
 b=BqAKTDnqAMRBI4M6ekeWndt9sCQ77aHF+5sHI8PpAnYdc5PXRynn3NGH1tmP6yZrgnv7HF
 bV/9ogVno+TEwDEZPuGaZy2CWvfSXrZ3fD0vAFqmhOGqdAUI5dZjWwJ6EiWDyvkCBEXa7l
 eSq15XcY8EDFzIfRj5HeMcxazqH3/aY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-FKN0bHJTNDesy7twJbVo7g-1; Mon, 28 Mar 2022 10:02:42 -0400
X-MC-Unique: FKN0bHJTNDesy7twJbVo7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC73F38008BE;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94EF71121320;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/15] tests/docker: simplify docker-TEST@IMAGE targets
Date: Mon, 28 Mar 2022 10:02:32 -0400
Message-Id: <20220328140240.40798-8-pbonzini@redhat.com>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
References: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to go through the shell when we already have the test and images at
the point where the targets are declared.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 5cadd1b53e..e1bea20451 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -204,7 +204,9 @@ DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
-		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
+		$(eval docker-$t@$i: TEST=$t) \
+		$(eval docker-$t@$i: IMAGE=qemu/$i) \
+		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run) \
 	) \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval docker-all-tests: docker-$t@$i) \
@@ -298,14 +300,6 @@ docker-run: docker-qemu-src
 	$(call quiet-command, rm -r $(DOCKER_SRC_COPY), \
 		"  CLEANUP $(DOCKER_SRC_COPY)")
 
-# Run targets:
-#
-# Of the form docker-TEST-FOO@IMAGE-BAR which will then be expanded into a call to "make docker-run"
-docker-run-%: CMD = $(shell echo '$@' | sed -e 's/docker-run-\([^@]*\)@\(.*\)/\1/')
-docker-run-%: IMAGE = $(shell echo '$@' | sed -e 's/docker-run-\([^@]*\)@\(.*\)/\2/')
-docker-run-%:
-	@$(MAKE) docker-run TEST=$(CMD) IMAGE=qemu/$(IMAGE)
-
 docker-image: ${DOCKER_IMAGES:%=docker-image-%}
 
 docker-clean:
-- 
2.31.1



