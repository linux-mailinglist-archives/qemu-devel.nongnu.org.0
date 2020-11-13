Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B404F2B2106
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:54:32 +0100 (CET)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdcLH-0004Cd-Qi
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdcJj-0002zV-Oh; Fri, 13 Nov 2020 11:52:55 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:47304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdcJh-0003Qj-4U; Fri, 13 Nov 2020 11:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=86cxSeyXQCSIIzwJ2KZBEK/0wAUQTJzLl0ypKyWxwbo=; 
 b=RIRVoL4MbXvjNbYItP95lFDzmXlPxWVvtE+XZKj9ub4DJ+Z4A+s1kIbvt3CMDF4x5RQc+uSzJnriSVQ9XmymrkWBYyFOubLk8F4Rtl8nVH3d0jPOSW1yzZEobKY5wA1t9eoye6QKnYp9DSi4DQxftIofWcLPQb1HN7hmMdMElHO+N5zuY6255l9ax9kiJWx17vo2njJoRm9fHS4hCpxr99NBT3WSfoIlJfffmd8cKXSdfRdIGtEmOZbFuAG4pgISAtjXsEIeB0J4cl7MxZ8a/PX987x3ZJoZCFm7xGcZ/ew3qwHfTdgwDMGb4y4SA2wm+Sh3KTLKuOt7yK9d1wrVKw==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kdcJc-0008O2-BT; Fri, 13 Nov 2020 17:52:48 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kdcJP-0002hf-8D; Fri, 13 Nov 2020 17:52:35 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] quorum: Implement bdrv_co_block_status()
Date: Fri, 13 Nov 2020 17:52:30 +0100
Message-Id: <cover.1605286097.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 11:07:49
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

Following Max's suggestion, this version sets supported_zero_flags.

Berto

v4:
- Set supported_zero_flags in quorum [Max]
- Update test to verify the data written before doing 'write -z' [Max]

v3: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00371.html
- Fall back to BDRV_BLOCK_DATA if a child returns an error.

v2: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00259.html
- Implement bdrv_co_pwrite_zeroes() for quorum

v1: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00163.html


Alberto Garcia (2):
  quorum: Implement bdrv_co_block_status()
  quorum: Implement bdrv_co_pwrite_zeroes()

 block/quorum.c             |  88 +++++++++++++++++++-
 tests/qemu-iotests/312     | 159 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/312.out |  75 +++++++++++++++++
 tests/qemu-iotests/group   |   1 +
 4 files changed, 321 insertions(+), 2 deletions(-)
 create mode 100755 tests/qemu-iotests/312
 create mode 100644 tests/qemu-iotests/312.out

-- 
2.20.1


