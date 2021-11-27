Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A5460171
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 21:25:51 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr4GX-0003vF-Se
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 15:25:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Ag-0003p1-Sz
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:42 -0500
Received: from [2607:f8b0:4864:20::132] (port=39573
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Af-0004uL-It
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:42 -0500
Received: by mail-il1-x132.google.com with SMTP id a11so12394356ilj.6
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 12:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eam3w9LXPfpndp7R0xNZyvXloRay7O+0JeoCABaTlpc=;
 b=yQQlkAminKrQHJOm6nO+jNBtiaE4WVysjOgY5c/dxicc9KIJ7XBqxPDlLv/H8Nwpw0
 yEu/ZjUZox2+P20nMCoCgrh1oHjotmh7K+kLdY8oaVdo1nSiEVjdMrzoj5UkpaTk5pxK
 iBIOer7QbdkXJgBYIWv4DmVlCYOCPnhE2dzjMsFojRsZJSryTBDmWSmuOe+QH+/jP07J
 khgAfTnvJ+2UFKb6q5poiUfjVf7SUswGM4mxk1tjS4nn5MGheW96hR5sJRVqazmS7T1n
 fOz5NT3TKRZJK8zUeqx4PprPzr6vfC0/djcQYa6D1Ksk23mFLVn8oTx1/BNNgqJzUn7G
 MAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eam3w9LXPfpndp7R0xNZyvXloRay7O+0JeoCABaTlpc=;
 b=1BMGp7IAB5n0mMn2VgiFtYtByIHkGTiJ99SFNXmLvBdy4c0lNC8JaXv9adkkl6WyCf
 ++upLSmknVQdesQOeZYdGj2y6EC+74IOstbSV5VHcoe3l0jwovfYXT1FQwJzJl9g6gxs
 FykAq+u8eNbtq8RzB3+mniPln3I5+ZvEoeJznPPYpozgcz3HetTDxbmqFM11jFUhQ0sS
 BUEGOiRiEcd5BUzIue4D5zwpVTc/UFM03zBOPvHJksmUw//qC5kCbTS2/wui8+DSZgiA
 ykaVDx3c72flMyHhE4ZWAMqu3aET+RtpqZuhuNviyy7ECrxihB1aHkmHFsyBeMBg+s/L
 3jug==
X-Gm-Message-State: AOAM530OdnyhhYmc6664x79NpqzYwWUJr36se0MyjUgnrlcPUlVNgp3o
 3aEb44f9YW/fF5IkVTv8Wv+dU2Db+mFI0yCb
X-Google-Smtp-Source: ABdhPJyiXeX8r5IKzWzThWc62auuYi54xY0JecD2OPa1qEZDJPzxHh97JHeBlDxUwlV1OdtBViA+Ng==
X-Received: by 2002:a05:6e02:188a:: with SMTP id
 o10mr47292032ilu.296.1638044380272; 
 Sat, 27 Nov 2021 12:19:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h12sm3091632ila.81.2021.11.27.12.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 12:19:39 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 7.0 4/5] smoke-bsd-user: A test script to run all the
 FreeBSD binaries
Date: Sat, 27 Nov 2021 13:18:45 -0700
Message-Id: <20211127201846.64187-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127201846.64187-1-imp@bsdimp.com>
References: <20211127201846.64187-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: arrowd@freebsd.org, kevans@freebsd.org, richard.henderson@linaro.org,
 f4bug@amsat.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple shell script to iterate through all the FreeBSD binaries running
qemu-$binary to ensure that we have minimal functionality for each
platform. When more of the bsd-user fork has been upstreamed, this
will be replaced by more extensive regresion tests.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 tests/bsd-user-smoke/smoke-bsd-user | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 tests/bsd-user-smoke/smoke-bsd-user

diff --git a/tests/bsd-user-smoke/smoke-bsd-user b/tests/bsd-user-smoke/smoke-bsd-user
new file mode 100644
index 00000000000..20818fdf918
--- /dev/null
+++ b/tests/bsd-user-smoke/smoke-bsd-user
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+build=$1
+testing=$2
+
+smoke_one() {
+	local a=$1 q=$2
+
+	echo Hello World > foo1
+	$build/qemu-$q $testing/h.$a > foo2 || die "cmd failed: $build/qemu-$q $testing/h.$a"
+	cmp foo1 foo2 || die "Hello World expected"
+	rm foo1 foo2
+}
+
+die() {
+	echo $1
+	exit 1
+}
+
+smoke_one amd64 x86_64
+smoke_one armv7 arm
+smoke_one i386 i386
-- 
2.33.0


