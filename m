Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341F4EF3AC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:26:55 +0200 (CEST)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJAs-0004oZ-Fe
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:26:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7v-0001qN-5F
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7t-0000u4-8F
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648826628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HPbeD6AAeDVJtEb3Om9tQ7uY4+AVoVcac7NPB0sl1Q=;
 b=EWLXtz85muxivJhaagLHnkf8iTaS9IQJeXpBJPYVtwzNZBXh/bbMng/zHEkqQPk6VtJVfe
 SLi+FmoDoXe/0YvHzCnR0QWBZUel38jduB/QzrK77EW1RSfBOoaFUcrS0OkwF//0tO5t+p
 8P2TGC8FakK8F9zNEjdW/nSNURr8bIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-xTI_6KQ9PbiAGHbYf9dALA-1; Fri, 01 Apr 2022 11:23:45 -0400
X-MC-Unique: xTI_6KQ9PbiAGHbYf9dALA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35D1986B8AC;
 Fri,  1 Apr 2022 15:23:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D58C2166B4E;
 Fri,  1 Apr 2022 15:23:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] trace: fix compilation with lttng-ust >= 2.13
Date: Fri,  1 Apr 2022 17:23:23 +0200
Message-Id: <20220401152323.52519-7-thuth@redhat.com>
In-Reply-To: <20220401152323.52519-1-thuth@redhat.com>
References: <20220401152323.52519-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

On Fedora 36, with lttng-ust 2.13.1, compilation fails with:

In file included from trace/trace-ust-all.h:49085,
                 from trace/trace-ust-all.c:13:
/usr/include/lttng/tracepoint-event.h:67:10: error: #include expects "FILENAME" or <FILENAME>
   67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
tracepoint file name") from 2012, starting from lttng-ust 2.1, the API
was changed to expect TRACEPOINT_INCLUDE to be defined as a string.

In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
macro"), in 2021, the compatibility macro was removed.

Use the "new" API from 2012, and bump the version requirement to 2.1 to
fix compilation with >= 2.13.

According to repology, all distributions we support have >= 2.1 (centos
8 has oldest with 2.8.1 afaict)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220328084717.367993-2-marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build                              | 4 ++--
 scripts/tracetool/format/ust_events_h.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 04ce33fef1..861de93c4f 100644
--- a/meson.build
+++ b/meson.build
@@ -455,8 +455,8 @@ if 'CONFIG_GIO' in config_host
 endif
 lttng = not_found
 if 'ust' in get_option('trace_backends')
-  lttng = dependency('lttng-ust', required: true, method: 'pkg-config',
-                     kwargs: static_kwargs)
+  lttng = dependency('lttng-ust', required: true, version: '>= 2.1',
+                     method: 'pkg-config', kwargs: static_kwargs)
 endif
 pixman = not_found
 if have_system or have_tools
diff --git a/scripts/tracetool/format/ust_events_h.py b/scripts/tracetool/format/ust_events_h.py
index 6ce559f6cc..b99fe6896b 100644
--- a/scripts/tracetool/format/ust_events_h.py
+++ b/scripts/tracetool/format/ust_events_h.py
@@ -29,8 +29,8 @@ def generate(events, backend, group):
         '#undef TRACEPOINT_PROVIDER',
         '#define TRACEPOINT_PROVIDER qemu',
         '',
-        '#undef TRACEPOINT_INCLUDE_FILE',
-        '#define TRACEPOINT_INCLUDE_FILE ./%s' % include,
+        '#undef TRACEPOINT_INCLUDE',
+        '#define TRACEPOINT_INCLUDE "./%s"' % include,
         '',
         '#if !defined (TRACE_%s_GENERATED_UST_H) || \\'  % group.upper(),
         '     defined(TRACEPOINT_HEADER_MULTI_READ)',
-- 
2.27.0


