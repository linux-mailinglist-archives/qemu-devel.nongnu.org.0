Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55520AFFE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 12:45:55 +0200 (CEST)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jolrm-0002Nj-6O
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 06:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jolqN-0001CO-56
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:44:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jolqK-0000k7-Mv
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593168263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R00hQqPF3lhShtbvIek4n3YKTjw+/cU261cuUrWpip4=;
 b=CxlEFynd/fuBBRgrVQJE9WbpY0lWfm0vKkOs9NaNhBvVwQWWKtDZpVhkpcE5W8b2+rpgY6
 gUkWexg071eG0vHDGKf8js5Tn4cu+rDB7k0PY57tmh/B40ICfuTCaXqEw8VMEZq8oluaB5
 7rmN2hKXAhk7wv/Dzthw7++tKPZCr5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-Wv0eIi-5O_eW_cvekJ41GQ-1; Fri, 26 Jun 2020 06:44:21 -0400
X-MC-Unique: Wv0eIi-5O_eW_cvekJ41GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E85B510059A0
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 10:44:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A427E5BAD2
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 10:44:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: implement undocumented "smsw r32" behavior
Date: Fri, 26 Jun 2020 06:44:19 -0400
Message-Id: <20200626104419.15504-2-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:49:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In 32-bit mode, the higher 16 bits of the destination
register are undefined.  In practice CR0[31:0] is stored,
just like in 64-bit mode, so just remove the "if" that
currently differentiates the behavior.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/translate.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 4d808a6f93..60eac03498 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -7579,12 +7579,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         CASE_MODRM_OP(4): /* smsw */
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_READ_CR0);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
-            if (CODE64(s)) {
-                mod = (modrm >> 6) & 3;
-                ot = (mod != 3 ? MO_16 : s->dflag);
-            } else {
-                ot = MO_16;
-            }
+            /*
+             * In 32-bit mode, the higher 16 bits of the destination
+             * register are undefined.  In practice CR0[31:0] is stored
+             * just like in 64-bit mode.
+             */
+            mod = (modrm >> 6) & 3;
+            ot = (mod != 3 ? MO_16 : s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 0xee: /* rdpkru */
-- 
2.26.2


