Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5FE240BD1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:20:35 +0200 (CEST)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BTO-0000jI-BS
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIu-00060C-D1
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42380
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIs-0002km-Hx
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLitUbpbM6irG8a+7TtGiqB3QI3hJzEWoxne18gjXGA=;
 b=Gso+xKpunmRDyVi9Alv8IH4IV1vo9FqBtF28uBdWFlBsU+M2gOD//5QLX0jPwBSSCB10JR
 WXQlBTUpLVMBGZHT70e9VGry0pNq0Lm+J+p+u+l28SbYms8XWoYXBQBI0cTbH1W+DlJcvJ
 gMPfWbELYfTDDZb6wn6fKojVHRL/djE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-bYfuge8SPZSaWKvy_ObeYA-1; Mon, 10 Aug 2020 13:09:40 -0400
X-MC-Unique: bYfuge8SPZSaWKvy_ObeYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C4779EC0
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:39 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B525F1E9;
 Mon, 10 Aug 2020 17:09:38 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 017/147] build-sys hack: link with whole .fa archives
Date: Mon, 10 Aug 2020 19:06:55 +0200
Message-Id: <1597079345-42801-18-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:31:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

In order to link the *-obj-y files into tests, we will make static
libraries of them in Meson, and then link them as whole archives
into the tests.  To separate regular static libraries from link-whole
libraries, give them a different file extension.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rules.mak | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/rules.mak b/rules.mak
index e79a400..5ab42de 100644
--- a/rules.mak
+++ b/rules.mak
@@ -39,6 +39,13 @@ find-symbols = $(if $1, $(sort $(shell $(NM) -P -g $1 | $2)))
 defined-symbols = $(call find-symbols,$1,awk '$$2!="U"{print $$1}')
 undefined-symbols = $(call find-symbols,$1,awk '$$2=="U"{print $$1}')
 
+WL := -Wl,
+ifdef CONFIG_DARWIN
+whole-archive = $(WL)-force_load,$1
+else
+whole-archive = $(WL)--whole-archive $1 $(WL)--no-whole-archive
+endif
+
 # All the .mo objects in -m variables are also added into corresponding -y
 # variable in unnest-vars, but filtered out here, when LINK is called.
 #
@@ -54,11 +61,12 @@ undefined-symbols = $(call find-symbols,$1,awk '$$2=="U"{print $$1}')
 # This is necessary because the exectuable itself may not use the function, in
 # which case the function would not be linked in. Then the DSO loading will
 # fail because of the missing symbol.
-process-archive-undefs = $(filter-out %.a %.mo,$1) \
+process-archive-undefs = $(filter-out %.a %.fa %.mo,$1) \
                 $(addprefix $(WL_U), \
-                     $(filter $(call defined-symbols,$(filter %.a, $1)), \
+                     $(filter $(call defined-symbols,$(filter %.a %.fa, $1)), \
                               $(call undefined-symbols,$(filter %.mo,$1)))) \
-                $(filter %.a,$1)
+		$(foreach l,$(filter %.fa,$1),$(call whole-archive,$l)) \
+		$(filter %.a,$1)
 
 extract-libs = $(strip $(foreach o,$(filter-out %.mo,$1),$($o-libs)))
 expand-objs = $(strip $(sort $(filter %.o,$1)) \
@@ -122,7 +130,7 @@ LD_REL := $(CC) -nostdlib $(LD_REL_FLAGS)
 modules:
 
 %$(EXESUF): %.o
-	$(call LINK,$(filter %.o %.a %.mo, $^))
+	$(call LINK,$(filter %.o %.a %.mo %.fa, $^))
 
 %.a:
 	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"AR","$(TARGET_DIR)$@")
@@ -378,7 +386,7 @@ define unnest-vars
                 $(error $o added in $v but $o-objs is not set)))
         $(shell mkdir -p ./ $(sort $(dir $($v))))
         # Include all the .d files
-        $(eval -include $(patsubst %.o,%.d,$(patsubst %.mo,%.d,$($v))))
+        $(eval -include $(patsubst %.o,%.d,$(patsubst %.mo,%.d,$(filter %.o,$($v)))))
         $(eval $v := $(filter-out %/,$($v))))
 endef
 
-- 
1.8.3.1



