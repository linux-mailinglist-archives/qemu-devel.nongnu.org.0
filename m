Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62AA2A9B15
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 18:45:39 +0100 (CET)
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb5nu-00033f-9n
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 12:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kb5mh-00027h-Pk; Fri, 06 Nov 2020 12:44:23 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:56599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kb5mf-0007hb-Dm; Fri, 06 Nov 2020 12:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=0T+2H2pIRRu6B0aCD0TkVm4zcfR4m2aOp1/uvMdp/Lg=; 
 b=IGRk6Npc5oIgZtMAn2lTj2wD6GpN4+mwiwDhY+597/aFNpQin7Y4NUBZ06fr6Js/y37F0uKTL1HILyBPOrXWFZ/Ec+SRjGDzckkfrL1DjLVcp/kGvDQtb63PcNoyjYjq10SNpaMihl9Byx+wGW03/T7Yfe+pNNnXf6g/Go/EyLIRpGrYcRtfZLQOX/Pbh316l+q4usl+Ohh+fWXFC82ZFLOAH3OMARbF+OKtCYOnJTdGncPY6FshEGcAFjorbBPYtoH9t50bVA6aiR40r8SWd7yeDd2Q8oalxGIB7UDb850ITVerILZaZe1FbVryIwQmK9580ge1CYIrvti4a4H9NQ==;
Received: from [81.0.39.238] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kb5mb-0003zj-Ag; Fri, 06 Nov 2020 18:44:17 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kb5mO-0007fO-AN; Fri, 06 Nov 2020 18:44:04 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] quorum: Implement bdrv_co_block_status()
Date: Fri,  6 Nov 2020 18:43:46 +0100
Message-Id: <cover.1604684432.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 12:44:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The first patch is the same as in v1, but now that we're at it I
decided to also implement bdrv_co_pwrite_zeroes()

Berto

v2:
- Implement bdrv_co_pwrite_zeroes() for quorum

v1: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00163.html

Alberto Garcia (2):
  quorum: Implement bdrv_co_block_status()
  quorum: Implement bdrv_co_pwrite_zeroes()

 block/quorum.c             |  67 +++++++++++++++-
 tests/qemu-iotests/312     | 155 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/312.out |  71 +++++++++++++++++
 tests/qemu-iotests/group   |   1 +
 4 files changed, 292 insertions(+), 2 deletions(-)
 create mode 100755 tests/qemu-iotests/312
 create mode 100644 tests/qemu-iotests/312.out

-- 
2.20.1


