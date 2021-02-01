Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB930A7FD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:52:13 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Yge-0002Qy-Rp
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YfF-0001Ts-3c
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YfC-0004Je-BA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612183840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HqIEgUA9uL57sNWGMbTXwQk7XS21IdzaNVSiF90e4KQ=;
 b=GHLKWANJAjr5MrKH1W/vBWQq/IF+1W/5WSQB/lx0zoA0iXtGaSKjlj7gaLmXGaIimLkigy
 sQ/ZZtxPDIm9gaB2ZD5x5HN/VpfMrYVdsUrADsWvLBIXVdQY+2JgDl1KamFDJibTVO09b8
 8y9Y2EsSaxoOzR6c5NZyCNJ9ZxZZUJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-6unq9I7gP6CaG5EgVZIrvA-1; Mon, 01 Feb 2021 07:50:38 -0500
X-MC-Unique: 6unq9I7gP6CaG5EgVZIrvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7458107ACE3;
 Mon,  1 Feb 2021 12:50:37 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-113-25.rdu2.redhat.com [10.10.113.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7031510016DB;
 Mon,  1 Feb 2021 12:50:33 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] nbd/server: Quiesce coroutines on context switch
Date: Mon,  1 Feb 2021 13:50:30 +0100
Message-Id: <20210201125032.44713-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series allows the NBD server to properly switch between AIO contexts,=
=0D
having quiesced recv_coroutine and send_coroutine before doing the transiti=
on.=0D
=0D
We need this because we send back devices running in IO Thread owned contex=
ts=0D
to the main context when stopping the data plane, something that can happen=
=0D
multiple times during the lifetime of a VM (usually during the boot sequenc=
e or=0D
on a reboot), and we drag the NBD server of the correspoing export with it.=
=0D
=0D
While there, fix also a problem caused by a cross-dependency between=0D
closing the export's client connections and draining the block=0D
layer. The visible effect of this problem was QEMU getting hung when=0D
the guest request a power off while there's an active NBD client.=0D
=0D
v4:=0D
 - Call to blk_exp_close_all() from qemu-nbd and qemu-storage-daemon=0D
 too. (Kevin Wolf)=0D
=0D
v3:=0D
 - Drop already merged "block: Honor blk_set_aio_context() context=0D
 requirements" and "nbd/server: Quiesce coroutines on context switch"=0D
 - Change the strategy for avoiding processing BDS twice to adding=0D
 every child and parent to the ignore list in advance before=0D
 processing them. (Kevin Wolf)=0D
 - Replace "nbd/server: Quiesce coroutines on context switch" with=0D
 "block: move blk_exp_close_all() to qemu_cleanup()"=0D
=0D
v2:=0D
 - Replace "virtio-blk: Acquire context while switching them on=0D
 dataplane start" with "block: Honor blk_set_aio_context() context=0D
 requirements" (Kevin Wolf)=0D
 - Add "block: Avoid processing BDS twice in=0D
 bdrv_set_aio_context_ignore()"=0D
 - Add "block: Close block exports in two steps"=0D
 - Rename nbd_read_eof() to nbd_server_read_eof() (Eric Blake)=0D
 - Fix double space and typo in comment. (Eric Blake)=0D
=0D
Sergio Lopez (2):=0D
  block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()=0D
  block: move blk_exp_close_all() to qemu_cleanup()=0D
=0D
 block.c                              | 35 +++++++++++++++++++++-------=0D
 qemu-nbd.c                           |  1 +=0D
 softmmu/runstate.c                   |  9 +++++++=0D
 storage-daemon/qemu-storage-daemon.c |  1 +=0D
 4 files changed, 38 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


