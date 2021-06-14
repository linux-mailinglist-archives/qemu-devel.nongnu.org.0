Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E553A5C78
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 07:28:23 +0200 (CEST)
Received: from localhost ([::1]:34186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsf94-0000wL-AR
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 01:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsf7F-0008Hg-Mp; Mon, 14 Jun 2021 01:26:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsf7E-0003vx-5I; Mon, 14 Jun 2021 01:26:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id c9so13011672wrt.5;
 Sun, 13 Jun 2021 22:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nhR+JGOKSUCLxBZNtaVPLvIbdzNaBysFi3i6WyCcL84=;
 b=Lxc8sYkXMX4J3LXUGzyQpmlqQL2U7J+4oVsG9HIgaSdDehgoT5l225c8ciWXraE31C
 uZp46/ymCl1FJzmgtMC4ugtT7v4Y3VrnDaK0diT1pL6Oa/o8zU0Yijx7JJarJLsQjyac
 nW5fmxalUeqljtBwuV4SuRqiRBqt643sC+gCB/xYomAkuuWPIfcBzQb6erc1qD3IiYAy
 QNljuuVOBH5nTuc00T6ehPBhmIxCN0WfyRZsjDppIfSjjjuITgq6CtePcVsO++tw93q4
 OdIBpg9kDTNNBbw0/4vlGJImg247+TfOmUMIda3clatNWTuZvkyYZtN96I+UDphCNkuu
 pTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nhR+JGOKSUCLxBZNtaVPLvIbdzNaBysFi3i6WyCcL84=;
 b=lh9K1qA+cxvDlo1bMwmWcKpsGMQiEQkVz/6Fl1JjLtSxq2vLNLvOVaVy4i+B3AqR6O
 BwYVMR0VbeKbaqFLhCXoZh5OVjYDvcRlnzKmzopNZ+oy0ZcHCVFrQ/whhLRCFIjH8JBS
 vFlcjzj7a7yRc1hw427MTtUHK0+xqSt2wr995lPAOrbsXNoGEwCtHj8+KlZe68qrx1sp
 3qfpflGXOk61EDxkz5pGAjYUKE7PWg/CTDHqMvLtvduWB0BRY1A1bv6zplBDkeF+jsRc
 +3BvqrfB7bqfg1YAsbePDcWOhZ9v8RXR+zkFjmaRjCIWhmDaUG0P8xpp0d/9THmciQVn
 oPOg==
X-Gm-Message-State: AOAM533iWRZKmqj5ZtNMwes0VYZDV+g2VkioHGl612hZA87NjF9c1RNG
 /NmUWbRK1PZQWV9H6hEev4USkBzkPEjaEg==
X-Google-Smtp-Source: ABdhPJw3HUv9ezhqJMztn8CGPwQQR7yHH0NexG6zy3pKkZekmbTCGzUKMvOapW+F7T56GgW4D0knSg==
X-Received: by 2002:adf:f305:: with SMTP id i5mr17225899wro.29.1623648385618; 
 Sun, 13 Jun 2021 22:26:25 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i2sm11848444wmo.40.2021.06.13.22.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 22:26:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] migration: Add missing dependency on GNUTLS
Date: Mon, 14 Jun 2021 07:26:23 +0200
Message-Id: <20210614052623.1657103-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7de2e856533 made migration/qemu-file-channel.c include
"io/channel-tls.h" but forgot to add the new GNUTLS dependency
on Meson, leading to build failure on OSX:

  [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
  FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
  cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
  In file included from ../migration/qemu-file-channel.c:29:
  In file included from include/io/channel-tls.h:26:
  In file included from include/crypto/tlssession.h:24:
  include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
  #include <gnutls/gnutls.h>
           ^~~~~~~~~~~~~~~~~
  1 error generated.

Reported-by: Stefan Weil <sw@weilnetz.de>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: Not tested on OSX. Stefan, do you know why this isn't covered
     on Cirrus-CI?  https://cirrus-ci.com/build/4876003651616768
---
 migration/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/meson.build b/migration/meson.build
index f8714dcb154..5b5a3f7b337 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -8,7 +8,7 @@
   'qemu-file.c',
   'yank_functions.c',
 )
-softmmu_ss.add(migration_files)
+softmmu_ss.add(migration_files, gnutls)
 
 softmmu_ss.add(files(
   'block-dirty-bitmap.c',
-- 
2.31.1


