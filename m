Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C07C382B82
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:53:34 +0200 (CEST)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liboS-0000Kc-Rk
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIM-00062Z-Iz
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIK-0006Oj-Dn
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwqqzb7p7dGbaaVZ8fNrxOwZNiGEn5YAsgDFN5UOSjQ=;
 b=a5ZviMZ8zcANGfdoyuZAPbj94Yh62MRnlqbJGdxRZXCMXZhttqnSmNo8JbQqUZM8agSfhs
 k5hH2P3a/tXn7FaoOEFYlLRfQJgy8mb1zycHAsCImYE0JsOEKo8k/C522AErDWKeQpOngQ
 9aiUSRs7dVsQH4XERt4qgl+rWpoBB04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-ISG4D6m-NZmEP3h64rzQbw-1; Mon, 17 May 2021 07:20:18 -0400
X-MC-Unique: ISG4D6m-NZmEP3h64rzQbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66F0107AD25
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 729B519726
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] object: add more commands to preconfig mode
Date: Mon, 17 May 2021 07:19:49 -0400
Message-Id: <20210517112001.2564006-9-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Creating and destroying QOM objects does not require a fully constructed
machine.  Allow running object-add and object-del before machine
initialization has concluded.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx | 2 ++
 qapi/qom.json   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591a1c..146a13c896 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1297,6 +1297,7 @@ ERST
         .help       = "create QOM object",
         .cmd        = hmp_object_add,
         .command_completion = object_add_completion,
+        .flags      = "p",
     },
 
 SRST
@@ -1311,6 +1312,7 @@ ERST
         .help       = "destroy QOM object",
         .cmd        = hmp_object_del,
         .command_completion = object_del_completion,
+        .flags      = "p",
     },
 
 SRST
diff --git a/qapi/qom.json b/qapi/qom.json
index cd0e76d564..f1e243dbe5 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -857,7 +857,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true }
+{ 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true,
+  'allow-preconfig': true }
 
 ##
 # @object-del:
@@ -877,4 +878,5 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'object-del', 'data': {'id': 'str'} }
+{ 'command': 'object-del', 'data': {'id': 'str'},
+  'allow-preconfig': true }
-- 
2.27.0



