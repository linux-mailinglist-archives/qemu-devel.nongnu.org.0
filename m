Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90F42581D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:38:14 +0200 (CEST)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWPN-0005u4-GM
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6s-0006IA-5I
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6o-0006PJ-3S
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dszCsYIAf35aWLecKqc6M9ImtE7DijrXFcMIXKeRiqY=;
 b=fOMoK7yu2Th/DklPfAtgBmj+ayBhrgWm59dOJGrfV8DltP4gr12ZIy8qg++UJFaiKDkTAo
 3OxJ7lKn3nBGVm2rrVijF9IjQ0kBa/ry5s/1k8PvNbBifxPizTp3nXBt1l+ZPmvO2/X2ZL
 6+9ZlPu5L6K74NZjZ7tT7bMIXb/sZg8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-hQF28j5INBOUj-mpoG96ug-1; Thu, 07 Oct 2021 12:19:00 -0400
X-MC-Unique: hQF28j5INBOUj-mpoG96ug-1
Received: by mail-wr1-f69.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so5119412wrc.21
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dszCsYIAf35aWLecKqc6M9ImtE7DijrXFcMIXKeRiqY=;
 b=OT8YtTFsRrfxiqTp01yKJVKXnd6OwxCDK/dMR/rgIRSk6A0dH7KNUAsf7emBORjOkT
 /CTw+4SmjSovBnRAzSDKWKmGGVd//vuZEii+06JkM2jMaZfAsHGA/hWWbfvn5x+BPfpo
 D0DMZVn5CpEpDiyGv1tt4fAmEncKw2Stm7weRRD3E4LhCLrYvzAL3C/GE+7oI5Q0cFLR
 q7i09hLiYvWzQUwFMur0KMOTNj/vGo/Eg7GE9+whCHSdHisInfK240hhf3P0GwqOvdSy
 XktNQRPoYPxsoyfn6Zc7RTh0oDUh81OPiuO/tbc5Ez9MGbripVTyW+K4va1tBR751Fnd
 rkQQ==
X-Gm-Message-State: AOAM530NxyR9KcjgK4i5vWtHtPdEslFEn9dssPacFDgrmT1zejLyl0fW
 hdzo7kKt+3j+s6mvucOPld0HuvPMtiYDhzghrNU5Ydox2coH4qGLgFkn5gCJplovx6BTG/ROj8G
 scAYh9NWg+rx89oUeiMWzivz5IuJu7C6bLP9izOvrR8Xa3+Pg9r+QrdgU4YPFsRWN
X-Received: by 2002:a05:600c:2199:: with SMTP id
 e25mr17668201wme.67.1633623538612; 
 Thu, 07 Oct 2021 09:18:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNRqSXp1fcCQwH5Qrmb0ILMhSM78sS3Mu8PApG1hGseG2CcrM+8gbZcUik9BKir5O9HMblnA==
X-Received: by 2002:a05:600c:2199:: with SMTP id
 e25mr17668154wme.67.1633623538287; 
 Thu, 07 Oct 2021 09:18:58 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c77sm4630wme.48.2021.10.07.09.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/23] monitor: Reduce hmp_info_sev() declaration
Date: Thu,  7 Oct 2021 18:17:15 +0200
Message-Id: <20211007161716.453984-23-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While being conditionally used for TARGET_I386 in hmp-commands-info.hx,
hmp_info_sev() is declared for all targets. Reduce its declaration
to target including "monitor/hmp-target.h". This is a minor cleanup.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 68518fd3f9d..7a29295d1ed 100644
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
index 19504796fb7..4c64c682442 100644
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


