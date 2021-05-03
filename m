Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145F33718DE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:08:34 +0200 (CEST)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldb7Y-0007Ix-Gu
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldb50-0006D6-ND; Mon, 03 May 2021 12:05:56 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldb4w-00062s-Sn; Mon, 03 May 2021 12:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=74XrSjpvN7bXI7ttOXIQSFQZesCUWN5tVzG7PT+h4lQ=; 
 b=E75CS0E/gr+0HlZpc1F9ZNB5q7f/OyaYd40udUeifsY9zBG6Hp+AnTCTL1fyoh1Zua35XTP0AoNBXx2y4pIyKzTJ7NWvAq3NFgdGyhu3egcJKcJSOQW9pUxsaQRYtrVhr58wLiCyoDOoG52x173f8gcKRDu/fKpWrC81UPsdz+KT38urLaWsm2nA+1C9xRMz/j0jmbAgAWlLQkvcnXugxyGlLZBgWV6TA1sjjL+XpfrAqB5IbAwcuSxDj6lDAA98Zcb7eXFOv7htUkaLjJseIbzQ2k//wDneVKOW6PxOZOu2Dw2z8qmVyNCITy3/euMnXcJDHcEeaV8BS2Vbi5WPqw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1ldb4t-0002cV-63; Mon, 03 May 2021 18:05:47 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1ldb4s-0001is-SL; Mon, 03 May 2021 18:05:46 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 5/6] block: simplify bdrv_child_user_desc()
In-Reply-To: <20210503113402.185852-6-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-6-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 03 May 2021 18:05:46 +0200
Message-ID: <w51o8drhkf9.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 03 May 2021 01:34:01 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> All existing parent types (block nodes, block devices, jobs) has the
> realization. So, drop unreachable code.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

With the updated description that you propose in your reply to the
patch,

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

