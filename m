Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2F2067D9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 01:03:05 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnrwW-0002yp-1k
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 19:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jnruv-0001jg-8T
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 19:01:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36120
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jnrus-00020F-1Z
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 19:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592953280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dSxfIsiKAOAuOkcH6/6KkAm1SJMN+fb41ElIwudmlpc=;
 b=T9jsu/6/vmW7ko9hCgfcWleTjt8YjgY7PI3Oc1+P+MI5M0qIyWOfxR7YtYDoFfbRVsreI9
 u/ZKe5oFFmo7+DaGTAgGcNetRt/Tc4/4KsT0oQj/uIZBLxZdyi93OWWdEz60UNILkWzC25
 xasSrFgavufaY9femhDmj7s+cn6SAFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-TlDUT0zNOF2W3H6FnjZElg-1; Tue, 23 Jun 2020 19:01:18 -0400
X-MC-Unique: TlDUT0zNOF2W3H6FnjZElg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 503B7107ACF2;
 Tue, 23 Jun 2020 23:01:17 +0000 (UTC)
Received: from localhost (ovpn-113-247.phx2.redhat.com [10.3.113.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 111725C1D4;
 Tue, 23 Jun 2020 23:01:16 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] i386: Mask SVM features if nested SVM is disabled
Date: Tue, 23 Jun 2020 19:01:16 -0400
Message-Id: <20200623230116.277409-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
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
Cc: Yanan Fu <yfu@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Babu Moger <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU incorrectly validates FEAT_SVM feature flags against
GET_SUPPORTED_CPUID even if SVM features are being masked out by
cpu_x86_cpuid().  This can make QEMU print warnings on most AMD
CPU models, even when SVM nesting is disabled (which is the
default).

This bug was never detected before because of a Linux KVM bug:
until Linux v5.6, KVM was not filtering out SVM features in
GET_SUPPORTED_CPUID when nested was disabled.  This KVM bug was
fixed in Linux v5.7-rc1, on Linux commit a50718cc3f43 ("KVM:
nSVM: Expose SVM features to L1 iff nested is enabled").

Fix the problem by adding a CPUID_EXT3_SVM dependency to all
FEAT_SVM feature flags in the feature_dependencies table.

Reported-by: Yanan Fu <yfu@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b1b311baa2..a9edcaf531 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1404,6 +1404,10 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_VMX_SECONDARY_CTLS,  VMX_SECONDARY_EXEC_ENABLE_VMFUNC },
         .to = { FEAT_VMX_VMFUNC,            ~0ull },
     },
+    {
+        .from = { FEAT_8000_0001_ECX,       CPUID_EXT3_SVM },
+        .to = { FEAT_SVM,                   ~0ull },
+    },
 };
 
 typedef struct X86RegisterInfo32 {
-- 
2.26.2


