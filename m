Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E724AC6B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:51:09 +0200 (CEST)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YnM-00089H-MG
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1k8YOQ-0001pu-4Q
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:25:22 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:46482)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1k8YOO-0003bc-Eo
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:25:21 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id BBD1B4276F;
 Thu, 20 Aug 2020 10:25:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1597883116;
 bh=BCW3PGk4hS3wlWkgzTkOkPpUnhcgG72HIRyjP4lVLPc=;
 h=From:To:Cc:Subject:Date:From;
 b=XPElCgtxABbn+lxPz9qRs5Hso8WLRZZ7ijRu1p4FSUZh2cD28MXbKDHKSvmjdNt84
 iaRCRqWNgM/Se5EWHMS1HbWwNkfAofu6gOOyBH/b8HSPZZd2GPJtHtKAFM0JMGYLmQ
 LWhhPXNURi8bG6ZPOn78NubQUx+wayJiIotraXoM=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 99EE73A0560; Thu, 20 Aug 2020 10:25:16 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>,
	kraxel@redhat.com
Subject: [PATCH v6 0/1] audio/jack: fix use after free segfault
Date: Thu, 20 Aug 2020 10:25:14 +1000
Message-Id: <20200820002515.75576-1-geoff@hostfission.com>
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

v6:
  * delete the QEMUBH when finished
  * fix possible race by taking the iothread mutex
  * removed whitespace changes

Geoffrey McRae (1):
  audio/jack: fix use after free segfault

 audio/jackaudio.c | 51 +++++++++++++++++++++++++++++++++--------------
 ui/spice-input.c  |  2 ++
 2 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.20.1


