Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA23DF041
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:26:53 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvNc-0001wi-AU
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvM1-0007W5-Uu
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvLz-00018k-RT
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628000711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/Sv1V243bpQ+RTIttD2wBJ7Rno5NPyWfMsFHgL8vEc=;
 b=f8C2e0HNPBQpha/ftBR93esxKzFOsBoCghdyLxZa/ppOJ2u93W1Iesu+XnfIqCIXfZfFln
 Tl3c9ZzM4pZcOOqrKUJE0VAcN4+aQOE99mZQENeNxxNntOEIzDN1crRJDm9TC+9imfv0yp
 YlHmg9VinPGiOC6+8evbKgOfFIOyzjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-p5ZJLppuNVKL0kLxHV-aHg-1; Tue, 03 Aug 2021 10:25:09 -0400
X-MC-Unique: p5ZJLppuNVKL0kLxHV-aHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8092F107ACF5;
 Tue,  3 Aug 2021 14:25:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C987B19C44;
 Tue,  3 Aug 2021 14:25:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/3] target/s390x: Fix SIGILL and SIGFPE psw.addr reporting
Date: Tue,  3 Aug 2021 16:24:53 +0200
Message-Id: <20210803142455.89123-2-thuth@redhat.com>
In-Reply-To: <20210803142455.89123-1-thuth@redhat.com>
References: <20210803142455.89123-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
instruction, and at the instruction for other signals. Currently under
qemu-user for SIGFILL and SIGFPE it points at the instruction.

Fix by advancing psw.addr for these signals.

Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
Message-Id: <20210705210434.45824-2-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/s390x/cpu_loop.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index f2d1215fb1..22f2e89c62 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -64,7 +64,13 @@ void cpu_loop(CPUS390XState *env)
         case EXCP_DEBUG:
             sig = TARGET_SIGTRAP;
             n = TARGET_TRAP_BRKPT;
-            goto do_signal_pc;
+            /*
+             * For SIGTRAP the PSW must point after the instruction, which it
+             * already does thanks to s390x_tr_tb_stop(). si_addr doesn't need
+             * to be filled.
+             */
+            addr = 0;
+            goto do_signal;
         case EXCP_PGM:
             n = env->int_pgm_code;
             switch (n) {
@@ -132,6 +138,10 @@ void cpu_loop(CPUS390XState *env)
 
         do_signal_pc:
             addr = env->psw.addr;
+            /*
+             * For SIGILL and SIGFPE the PSW must point after the instruction.
+             */
+            env->psw.addr += env->int_pgm_ilen;
         do_signal:
             info.si_signo = sig;
             info.si_errno = 0;
-- 
2.27.0


