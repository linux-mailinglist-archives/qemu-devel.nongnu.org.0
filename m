Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDC3E4646
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:12:13 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD54d-00024y-Ej
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mD53C-0001Jr-2b
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mD538-0000kV-B8
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628514636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AMTN+uSEvUoDnED3vTbOwbsS1JjW5TjsWp8ATo6we4U=;
 b=O4bS+SU1Cjv7w17vwRtUJUCScD0CPPQlrEFW1ImUxUJqyTwmhhZUwx/BcO+QGMJxp/0AiW
 gtPO3uB+GiC0FN3A5qqwcM20ujrphiABxA+In5f+EoO6d+jGbW6tRrkBEW5kNs10zYb1ml
 Ud7vx2K/eD4+vOJHihvlSF15AkWZX1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-QWnkErGRPGWhYdlIfZQhnw-1; Mon, 09 Aug 2021 09:10:32 -0400
X-MC-Unique: QWnkErGRPGWhYdlIfZQhnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99EBF100E431;
 Mon,  9 Aug 2021 13:10:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 607BD2B399;
 Mon,  9 Aug 2021 13:10:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qga: fix leak of base64 decoded data on command error
Date: Mon,  9 Aug 2021 14:10:29 +0100
Message-Id: <20210809131029.3759267-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the guest command fails to be spawned, then we would leak the decoded
base64 input used for the command's stdin feed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qga/commands.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index a6491d2cf8..80501e4a73 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -402,7 +402,7 @@ GuestExec *qmp_guest_exec(const char *path,
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
     bool has_output = (has_capture_output && capture_output);
-    uint8_t *input = NULL;
+    g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
 
     arglist.value = (char *)path;
@@ -441,7 +441,7 @@ GuestExec *qmp_guest_exec(const char *path,
     g_child_watch_add(pid, guest_exec_child_watch, gei);
 
     if (has_input_data) {
-        gei->in.data = input;
+        gei->in.data = g_steal_pointer(&input);
         gei->in.size = ninput;
 #ifdef G_OS_WIN32
         in_ch = g_io_channel_win32_new_fd(in_fd);
-- 
2.31.1


