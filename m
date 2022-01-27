Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6249E494
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:27:21 +0100 (CET)
Received: from localhost ([::1]:52042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5k7-0001kX-Gc
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:27:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5f9-00072I-Qh
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5f8-0003O6-7Q
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWHYDG+AYSTXXnvdt63cGlbBLmMtorvMEgBAXFzb4G4=;
 b=JN0HzW7Ds5QOiwRHn8/hf/uCzMyaQkk56MMAsBGUgwOJmeOxQxMq/PG2R/VyNDk49KKwCR
 kEuGXO8uIByvp+MZuTIqPl0LjQswHX/Bj4thPbaJjfgALJH3Ak1c/t6E0na7HOj4uojVkK
 q8QoY+0wDlpraOGouxWI+eFU1QwuABw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-Bq4u9OmbNK6uC6tWNaeppw-1; Thu, 27 Jan 2022 09:22:06 -0500
X-MC-Unique: Bq4u9OmbNK6uC6tWNaeppw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E6F98144E4;
 Thu, 27 Jan 2022 14:22:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB3D81F72;
 Thu, 27 Jan 2022 14:22:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B218C11380A9; Thu, 27 Jan 2022 15:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 7/8] meson: document why we don't generate trace events for
 tests/ and qga/
Date: Thu, 27 Jan 2022 15:22:01 +0100
Message-Id: <20220127142202.236638-8-armbru@redhat.com>
In-Reply-To: <20220127142202.236638-1-armbru@redhat.com>
References: <20220127142202.236638-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Making trace generation work for tests/ and qga/ would involve some
Meson hackery to ensure we generate the trace-events files before
trace-tool uses them. Since we don't actually support tracing there
anyway, we bypass that problem.

Let's add corresponding comments.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220126161130.3240892-7-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Pasto fixed, commit message punctuation tidied up]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/meson.build   | 7 +++++++
 tests/meson.build | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/qga/meson.build b/qga/meson.build
index cfb1fbc085..724d5a667b 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,6 +15,13 @@ qga_qapi_outputs = [
   'qga-qapi-visit.h',
 ]
 
+# Problem: to generate trace events, we'd have to add the .trace-events
+# file to qapi_trace_events like we do in qapi/meson.build.  Since
+# qapi_trace_events is used by trace/meson.build, we'd have to move
+# subdir('qga') above subdir('trace') in the top-level meson.build.
+# Can't, because it would break the dependency of qga on qemuutil (which
+# depends on trace_ss).  Not worth solving now; simply suppress trace
+# event generation instead.
 qga_qapi_files = custom_target('QGA QAPI files',
                                output: qga_qapi_outputs,
                                input: 'qapi-schema.json',
diff --git a/tests/meson.build b/tests/meson.build
index 3f3882748a..c8ab6272d1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -31,6 +31,13 @@ test_qapi_outputs = [
   'test-qapi-visit.h',
 ]
 
+# Problem: to generate trace events, we'd have to add the .trace-events
+# file to qapi_trace_events like we do in qapi/meson.build.  Since
+# qapi_trace_events is used by trace/meson.build, we'd have to move
+# subdir('tests') above subdir('trace') in the top-level meson.build.
+# Can't, because it would break the dependency of qga on qemuutil (which
+# depends on trace_ss).  Not worth solving now; simply suppress trace
+# event generation instead.
 test_qapi_files = custom_target('Test QAPI files',
                                 output: test_qapi_outputs,
                                 input: files('qapi-schema/qapi-schema-test.json',
-- 
2.31.1


