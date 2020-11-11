Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4112AF70A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:57:52 +0100 (CET)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kctRP-00070W-Vw
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kctOH-0003vh-Pf; Wed, 11 Nov 2020 11:54:37 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:38398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kctOE-00042R-4l; Wed, 11 Nov 2020 11:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=IA/aoncKAQo0Vid+1MYKFtRal2KS6A7cbJyGCewO29A=; 
 b=VIimj5X/dPJzQVGiRxITsIGucpWv4/ZryTLaDbpgbkVAOyToDCaTK2EnBAwiPyFN7bT3R7QlOmRZGFpjEGjD1BkqLMKDATPuiq+QzfHcQtaOpK5fuzb5P1eyEHw9oUfu3/P9wKW1QRC7X+oIXrAyfA1U4bwrUqllIeGyoY4ymLziPyFcLfJJmgsA3O1UoSgpOXBM3QvMkMIgtjwLE/Mc1alFxVm6sGjzFJaRMmDeCV2AQ92s/CNiqNldHpDW6+IAwNw1qjJOcrBHq0DCJVhIsS1WrWGeHz6CrYRS3M8S8vzM6czsxsfX2FPHqnqLEa8+A+s0eS9U0dWrLZXwkdPuzg==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kctNq-0007uR-KJ; Wed, 11 Nov 2020 17:54:10 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kctNc-0003ly-RG; Wed, 11 Nov 2020 17:53:56 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] quorum: Implement bdrv_co_block_status()
Date: Wed, 11 Nov 2020 17:53:53 +0100
Message-Id: <cover.1605111801.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 11:54:12
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

I realized that if one of the children returns an error during
co_block_status() then we should not pass the error immediately to the
caller, because that's a situation that Quorum should be able to
handle.

The new version of the patch takes the simpler approach of falling
back to returning BDRV_BLOCK_DATA, as if Quorum did not implement
bdrv_co_block_status(). This will force the caller to try to read the
actual data and the normal Quorum voting and error handling process
will be used.

Berto

v3:
- Fall back to BDRV_BLOCK_DATA if a child returns an error.

v2: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00259.html
- Implement bdrv_co_pwrite_zeroes() for quorum

v1: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00163.html


Alberto Garcia (2):
  quorum: Implement bdrv_co_block_status()
  quorum: Implement bdrv_co_pwrite_zeroes()

 block/quorum.c             |  70 ++++++++++++++++-
 tests/qemu-iotests/312     | 155 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/312.out |  71 +++++++++++++++++
 tests/qemu-iotests/group   |   1 +
 4 files changed, 295 insertions(+), 2 deletions(-)
 create mode 100755 tests/qemu-iotests/312
 create mode 100644 tests/qemu-iotests/312.out

-- 
2.20.1


