Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5146171C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:56:32 +0100 (CET)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh8x-000325-Nu
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1mrh49-0003hI-Aj
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:34 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:47498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mwilck@suse.com>) id 1mrh44-000318-Lb
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:31 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E01131FCA1;
 Mon, 29 Nov 2021 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1638193882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iqpoKazBX1gxmupYcru93ar2fqVBSeGBPM/7KOmzjIw=;
 b=E6Rur0oW+ounVmN/zRt1RRz7VXVgC2Yf4trQK82D6+Tr2vARyE+kCi25cf8ayotx4ShQfB
 FoTRPTb0N3Yvmo1hByhv4sf375hpfkV1ZOMK1YTpwaWzjh0M/YrCru3WX3BwPKA8i8jJbd
 q36awKtCrAbSpFqw5h73uwwiA4aVgiA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B5FF13B08;
 Mon, 29 Nov 2021 13:51:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yiUFJNrapGHCbAAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 29 Nov 2021 13:51:22 +0000
From: mwilck@suse.com
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Jos=C3=A9=20Ricardo=20Ziviani?= <jose.ziviani@suse.com>,
 Claudio Fontana <claudio.fontana@suse.com>, Martin Wilck <mwilck@suse.com>
Subject: [PATCH resend v2] qemu-binfmt-conf.sh: fix -F option
Date: Mon, 29 Nov 2021 14:51:00 +0100
Message-Id: <20211129135100.3934-1-mwilck@suse.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=mwilck@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Martin Wilck <mwilck@suse.com>

qemu-binfmt-conf.sh should use "-F" as short option for "--qemu-suffix".
Fix the getopt call to make this work.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
previous: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg03132.html
ref: https://bugzilla.opensuse.org/show_bug.cgi?id=1186256
---
 scripts/qemu-binfmt-conf.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 7de996d536..e9bfeb94d3 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -340,7 +340,9 @@ PERSISTENT=no
 PRESERVE_ARG0=no
 QEMU_SUFFIX=""
 
-options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
+_longopts="debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,\
+persistent:,preserve-argv0:"
+options=$(getopt -o ds:Q:S:e:hc:p:g:F: -l ${_longopts} -- "$@")
 eval set -- "$options"
 
 while true ; do
-- 
2.33.1


