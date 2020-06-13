Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540211F86C1
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 06:43:57 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkKUu-0006Tn-BC
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 00:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1jkKTe-0004jv-CH
 for qemu-devel@nongnu.org; Sun, 14 Jun 2020 00:42:38 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:57370)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1jkKTa-0005Ar-OI
 for qemu-devel@nongnu.org; Sun, 14 Jun 2020 00:42:38 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id F0390445B1;
 Sat, 13 Jun 2020 14:05:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1592021156;
 bh=PPeacZfz0/H7c3zbFUwy7ib18/dqZAjQwotikYVk6OU=;
 h=From:To:Cc:Subject:Date:From;
 b=owXNvoTLgtgD0VSMZobwq8jk+O0FVpPyQMMx8T0g1u9P9bu0g/yUv/tXiy9jescZb
 9b//79crxZw9n/Gzv5rnE293s/ZbK6ee6F/QHpi/2hGN1ZWuw2ZCyWc1+JHanVqzLr
 yyEsa6FT8eToXV8h6na2a4YetLPRdygfre/N14rg=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id C22723A01AD; Sat, 13 Jun 2020 14:05:55 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	geoff@hostfission.com
Subject: [PATCH 0/6] audio/jack: fixes to overall jack behaviour
Date: Sat, 13 Jun 2020 14:05:12 +1000
Message-Id: <20200613040518.38172-1-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 00:05:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set addresses several issues that cause inconsistent
behaviour in the guest when the sound device is stopped and started or
the JACK server stops responding on the host.

Geoffrey McRae (6):
  audio/jack: fix invalid minimum buffer size check
  audio/jack: remove unused stopped state
  audio/jack: remove invalid set of input support bool
  audio/jack: do not remove ports when finishing
  audio/jack: honour the enable state of the audio device
  audio/jack: simplify the re-init code path

 audio/jackaudio.c | 73 ++++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

-- 
2.20.1


