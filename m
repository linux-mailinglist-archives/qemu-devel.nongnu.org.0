Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F23025ABB0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:04:55 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSRa-0006X6-Ko
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMS-00064g-Cd
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33616
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMP-000776-SF
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599051573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwXmnckO+iG2uDr07UWgSCscI6KlxObmHPb2/Umqe7c=;
 b=NoEUNaJmIthbEKBQfSR38UlMY+NO7RJbyM4g1k3aZNUjU+1iWEZgT3JT9rvJzf3TdPasUd
 JZMcpHXGZgTr3MRRQW23R0L5bz3jkNo+bupBsipH00OrMwwD++N7gg5HJKZr1UiMmYiBD4
 IW91jNiFBwe655+H4IqDn7VZm9gI5Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-L3jkQMChPNmX-ORcKgdK_A-1; Wed, 02 Sep 2020 08:59:31 -0400
X-MC-Unique: L3jkQMChPNmX-ORcKgdK_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E017981F009
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E96776E01;
 Wed,  2 Sep 2020 12:59:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/39] meson: remove old socket_scm_helper rule
Date: Wed,  2 Sep 2020 08:58:56 -0400
Message-Id: <20200902125917.26021-19-pbonzini@redhat.com>
In-Reply-To: <20200902125917.26021-1-pbonzini@redhat.com>
References: <20200902125917.26021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:33:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It was covered already in commit d3ca592b3c10 ("meson: convert check-block")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200828110734.1638685-9-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ce0a9fd780..b68911833f 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -66,7 +66,6 @@ tests/migration/initrd-stress.img: tests/migration/stress$(EXESUF)
 	rmdir $(INITRD_WORK_DIR)
 
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-obj-y) libvhost-user.a
-tests/qemu-iotests/socket_scm_helper$(EXESUF): tests/qemu-iotests/socket_scm_helper.o
 
 SPEED = quick
 
-- 
2.26.2



