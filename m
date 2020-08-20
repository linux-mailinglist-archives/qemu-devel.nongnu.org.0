Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6C24AC53
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:39:19 +0200 (CEST)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Ybu-00022h-Qh
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1k8YQX-0006qu-1M
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:27:33 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:46518)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1k8YQV-00041T-A6
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:27:32 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 1A1B34276F;
 Thu, 20 Aug 2020 10:27:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1597883250;
 bh=bcRfL8lh4bOBR2cfHRoIVxxIWYuh5WpnjVgPf3WyWHc=;
 h=From:To:Cc:Subject:Date:From;
 b=agBYUZvMaqiv63kiqP4TgfoRRECxvgQHhUFSXquQSrFCcDMJhTF71asvIruWv0Vrw
 f5g0Ihgbf3fRpbQ961RwjZanBKb1zWg2YJaZXyI+J3uHnN/KfnOVdeDnCttuEpr2ST
 cvja0qe/MQdIFwtXCqahL432xlFSdBwK1cmM/nXs=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 051013A0560; Thu, 20 Aug 2020 10:27:29 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>,
	kraxel@redhat.com
Subject: [PATCH v7 0/1] audio/jack: fix use after free segfault
Date: Thu, 20 Aug 2020 10:27:28 +1000
Message-Id: <20200820002729.76290-1-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:25:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

v7:
  * removed accidental inclusion of spice-input changes

Geoffrey McRae (1):
  audio/jack: fix use after free segfault

 audio/jackaudio.c | 51 +++++++++++++++++++++++++++++++++--------------
 ui/spice-input.c  |  2 ++
 2 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.20.1


