Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7741246B14
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 17:49:07 +0200 (CEST)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7hNi-0003bb-Ob
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 11:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7gLM-00040i-9m
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:42:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27885
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7gLK-0006xM-KQ
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597675353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yESx4uQrlQDD7A1KJuXUBpw0lm9/dKGq7J7gF6Ild0=;
 b=QZa1E1CAmVTsF8cV1dEZQn0M7njjM7y02EiEq7MvbJIfe2h+6dlMrWsl/W7forZBfu+UIM
 hfPuaoZd5c++AVBlJds76X5qg2ytkJBk8TnA7uuPMz5krvw1Lrl0o2Ngble68/d6QtmIiY
 koazlvD3mxjJmDiJCteym4KPku9wtAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-2mB6O1kfNTiS3BnrHYKJ-w-1; Mon, 17 Aug 2020 10:42:32 -0400
X-MC-Unique: 2mB6O1kfNTiS3BnrHYKJ-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2881A1DDF9
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 14:42:31 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8125070C3D
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 14:42:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 147/150] meson: avoid unstable module warning with Meson
 0.56.0 or newer
Date: Mon, 17 Aug 2020 16:40:50 +0200
Message-Id: <20200817144053.345107-52-pbonzini@redhat.com>
In-Reply-To: <20200817143723.343284-1-pbonzini@redhat.com>
References: <20200817143723.343284-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 00:24:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
index 54e92195d6..3a689d2d07 100644
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



