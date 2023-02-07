Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA168D103
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIlG-00039m-KV; Tue, 07 Feb 2023 02:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlD-00038Z-Ke
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlC-0000tX-3S
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675756285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXZtXohVUlKB9CTq9zhzjMTo9bb5KXXM8C/qDPWQXF0=;
 b=hpWRITdrehgNIozl1xU9hgTyODECcNYOLhu9YXBbfg79YM0jaxXWf3bJedSHuZz4IdCQiB
 QNex3T09mdiMy2hyIROMCRpIU/37w4gm8ze/9i4pQ8U+hb9qnfv8uo/M2z26Oun+IpCkNU
 RMgz8RTGEuvrov4JLEjghi+3lq4ohvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-PFhilGi3NiW9FYZTRV-v6g-1; Tue, 07 Feb 2023 02:51:18 -0500
X-MC-Unique: PFhilGi3NiW9FYZTRV-v6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3455B181B7CD;
 Tue,  7 Feb 2023 07:51:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2BC92026D38;
 Tue,  7 Feb 2023 07:51:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BD7CC21E6A22; Tue,  7 Feb 2023 08:51:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jiri@resnulli.us,
 jasowang@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 zhanghailiang@xfusion.com, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com
Subject: [PATCH 03/12] dump: Assert cpu_get_note_size() can't fail
Date: Tue,  7 Feb 2023 08:51:06 +0100
Message-Id: <20230207075115.1525-4-armbru@redhat.com>
In-Reply-To: <20230207075115.1525-1-armbru@redhat.com>
References: <20230207075115.1525-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only way cpu_get_note_size() can return a negative value is
integer overflow in the non-stub versions, which is a programming
error.  The stub version is not actually reachable, because the
cpu_get_dump_info() stub will fail first.  Use assert().  This gets
rid of another use of QERR_UNSUPPORTED.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 dump/dump.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 80620da40d..6be8a65fe3 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1865,10 +1865,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
 
     s->note_size = cpu_get_note_size(s->dump_info.d_class,
                                      s->dump_info.d_machine, nr_cpus);
-    if (s->note_size < 0) {
-        error_setg(errp, QERR_UNSUPPORTED);
-        goto cleanup;
-    }
+    assert(s->note_size >= 0);
 
     /*
      * The goal of this block is to (a) update the previously guessed
-- 
2.39.0


