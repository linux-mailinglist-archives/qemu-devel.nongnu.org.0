Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C16BC6B9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:14:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcho3-0003lq-8k; Thu, 16 Mar 2023 03:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchns-0003j8-Tc
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchno-0004YS-Lv
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTx7L55fpeKIMQLSdfD4nXtyc19FXlrBhBi+qVAuLZU=;
 b=YqxrpEedsqniEWS6ZzRKUibVrXY+XpVQD63yG9io/pUowfFJjgXk0GXHaob8YokMblm6eb
 jIa28Qp8COgMFQlKL8qLA1q8rwwO9AcaPdPeeqzsHZFyu3m9zuRnqH83GQfYbmcOLQDbfy
 DsjnklWKD+kmzirZAppIyqbK3n3Nt24=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-FB5bn1caPNmvSvuZwm5pww-1; Thu, 16 Mar 2023 03:13:27 -0400
X-MC-Unique: FB5bn1caPNmvSvuZwm5pww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 190353C0F23C;
 Thu, 16 Mar 2023 07:13:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE1AA492C3E;
 Thu, 16 Mar 2023 07:13:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E86D321E6606; Thu, 16 Mar 2023 08:13:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 01/14] qapi: Fix error message format regression
Date: Thu, 16 Mar 2023 08:13:12 +0100
Message-Id: <20230316071325.492471-2-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


