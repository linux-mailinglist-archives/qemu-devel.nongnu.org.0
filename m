Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381560C6CE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:46:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFVo-0003tf-6F; Tue, 25 Oct 2022 04:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwy-0004i1-Ir
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwZ-0007vN-8B
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fftWor+J/SFCK/DCtKxeYNuz599uB+cJZYMzXXVYnU=;
 b=LqFpJJxK0EJQcBB7G1zMfpXvzhhNAtQS+hc4Zamfk6D7+2lZ28sx1kf/6aEfN7zfWSbTP9
 t6jiPqglVH07NlUcRmNEsUDh0igWomaHnIcXigf52N9mrs9pmPoA8f7hQl6KQ6FgNY5fzT
 SljkAfUsoqDZspv/f2HA3U7iIA0j0l0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-5o77lb38Oo-LgrvNpVKwkQ-1; Tue, 25 Oct 2022 04:05:45 -0400
X-MC-Unique: 5o77lb38Oo-LgrvNpVKwkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEA962999B50;
 Tue, 25 Oct 2022 08:05:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B32D22166B31;
 Tue, 25 Oct 2022 08:05:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51EE921E60CC; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 23/28] qapi tpm: Elide redundant has_FOO in generated C
Date: Tue, 25 Oct 2022 10:05:36 +0200
Message-Id: <20221025080541.271547-24-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
References: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/tpm.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20221018062849.3420573-24-armbru@redhat.com>
---
 backends/tpm/tpm_passthrough.c | 2 --
 monitor/hmp-cmds.c             | 8 ++++----
 scripts/qapi/schema.py         | 1 -
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 5a2f74db1b..179697a3a9 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -259,12 +259,10 @@ tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, QemuOpts *opts)
     value = qemu_opt_get(opts, "cancel-path");
     if (value) {
         tpm_pt->options->cancel_path = g_strdup(value);
-        tpm_pt->options->has_cancel_path = true;
     }
 
     value = qemu_opt_get(opts, "path");
     if (value) {
-        tpm_pt->options->has_path = true;
         tpm_pt->options->path = g_strdup(value);
     }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8f8bd93df1..378f5b083d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -885,10 +885,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
         case TPM_TYPE_PASSTHROUGH:
             tpo = ti->options->u.passthrough.data;
             monitor_printf(mon, "%s%s%s%s",
-                           tpo->has_path ? ",path=" : "",
-                           tpo->has_path ? tpo->path : "",
-                           tpo->has_cancel_path ? ",cancel-path=" : "",
-                           tpo->has_cancel_path ? tpo->cancel_path : "");
+                           tpo->path ? ",path=" : "",
+                           tpo->path ?: "",
+                           tpo->cancel_path ? ",cancel-path=" : "",
+                           tpo->cancel_path ?: "");
             break;
         case TPM_TYPE_EMULATOR:
             teo = ti->options->u.emulator.data;
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 0544037e71..f0726af876 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/tpm.json',
             'qapi/transaction.json',
             'qapi/ui.json',
             'qapi/virtio.json',
-- 
2.37.3


