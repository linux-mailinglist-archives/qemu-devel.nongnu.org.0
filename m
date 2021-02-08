Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03331442E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:42:58 +0100 (CET)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GBF-0008Ip-Uu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXW-0008GU-87; Mon, 08 Feb 2021 13:45:38 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXN-0006o6-KK; Mon, 08 Feb 2021 13:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=lev5znwEkzyTtK2ggTaUQmdew1GG+Kw/b4eFuozGtBM=; 
 b=e/gZMZ/dol9GxcDcwU4amSMwoqTplALFAorRKNIyW4gQY3TUV7yx2VAkpDPy/jhS4qzd4WNBda3ZKj9ojc4UO90IgTeDBxXNsfP9hh4HGSpOUyPrxhYxhDIGaNfUF3E9VfQW0haLrElJ+QLmLUuZGZW0TJKaBacZYZeoetPe4YRz5QnNGuYZrjpmJLe3318dghW/i/IX8lMt7MeghohccSqWrtosezZy5PafEBfCFQKdFbIJr6uZO6zwxVJxKBc768fz8yxDoCVlkqqxGaS/8LaaS7AsdRaGNoC/cCvvmlTaCWeoTUnDUmwIkZ5D+KJ2Iyxarp5vZZ6MWvfkvmaSRA==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1l9BWw-000565-IC; Mon, 08 Feb 2021 19:45:02 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1l9BWj-00007z-JN; Mon, 08 Feb 2021 19:44:49 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/4] Allow changing bs->file on reopen
Date: Mon,  8 Feb 2021 19:44:40 +0100
Message-Id: <cover.1612809837.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

this series allows changing bs->file using x-blockdev-reopen. Read
here for more details:

   https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html

Version 2 of the series introduces a very significant change:
x-blockdev-reopen now receives a list of BlockdevOptions instead of
just one, so it is possible to reopen multiple block devices using a
single transaction.

This is still an RFC, I haven't updated the documentation and the
structure of the patches will probably change in the future, but I'd
like to know your opinion about the approach.

These patches apply on top of Vladimir's branch:

git: https://src.openvz.org/scm/~vsementsov/qemu.git
tag: up-block-topologic-perm-v2

Regards,

Berto

Alberto Garcia (4):
  block: Allow changing bs->file on reopen
  iotests: Update 245 to support replacing files with x-blockdev-reopen
  block: Support multiple reopening with x-blockdev-reopen
  iotests: Test reopening multiple devices at the same time

 qapi/block-core.json       |   2 +-
 include/block/block.h      |   2 +
 block.c                    |  81 +++++++++++++++++++++--
 blockdev.c                 |  85 +++++++++++++-----------
 tests/qemu-iotests/155     |   9 ++-
 tests/qemu-iotests/165     |   4 +-
 tests/qemu-iotests/245     | 128 ++++++++++++++++++++++++++++++++-----
 tests/qemu-iotests/245.out |   4 +-
 tests/qemu-iotests/248     |   2 +-
 tests/qemu-iotests/248.out |   2 +-
 tests/qemu-iotests/298     |   4 +-
 11 files changed, 254 insertions(+), 69 deletions(-)

-- 
2.20.1


