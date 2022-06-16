Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68654E1C7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:21:20 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pR1-0007TX-OS
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ooe-0001X3-N5
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ood-0005sN-4b
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655383295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Et7o+gm789s34jZqe/LwIE8WIv+NIHpOHYPmrL3ytP8=;
 b=bbG1g7pZ8MUlOY2W7dp6upgt4+ynMwHO6P4ArcrqlRS3mZnRDYGrrCGrRQnNqc4XnAF+17
 1ZTcO5ODTG4oU2Oy2IrLhcyBUx/I7N6KtPZ6nMbDgcwz2k8wOyd1riddTo3UUkQdNUQrt3
 JsQlmAXOq4QwYDaBcGfUMD56ZPKNMT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-mf8Vj5tQNSCy7A57D0VbIw-1; Thu, 16 Jun 2022 08:41:31 -0400
X-MC-Unique: mf8Vj5tQNSCy7A57D0VbIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 301D5101E986;
 Thu, 16 Jun 2022 12:41:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D71D111F5;
 Thu, 16 Jun 2022 12:41:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 9/9] scripts/qapi: add required system includes to visitor
Date: Thu, 16 Jun 2022 16:40:34 +0400
Message-Id: <20220616124034.3381391-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The generated visitor code includes abort() & assert(), we shouldn't
rely on the global "-i" headers to include the necessary system headers.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/visit.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 1ff464c0360f..d686df17f4b6 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -326,6 +326,8 @@ def __init__(self, prefix: str, include: List[str]):
     def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
 %(include)s
+#include <assert.h>
+#include <stdlib.h>
 
 #include "qapi/error.h"
 #include "qapi/qapi-builtin-visit.h"
@@ -342,6 +344,8 @@ def _begin_user_module(self, name: str) -> None:
         visit = self._module_basename('qapi-visit', name)
         self._genc.preamble_add(mcgen('''
 %(include)s
+#include <assert.h>
+#include <stdlib.h>
 
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-- 
2.37.0.rc0


