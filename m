Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2B57940A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:21:23 +0200 (CEST)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhXm-0004Vi-Ih
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHW-0002al-Sj
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHV-00030D-AW
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68MvqjwHoJV61jkmbC7tQe72+TNoC4BdPoga7TcMYj4=;
 b=Ufj20PEZLGHzE/hEoDCQlBDsyPWr/64E26Fj2GGwOCQ5AA7g1YB69P8ho07nIpURgPnP9W
 m27p0gd++rdfFdA63T7gpNDKMxlxEip4P/LWrwc0Vo6+hcq/eEblnkoWqRk58QeM232ks9
 fupaP8kaBCvjSFJ1tXctZ6+DQ8cEJ+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-mfT56KKcPRe68iWhZypx6w-1; Tue, 19 Jul 2022 03:04:25 -0400
X-MC-Unique: mfT56KKcPRe68iWhZypx6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F3738037AC;
 Tue, 19 Jul 2022 07:04:25 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B29BA40CFD0A;
 Tue, 19 Jul 2022 07:04:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/14] Replace 'whitelist' with 'allow'
Date: Tue, 19 Jul 2022 09:04:10 +0200
Message-Id: <20220719070412.16757-13-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use more inclusive language here and avoid terms
that are frowned upon nowadays.

Message-Id: <20220711095300.60462-1-thuth@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/submitting-a-patch.rst | 2 +-
 docs/tools/qemu-nbd.rst           | 2 +-
 scripts/vmstate-static-checker.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 09a8d12c2c..fec33ce148 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -39,7 +39,7 @@ ideas from other posts. If you do subscribe, be prepared for a high
 volume of email, often over one thousand messages in a week. The list is
 moderated; first-time posts from an email address (whether or not you
 subscribed) may be subject to some delay while waiting for a moderator
-to whitelist your address.
+to allow your address.
 
 The larger your contribution is, or if you plan on becoming a long-term
 contributor, then the more important the rest of this page becomes.
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 8e08a29e89..faf6349ea5 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -225,7 +225,7 @@ disconnects:
   qemu-nbd -f qcow2 file.qcow2
 
 Start a long-running server listening with encryption on port 10810,
-and whitelist clients with a specific X.509 certificate to connect to
+and allow clients with a specific X.509 certificate to connect to
 a 1 megabyte subset of a raw file, using the export name 'subset':
 
 ::
diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
index 539ead62b4..b369388360 100755
--- a/scripts/vmstate-static-checker.py
+++ b/scripts/vmstate-static-checker.py
@@ -40,7 +40,7 @@ def check_fields_match(name, s_field, d_field):
         return True
 
     # Some fields changed names between qemu versions.  This list
-    # is used to whitelist such changes in each section / description.
+    # is used to allow such changes in each section / description.
     changed_names = {
         'apic': ['timer', 'timer_expiry'],
         'e1000': ['dev', 'parent_obj'],
-- 
2.31.1


