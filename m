Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428D67814E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 17:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzbK-0007bw-Eu; Mon, 23 Jan 2023 11:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbG-0007at-Sr; Mon, 23 Jan 2023 11:23:14 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbF-0003a0-81; Mon, 23 Jan 2023 11:23:14 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id C824C20E1ABA;
 Mon, 23 Jan 2023 08:23:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C824C20E1ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490990;
 bh=D4r48KVnk7ot18DtWCSTUBNmhBPIHZ6bG95OQJkFm5E=;
 h=From:To:Cc:Subject:Date:From;
 b=B2iic5TilhEFf/rbEu060LjiT/7DBM5xfcTCqYgMFsF7mKO87UNea/2/2NPcVRtvI
 7lIkci+SwVgSqPBX9aWSThoxk3lI4850dCGxBXg/A6Hx7DICqfJWBJ6s+c0BZQp+wP
 h/RfNBt1odBt5TLSpz6E5GcdqLG6N1CKCRK4s27o=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 0/5] Series of fixes for PL011 char device
Date: Mon, 23 Jan 2023 17:22:59 +0100
Message-Id: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v4:
* Fixed post_load hook to be backwards-migratable
* Refactored some code in 5/5 as per review comments

v3:
* Introduced a post_load hook for PL011State migration for
  backwards-compatibility due to some input state fragility.
* No longer touching irq lines in reset method
* Minor changes based on review feedback.

v2:
* Moved FIFO depth refactoring part of FIFO flags change into its own
  commit.
* Added a reset method for PL011


Evgeny Iakovlev (5):
  hw/char/pl011: refactor FIFO depth handling code
  hw/char/pl011: add post_load hook for backwards-compatibility
  hw/char/pl011: implement a reset method
  hw/char/pl011: better handling of FIFO flags on LCR reset
  hw/char/pl011: check if UART is enabled before RX or TX operation

 hw/char/pl011.c         | 121 +++++++++++++++++++++++++++++++++-------
 include/hw/char/pl011.h |   5 +-
 2 files changed, 105 insertions(+), 21 deletions(-)

-- 
2.34.1


