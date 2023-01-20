Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C3675968
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 17:00:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItnq-0000fI-0w; Fri, 20 Jan 2023 10:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItnn-0000eZ-8i; Fri, 20 Jan 2023 10:59:39 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItnl-00073Y-Ot; Fri, 20 Jan 2023 10:59:38 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id C1D8620E1A43;
 Fri, 20 Jan 2023 07:59:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C1D8620E1A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230375;
 bh=1SYd02ysTymy00KMv8nS+1COA78uasffvtd0JBKbW1w=;
 h=From:To:Cc:Subject:Date:From;
 b=fGuNwoQ+kCyB4uDTn2QgSPz6B1NzBMCau87c3jgxDpOWWeYTC9z6fzTgBh97jUGhQ
 m98baWbSXl2NTwpNakfNnomJ3o4xSN9lTREkYZw5217Jq5xMB7zusp9b2NweeS3/Hg
 3Y66ty6i4PPm9WVcthy+5El1oBDYm70Mk2LG2gyM=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PATCH v3 0/2] various aarch64 fixes for running Hyper-V on TCG
Date: Fri, 20 Jan 2023 16:59:27 +0100
Message-Id: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
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

Small series of changes to aarch64 emulation to better support running
Hyper-V as a TCG guest wtih EL3 firmware.

v3:
* Replaced raw_write fn with raw_write instead of a manual function

v2:
* DBGCLAIM now implements a (trivial) raw_write handler
* Added comments around ignored external debug registers
* Patch 3 is dropped because it was manually picked into target-arm.next

Evgeny Iakovlev (2):
  target/arm: implement DBGCLAIM registers
  target/arm: provide stubs for more external debug registers

 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 54 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

-- 
2.34.1


