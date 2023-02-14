Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AC696E4B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 21:11:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1cd-0006zi-Fw; Tue, 14 Feb 2023 15:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pS1ca-0006xV-Tv; Tue, 14 Feb 2023 15:09:48 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pS1cY-0000nH-Hd; Tue, 14 Feb 2023 15:09:48 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 88A5961FF5;
 Tue, 14 Feb 2023 23:09:35 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y9q4w20RhOs1-QS8EF8Bw; Tue, 14 Feb 2023 23:09:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676405374; bh=V4KCUxra3PYEZN9bye0/UYtppbBBk0Rlli7Kj2oT/EU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=T0q+kHSS0RYDXqxJfeTQ8kldOryE2JIkY2iTTYjG+OEfZlNoEhL9pi4R6cC6yKiRG
 KpVfZfhSN9RSKiuXiSYsfv6UKxlCb6uWu5/KP4af3iqE+qEqtq/9pH090KMOYgeLY1
 mTXJWQrg4l64V77LwDpWVzo9Rdcodv3LwzL4QLCA=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <219d0150-59e6-2a77-d43e-9a921d172d72@yandex-team.ru>
Date: Tue, 14 Feb 2023 23:09:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] qemu-img: Fix exit code for errors closing the image
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, qemu-devel@nongnu.org
References: <20230112191454.169353-1-kwolf@redhat.com>
 <874jsu51sj.fsf@pond.sub.org> <Y8FAkAC3L7oF5q48@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <Y8FAkAC3L7oF5q48@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13.01.23 14:29, Kevin Wolf wrote:
> Another thing that could be tried is making failure in .bdrv_close less
> likely by doing things earlier. At least ENOSPC could probably be
> avoided if dirty bitmaps clusters were allocated during the write
> request that first sets a bit in them (I know too little about the
> details how bitmaps are implemented in qcow2, though, maybe Vladimir can
> help here).

That's possible but not trivial :)

Qcow2 does nothing with dirty bitmaps during normal operation. Only on close, it finds all persistent bitmaps and stores them somehow, mostly allocating new clusters on the fly.

So the simplest way look like:

- add generic handler .bitmap_changed in BlockDriver, to handle bitmap change in qcow2 (that's not only write, but may be bitmap_merge opertion).
- in a new handler allocate some clusters to produce a pool for dirty bitmaps saving (will need clusters for bitmap data and metadata (bitmap table, bitmap directory))
- in block/qcow2-bitmap.c switch qcow2_alloc_cluster() to a wrapper, that first tries to get a cluster from the pool and if it's empty fallback to qcow2_alloc_cluster()

Note also, that this will increase fragmentation.

Or, may be more effective would be to preallocate clusters on bitmap creation (and therefore on image resize).

More difficult would be rework the whole code to bind allocated clusters for each persistent dirty bitmap.

-- 
Best regards,
Vladimir


