Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336624BDABB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:03:31 +0100 (CET)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMB9t-0002YU-Mt
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:03:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2E-0006b9-Vx
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:35 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2C-0002Am-5Z
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:34 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id E32702077F;
 Mon, 21 Feb 2022 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645458930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WVPt5HYkW5rAf8ErdjsHa6yJcxx/aRccY80De5B7Q2Y=;
 b=SKV8MovPaV1Ij5lwWuCTROgEE5SIiOVOP8G6vzyaHH9TBOO5qr1HZAv3cE8XPNYaQDzE4F
 QQF+H3qTfzRSgdLVD4j5JgHOCudeTjroZuZBqAx/6N9VZnumH3XcBDa0M4fMeG0MhN/xFL
 uYoEplxRmWociWnwMesNtcwHevjTCEo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] qmp-shell modifications for non-interactive use
Date: Mon, 21 Feb 2022 16:55:14 +0100
Message-Id: <20220221155519.2367-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The main idea of this series is to be a bit more user-friendly when
using qmp-shell in a non-interactive way: with an input redirection
from a file containing a list of commands.

I'm working on dynamic qapi config of a qemu machine, this would
be very useful to provide and reproduce small examples.

This series proposes the following modifications:
+ no prompt when input is non-interactive
+ an --exit-on-error option so that the shell exits on first
  error (disconnection, command parsing error, response is an error)
+ support for comment lines and escaping eol to have more reability
  in the source files.

I tested this using QMPShell. I tried HMPShell but did not findout
how to successfully use it with qemu. How do I setup an HMPShell ?.

Another "issue" I have is the handling of integers. I
deal with a lot of addresses and reading/writing them as decimal is
a bit painful (json does not support hexadecimal integer format). Do
you think of any reasonable workaround for this ? Maybe HMP shell
support this ?

Thanks for your comments,
--
Damien

Damien Hedde (5):
  python: qmp_shell: don't prompt when stdin is non-interactive
  python: qmp_shell: refactor the parsing error handling
  python: qmp_shell: refactor disconnection handling
  python: qmp_shell: add -e/--exit-on-error option
  python: qmp_shell: handle comment lines and escaped eol

 python/qemu/aqmp/qmp_shell.py | 117 ++++++++++++++++++++++++----------
 1 file changed, 83 insertions(+), 34 deletions(-)

-- 
2.35.1


