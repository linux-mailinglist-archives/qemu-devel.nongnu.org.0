Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9644F531556
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 19:42:44 +0200 (CEST)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntC4m-0008Vb-Mz
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 13:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntAip-0002gz-3D; Mon, 23 May 2022 12:15:55 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:43118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntAil-0003hv-Fr; Mon, 23 May 2022 12:15:53 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 6AE372E1219;
 Mon, 23 May 2022 19:04:52 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 g6MjHgEeh5-4pJKA7XQ; Mon, 23 May 2022 19:04:52 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653321892; bh=2nz+x//69YqDDfN8aMdhWX1z8+WFYGFsMdaX16q2Y0o=;
 h=Cc:To:From:Subject:Message-ID:Date;
 b=u+cT9YaFR1bEifAluJ3/Ht1kLGR/PQFdF3gIwYvfiW8mlmxctdcesFZPNUN2fytzo
 ypTY6PTYI+/l+foyNqDAEMYYfnmkU2X8HLc2J3SsVRj4ozDM1XgiBZBYflVgIBne8W
 dpASNiV/7wRgc34SenXU0Uj2O2lyGnehM3QxzJYU=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:a521::1:28] (unknown
 [2a02:6b8:b081:a521::1:28])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 iO9ZBTYofb-4pNC6W5w; Mon, 23 May 2022 19:04:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <5dacced9-5434-5d05-a826-c7acb9fcb2ed@yandex-team.ru>
Date: Mon, 23 May 2022 19:04:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, hreitz@redhat.com
Subject: aio_wait_bh_oneshot() thread-safety question
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 23 May 2022 13:38:23 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all (yes, that's my new address, I hope for a long time. )

I have a doubt about how aio_wait_bh_oneshot() works. Exactly, I see that data->done is not accessed atomically, and doesn't have any barrier protecting it..

Is following possible:

main-loop                           iothread
                                 |
aio_wait_bh_oneshot()           |
     aio_bh_schedule_oneshot()   |
                                 |  handle bh:
                                 | 1. set data->done = true
                                 | 2. call aio_wait_kick(), inserting the
                                 | dummy bh into main context
                                 |
  ... in AIO_WAIT_WHILE():
    handle dummy bh, go to next
    iteration, but still read
    data->done=false due to some
    processor data reordering,
    go to next iteration of polling
    and hang

?

I've seen a following dead-lock on 2.12-based Qemu, but failed to find is it (and how is it) fixed in master:

1. main() thread is stuck in qemu_mutex_lock_iothread()

2. The global mutex is taken by migration_thread(), which has the following stack:

aio_poll ( ctx=qemu_aio_context, blocking=true )
aio_wait_bh_oneshot ( ctx=context_of_iothread, cb=virtio_blk_data_plane_stop_bh )
virtio_blk_data_plane_stop
virtio_bus_stop_ioeventfd
virtio_vmstate_change
vm_state_notify
do_vm_stop
migration_completion

The iothread itself is in qemu_poll_ns() -> ppoll(). data->done of the BH is true, so I assume iothread completely handled the BH. Also, there is no dummy_bh in the main qemu aio context bh-list, so I assume it's either already handled, or aio_wait_kick() was called even before entering AIO_WAIT_WHILE. But still, AIO_WAIT_WHILE somehow go into block aio_poll, like data->done was false.

-- 
Best regards,
Vladimir

