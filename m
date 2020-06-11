Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFE1F6E61
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 21:59:12 +0200 (CEST)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTLz-0002wp-0u
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 15:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8k-0007lW-5Q
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47928
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8h-0000yw-HG
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGWM2hNLocwo2GTocEC9QFnmpSz++kZYwy0QI1FJpC4=;
 b=Ee0LGvUwLnkTaSprPmUsp+ou9fVpdEfGL3VaW2m30qwt4lGCmESQq7dCJW3uGvUfa0ZGJm
 Jj91DAXMEMpuCKaUayD16OUlrilvELHD0j97Hrvt1n9t33KIrkA9Ur08HXGujMYzADsv1s
 RWHCYBRQloiTkMDDGv7e1s5wkD7UFt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Du7e0vxgMaOy_CHnh1q6mA-1; Thu, 11 Jun 2020 15:44:56 -0400
X-MC-Unique: Du7e0vxgMaOy_CHnh1q6mA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94D1219057A0
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 19:44:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B3B75EE0E;
 Thu, 11 Jun 2020 19:44:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 009/115] vl.c: run preconfig loop before creating default RAM
 backend
Date: Thu, 11 Jun 2020 15:43:03 -0400
Message-Id: <20200611194449.31468-10-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:52:10
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Default RAM backend depends on numa_uses_legacy_mem(), which is
infulenced by -numa options on CLI or set-numa-node QMP command
at preconfig time. If QEMU is started with  '-preconfig'
without -numa, it will lead to creating default RAM backend
even if later set-numa-node is used to assing RAM to NUMA nodes
using 'memdev' NUMA option.
That at best will waste RAM object created by default and with
next patch adding a check to prevent usage of conflicting
 '-M memory-backend' and '-numa memdev'
options, it will make QEMU error out if user tries to configure
NUMA at preconfig time with memdev option, making set-numa-node
unusable.

To fix issue, move preconfig loop before default RAM backend is
created, so that numa_uses_legacy_mem() would take into account
effects of set-numa-node commands executed at preconfig time.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200511141103.43768-2-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 05d1a4cb6b..055472da66 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4334,12 +4334,13 @@ void qemu_init(int argc, char **argv, char **envp)
 
     parse_numa_opts(current_machine);
 
+    /* do monitor/qmp handling at preconfig state if requested */
+    qemu_main_loop();
+
     if (machine_class->default_ram_id && current_machine->ram_size &&
         numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
         create_default_memdev(current_machine, mem_path);
     }
-    /* do monitor/qmp handling at preconfig state if requested */
-    qemu_main_loop();
 
     audio_init_audiodevs();
 
-- 
2.26.2



