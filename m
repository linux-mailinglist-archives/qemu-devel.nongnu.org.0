Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D70489AFD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:02:08 +0100 (CET)
Received: from localhost ([::1]:43240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vFP-0003Kr-0d
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:02:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0o-0002MV-Fl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0m-00073E-Mx
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/PuiaiPTEsCHacu0SBkdgDPgiVpur/KjjkCy3lBTeA=;
 b=e8K+ZWTT8VuRYUxg8FuTXx/r3FWC5oATBd7/e/d6xPiwTFndWm8N9rqbJnFIQmyI/f5RNH
 N5JCKGa4XDZZurteUobBFkzxGERIgWyE/Q8XeLrURBA7SCZiO+u8thglQPO0RXTmBUm+9u
 aq3u8Ctq5tm5dN3p9Goohvf7/IUOUFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-ZdBV6euUObihQaRL8Wl7RQ-1; Mon, 10 Jan 2022 08:46:59 -0500
X-MC-Unique: ZdBV6euUObihQaRL8Wl7RQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4660681CCB7;
 Mon, 10 Jan 2022 13:46:58 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 609487BB41;
 Mon, 10 Jan 2022 13:46:57 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] qga-win: Detect OS based on Windows 10 by first build
 number
Date: Mon, 10 Jan 2022 15:46:43 +0200
Message-Id: <20220110134644.107375-9-kkostiuk@redhat.com>
In-Reply-To: <20220110134644.107375-1-kkostiuk@redhat.com>
References: <20220110134644.107375-1-kkostiuk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kostiantyn Kostiuk <konstantin@daynix.com>

Windows Server 2016, 2019, 2022 are based on Windows 10 and
have the same major and minor versions. So, the only way to
detect the proper version is to use the build number.

Before this commit, the guest agent use the last build number
for each OS, but it causes problems when new OS releases.
There are few preview versions before release, and we
can't update this list.

After this commit, the guest agent will use the first build
number. For each new preview version or release version,
Microsoft increases the build number, so we can add the number
of the first preview build and this will work until the new
OS release.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-win32.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 892082504f..3f60419419 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2195,7 +2195,7 @@ static ga_matrix_lookup_t const WIN_VERSION_MATRIX[2][8] = {
 };
 
 typedef struct _ga_win_10_0_server_t {
-    int final_build;
+    int first_build;
     char const *version;
     char const *version_id;
 } ga_win_10_0_server_t;
@@ -2235,18 +2235,22 @@ static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
     int tbl_idx = (os_version->wProductType != VER_NT_WORKSTATION);
     ga_matrix_lookup_t const *table = WIN_VERSION_MATRIX[tbl_idx];
     ga_win_10_0_server_t const *win_10_0_table = WIN_10_0_SERVER_VERSION_MATRIX;
+    ga_win_10_0_server_t const *win_10_0_version = NULL;
     while (table->version != NULL) {
         if (major == 10 && minor == 0 && tbl_idx) {
             while (win_10_0_table->version != NULL) {
-                if (build <= win_10_0_table->final_build) {
-                    if (id) {
-                        return g_strdup(win_10_0_table->version_id);
-                    } else {
-                        return g_strdup(win_10_0_table->version);
-                    }
+                if (build >= win_10_0_table->first_build) {
+                    win_10_0_version = win_10_0_table;
                 }
                 win_10_0_table++;
             }
+            if (win_10_0_table) {
+                if (id) {
+                    return g_strdup(win_10_0_version->version_id);
+                } else {
+                    return g_strdup(win_10_0_version->version);
+                }
+            }
         } else if (major == table->major && minor == table->minor) {
             if (id) {
                 return g_strdup(table->version_id);
-- 
2.25.1


