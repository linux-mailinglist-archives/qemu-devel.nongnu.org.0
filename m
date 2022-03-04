Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99914CD850
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:52:39 +0100 (CET)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAEQ-0000Ra-Pq
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:52:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9qS-0001wT-1p
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:27:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9qK-0004z6-1e
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646407663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ntRqMb9zItiX8LVU47zdYtH2GTJ7IQfCQ2jg6NXQgU=;
 b=T0JzWpe9xLs5siSfiaN5o43p0oKSd2ne6Tn9wWgM6z6OY5m0idOeFY/A3qw4iweFnikg3m
 qnMxitHr4WNGBcqc3F+APSAm5b8Kqrhl9nre8xD9n7npVL2TeIVKLyKm3Y2G+w6sewWySW
 413enpK31FbFTxr5/aonEWksLanzo8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-xcYAOgmUMZOm5_ZdWGJluA-1; Fri, 04 Mar 2022 10:27:42 -0500
X-MC-Unique: xcYAOgmUMZOm5_ZdWGJluA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 943AF8145F7;
 Fri,  4 Mar 2022 15:27:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46D1D1064275;
 Fri,  4 Mar 2022 15:27:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] m68k/nios2-semi: fix gettimeofday() result check
Date: Fri,  4 Mar 2022 19:27:01 +0400
Message-Id: <20220304152704.3466036-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

gettimeofday() returns 0 for success.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/m68k/m68k-semi.c   | 2 +-
 target/nios2/nios2-semi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 44ec7e4612c6..c5c164e096c8 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -381,7 +381,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
             qemu_timeval tv;
             struct gdb_timeval *p;
             result = qemu_gettimeofday(&tv);
-            if (result != 0) {
+            if (result == 0) {
                 if (!(p = lock_user(VERIFY_WRITE,
                                     arg0, sizeof(struct gdb_timeval), 0))) {
                     /* FIXME - check error code? */
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index fe5598bae4d7..5a7ad0c7108d 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -403,7 +403,7 @@ void do_nios2_semihosting(CPUNios2State *env)
             qemu_timeval tv;
             struct gdb_timeval *p;
             result = qemu_gettimeofday(&tv);
-            if (result != 0) {
+            if (result == 0) {
                 p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval),
                               0);
                 if (!p) {
-- 
2.35.1.273.ge6ebfd0e8cbb


