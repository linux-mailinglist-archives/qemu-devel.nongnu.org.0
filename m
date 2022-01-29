Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FF24A2D77
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 10:48:57 +0100 (CET)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDkLo-0003PR-4M
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 04:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nDkKM-000210-2i
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 04:47:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nDkKJ-0002gm-AS
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 04:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643449639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pAVLEXh55UJePiBne0eX5BxTj3GWW71ZjBEKYPV38xw=;
 b=NdsUuaWxbDKPEswzIFVorhnqX/RWXb7cX+aLK/gcEorpoCkl5a5tbRuJDv3WQp3epF8jOt
 ipVyEiEaX7UDh+HNDc+r58JcEIGAgGYgR1mgfnm6ENgIXQbblaMTIeCRN0POeXw/ide9kE
 do0Co8ktFR/JrU8Q/ZvP/y60lm0qmAw=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-YovoIqwSOn-nWCP5FGbAFw-1; Sat, 29 Jan 2022 04:47:18 -0500
X-MC-Unique: YovoIqwSOn-nWCP5FGbAFw-1
Received: by mail-ua1-f71.google.com with SMTP id
 i25-20020ab03759000000b00308e68dcb1fso4528669uat.22
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 01:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pAVLEXh55UJePiBne0eX5BxTj3GWW71ZjBEKYPV38xw=;
 b=QvbleXylpYc+Xm3j7nu42u3yUmz3xUp4EvEeJ6yzy5k4ZxFqoAqrJiqbsw+6YNd0St
 s4kLUZtT3/99jpGloGR/H+gyI4PGj0WzmVFkwFxSKtAADURjk6kSCHY3XQcdLiqCZIrd
 Aws3L00nMLOsz++0HwbV5KsQ5a5a9fvLkogW22Eh4oQ94tCgQOkfcTnq7p7Qxr6Xwnet
 FljoAxSiKP4TZUAIZJ9DRhvE79jOMLLQTeOVwiqCfB2YDGZWjVfut4g5YKYRtr7U6vlT
 6OqWoMghdEuC+mOkwXD4EkFygjMGcp3mfVqmv6PL8IIcRA265LQESLJeoYBkoWre7tn4
 O5Ow==
X-Gm-Message-State: AOAM532AoMHYP72G02lLxZlW5EAry/arDgO44NwOeOcR0bGY8xfnHtT4
 5WSlBbiaBhJL+CibuNivDlXeondhMQUkq7mxoL4P2iShfQe98kc1E/BeWwPOq5SZ1NL4KTcbcyJ
 Mr2n9AQga0mKQQj8=
X-Received: by 2002:a05:6122:2194:: with SMTP id
 j20mr5266217vkd.21.1643449637488; 
 Sat, 29 Jan 2022 01:47:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgeD+0V7n1ejp5Nxiq4Egr9IHz/zjZOUq/D8WJPaAodLyyOjcSnYME9UIH1++bUGqy+TUOZA==
X-Received: by 2002:a05:6122:2194:: with SMTP id
 j20mr5266212vkd.21.1643449637267; 
 Sat, 29 Jan 2022 01:47:17 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id n10sm1950649vso.34.2022.01.29.01.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 01:47:16 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu enabled
 features
Date: Sat, 29 Jan 2022 06:46:45 -0300
Message-Id: <20220129094644.385841-1-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following steps describe a migration bug:
1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
2 - Migrate to a host with EPYC-Naples cpu

The guest kernel crashes shortly after the migration.

The crash happens due to a fault caused by XRSTOR:
A set bit in XSTATE_BV is not set in XCR0.
The faulting bit is FEATURE_PKRU (enabled in Milan, but not in Naples)

To avoid this kind of bug:
In kvm_get_xsave, mask-out from xstate_bv any bits that are not set in
current vcpu's features.

This keeps cpu->env->xstate_bv with feature bits compatible with any
host machine capable of running the vcpu model.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 target/i386/xsave_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
index ac61a96344..0628226234 100644
--- a/target/i386/xsave_helper.c
+++ b/target/i386/xsave_helper.c
@@ -167,7 +167,7 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
         env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm + 8);
     }
 
-    env->xstate_bv = header->xstate_bv;
+    env->xstate_bv = header->xstate_bv & env->features[FEAT_XSAVE_COMP_LO];
 
     e = &x86_ext_save_areas[XSTATE_YMM_BIT];
     if (e->size && e->offset) {
-- 
2.34.1


