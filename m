Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D92AA1A5
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Nov 2020 01:07:03 +0100 (CET)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbBl0-0008Fu-Lz
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 19:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1kbBjQ-0007JL-Uy
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 19:05:24 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:39830)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1kbBjO-00060W-Qz
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 19:05:24 -0500
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 5408E4497F;
 Sat,  7 Nov 2020 11:05:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1604707519;
 bh=YkvvO5M8XoNmxHTeb5JuCO6jQWX7/+qRHdZmv/1rW3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KooBrBEFLnotfJmNbJWd3bsHNXdwakAchWBGVP690qeY+mHfTYfQuzPH5a0eDNrcE
 q8wK7IIJPS8rV9W1cxuVP1UnMvFtvSVQWvRcLPUdQzfmsIbdIQpc99U00zfGWPYWmU
 dR1uuwPixcOLOqmv7jF+3QJnIaE+m7hVOBnzBkG8=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 39C2A3A0604; Sat,  7 Nov 2020 11:05:18 +1100 (AEDT)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>, kraxel@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v8 0/1] audio/jack: fix use after free segfault
Date: Sat,  7 Nov 2020 11:04:57 +1100
Message-Id: <20201107000458.8754-1-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821134554.101397-2-geoff@hostfission.com>
References: <20200821134554.101397-2-geoff@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 18:47:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

v9:
  * switch to using a global shutdown mutex

Geoffrey McRae (1):
  audio/jack: fix use after free segfault

 audio/jackaudio.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

-- 
2.20.1


