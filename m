Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C52F7BAE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:06:10 +0100 (CET)
Received: from localhost ([::1]:44220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Ono-0003HO-NS
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l0Ol7-00022Q-J5; Fri, 15 Jan 2021 08:03:21 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l0Ol3-0003wB-TD; Fri, 15 Jan 2021 08:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=33Z7xEdyIfs5ZEhzPjtmubsdYtm4WxfagtvLw25VEio=; 
 b=H+fpePDVRSkqb7BnGHeNkPMBCRvRZzoZnRrkDGyXV3x0kmFLIa6ZSkyddVqOP41reFAzPkp3VYR5hXODbguxF6yNwMdRv5rI+SUnvwdQxJczjwhHiCcsEwcIvCEkEauG3/PQ5BJOf2T+HGmn3RNdMNRRw/hKkppZl6bdkUqHr74w1y9gpmpMscUB4rTWYIliV9YSe5LuCQnqrrPFxRCZPe42OF5vUQSg8piBLv/+jtOWSo3BtJybbkax6gd9CUq1YSujAlWMRjxkDZSHEHLTF84fuQFPyyk75ViCJJ4txItUeB2Q+3vkPCeW8/c8tw7Wlycdh9DNblY8YjNIe9IBAA==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1l0Okg-0007Wd-Rp; Fri, 15 Jan 2021 14:02:54 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1l0OkT-0003fk-QN; Fri, 15 Jan 2021 14:02:41 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] Allow changing bs->file on reopen
Date: Fri, 15 Jan 2021 14:02:36 +0100
Message-Id: <cover.1610715661.git.berto@igalia.com>
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
 Kashyap Chamarthy <kchamart@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

during the past months we talked about making x-blockdev-reopen stable
API, and one of the missing things was having support for changing
bs->file. See here for the discusssion (I can't find the message from
Kashyap that started the thread in the web archives):

   https://lists.gnu.org/archive/html/qemu-block/2020-10/msg00922.html

I was testing this and one of the problems that I found was that
removing a filter node using this command is tricky because of the
permission system, see here for details:

   https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00092.html

The good news is that Vladimir posted a set of patches that changes
the way that permissions are updated on reopen:

   https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00745.html

I was testing if this would be useful to solve the problem that I
mentioned earlier and it seems to be the case so I wrote a patch to
add support for changing bs->file, along with a couple of test cases.

This is still an RFC but you can see the idea.

These patches apply on top of Vladimir's branch:

git: https://src.openvz.org/scm/~vsementsov/qemu.git
tag: up-block-topologic-perm-v2

Opinions are very welcome!

Berto

Alberto Garcia (2):
  block: Allow changing bs->file on reopen
  iotests: Update 245 to support replacing files with x-blockdev-reopen

 include/block/block.h      |  1 +
 block.c                    | 61 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/245     | 61 +++++++++++++++++++++++++++++++++++---
 tests/qemu-iotests/245.out |  4 +--
 4 files changed, 121 insertions(+), 6 deletions(-)

-- 
2.20.1


