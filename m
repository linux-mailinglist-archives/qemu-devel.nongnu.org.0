Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02A2D7931
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:27:56 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkKp-0007F3-Fo
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHu-0004dU-5f
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHp-00062s-Ep
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Z0RQvRtJ7hMk7gfMe6Bddm/jnUXve9GIhF/VDyih1Y=;
 b=GXfNl3nkC6T5uto6Nueb549i2nsadDqQDzIaqHdqGL71it+TRh/mwTDr2sDry+z0WWFBuv
 0WmIyF5Fq4xleVv1r5oeAAn7GeSFo3fJoxFrg/ykmhBN7YiinRQ1ERVlaIfiWhAwvk4OCe
 rMobJ/VBsRudPot0BKtjvt0RbDIZAN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-tS0UXVGXN-K0Oegk_Wew2Q-1; Fri, 11 Dec 2020 10:24:45 -0500
X-MC-Unique: tS0UXVGXN-K0Oegk_Wew2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B125800D53;
 Fri, 11 Dec 2020 15:24:44 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B669D10016FE;
 Fri, 11 Dec 2020 15:24:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 07/12] accel/tcg/user-exec: silence the compiler warnings
Date: Fri, 11 Dec 2020 16:24:21 +0100
Message-Id: <20201211152426.350966-8-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
../accel/tcg/user-exec.c: In function ‘handle_cpu_signal’:
../accel/tcg/user-exec.c:169:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
  169 |             cpu_exit_tb_from_sighandler(cpu, old_set);
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../accel/tcg/user-exec.c:172:9: note: here
  172 |         default:

Mark the cpu_exit_tb_from_sighandler() function with QEMU_NORETURN to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201030004046.2191790-4-kuhn.chenqun@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 accel/tcg/user-exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 4ebe25461a..293ee86ea4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -49,7 +49,8 @@ __thread uintptr_t helper_retaddr;
 /* exit the current TB from a signal handler. The host registers are
    restored in a state compatible with the CPU emulator
  */
-static void cpu_exit_tb_from_sighandler(CPUState *cpu, sigset_t *old_set)
+static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,
+                                                      sigset_t *old_set)
 {
     /* XXX: use siglongjmp ? */
     sigprocmask(SIG_SETMASK, old_set, NULL);
-- 
2.27.0


