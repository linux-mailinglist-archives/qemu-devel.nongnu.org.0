Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80478675559
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:16:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrF2-0000Ak-MZ; Fri, 20 Jan 2023 08:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+11ac54132413ad4eaace+7089+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pIrDs-0006nW-0V
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:14:24 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+11ac54132413ad4eaace+7089+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pIrDd-0000gJ-Rd
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IaoN0mTu0LyDXBzfMTPNK25gFWcBxrzrInZtGnJysf4=; b=ZdcC0bhsFvOuVt2JxjKuSk6HLx
 EcMINOujcxyLjRfmHD4ahGN46R0PoBr8c59OYex3zsjKLRC/QzPFpYahnxKT85wPLlapnMKOTPkWs
 uAd6fy92Yjql1gp9Ew9i/Il3szhahKw3KQJgr/2nLtcR3I8qbEs37D8zHGp0jmwK8BEANr/McAgiv
 Zy9Y0+VC8ty4K0CBCjEGzFVwuoWFbl8m/0g1ItJhO465jeTpkAjfHYtoB2Dq7928nGPI0T8otPat+
 y6ZJH2tibTAKi10S9lbqo4sFSXJBRI7zKJfO54M7ZhbMaWDB3QaslGS8CDSdCmJ6LpH0sOIzCJB3L
 4u19AQXA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pIrCp-000dek-3D; Fri, 20 Jan 2023 13:13:20 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pIrDI-0063DE-04; Fri, 20 Jan 2023 13:13:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v8 12/58] i386/xen: Implement SCHEDOP_poll and SCHEDOP_yield
Date: Fri, 20 Jan 2023 13:12:57 +0000
Message-Id: <20230120131343.1441939-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120131343.1441939-1-dwmw2@infradead.org>
References: <20230120131343.1441939-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+11ac54132413ad4eaace+7089+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

They both do the same thing and just call sched_yield. This is enough to
stop the Linux guest panicking when running on a host kernel which doesn't
intercept SCHEDOP_poll and lets it reach userspace.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index d2c70ea180..5579e012ed 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -234,6 +234,19 @@ static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = schedop_shutdown(cs, arg);
         break;
 
+    case SCHEDOP_poll:
+        /*
+         * Linux will panic if this doesn't work. Just yield; it's not
+         * worth overthinking it because with event channel handling
+         * in KVM, the kernel will intercept this and it will never
+         * reach QEMU anyway. The semantics of the hypercall explicltly
+         * permit spurious wakeups.
+         */
+    case SCHEDOP_yield:
+        sched_yield();
+        err = 0;
+        break;
+
     default:
         return false;
     }
-- 
2.39.0


