Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAD6EF9DE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:14:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjdi-0003f8-8e; Wed, 26 Apr 2023 14:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjdf-0003dx-TA
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjde-0000qc-D9
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682532789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hpFxDZgTL4tlOiN3Iw3xMAXDUUXTaaX8jXP0Fljze0=;
 b=INzHnZBknhk7B6hhnd3WctlgXFJzwCafcUvrnVtFbwPdgDGNTsbt3o/KiA7knX7reetDKV
 QpWn5krRFd05au1DRIAqIxq83G9O4YWSCLs8d68EleTXPoeMmB95dcc8iM6YvXzkJ1wwym
 2DgLuv9NIDjKujYrm7fHEsP602MCo8A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-4DYSCHB1MmKrW-b0wizx5w-1; Wed, 26 Apr 2023 14:13:07 -0400
X-MC-Unique: 4DYSCHB1MmKrW-b0wizx5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0F553C0F662
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 18:13:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61ED01121314;
 Wed, 26 Apr 2023 18:13:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 6/7] migration/vmstate-dump: Dump array size too as "num"
Date: Wed, 26 Apr 2023 20:12:52 +0200
Message-Id: <20230426181253.13286-7-quintela@redhat.com>
In-Reply-To: <20230426181253.13286-1-quintela@redhat.com>
References: <20230426181253.13286-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

For VMS_ARRAY typed vmsd fields, also dump the number of entries in the
array in -vmstate-dump.

Without such information, vmstate static checker can report false negatives
of incompatible vmsd on VMS_ARRAY typed fields, when the src/dst do not
have the same type of array defined.  It's because in the checker we only
check against size of fields within a VMSD field.

One example: e1000e used to have a field defined as a boolean array with 5
entries, then removed it and replaced it with UNUSED (in 31e3f318c8b535):

-        VMSTATE_BOOL_ARRAY(core.eitr_intr_pending, E1000EState,
-                           E1000E_MSIX_VEC_NUM),
+        VMSTATE_UNUSED(E1000E_MSIX_VEC_NUM),

It's a legal replacement but vmstate static checker is not happy with it,
because it checks only against the "size" field between the two
fields (here one is BOOL_ARRAY, the other is UNUSED):

For BOOL_ARRAY:

      {
        "field": "core.eitr_intr_pending",
        "version_id": 0,
        "field_exists": false,
        "size": 1
      },

For UNUSED:

      {
        "field": "unused",
        "version_id": 0,
        "field_exists": false,
        "size": 5
      },

It's not the script to blame because there's just not enough information
dumped to show the total size of the entry for an array.  Add it.

Note that this will not break old vmstate checker because the field will
just be ignored.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 211eff3a8b..a9181b444b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -536,6 +536,9 @@ static void dump_vmstate_vmsf(FILE *out_file, const VMStateField *field,
             field->version_id);
     fprintf(out_file, "%*s\"field_exists\": %s,\n", indent, "",
             field->field_exists ? "true" : "false");
+    if (field->flags & VMS_ARRAY) {
+        fprintf(out_file, "%*s\"num\": %d,\n", indent, "", field->num);
+    }
     fprintf(out_file, "%*s\"size\": %zu", indent, "", field->size);
     if (field->vmsd != NULL) {
         fprintf(out_file, ",\n");
-- 
2.40.0


