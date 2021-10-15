Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F942F209
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:22:26 +0200 (CEST)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbNAH-0007Jb-IN
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mbN5c-0001QO-27
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:17:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mbN5Z-0002M5-BR
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634303852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RJchtTRb8K4f1LamO424rloJhN6Cwn94hqLkenNGvk=;
 b=jWqBKa70yKR2B7cIzY6xMITOXtwXyxjMCyRq4nsI+SvJ4Lyl3Z4Emy/mdJEUNemuIgm4WV
 5KybeC6uYXf4/zs50QDJJyjYLsGFu93rSYpbaF3m6KNTv7QEOahgrojz8Rg7bzn7Khn2ab
 2NL/NloB8PtPb89Ua9vovbgyhHRyeWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-VV4shiOIPGKN0NASlMb8sA-1; Fri, 15 Oct 2021 09:17:31 -0400
X-MC-Unique: VV4shiOIPGKN0NASlMb8sA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB5041006AA3;
 Fri, 15 Oct 2021 13:17:29 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C82F660C13;
 Fri, 15 Oct 2021 13:17:06 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] analyze-migration.py: fix extract contents ('-x') errors
Date: Fri, 15 Oct 2021 15:16:45 +0200
Message-Id: <20211015131645.501281-3-lvivier@redhat.com>
In-Reply-To: <20211015131645.501281-1-lvivier@redhat.com>
References: <20211015131645.501281-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we try to use 'analyze-migration.py -x' with python3,
we have the following errors:

  Traceback (most recent call last):
    File "scripts/analyze-migration.py", line 593, in <module>
      f.write(jsonenc.encode(dump.vmsd_desc))
  TypeError: a bytes-like object is required, not 'str'

  Traceback (most recent call last):
    File "scripts/analyze-migration.py", line 601, in <module>
      f.write(jsonenc.encode(dict))
  TypeError: a bytes-like object is required, not 'str'

This happens because the file 'f' is open in binary mode while
jsonenc.encode() returns a string.

The results are human-readable files, 'desc.json' and 'state.json',
so there is no reason to use the binary mode.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/analyze-migration.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index 9d239d309f33..b82a1b0c58c4 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -588,7 +588,7 @@ def default(self, o):
 
     dump.read(desc_only = True)
     print("desc.json")
-    f = open("desc.json", "wb")
+    f = open("desc.json", "w")
     f.truncate()
     f.write(jsonenc.encode(dump.vmsd_desc))
     f.close()
@@ -596,7 +596,7 @@ def default(self, o):
     dump.read(write_memory = True)
     dict = dump.getDict()
     print("state.json")
-    f = open("state.json", "wb")
+    f = open("state.json", "w")
     f.truncate()
     f.write(jsonenc.encode(dict))
     f.close()
-- 
2.31.1


