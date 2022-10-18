Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A06025B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:29:52 +0200 (CEST)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh2o-0004al-HU
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg85-0008DA-R0
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg83-0001kP-S0
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esTensj2EfWOvBk+soz4g5CQOaEC4qRBlI4XgAcVRcM=;
 b=HUeUFmAEslQhwSDDFzDJf00MnAXXXLUbA5dcZlRQhuRqPsB2BRj8wbHhiT4WIVM0QpwOVY
 tFLdla0dAv18zjRNc77zRHwIJ0xMbW2ew0BrFu+BNaOl5imwomCu7KyeZ56jAorIT0P1eX
 bMPWb3IicMzE945pwgYjIM/rBvLDcP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-0AIXzOTXNI6Smv6pOhAI6g-1; Tue, 18 Oct 2022 02:28:53 -0400
X-MC-Unique: 0AIXzOTXNI6Smv6pOhAI6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46F1080D08F;
 Tue, 18 Oct 2022 06:28:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB12D111DCE4;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 554A921E661C; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 19/28] qapi replay: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:40 +0200
Message-Id: <20221018062849.3420573-20-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index c74c26bda3..2b6644f1c3 100644
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


