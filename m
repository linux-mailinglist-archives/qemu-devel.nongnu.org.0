Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D275C517
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 23:41:09 +0200 (CEST)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi42v-0002ps-5D
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 17:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1hi3Qh-0001j5-Pg
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1hi3QP-0001Jh-Qn
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:01:26 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:36360)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
 id 1hi3QC-0008CD-Pd
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:01:11 -0400
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 78CBF2E1435;
 Mon,  1 Jul 2019 19:42:34 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 5XFJ2s1Qlk-gYbGiC7f; Mon, 01 Jul 2019 19:42:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1561999354; bh=TwFSzjnXJnDvcova6hE0WeovdGZ3iXT6HsyPPJ/eEdo=;
 h=Date:Message-Id:Cc:Subject:To:From;
 b=rCCuleW6wAlaJN7ttHYZj2mfbEjAifmu1A2DxE8fFUTn5sF0dRU+GJy4Lv/GOgPPA
 EkEeSuhVCOxxQeRcwgOIpClCSEpNn8CDPB+Wrk2+DqyLUMFueC2y631iQk3nzME9qI
 vWUEyMjoGhHpAIGhM7OflK+zXw4eqOOe0mHOU1u8=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000071945
X-Yandex-Avir: 1
Received: from mxbackcorp1g.mail.yandex.net (localhost [::1])
 by mxbackcorp1g.mail.yandex.net with LMTP id MUMlmgbyWn-ed6mRBF7
 for <yury-kotov@yandex-team.ru>; Mon, 01 Jul 2019 19:42:23 +0300
Received: by sas2-ae5b5c0d8595.qloud-c.yandex.net with HTTP;
 Mon, 01 Jul 2019 19:42:23 +0300
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Dr. David Alan Gilbert <dgilbert@redhat.com>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 01 Jul 2019 19:42:33 +0300
Message-Id: <1563421561999343@sas2-ae5b5c0d8595.qloud-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 77.88.29.217
Subject: [Qemu-devel] Question about bdrv_co_invalidate_cache
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I just want to clarify the purpose of bdrv_co_invalidate_cache callback.
IIUC on of the purposes of this callback is to "activate" BDRV (opposite of the
bdrv_inactivate callback) on migration end, right?

E.g, if we have a custom BDRV which is backed by some network block storage with
exclusive mount then on migration end bdrv_inactivate callback have to unmount
this storage and bdrv_co_invalidate_cache have to mount it.

I'm not sure because of the name of bdrv_co_invalidate_cache callback. It looks
like something that can be called in very different context, not only migration
(may be not now, but in the future).

If there is another approach for my example, tell me about it, please.
We have such custom BDRV with exclusive mount and want to realize migration
support correctly.

Thanks!

Regards,
Yury

