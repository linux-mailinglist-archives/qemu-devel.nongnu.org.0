Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560A551107
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:11:50 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3BZd-0004c1-5v
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1o3BJv-00014v-5g
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 02:55:35 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1o3BJt-0004vv-F4
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 02:55:34 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t21so3129093pfq.1
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=goWwuUuTp+oFheuWNxQ/cuMvI+6GPiazmzh2/kKLbKQ=;
 b=cILdN7A9HJYNfuTKLqiR2gfQF5TrNPfQw1x7p4UNclo5D1XMv4ByAckGP4SyjTp7ZB
 rqZjBs075MM+hmqx8QkR1Dm406D8YGgF+vbucCyfcztpEzCbuaot+MxijVG192NSFPos
 k9rxFIhKSB9zqb0QHm4Ay6zfhGW53fr4yCn9qPTxaZfmHh+l9Ch6X1C8A1i+8RCqRqwY
 rdJV79pU2BydRmjoUgnScE2gsED7SFTUCpINaQxLOzjZ4MWuVf71VjolxB9B7HfjAQxu
 bi8SpLXA8imhYYIhGVXE/ObIGavGbXJlkIq/BNAblyJuBGdq5Z+TAf340mfE11UxdI0W
 GTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=goWwuUuTp+oFheuWNxQ/cuMvI+6GPiazmzh2/kKLbKQ=;
 b=sZuAfy5t67YQuaOrHNOkiwnmopciG+Z1H2uaqJcfYyUyV+aN72cdHdT0chZdMqxeMl
 Mcq5+cQLHQN3UHWSZCcDOndhT795AxEtPLnTDphtMdbhrrnoRpoc4rJdplJ/hDUk9MxB
 OMu8Cow6A4W60kEBNECxzKsE5xRMUxJ/SytucSaSPKwQua/5uEJ7PM750Yn4Bq/qOMjw
 vpwtMup6wXMzjbe2/ge9qMg+Msbxsjr70g6M3SpTwViPGckBuIW7TQk3nyB2knegAfub
 yNJOgVYdaEu3l/KH+cZfRrKYz0Ndr1eZCRXuwDj/V6eKSwTKPPGeH0h91j5LNJk0sxBa
 B/7w==
X-Gm-Message-State: AJIora/XED58ng21333TLAEAzIadhTeOVJpG5zt+LrYR47ceBWcyZzSL
 RU1PpGsezqvNSpiwh0ZyW8TbHhSKzcnRmw==
X-Google-Smtp-Source: AGRyM1t7t+UheaYB0J1HEryFu4R0ItcaQZweucy6YNQ+bhkPpjCqPk6dMaNJCfhIE9AbTtqX5XrJMQ==
X-Received: by 2002:a63:b443:0:b0:40c:d8f6:fb23 with SMTP id
 n3-20020a63b443000000b0040cd8f6fb23mr170352pgu.145.1655708131287; 
 Sun, 19 Jun 2022 23:55:31 -0700 (PDT)
Received: from localhost.localdomain ([76.132.29.156])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170902d89000b001616b71e5e3sm7849437plz.171.2022.06.19.23.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 23:55:30 -0700 (PDT)
From: Richard Liu <richy.liu.2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: alxndr@bu.edu,
	Richard Liu <richy.liu.2002@gmail.com>
Subject: [PATCH] new snapshot/restore mechanism for fuzzing
Date: Sun, 19 Jun 2022 23:55:27 -0700
Message-Id: <20220620065527.92252-1-richy.liu.2002@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richy.liu.2002@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

- create a document outlining specifications for a virtual device to
  manage snapshot/restore mechanism for fuzzing

Signed-off-by: Richard Liu <richy.liu.2002@gmail.com>
---
 docs/devel/snapshot.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 docs/devel/snapshot.rst

diff --git a/docs/devel/snapshot.rst b/docs/devel/snapshot.rst
new file mode 100644
index 0000000000..a333de69b6
--- /dev/null
+++ b/docs/devel/snapshot.rst
@@ -0,0 +1,26 @@
+================
+Snapshot/restore
+================
+
+The ability to rapidly snapshot and restore guest VM state is a
+crucial component of fuzzing applications with QEMU. A special virtual
+device can be used by fuzzers to interface with snapshot/restores
+commands in QEMU. The virtual device should have the following
+commands supported that can be called by the guest:
+
+- snapshot: save a copy of the guest VM memory, registers, and virtual
+  device state
+- restore: restore the saved copy of guest VM state
+- coverage_location: given a location in guest memory, specifying
+  where the coverage data is to be passed to the fuzzer
+- input_location: specify where in the guest memory the fuzzing input
+  should be stored
+- done: indicates whether or not the run succeeded and that the
+  coverage data has been populated
+
+The first version of the virtual device will only accept snapshot and
+restore commands from the guest. Coverage data will be collected by
+code on the guest with source-based coverage tracking.
+
+Further expansions could include controlling the snapshot/restore from
+host and gathering code coverage information directly from TCG.
-- 
2.35.1


