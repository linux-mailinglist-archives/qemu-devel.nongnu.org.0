Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97C1F6F44
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 23:16:46 +0200 (CEST)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjUZ3-0007nw-FW
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 17:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTB8-0002tL-V3
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTB7-0001Xr-1O
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xKDOACYyJpLQJRqYHzBMhYwWIAw/U81pYzegx6+Uwk=;
 b=PVUW4vVGkV0yxDuYAr0x7w13VgJANL34nKugrjZpHbQNgEip4ihXdkOx+Va0ScX/msnL2h
 PnH70RjNJG54Q6JmawStp6RvirgfS65u9+hfGQFsHxFkWaShKK+kav5V3Fih5OPpJbJPyg
 Q7dvL3AUlNGerZ0lMecuV2+8R0RCHnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-Dk-Ks-o0OF6_-Xsi5lXFxQ-1; Thu, 11 Jun 2020 15:47:13 -0400
X-MC-Unique: Dk-Ks-o0OF6_-Xsi5lXFxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54220107BEFC;
 Thu, 11 Jun 2020 19:47:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1F19610FD;
 Thu, 11 Jun 2020 19:47:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 106/115] target/i386: sev: Remove redundant policy field
Date: Thu, 11 Jun 2020 15:44:40 -0400
Message-Id: <20200611194449.31468-107-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:57:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Gibson <david@gibson.dropbear.id.au>

SEVState::policy is set from the final value of the policy field in the
parameter structure for the KVM_SEV_LAUNCH_START ioctl().  But, AFAICT
that ioctl() won't ever change it from the original supplied value which
comes from SevGuestState::policy.

So, remove this field and just use SevGuestState::policy directly.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200604064219.436242-8-david@gibson.dropbear.id.au>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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



