Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C36276E7B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 12:18:50 +0200 (CEST)
Received: from localhost ([::1]:52246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLOKv-0006CF-I7
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 06:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUy-0003OR-50
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUo-0006GC-0O
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIZTR2GhufpytKXpAEmO3Z9wgr1JeJUUT2XoT3GbFuI=;
 b=N7wB3Sdi5lw5MhCNvapFhh4dMara0Rhh0b9/E5UtvnyoSV6nGb7BLZI/3j0gKuD67bstEt
 uoY2xrS2dwDiA/0bsmVtb2Ckkjs+EoMUntM1di4ezbsHJobX/7mD3JbJ38BO+c6Kg3HETj
 dmobrhlPHIU0+vKnzlQ/EotnvX+9buc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-kfN-zPwNNVi0Kq8ugQBJQw-1; Thu, 24 Sep 2020 05:24:50 -0400
X-MC-Unique: kfN-zPwNNVi0Kq8ugQBJQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED3F9104D3EE;
 Thu, 24 Sep 2020 09:24:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6669055778;
 Thu, 24 Sep 2020 09:24:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 81/92] helper_syscall x86_64: clear exception_is_int
Date: Thu, 24 Sep 2020 05:23:03 -0400
Message-Id: <20200924092314.1722645-82-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Douglas Crosher <dtc-ubuntu@scieneer.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Douglas Crosher <dtc-ubuntu@scieneer.com>

The exception_is_int flag may be set on entry to helper_syscall,
e.g. after a prior interrupt that has returned, and processing
EXCP_SYSCALL as an interrupt causes it to fail so clear this flag.

Signed-off-by: Douglas Crosher <dtc-ubuntu@scieneer.com>
Message-Id: <a7dab33e-eda6-f988-52e9-f3d32db7538d@scieneer.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/seg_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
index b96de068ca..be88938c2a 100644
--- a/target/i386/seg_helper.c
+++ b/target/i386/seg_helper.c
@@ -975,6 +975,7 @@ void helper_syscall(CPUX86State *env, int next_eip_addend)
     CPUState *cs = env_cpu(env);
 
     cs->exception_index = EXCP_SYSCALL;
+    env->exception_is_int = 0;
     env->exception_next_eip = env->eip + next_eip_addend;
     cpu_loop_exit(cs);
 }
-- 
2.26.2



