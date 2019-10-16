Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB8D8E26
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 12:40:03 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKgio-0003EO-Sl
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 06:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iKgZz-0006Mx-I7
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iKgZx-0006Ey-De
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:30:54 -0400
Received: from mgwym04.jp.fujitsu.com ([211.128.242.43]:42806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1iKgZw-0006BC-QF
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:30:53 -0400
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
 mgwym04.jp.fujitsu.com with smtp
 id 5cc6_12f1_9b0314cb_c31d_4913_99d0_579efad0846d;
 Wed, 16 Oct 2019 19:30:44 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
 (g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
 by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D65BAC00C6
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 19:30:43 +0900 (JST)
Received: from G01JPEXCHKW17.g01.fujitsu.local
 (G01JPEXCHKW17.g01.fujitsu.local [10.0.194.56])
 by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id 4AF9DBD676A;
 Wed, 16 Oct 2019 19:30:42 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW17.g01.fujitsu.local (10.0.194.56) with Microsoft SMTP Server id
 14.3.439.0; Wed, 16 Oct 2019 19:30:41 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To: <virtio-fs@redhat.com>
Subject: [PATCH 0/2] virtiofsd: Two fix for xattr operation
Date: Wed, 16 Oct 2019 19:37:52 +0900
Message-ID: <20191016103754.2047-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 211.128.242.43
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
Cc: qemu-devel@nongnu.org, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I test xattr operation on virtiofs using xfstest generic/062
(with -o xattr option and XFS backend) and see some problems.

These patches fixes the two of the problems.

The remaining problems are:
 1. we cannot xattr to block device created by mknod
    which does not have actual device (since open in virtiofsd fails)
 2. we cannot xattr to symbolic link

I don't think 1 is a big problem but can we fix 2?

Misono Tomohiro (2):
  virtiofsd: Avoid process hang when doing xattr operation to FIFO
  virtiofsd: Allow setxattr operation to directry

 contrib/virtiofsd/passthrough_ll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.21.0


