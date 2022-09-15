Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A45BA22B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 23:05:59 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYw3Z-0000rj-QG
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 17:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhr-0001uI-8n
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhl-0000ID-Ub
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRlf1qaS6VlczMT2PmZq4zE7QsOav26h7vimJh6bjgw=;
 b=bmD2poLhqFheIp9sp/zCe6q2CWgoViiP20AOJTEhJeMYbQtEmt16YXgtnURP9pSRWcGQoe
 QNkBN1MB6Meum2sJ9qY6bbgW6GUYMqSjXTew/S9pajzIeOj4/fahIZ9HITNjHOXyS34up5
 /owDewo3/o9q/yI3A+wY3Vb8l2pOy24=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-8HpER-EgO0y9N4A4sO5U6g-1; Thu, 15 Sep 2022 16:43:23 -0400
X-MC-Unique: 8HpER-EgO0y9N4A4sO5U6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21CCA2A2AD64;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED5772166B29;
 Thu, 15 Sep 2022 20:43:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0FF7F21E66FD; Thu, 15 Sep 2022 22:43:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 19/27] qapi replay: Elide redundant has_FOO in generated C
Date: Thu, 15 Sep 2022 22:43:09 +0200
Message-Id: <20220915204317.3766007-20-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/replay.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 replay/replay-debugging.c | 1 -
 scripts/qapi/schema.py    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 1cde50e9f3..3e60549a4a 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -50,7 +50,6 @@ ReplayInfo *qmp_query_replay(Error **errp)
     retval->mode = replay_mode;
     if (replay_get_filename()) {
         retval->filename = g_strdup(replay_get_filename());
-        retval->has_filename = true;
     }
     retval->icount = replay_get_current_icount();
     return retval;
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index d92fd3b4d6..3aba200abb 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/replay.json',
             'qapi/rocker.json',
             'qapi/run-state.json',
             'qapi/stats.json',
-- 
2.37.2


