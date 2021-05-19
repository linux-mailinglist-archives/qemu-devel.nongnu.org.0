Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA94389292
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:28:44 +0200 (CEST)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljO7n-0002Cu-D7
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1ljO5E-0000p3-0O
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:26:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:52962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1ljO5B-00059Q-Gq
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:26:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621437957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=I8JhVWVz6KyBXk7bAPgVzdfokz0q7ya5EdUcoFPkKgI=;
 b=ByLOj/TAoEaaeTjEHScooTJPDHNIP/Aa0A0cKNq4i9UaS5S43JzntRVAF5oxz0hqSjflPw
 Thd8SymSYorv/GfeySdpwfmIk/p36Cnv7vMLXA3/zJT6elrw80cLqEb9TwIEf2KitqDdCQ
 DGXVH3SbQWIKP7mmjmWC+58MqOiWLnQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB4D5B172;
 Wed, 19 May 2021 15:25:57 +0000 (UTC)
From: mwilck@suse.com
To: Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
Cc: Martin Wilck <mwilck@suse.com>
Subject: [PATCH] qemu-binfmt-conf.sh: fix -F option
Date: Wed, 19 May 2021 17:25:41 +0200
Message-Id: <20210519152541.30625-1-mwilck@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=mwilck@suse.com;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Martin Wilck <mwilck@suse.com>

qemu-binfmt-conf.sh should use "-F" as short option for "--qemu-suffix".
Fix the getopt call to make this work.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 scripts/qemu-binfmt-conf.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index fb504a4..29ea33b 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -338,7 +338,7 @@ PERSISTENT=no
 PRESERVE_ARG0=no
 QEMU_SUFFIX=""
 
-options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
+options=$(getopt -o ds:Q:S:e:hc:p:g:F: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
 eval set -- "$options"
 
 while true ; do
-- 
2.31.1


