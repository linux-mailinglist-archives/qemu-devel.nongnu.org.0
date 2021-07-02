Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E9B3B9D65
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 10:14:51 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzEK2-0004uw-15
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 04:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lzEIj-0002n5-Me
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:13:29 -0400
Received: from zamok.crans.org ([2a0c:700:2:0:ec4:7aff:fe59:a1ad]:57814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lzEIf-0002l4-E4
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:13:29 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 35D0DE0093; Fri,  2 Jul 2021 10:13:20 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/2] execlog TCG plugin to log instructions
Date: Fri,  2 Jul 2021 10:13:05 +0200
Message-Id: <20210702081307.1653644-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a0c:700:2:0:ec4:7aff:fe59:a1ad;
 envelope-from=erdnaxe@crans.org; helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

execlog is a plugin that logs executed instructions with some useful
metadata including memory access.

The output of the plugin is designed to be usable with other tools. For
example it could be used with a side-channel leakage model to create
side-channel traces from QEMU for security evaluation.

Changes since v2:
 - Fix typo "tvg-plugins" to "tcg-plugins" in commit title.
 - Add warning about plugin output size in documentation.
 - Fix user mode tracing by using a dynamic list.
 - Fix last instructions not being logged.
 - Remove empty first line in plugin output.

Changes since v1:
 - The output is now easier to parse.
 - Use QEMU logging API rather than FILE* to write output.
 - Don't reject memory information in user mode.
 - Merge memory information with instruction execution. Now one line
   means one instruction.
 - Add documentation.

Alexandre Iooss (2):
  contrib/plugins: add execlog to log instruction execution and memory
    access
  docs/devel: tcg-plugins: add execlog plugin description

 MAINTAINERS                |   1 +
 contrib/plugins/Makefile   |   1 +
 contrib/plugins/execlog.c  | 153 +++++++++++++++++++++++++++++++++++++
 docs/devel/tcg-plugins.rst |  24 ++++++
 4 files changed, 179 insertions(+)
 create mode 100644 contrib/plugins/execlog.c

-- 
2.31.1


