Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9653D05D7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:49:15 +0200 (CEST)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zUA-0004zo-QN
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCY-0003JJ-Rg
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCW-0007zo-DU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626823859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EjM0mYgA0SWCtN5K8STIkVYuxkcpc/YPCEphsLVjtFI=;
 b=gKuI9xRyipG3HAn/+WCw/6PSxHx/m7GrdZT3TDJkIxITXKbVHclEGkJKjnrWZ+sI4lJzVh
 IHFG/GxPCpTCzE2+GLCDpA/W0u0XWjd3elRYEmVx1hl7rL95yxuhx8K8I1BXK+hfV2K8Eb
 Uxl35SNlM5Yg9B1xpX/U+AcGKO+ws4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-H9IYTxObMbiheb4C5gdOGA-1; Tue, 20 Jul 2021 19:30:58 -0400
X-MC-Unique: H9IYTxObMbiheb4C5gdOGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E95CD1084F4B;
 Tue, 20 Jul 2021 23:30:56 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 075E41002F12;
 Tue, 20 Jul 2021 23:30:44 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/7] remote/memory: Replace share parameter with ram_flags
Date: Tue, 20 Jul 2021 19:30:18 -0400
Message-Id: <20210720233018.101541-8-crosa@redhat.com>
In-Reply-To: <20210720233018.101541-1-crosa@redhat.com>
References: <20210720233018.101541-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Beraldo Leal <bleal@redhat.com>,
 David Hildenbrand <david@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to
qemu_ram_alloc_from_fd()")

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210709052800.63588-1-yang.zhong@intel.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 hw/remote/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 472ed2a272..6e21ab1a45 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
         subregion = g_new(MemoryRegion, 1);
         memory_region_init_ram_from_fd(subregion, NULL,
                                        name, sysmem_info->sizes[region],
-                                       true, msg->fds[region],
+                                       RAM_SHARED, msg->fds[region],
                                        sysmem_info->offsets[region],
                                        errp);
 
-- 
2.31.1


