Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B2298EDB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 15:07:55 +0100 (CET)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX3A9-0006Xc-To
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 10:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX2ur-0005qa-Hy
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX2uo-0001lo-6a
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603720302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfIiDQwTy2juH+OOnhgr+JgrKxNbYPcVhpVCYRhsDRM=;
 b=a1qMSRsDKAQoq8okCzHojKA31fiXSMelA2TL6bkygYSsQZUk2JgxwTaODZ45eF8YUwJ6ep
 ps3qdO8BjKnjMTiZrtmP4mdf+5WIvnEmA8JYMQvDCWiLpA2OjNG1K+dtbtH7khtGJtkBSq
 K9bKF68G5b3GH9k4mDDTU45KNauxwqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-JuLm2UGUMJK2fFaK2KowuQ-1; Mon, 26 Oct 2020 09:51:39 -0400
X-MC-Unique: JuLm2UGUMJK2fFaK2KowuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3EC2108E1D9;
 Mon, 26 Oct 2020 13:51:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 837781002391;
 Mon, 26 Oct 2020 13:51:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] WHPX: Fix WHPX build break
Date: Mon, 26 Oct 2020 09:51:27 -0400
Message-Id: <20201026135131.3006712-14-pbonzini@redhat.com>
In-Reply-To: <20201026135131.3006712-1-pbonzini@redhat.com>
References: <20201026135131.3006712-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sunil Muthuswamy <sunilmut@microsoft.com>

With upstream commit#8a19980e3fc4, logic was introduced to only
allow WHPX build on x64. But, the logic checks for the cpu family
and not the cpu. On my fedora container build, the cpu family is
x86 and the cpu is x86_64. Fixing the build break by checking for
the cpu, instead of the cpu family.

Signed-off-by: Sunil Muthuswamy <sunilmut@microsoft.com>
Message-Id: <SN4PR2101MB0880D706A85793DDFC411304C01D0@SN4PR2101MB0880.namprd21.prod.outlook.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 342b8bcab5..61919c024a 100644
--- a/meson.build
+++ b/meson.build
@@ -204,7 +204,7 @@ else
   have_xen_pci_passthrough = false
 endif
 if not get_option('whpx').disabled() and targetos == 'windows'
-  if get_option('whpx').enabled() and cpu != 'x86_64'
+  if get_option('whpx').enabled() and host_machine.cpu() != 'x86_64'
     error('WHPX requires 64-bit host')
   elif cc.has_header('WinHvPlatform.h', required: get_option('whpx')) and \
        cc.has_header('WinHvEmulation.h', required: get_option('whpx'))
-- 
2.26.2



