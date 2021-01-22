Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94B300E0A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:49:01 +0100 (CET)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Ma-0007Hv-RW
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JV-0005W8-Nc
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JP-0002up-EG
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FH8ITvmhiqWIcEFqVfmtpDiHqCMBIm0BPSKhlXQCGao=;
 b=Yd31iRRgmmjNhbINVVspem7ms/V/edB1Wk9DVTaH7M7PvythefxppiGUzSaSTj3PUhUXag
 ug8RPkuUZ1eb9CQ+IpRgXDpVjI6yhsiRhIgV41L+PhtgXMTktZDxmiWxBvvgHDXr3lxHW1
 kTh1bMFxEDNdySSxami8s6Ehf5qnxzU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-_aEqUKXLMRqQVk_ye2UKiQ-1; Fri, 22 Jan 2021 15:45:40 -0500
X-MC-Unique: _aEqUKXLMRqQVk_ye2UKiQ-1
Received: by mail-ed1-f72.google.com with SMTP id a24so3495122eda.14
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FH8ITvmhiqWIcEFqVfmtpDiHqCMBIm0BPSKhlXQCGao=;
 b=RNG9JRGz4+UVCdrifClMr3poGw0Zre/+wmebWsHAUw0D/X+2/H6kR4KmuBTDTf/Zp4
 q+Rfd59/dRbfG/3dcXrkym0Eq9WP5Hh3v/1BHG0SvhCbN39u8+SsEreniUi9kKMCU0Ue
 0fy6LP10P+ulZ6BriMV61MD7W2iEkSApeNJpBv4HfW3hSpwYmuLoN9gYN3vd8LVJ5tYF
 ZXNa6SboOgMGRpbu9qiUvzTVqrwK9SHgFreUNLlhr2lHwCQgITYapUTLS+I0VPHuiily
 EJNvMtOovIKmDNiFhXLiwVpHqa2Z4QLe5bcHkVQVc8t6ITCMwuYFwrR7aT1ATZwEB9/c
 qsgQ==
X-Gm-Message-State: AOAM533HBNrAqG8KkKotfkEznvqAmxQVdbBBzrgo15JtTcigZbUOwwSD
 T+OkSaNVzDPGASytivtiZNqfTmQs+OqZUlr63qeXLAE5S5thnJE90YirYfzBrshZ4QOa8qGWuCq
 FYS5QhfQNPaTfRXRJCSKyLetgY6DmjRFQ9lCahMLwqYD/kxpCA05QzfzRRR/u7Qvb
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr4702815edt.130.1611348338807; 
 Fri, 22 Jan 2021 12:45:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHVka1HJCXZBVomJ7SAEb4/fnnBOWk8Ba1xYuQP5rtHIFUKVsOU4/Sr6E+MXqOOKwipHMofQ==
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr4702790edt.130.1611348338648; 
 Fri, 22 Jan 2021 12:45:38 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id bk2sm5306366ejb.98.2021.01.22.12.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 10/12] qapi/meson: Remove QMP from user-mode emulation
Date: Fri, 22 Jan 2021 21:44:39 +0100
Message-Id: <20210122204441.2145197-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Laurent Vivier <laurent@vivier.eu>
---
 qapi/meson.build  | 10 +++++++---
 tests/meson.build |  7 ++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 2839871b478..b301a46f04a 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -4,14 +4,18 @@
   'qapi-dealloc-visitor.c',
   'qapi-util.c',
   'qapi-visit-core.c',
-  'qmp-dispatch.c',
-  'qmp-event.c',
-  'qmp-registry.c',
   'qobject-input-visitor.c',
   'qobject-output-visitor.c',
   'string-input-visitor.c',
   'string-output-visitor.c',
 ))
+if have_system or have_tools
+  util_ss.add(files(
+    'qmp-dispatch.c',
+    'qmp-event.c',
+    'qmp-registry.c',
+  ))
+endif
 
 qapi_all_modules = [
   'acpi',
diff --git a/tests/meson.build b/tests/meson.build
index 6f1ff926d26..7d7da6a6364 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -86,7 +86,6 @@
   'test-qobject-input-visitor': [testqapi],
   'test-string-input-visitor': [testqapi],
   'test-string-output-visitor': [testqapi],
-  'test-qmp-event': [testqapi],
   'test-opts-visitor': [testqapi],
   'test-visitor-serialization': [testqapi],
   'test-bitmap': [],
@@ -117,6 +116,12 @@
   'test-qapi-util': [],
 }
 
+if have_system or have_tools
+  tests += {
+    'test-qmp-event': [testqapi],
+  }
+endif
+
 test_deps = {
   'test-qht-par': qht_bench,
 }
-- 
2.26.2


