Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D891A375AC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 15:51:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYso1-0007xA-Vv
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 09:51:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYskv-0006LM-HK
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYskg-0001iW-Ow
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:48:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:45552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYskf-0001Hc-2t; Thu, 06 Jun 2019 09:48:22 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYskZ-00004z-O0; Thu, 06 Jun 2019 16:48:15 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu,  6 Jun 2019 16:48:11 +0300
Message-Id: <20190606134814.123689-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/3] block: blk_co_pcache
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is small new io API: blk_co_pcache, which does copy-on-read without
extra buffer for read data. This means that only parts that needs COR
will be actually read and only corresponding buffers allocated, no more.

This allows to improve a bit block-stream and NBD_CMD_CACHE

Vladimir Sementsov-Ogievskiy (3):
  block: implement blk_co_pcache
  block/stream: use blk_co_pcache
  nbd: improve CMD_CACHE: use blk_co_pcache

 include/block/block.h          |  8 ++++++-
 include/sysemu/block-backend.h |  7 ++++++
 block/io.c                     | 18 +++++++++-----
 block/stream.c                 | 19 +++++----------
 nbd/server.c                   | 43 +++++++++++++++++++++++++++-------
 5 files changed, 67 insertions(+), 28 deletions(-)

-- 
2.18.0


