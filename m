Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72424D66D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 15:46:43 +0200 (CEST)
Received: from localhost ([::1]:52172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k97NS-0007PE-Ng
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 09:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1k97Ml-0006wd-KT
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 09:45:59 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:45502)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1k97Mk-0001YP-33
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 09:45:59 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id BB42C4277C;
 Fri, 21 Aug 2020 23:45:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1598017555;
 bh=sGeCjrSf0BzhbEgBbjj6qEHmQs+ZJpjonGbYVLnyfug=;
 h=From:To:Cc:Subject:Date:From;
 b=Y2ibHVXCO/Vbxu7uQTgVWcLvYSk2Z7o1oA1H2qruA6SxUMJY4sCwdIg4RiWeVowLa
 AZ1BZCdFjkWtEjm6xPt7aDbWIeFND7iqfDMoZuyecaQwNZr1Kr6QAQ2t3TMuAOXsOd
 jxl7kMYzBCs9+gNDsZXrQefflL02F7MkCcai7YDM=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 99C633A0296; Fri, 21 Aug 2020 23:45:55 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>, kraxel@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v8 0/1] audio/jack: fix use after free segfault
Date: Fri, 21 Aug 2020 23:45:53 +1000
Message-Id: <20200821134554.101397-1-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 09:45:56
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

v8:
  * use a local mutex instead of the BQL

Geoffrey McRae (1):
  audio/jack: fix use after free segfault

 audio/jackaudio.c | 55 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 13 deletions(-)

-- 
2.20.1


