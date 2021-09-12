Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208F74081EB
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 23:46:50 +0200 (CEST)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPXJJ-0002cz-6k
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 17:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1mPXHM-0001pF-9K
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:44:48 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1mPXHK-0006cH-CO
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:44:47 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFB0D21E67;
 Sun, 12 Sep 2021 21:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631483082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QXvQipzI78tMw8fOUhj6hZM+mWzO0nfIO2mNG7GQfyA=;
 b=c533yAgrdYwk7gfSLobMRbj1zFL0J26N5XVXJ2UcuHlqlZr2SFN2l9v5nmciMtkok53LDD
 9Dlaz2ifjYrt8XvocGOjw4Jx3kGD+uzdNzld6oZNsQtJfPpcjCU7OUCMNSziRmULEB82Lh
 fuRp71+bGXqf2GUjWeh7KIDibmhOONY=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 891B8132AB;
 Sun, 12 Sep 2021 21:44:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 8aIxH8p0PmE8MgAAGKfGzw
 (envelope-from <mwilck@suse.com>); Sun, 12 Sep 2021 21:44:42 +0000
From: mwilck@suse.com
To: Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Jos=C3=A9=20Ricardo=20Ziviani?= <jose.ziviani@suse.com>,
 Martin Wilck <mwilck@suse.com>
Subject: [PATCH v2 1/2] qemu-binfmt-conf.sh: fix -F option
Date: Sun, 12 Sep 2021 23:44:40 +0200
Message-Id: <20210912214440.1280-1-mwilck@suse.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=mwilck@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Martin Wilck <mwilck@suse.com>

qemu-binfmt-conf.sh should use "-F" as short option for "--qemu-suffix".
Fix the getopt call to make this work.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
v2: fixed overlong line to make patchew bot happy. Sorry for the long
    delay, I'd missed the bot's reply.

---
 scripts/qemu-binfmt-conf.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index fb504a4..c73a785 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -338,7 +338,9 @@ PERSISTENT=no
 PRESERVE_ARG0=no
 QEMU_SUFFIX=""
 
-options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
+_longopts="debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,\
+persistent:,preserve-argv0:"
+options=$(getopt -o ds:Q:S:e:hc:p:g:F: -l ${_longopts} -- "$@")
 eval set -- "$options"
 
 while true ; do
-- 
2.33.0


