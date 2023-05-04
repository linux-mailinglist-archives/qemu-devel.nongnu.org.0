Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D26F68BE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:58:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVi6-0002JX-Mr; Thu, 04 May 2023 05:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVi5-0002JK-Ac
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVi3-00071x-Us
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683194231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80AM+5RyIwhaCcbwOaL5+0xN1QqywYmR4e9Rab2Poi4=;
 b=GVsIPmWAEe8NOBam4sAvgDMrxmaKZfHihYe3TcJjxlsfU15Md18h+tPQkOs2J5OGT2iC4q
 7yiijJnNKkeSS6wM52QYgEDT8djexCY3inWqEuALQTvj1yssLDEP11oFcobs4z556B0fxN
 SowQpi5+AisiAngqSO1Qv485AKdIlf8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-r_4AvVeJNVWkfvcQFW_kVg-1; Thu, 04 May 2023 05:57:09 -0400
X-MC-Unique: r_4AvVeJNVWkfvcQFW_kVg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A37B41C060CD;
 Thu,  4 May 2023 09:57:09 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.225.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81227492C13;
 Thu,  4 May 2023 09:57:08 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/6] qga: Fix suspend on Linux guests without systemd
Date: Thu,  4 May 2023 12:56:57 +0300
Message-Id: <20230504095657.239048-7-kkostiuk@redhat.com>
In-Reply-To: <20230504095657.239048-1-kkostiuk@redhat.com>
References: <20230504095657.239048-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mark Somerville <mark@qpok.net>

Allow the Linux guest agent to attempt each of the suspend methods
(systemctl, pm-* and writing to /sys) in turn.

Prior to this guests without systemd failed to suspend due to
`guest_suspend` returning early regardless of the return value of
`systemd_supports_mode`.

Signed-off-by: Mark Somerville <mark@qpok.net>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-posix.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 97754930c1..def857d773 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1922,10 +1922,10 @@ static void guest_suspend(SuspendMode mode, Error **errp)
     if (systemd_supports_mode(mode, &local_err)) {
         mode_supported = true;
         systemd_suspend(mode, &local_err);
-    }
 
-    if (!local_err) {
-        return;
+        if (!local_err) {
+            return;
+        }
     }
 
     error_free(local_err);
@@ -1934,10 +1934,10 @@ static void guest_suspend(SuspendMode mode, Error **errp)
     if (pmutils_supports_mode(mode, &local_err)) {
         mode_supported = true;
         pmutils_suspend(mode, &local_err);
-    }
 
-    if (!local_err) {
-        return;
+        if (!local_err) {
+            return;
+        }
     }
 
     error_free(local_err);
-- 
2.25.1


