Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0512447CB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:15:27 +0200 (CEST)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WkA-0005Fc-RV
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VoA-0000GZ-1A
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:15:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24412
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6Vnz-0003Ff-Bx
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIL+ex7FDmZVCocCIOpy2utUYx/tM5pJEJ3NyMMMe7I=;
 b=XFjZMCcOnsDcVTtj1XtQwOC0LbB+ybf5TxBWbKD3C5WA5i3CDcx1q7skyVhVFPSwERprhP
 wEso7HzUJ1dJk+RO/BTQ2D3QWYon5BN1z0yGDLoCP9ostq560OdXFguqJZwRBeJlN47TcB
 zGiLRWHxqpkAWOCnNGwhmqXrgCCiA9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-lahkLq--PcuoeiunTD_zPQ-1; Fri, 14 Aug 2020 05:15:16 -0400
X-MC-Unique: lahkLq--PcuoeiunTD_zPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B71E801AC3
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:15:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEBDE5C1BD
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:15:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 148/150] meson: avoid unstable module warning with Meson
 0.56.0 or newer
Date: Fri, 14 Aug 2020 05:13:24 -0400
Message-Id: <20200814091326.16173-149-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 01:57:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index dd2cffc6aa..f9f223cdfd 100644
--- a/meson.build
+++ b/meson.build
@@ -3,7 +3,11 @@ project('qemu', ['c', 'cpp'], meson_version: '>=0.55.0',
         version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())
 
 not_found = dependency('', required: false)
-keyval = import('unstable-keyval')
+if meson.version().version_compare('>=0.56.0')
+  keyval = import('keyval')
+else
+  keyval = import('unstable-keyval')
+endif
 ss = import('sourceset')
 
 sh = find_program('sh')
-- 
2.26.2



