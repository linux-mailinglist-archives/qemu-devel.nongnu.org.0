Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F6B49E1DD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:03:42 +0100 (CET)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3V6-0005PB-UN
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:03:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2xk-0005dy-9m
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2xi-0000Nf-Fn
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643282949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWHYDG+AYSTXXnvdt63cGlbBLmMtorvMEgBAXFzb4G4=;
 b=WkAvtBiOKG7QnPYQnSXYSZQkVI/dcfpTtoP4J/F95QSDPSZUHPZ8RyIzjtohHcPmcMd3Cs
 WcIm78KTIuXBKHwdbqmAmGddlT9wuMJOFRgQB5pc8AxW+seaajtW5NB5VueIq31GdK5aV7
 r8/XNYYUrtwuHdxf1JxoOWZW6oCKxdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-sK5ghe3FOEqvicqnCrVZrQ-1; Thu, 27 Jan 2022 06:29:06 -0500
X-MC-Unique: sK5ghe3FOEqvicqnCrVZrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5ACB8519E3;
 Thu, 27 Jan 2022 11:29:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 838C6110F9C;
 Thu, 27 Jan 2022 11:29:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7680F11380A9; Thu, 27 Jan 2022 12:28:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] meson: document why we don't generate trace events for
 tests/ and qga/
Date: Thu, 27 Jan 2022 12:28:58 +0100
Message-Id: <20220127112859.222484-8-armbru@redhat.com>
In-Reply-To: <20220127112859.222484-1-armbru@redhat.com>
References: <20220127112859.222484-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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


