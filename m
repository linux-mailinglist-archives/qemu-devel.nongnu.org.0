Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA59339F24
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:39:28 +0100 (CET)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7IU-0002XH-PC
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7GW-0001jC-1x
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:37:24 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7GT-0006mI-AO
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:37:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso17605916wme.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0FFuzmrGdFhcFu+dEHgcrczRbA5MYYId5TsRGewquGE=;
 b=LjnqMWfX6opa/NeCN7WDymduURd1bFukYhkLMIDz7s7j3maucz/SYcqogqsOxRTKRR
 PK+HETuru3Mq7SloCccLblXzc6dpdNz9iOsCZmAspfhsl9mi05kTMNUk0gPBpKFh9EOJ
 xLzIuep+6fEj0ZmX+kG3R+Co8JqR+jRCjTmU55jReo4vU4ZWP9zNfgcN7J9F+YA+a5JG
 6bN6wm5qJJTN2aR5Esv6McJGCAGsltrbQF75XypfyXtCgcyQNl0+wSmN2U7eb/zk+zhK
 ylF4utxXfT05YZc2kuyg2lEPQ6Y5mXafhQvO4qrMnGJqktJ3Wgd8QmRYwNEKJ0d+3atZ
 QTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0FFuzmrGdFhcFu+dEHgcrczRbA5MYYId5TsRGewquGE=;
 b=WJJJOcqK1anMe05G83iqwMqMoMX01+ntxiw14Xy5JixNSm1iMqn5H6D/RP/Hztq4xh
 +vctjqjdhnViwx7WwxLa+7/1p95vGKCCJgZR4mtJSCDvnVVgr6oqmYKJc2V7sshZmxu7
 exxLOeO/3rQYvzNPVENXEurujajdwAJ+rDD0uudFm6U2PeNh8QlOSOVBE2CGKlLi4SnO
 wQj2Vtjc8HyclJm9qAGiX7/Cq6e/lqTJt+x0Tv1TQCyg5cVDr4ug4IukjsPQap6Cd7Pu
 5MFpETUVl7h0yNsZd1qCE8bYVva2Gz7mTx9lJWuHne6PHPjQENWnGi9MbVq4vNX28n8W
 NQ9w==
X-Gm-Message-State: AOAM530MEgNO4jtyXdqAb905Ra6b4hh9pFuYCWQnqrT0KM6OXI9hFDft
 Jsn/gNsec5cLMDJvcS6yoS2CepN4RsE=
X-Google-Smtp-Source: ABdhPJwW/BF3kLO9vGH7dr2HGi0R0yRKzvntIWIDTAjenLfZOhosGBSKHEChUI8ohWXkqqSNXj+lnw==
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr18629636wmf.174.1615653439105; 
 Sat, 13 Mar 2021 08:37:19 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:37:18 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] Replacing malloc and the like with GLib's variants 
Date: Sat, 13 Mar 2021 18:36:44 +0200
Message-Id: <20210313163653.37089-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inspired by the task in the Bite-sized tasks page, I've tried to change
some of the occurrences of malloc(), calloc(), and realloc() calls and
their respective free() calls. I also included some minor style
improvements that caused errors and warnings when supplied to the 
checkpatch.pl script.

At numerous places, the change is quite obvious. However, some other 
malloc() and the like have no immediately visible free() calls. Analysis
was done to trace the roots of each free() call to match each GLib function
with a g_free(), and every malloc(), realloc(), or calloc() call with a
call to free().

Mahmoud Mandour (9):
  bsd-user/elfload.c: Replaced calls to malloc/free with GLib variants
  hw/audio/fmopl.c: Fixing some style errors.
  hw/audio/fmopl.c: Replaced calls to malloc with GLib's variants
  pc-bios/s390-ccw/netmain.c: Changed a malloc/free to GLib's variants
  target/xtensa: Replaced malloc/free with GLib's variants.
  util/compatfd.c: Replaced a malloc with GLib's g_try_malloc
  tools/virtiofsd/buffer.c: replaced a calloc call with GLib's
    g_try_new0
  tools/virtiofsd/fuse_opt.c: Replaced a malloc with GLib's g_try_malloc
  tools/virtiofsd: Replacing malloc-like calls with GLib's variants

 bsd-user/elfload.c               | 74 ++++++++++++++++----------------
 hw/audio/fmopl.c                 | 61 ++++++++++++++------------
 pc-bios/s390-ccw/netmain.c       |  6 +--
 target/xtensa/xtensa-isa.c       | 28 ++++++------
 tools/virtiofsd/buffer.c         |  4 +-
 tools/virtiofsd/fuse_lowlevel.c  | 30 ++++++-------
 tools/virtiofsd/fuse_opt.c       |  4 +-
 tools/virtiofsd/fuse_virtio.c    | 34 +++++++--------
 tools/virtiofsd/passthrough_ll.c | 32 +++++++-------
 util/compatfd.c                  | 10 ++---
 10 files changed, 145 insertions(+), 138 deletions(-)

-- 
2.25.1


