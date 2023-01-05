Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2065F700
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:47:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYzv-0001NJ-Rn; Thu, 05 Jan 2023 17:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTs-0006gU-W0; Thu, 05 Jan 2023 17:13:01 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTr-00022e-Fa; Thu, 05 Jan 2023 17:13:00 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id A00D920B92A6;
 Thu,  5 Jan 2023 14:12:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A00D920B92A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1672956777;
 bh=jQ4q+u2yS/x/Fw8ksJ7eBzcNHHLms6GmSqzp7SxVes0=;
 h=From:To:Cc:Subject:Date:From;
 b=XJ6j9zhLavI8oiYfvGjrl4RAz1VYssouc8IlqDhcr8cbnY7cGRXhxqS+7K8/tCuzb
 iFEeX8tMxbVX8o0AhoIF7A4pySurXilZTtyXcd5Si4CIKL5CfBOuXLVrMBk9sXcNou
 uvh2UDR/JdrsZxOkMQfGU9aeI6IC75cZBRZQmEG4=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 0/3] various aarch64 fixes for running Hyper-V on TCG
Date: Thu,  5 Jan 2023 23:12:48 +0100
Message-Id: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
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
X-Mailman-Approved-At: Thu, 05 Jan 2023 17:46:05 -0500
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

Evgeny Iakovlev (3):
  target/arm: implement DBGCLAIM registers
  target/arm: provide RAZ/WI stubs for more DCC registers
  target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled

 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 39 +++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c       |  3 +++
 3 files changed, 43 insertions(+)

-- 
2.34.1


