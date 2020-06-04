Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A31EDD83
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 08:48:57 +0200 (CEST)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgjgO-0007i0-7W
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 02:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jgjaG-00052N-Sy
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 02:42:36 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:45387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jgjaF-0000ni-Hk
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 02:42:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49cx6D0yx1z9sTV; Thu,  4 Jun 2020 16:42:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1591252948;
 bh=6MG/UBS88R7qdMJG8taGdNHmp5J64Yq8vcEMkHSWD7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CHV4tGbhvtnF2MNap+rM5TvnxKbVKH2I5Qs/263/iOUjUxymNXA+1W1tfSajA74X7
 K+2UQqhJFPRDeikkUWJDRxrDQ9Dgh+CAkD1dIUbwr9rvfF5f28m5qBW43O+5z1eI8H
 HYoCFGdKuaPgRUQpid9QYb21y7X/4pDkcVGLteh8=
From: David Gibson <david@gibson.dropbear.id.au>
To: rth@twiddle.net, pbonzini@redhat.com, ekabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH 7/9] target/i386: sev: Remove redundant policy field
Date: Thu,  4 Jun 2020 16:42:17 +1000
Message-Id: <20200604064219.436242-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604064219.436242-1-david@gibson.dropbear.id.au>
References: <20200604064219.436242-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: brijesh.singh@amd.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SEVState::policy is set from the final value of the policy field in the
parameter structure for the KVM_SEV_LAUNCH_START ioctl().  But, AFAICT
that ioctl() won't ever change it from the original supplied value which
comes from SevGuestState::policy.

So, remove this field and just use SevGuestState::policy directly.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/sev.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index d25af37136..4b261beaa7 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -39,7 +39,6 @@ struct SEVState {
     uint8_t api_major;
     uint8_t api_minor;
     uint8_t build_id;
-    uint32_t policy;
     uint64_t me_mask;
     uint32_t handle;
     int sev_fd;
@@ -397,7 +396,7 @@ sev_get_info(void)
         info->api_major = sev_guest->state.api_major;
         info->api_minor = sev_guest->state.api_minor;
         info->build_id = sev_guest->state.build_id;
-        info->policy = sev_guest->state.policy;
+        info->policy = sev_guest->policy;
         info->state = sev_guest->state.state;
         info->handle = sev_guest->state.handle;
     }
@@ -520,8 +519,7 @@ sev_launch_start(SevGuestState *sev)
 
     start->handle = object_property_get_int(OBJECT(sev), "handle",
                                             &error_abort);
-    start->policy = object_property_get_int(OBJECT(sev), "policy",
-                                            &error_abort);
+    start->policy = sev->policy;
     if (sev->session_file) {
         if (sev_read_file_base64(sev->session_file, &session, &sz) < 0) {
             goto out;
@@ -550,7 +548,6 @@ sev_launch_start(SevGuestState *sev)
                             &error_abort);
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_UPDATE);
     s->handle = start->handle;
-    s->policy = start->policy;
     ret = 0;
 
 out:
-- 
2.26.2


