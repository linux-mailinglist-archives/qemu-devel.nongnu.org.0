Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2E2488BB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:08:46 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83ED-0001Uf-Ur
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Lu-0006bC-4U
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48944
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Lm-0007gJ-3g
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNpg2+JxxivGlle9ggNErZ6ShlQW6g8IjN/0GSu0Dhw=;
 b=XxBHty0DAbDXu1uDGkZq+4CZUlEjKVx0hOBwZ3O0zTDOfwtlX9+vHZ8voKjorRMRfMrGWO
 sONGMMRfIFeFX/w9mog82+2LXvAXkOP+fdvRl6n589uM3JT+5FfauvBnpoPgcXOqG9Wh+/
 xa2vZYHX2KrnxjuMioNy+IqbYOQBieU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-iA5ECZiGNROzU8bklU_giw-1; Tue, 18 Aug 2020 10:12:24 -0400
X-MC-Unique: iA5ECZiGNROzU8bklU_giw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C929580F043
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:12:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DDBF7A1FA
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:12:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 148/150] meson: avoid unstable module warning with Meson 0.56.0
 or newer
Date: Tue, 18 Aug 2020 10:10:23 -0400
Message-Id: <20200818141025.21608-149-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 08:01:06
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
index 57cfa8723d..94bfaa6290 100644
--- a/meson.build
+++ b/meson.build
@@ -3,7 +3,11 @@ project('qemu', ['c'], meson_version: '>=0.55.0',
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



