Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC823BE90
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 19:06:39 +0200 (CEST)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k30Od-0004v9-16
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 13:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k30Jk-00070o-4S
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:01:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20621
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k30JY-0005S6-C8
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596560483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=lYXuxcpUGvBzCNXaXLs4Q4NI+vITEib0V44KH+fziNg=;
 b=CHls41Dzw01bfh3kPClPVrYq7JBACdYgdYhOAmSmXckMyP5aTy/WASxb+QpW9LJ+5krkfn
 Q7Vh7D4Dks134DjG6Uwgyw1MOI1IZZEY9VFn/se4SvvjcXSgnUCz/Ebr9avCnt4uepfiHt
 Opqgz08xquqOekcctnvW0T27j3F0xO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-d8rNA4RtM5a8-s6YUqP5UQ-1; Tue, 04 Aug 2020 13:01:22 -0400
X-MC-Unique: d8rNA4RtM5a8-s6YUqP5UQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 026AB8064DD;
 Tue,  4 Aug 2020 17:01:21 +0000 (UTC)
Received: from thuth.com (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A16FA101042E;
 Tue,  4 Aug 2020 17:01:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 03/11] tests/Makefile: test-image-locking needs CONFIG_POSIX
Date: Tue,  4 Aug 2020 19:00:47 +0200
Message-Id: <20200804170055.2851-4-thuth@redhat.com>
In-Reply-To: <20200804170055.2851-1-thuth@redhat.com>
References: <20200804170055.2851-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test-image-locking.c uses the qemu_lock_fd_test() function which is
only available on POSIX-like systems.

Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index c7e4646ded..1e5ca3b585 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -87,7 +87,9 @@ check-unit-$(CONFIG_BLOCK) += tests/test-blockjob$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-blockjob-txn$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-block-backend$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-block-iothread$(EXESUF)
+ifeq ($(CONFIG_POSIX),y)
 check-unit-$(CONFIG_BLOCK) += tests/test-image-locking$(EXESUF)
+endif
 check-unit-y += tests/test-x86-cpuid$(EXESUF)
 # all code tested by test-x86-cpuid is inside topology.h
 ifeq ($(CONFIG_SOFTMMU),y)
-- 
2.18.1


