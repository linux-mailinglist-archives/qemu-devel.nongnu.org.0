Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60684A5925
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:24:44 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpP1-0005ww-Oj
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEoy7-0005eY-Pr
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEoy5-0000Ix-JE
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643705811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RktKE3VpOPZ1YbhVl8tz46kzsTzG3FlFb4m1soYkP9o=;
 b=gOEQmhjX6XMrKN6V6F2nzraGMUS6MIAu2SHNQjz7BwB9CdlwTkwbHdae96MGPsiQXo7HHy
 KvW2KU9UI/x9uoaNLKqJ+d0qLINMWQF06m9WIfMEaMarps80Lts+ytM63AkV8/SG8cjYLZ
 /ZfpnuIpCwi+fvCHcevHoXDzYV3ePAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-_OOXT7xEMpKL0WXxCDi0rQ-1; Tue, 01 Feb 2022 03:56:08 -0500
X-MC-Unique: _OOXT7xEMpKL0WXxCDi0rQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D821091DA9;
 Tue,  1 Feb 2022 08:56:07 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41BB04EC84;
 Tue,  1 Feb 2022 08:55:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] tests/lcitool: Allow lcitool-refresh in out-of-tree builds,
 too
Date: Tue,  1 Feb 2022 09:55:54 +0100
Message-Id: <20220201085554.85733-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running "make lcitool-refresh" in an out-of-tree build, it
currently fails with an error message from git like this:

 fatal: not a git repository (or any parent up to mount point /)
 Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

Fix it by changing to the source directory first before updating
the submodule.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/lcitool/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
index cff7c0b814..6b215adcd1 100644
--- a/tests/lcitool/Makefile.include
+++ b/tests/lcitool/Makefile.include
@@ -13,5 +13,5 @@ lcitool:
 lcitool-help: lcitool
 
 lcitool-refresh:
-	$(call quiet-command, git submodule update --init $(SRC_PATH)/tests/lcitool/libvirt-ci)
+	$(call quiet-command, cd $(SRC_PATH) && git submodule update --init tests/lcitool/libvirt-ci)
 	$(call quiet-command, $(LCITOOL_REFRESH))
-- 
2.27.0


