Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77F42BBB1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:34:05 +0200 (CEST)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaeC-0003le-3o
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEt-0002RQ-0D
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEn-0005s3-Ud
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: by mail-ed1-x534.google.com with SMTP id ec8so7259323edb.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uRLBkBTO2vHgRUnd0ocK68bxa5JKjoSqkWbJMyecl8U=;
 b=EDE5P8Tw1ButNzLc/B29bAglgTF2XoNa34gXzwJ7eobOhUpubepWrJ6BN/cdkYSpGM
 l/FOQKmhUlFAdSSvdLChNkqEvomE2BQwkh4DUakOP/smlxa+y5DcgGcB+tS76JQRLjyN
 79V19FjNhpT0Fmm7ho6bMLRiTej7zTBPYdrbl5n4QUONaWds/PJspleBLNtGD9BqCJWk
 NHmxDVWOABfIxsDUETlbl8+yxwTj3dnHo1EXVEYZjWeOdMVJf9BK66IFPL6RrwXK91Aa
 9W8WMQ+RNcqpqFInb3gA2qgR+MMmbQ3djNofi8w/bK20GIMuYbE6fMBQjB5m8yKI1UMw
 CYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uRLBkBTO2vHgRUnd0ocK68bxa5JKjoSqkWbJMyecl8U=;
 b=QqHpq+KlHpcfq9KFdARa9tF5A33bKuJxIVVbSozJZzfoliImXW08kEFpE7yKShOfXV
 +r2hIwX2MOx0SC6rue8SYVrWxP/RCp6eS1ModGPQOvGsNFX2P2LTRfffsQVvIKTikbml
 u2/kl7i3OyozVIiMqxa3NSeMqvfSbw3I6jPPCbfC15+tIP3X4AFLEOKgnojotJafiohL
 BpSX15a120dOUtCx9aXi9fzEjNwf8w3N1Z1sPDtok7K4yCtIQ17qawHe+g9AC2SZlMox
 UFUyzPYF2PDH2xjeKfBMCkGpuauc5ppJ4mCZyCCXreTwhBqUaWubcRvQpKs4pq+YiTr7
 zDFg==
X-Gm-Message-State: AOAM530RZBp6+XudQ/TKb2rF6pwKF3Jp8ulk5UBy+1DEGnnWPfQUqBKd
 APRyQ+b9nqYKzLmu13CiZMD9QKNvuXw=
X-Google-Smtp-Source: ABdhPJzQl9oyrJzwItBimjJwuj0lMntHqyEvjOggFpqNXEZ89i58XF7VMtuDJvUmqAsdW2Gg9pqhSw==
X-Received: by 2002:a17:906:3715:: with SMTP id
 d21mr40132972ejc.74.1634116068525; 
 Wed, 13 Oct 2021 02:07:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/40] monitor: Reduce hmp_info_sev() declaration
Date: Wed, 13 Oct 2021 11:07:15 +0200
Message-Id: <20211013090728.309365-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

While being conditionally used for TARGET_I386 in hmp-commands-info.hx,
hmp_info_sev() is declared for all targets. Reduce its declaration
to target including "monitor/hmp-target.h". This is a minor cleanup.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-23-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/monitor/hmp-target.h  | 1 +
 include/monitor/hmp.h         | 1 -
 target/i386/sev-sysemu-stub.c | 2 +-
 target/i386/sev.c             | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index dc53add7ee..96956d0fc4 100644
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
index 3baa1058e2..6bc27639e0 100644
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
index 68518fd3f9..7a29295d1e 100644
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
index 19504796fb..4c64c68244 100644
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



