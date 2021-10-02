Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B751641FC05
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:03:19 +0200 (CEST)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWefe-0003CT-Kk
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXR-0002SW-Cs
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXP-00010W-RU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WyR/eNCtMhabJTiJL4KYPQfagO3ysZNetDQfcxieNmI=;
 b=fVsltZ6HffjC1hd7tmQU6T9GQyrwvL4MAOyBjfoUhvwkNh5jg49dTbrlb6cneTMLejizPX
 6QakBJQu4NqoT+E6lCPMRXN2sSngDGsZYTiZQ/vnvhPKXe6dYfHJcYsDLhEzf9vQsqiDj3
 zLfYKk8B/CZqo2Mqs1Um/m+B+x/6upg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-HgLWEliTNb6XRwYnSB9rvQ-1; Sat, 02 Oct 2021 08:54:46 -0400
X-MC-Unique: HgLWEliTNb6XRwYnSB9rvQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a7bc5d1000000b0030d4041f73eso1968612wmk.4
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WyR/eNCtMhabJTiJL4KYPQfagO3ysZNetDQfcxieNmI=;
 b=dkd8bm/1ld+O3b15xeO+ZX+sTTCOF/rtY+1Ffh4fqtX7dpwWj+u1dv7pQ9mELWmXeV
 WlA6x953VyidmGIWL4aoLFR+YmJOf0uWL5nD0b6ZO3aRYnR9UbCkOHxwUm6Hhwy9AUpM
 Tj6/cM67cmw94G60Xw3CiS7Nnzb3i9D/gk1ot/liHDVZBsyoJOrqYM8cXNiWGTtG91sr
 OxhTzPtwRZxEJT40oZxTmDvdm192g7pmaqAJG+U4TAA0E/zdxuCJxUeNucgaBB5bN8c4
 /JrFENTf5sjZPZcDiaJoIwUeNkJRQix0R/7XOXKSWtkT8zzNDx4uGhGPI+jr88A09iDZ
 OVpg==
X-Gm-Message-State: AOAM533flnbGAyH5+9iipGD0pWrQ3RA/xHdr89O5NihpuJz10bcCBQ2z
 u80xB00pfv3/9IuTrZxb/eWsPAdTQffpzA65E0ASWMJMHNygynldzX9V2uXUKBMFjEcpWsHu0zG
 es/wePTDrsmswo67AuyegMKHfmTuhdSXsamlMxM6cYIWvoCIbSKlhsZXR3hSjvBwI
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr3370235wrr.187.1633179285104; 
 Sat, 02 Oct 2021 05:54:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy67yh1G/4H9iMDyZQOpRZdq+m1Nl/19ODGozR8E+nhB1/ZKWnqdXBw6WrBb4+UnlkFrV3bSA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr3370205wrr.187.1633179284860; 
 Sat, 02 Oct 2021 05:54:44 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o12sm8851885wms.15.2021.10.02.05.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/22] monitor: Restrict 'info sev' to x86 targets
Date: Sat,  2 Oct 2021 14:53:14 +0200
Message-Id: <20211002125317.3418648-20-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/monitor/hmp-target.h  | 1 +
 include/monitor/hmp.h         | 1 -
 target/i386/sev-sysemu-stub.c | 2 +-
 target/i386/sev.c             | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index dc53add7eef..96956d0fc41 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -49,6 +49,7 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
+void hmp_info_sev(Monitor *mon, const QDict *qdict);
 void hmp_info_sgx(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa1058e2c..6bc27639e01 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -124,7 +124,6 @@ void hmp_info_ramblock(Monitor *mon, const QDict *qdict);
 void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict);
 void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict);
 void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict);
-void hmp_info_sev(Monitor *mon, const QDict *qdict);
 void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 1836b32e4fc..b2a4033a030 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
-#include "monitor/hmp.h"
+#include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 7caaa117ff7..c6d8fc52eb2 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -32,7 +32,7 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
-#include "monitor/hmp.h"
+#include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
-- 
2.31.1


