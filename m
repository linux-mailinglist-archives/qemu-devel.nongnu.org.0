Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE0270F58
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 18:16:16 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJfX5-0006uT-7L
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 12:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfH9-0005PZ-Mc
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 11:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfGx-0007NH-MM
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 11:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600531175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPGBDRWzNPEJeb+ZkX8dUDQ6P3CC5kzoM+bMM7X804o=;
 b=DIwDOjE9usP4eqAEPWXXRhs/YECOQmsojM78mqHYex/4x8r5w5KzrN59qHcnUIq1hWlBfG
 y1rDjK8GQQCgI0xfYqEBeTAk9FflIJ5oG3ESfSbBHdYet+vaBDC9jz4CUKa/FtYx1gz6u5
 9dxFjTUq9ayiNsqjirNhu56w9njm7Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-HLDMZhmpMGa7noKdF0JzFw-1; Sat, 19 Sep 2020 11:59:33 -0400
X-MC-Unique: HLDMZhmpMGa7noKdF0JzFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B3741074644
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD9A2196F3;
 Sat, 19 Sep 2020 15:59:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/57] numa: remove fixup numa_state->num_nodes to MAX_NODES
Date: Sat, 19 Sep 2020 11:58:36 -0400
Message-Id: <20200919155916.1046398-18-pbonzini@redhat.com>
In-Reply-To: <20200919155916.1046398-1-pbonzini@redhat.com>
References: <20200919155916.1046398-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 06:41:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

current code permits only nodeids in [0..MAX_NODES) range
due to nodeid check in

  parse_numa_node()
      if (nodenr >= MAX_NODES) {
          error_setg(errp, "Max number of NUMA nodes reached: %"

so subj fixup is not reachable, drop it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200911084410.788171-4-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/numa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 706c1e84c6..7d5d413001 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -677,10 +677,6 @@ void numa_complete_configuration(MachineState *ms)
     if (ms->numa_state->num_nodes > 0) {
         uint64_t numa_total;
 
-        if (ms->numa_state->num_nodes > MAX_NODES) {
-            ms->numa_state->num_nodes = MAX_NODES;
-        }
-
         numa_total = 0;
         for (i = 0; i < ms->numa_state->num_nodes; i++) {
             numa_total += numa_info[i].node_mem;
-- 
2.26.2



