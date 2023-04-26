Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4B6EEDE5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 08:00:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAC-00068n-A9; Wed, 26 Apr 2023 01:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA5-000650-2a
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA1-0002l8-Sk
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Hz9ZJyOHb7HeMMGGGjq9hemFWL+7NMJVM41BZbVF+U=;
 b=CDUq313j2IT5QN2YL/GEgrJBcc1l4laBhg9DegdPz7ZJurMsW6czN4VhwSGs7BL+dPeywy
 eUjow2BOgQV0Eq0EYBTdoRAuXzqfl6E7YkZyG2rjvTH8T2ztv86Iw8fG/267OsZjWAvScJ
 RGuAIgxDDIrYCP98FPulM0UNb5FMo3I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-VY1c3qtyMhCCTrJ_ToMP6Q-1; Wed, 26 Apr 2023 01:57:45 -0400
X-MC-Unique: VY1c3qtyMhCCTrJ_ToMP6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CF2885C069;
 Wed, 26 Apr 2023 05:57:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B80640C6E67;
 Wed, 26 Apr 2023 05:57:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1FD0B21F1674; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Eric Blake <eblake@redhat.com>
Subject: [PULL 01/17] qapi: Fix error message format regression
Date: Wed, 26 Apr 2023 07:57:28 +0200
Message-Id: <20230426055744.1041930-2-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 52a474180ae3 changed reporting of errors connected to a source
location without mentioning it in the commit message.  For instance,

    $ python scripts/qapi-gen.py tests/qapi-schema/unknown-escape.json
    tests/qapi-schema/unknown-escape.json:3:21: unknown escape \x

became

    scripts/qapi-gen.py: tests/qapi-schema/unknown-escape.json:3:21: unknown escape \x

This is not how compilers report such errors, and Emacs doesn't
recognize the format.  Revert this change.

Fixes: 52a474180ae3 (qapi-gen: Separate arg-parsing from generation)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230316071325.492471-2-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/main.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index fc216a53d3..316736b6a2 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -98,6 +98,6 @@ def main() -> int:
                  builtins=args.builtins,
                  gen_tracing=not args.suppress_tracing)
     except QAPIError as err:
-        print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
+        print(err, file=sys.stderr)
         return 1
     return 0
-- 
2.39.2


