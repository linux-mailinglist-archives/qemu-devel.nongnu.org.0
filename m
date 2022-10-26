Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B1360E798
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:46:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlGt-0007u7-BH; Wed, 26 Oct 2022 14:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onlG3-0007ed-Cq
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onlFd-0003Cu-4S
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666809340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knqts98TNG7z2RsXziWM6TpxzKf9SV554DrLtHWZllw=;
 b=G31COl7JxeNR6x7axyWaiWXrf/++yERMkXBwN+XNDBxfxH+EpBxnpZFNErDCwxqbDRyliy
 Gpwnlzh5eR2tqRNPi27JvP38shu8wZz8DGSCur8MnADBJdL5Uumxo4z7iAe9Hf1Oht6r5B
 eEyOdOBdBsLMwhLqM1vixz/EoeZdHn0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-FCKhBm90NBOyZ19NCWEakw-1; Wed, 26 Oct 2022 14:35:36 -0400
X-MC-Unique: FCKhBm90NBOyZ19NCWEakw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01FA93C11043;
 Wed, 26 Oct 2022 18:35:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD388414A815;
 Wed, 26 Oct 2022 18:35:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 50F4F21E65CC; Wed, 26 Oct 2022 20:35:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 19/28] qapi replay: Elide redundant has_FOO in generated C
Date: Wed, 26 Oct 2022 20:35:23 +0200
Message-Id: <20221026183532.487708-20-armbru@redhat.com>
In-Reply-To: <20221026183532.487708-1-armbru@redhat.com>
References: <20221026183532.487708-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/replay.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221018062849.3420573-20-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.37.3


