Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879032CB906
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:37:06 +0100 (CET)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOZN-0001KI-GY
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM5-0006c8-0D
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM1-0006wx-63
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606897149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9W9eJP/VdbLgnM1gIVhh2SIEHqXQtXY91OhU3orp+gY=;
 b=jHUM0XgS9mSZP17jdAIwYmaIpbxUD0K0qVMWhWMfOMH6uGZoV8Pzk8NHxyATiFDhgVu0R8
 Hj9LuRhPxA4B2SEiREjMdw92p6Zb7e53FgYWtJRVmmPkGGi4FbwB40fkhPmpsoRSdzJozS
 yqoHp58z54EtjyZuR3BaMUyY8OqO/d0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-x6Ka0LBQO4mgZ_9w-7pCeA-1; Wed, 02 Dec 2020 03:19:07 -0500
X-MC-Unique: x6Ka0LBQO4mgZ_9w-7pCeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C7D8185A0D7
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:19:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 495DD5D9DC;
 Wed,  2 Dec 2020 08:19:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/15] null-machine: do not create a default memdev
Date: Wed,  2 Dec 2020 03:18:53 -0500
Message-Id: <20201202081854.4126071-15-pbonzini@redhat.com>
In-Reply-To: <20201202081854.4126071-1-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default RAM size is 0, so no RAM will be created anyway.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/null-machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 7e693523d7..c40badf5bc 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -49,7 +49,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->init = machine_none_init;
     mc->max_cpus = 1;
     mc->default_ram_size = 0;
-    mc->default_ram_id = "ram";
+    mc->default_ram_id = NULL;
     mc->no_serial = 1;
     mc->no_parallel = 1;
     mc->no_floppy = 1;
-- 
2.26.2



