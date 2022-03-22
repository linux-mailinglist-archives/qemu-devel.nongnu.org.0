Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2025F4E3E90
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:34:41 +0100 (CET)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdii-0003qO-6Q
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:34:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdb2-0005Dr-5a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWday-0002WV-Fl
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647951985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PtUef0YlgqVlexzoy5L4fvW3KU4/yd5MyGwbdOaaAd4=;
 b=bDJZIR0xv+/p16fJ+cwe4o0JsssnH29DcdqiBiVIqe7gNZ807onwJyJippQ2Indyz4kpLu
 7eogxvB+xGM065gxkN8PZYWoKH3HhgIfoAPbh39EY14TVaQHusSgcl5iNLLbd6lCoCOPX0
 l8jN5KKsGqkdYSpBa3hYTUAEWV618e4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-Xk2g7CcrM5ycV49lELKQ9A-1; Tue, 22 Mar 2022 08:26:22 -0400
X-MC-Unique: Xk2g7CcrM5ycV49lELKQ9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30EB3833959;
 Tue, 22 Mar 2022 12:26:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A91253D8;
 Tue, 22 Mar 2022 12:26:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] m68k/nios2-semi: fix gettimeofday() result check
Date: Tue, 22 Mar 2022 16:25:43 +0400
Message-Id: <20220322122601.927238-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

gettimeofday() returns 0 for success.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


