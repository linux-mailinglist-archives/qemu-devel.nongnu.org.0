Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FE313B6B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:49:32 +0100 (CET)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AfD-0004HC-8E
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94jp-0001Y8-Vu
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:29:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94jd-0002D1-Aw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TC0oIbcH2+Jl5Clk2QXKmW8utKg37UsUy5kd2yakaA=;
 b=h3qHzEFL5bamTzwtoYCywo91r2loPiG8Uvq+2DwArnO3aFenaYrxfjePOhSSTjPUI52RsL
 CONGR7G6DLQy593pc8ZzZ0zOrfCOkLrT7T1+ucmpy1JZ1kvtzhjh+xVdkFEtSSfiuP2oR4
 O1ZiVCthcN496vzQl2FIE2ZKXvuH+Kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Ucd7tgPgOu6Jtr098o74AQ-1; Mon, 08 Feb 2021 06:29:37 -0500
X-MC-Unique: Ucd7tgPgOu6Jtr098o74AQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D824E107ACC7;
 Mon,  8 Feb 2021 11:29:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D26D41002388;
 Mon,  8 Feb 2021 11:29:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 02/27] savevm: Fix memory leak of vmstate_configuration
Date: Mon,  8 Feb 2021 11:28:53 +0000
Message-Id: <20210208112918.185058-3-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Jinhao Gao <gaojinhao@huawei.com>

When VM migrate VMState of configuration, the fields(name and capabilities)
of configuration having a flag of VMS_ALLOC need to allocate memory. If the
src doesn't free memory of capabilities in SaveState after save VMState of
configuration, or the dst doesn't free memory of name and capabilities in post
load of configuration, it may result in memory leak of name and capabilities.
We free memory in configuration_post_save and configuration_post_load func,
which prevents memory leak.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20201231061020.828-3-gaojinhao@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 4f3b69ecfc..d1e6aaed60 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -315,6 +315,16 @@ static int configuration_pre_save(void *opaque)
     return 0;
 }
 
+static int configuration_post_save(void *opaque)
+{
+    SaveState *state = opaque;
+
+    g_free(state->capabilities);
+    state->capabilities = NULL;
+    state->caps_count = 0;
+    return 0;
+}
+
 static int configuration_pre_load(void *opaque)
 {
     SaveState *state = opaque;
@@ -365,24 +375,36 @@ static int configuration_post_load(void *opaque, int version_id)
 {
     SaveState *state = opaque;
     const char *current_name = MACHINE_GET_CLASS(current_machine)->name;
+    int ret = 0;
 
     if (strncmp(state->name, current_name, state->len) != 0) {
         error_report("Machine type received is '%.*s' and local is '%s'",
                      (int) state->len, state->name, current_name);
-        return -EINVAL;
+        ret = -EINVAL;
+        goto out;
     }
 
     if (state->target_page_bits != qemu_target_page_bits()) {
         error_report("Received TARGET_PAGE_BITS is %d but local is %d",
                      state->target_page_bits, qemu_target_page_bits());
-        return -EINVAL;
+        ret = -EINVAL;
+        goto out;
     }
 
     if (!configuration_validate_capabilities(state)) {
-        return -EINVAL;
+        ret = -EINVAL;
+        goto out;
     }
 
-    return 0;
+out:
+    g_free((void *)state->name);
+    state->name = NULL;
+    state->len = 0;
+    g_free(state->capabilities);
+    state->capabilities = NULL;
+    state->caps_count = 0;
+
+    return ret;
 }
 
 static int get_capability(QEMUFile *f, void *pv, size_t size,
@@ -516,6 +538,7 @@ static const VMStateDescription vmstate_configuration = {
     .pre_load = configuration_pre_load,
     .post_load = configuration_post_load,
     .pre_save = configuration_pre_save,
+    .post_save = configuration_post_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(len, SaveState),
         VMSTATE_VBUFFER_ALLOC_UINT32(name, SaveState, 0, NULL, len),
-- 
2.29.2


