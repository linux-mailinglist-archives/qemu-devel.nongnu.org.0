Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80D675959
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:56:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItjH-0004Ya-7G; Fri, 20 Jan 2023 10:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjE-0004XO-6o; Fri, 20 Jan 2023 10:54:56 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjC-000689-GO; Fri, 20 Jan 2023 10:54:55 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1645320E1A45;
 Fri, 20 Jan 2023 07:54:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1645320E1A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230092;
 bh=bvwAfIJtjFwHtptnPrI0NHq3acGMoMn68aFxVXRTeMI=;
 h=From:To:Cc:Subject:Date:From;
 b=F5L2FutfBpFyrC6K9dN09Fj/cRDMEEvh0KrxQDYPl/0+sLEcvvFVNXcdLi54yU/pE
 Y9bZmUzeIVKfM8Yh7JUXXdZFVDJmmn5n2ygPBDKGdwHwz5jFV88+KLA9gW4MZrzXCG
 RU7+bQIHrJWk2uBaiz43Mlzy2TWFsK//kcfTQQW4=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 0/5] Series of fixes for PL011 char device
Date: Fri, 20 Jan 2023 16:54:42 +0100
Message-Id: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

 hw/char/pl011.c         | 110 +++++++++++++++++++++++++++++++++-------
 include/hw/char/pl011.h |   5 +-
 2 files changed, 95 insertions(+), 20 deletions(-)

-- 
2.34.1


