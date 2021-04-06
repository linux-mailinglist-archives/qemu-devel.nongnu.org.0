Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AD354E7B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:24:00 +0200 (CEST)
Received: from localhost ([::1]:39140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTh0A-00027P-R4
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lTgyw-0001HW-Qb
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:22:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lTgyu-0008Uv-UJ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617697360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l2kwAAH52cWfe49/63r7Xf6cKlxi7w/jQbas36PNF/w=;
 b=iAy0WXjb1GkPQ8xNGZJBl14ZEKQthuattevxEWiEEMEJMiq1zJefu9QbNeqy6G4yvXYVr8
 OLfyMrvph3j3q7ZflfkKHQv5WEvh7AUBfKBPbVL7Ycn5ghTQU1PW2jt0rMFlPUE1I2glKt
 L0EICDbaIfyqVFjU1hM80PhKZm8AQ7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-CChTQjw3O0OpCTKfQnJjfw-1; Tue, 06 Apr 2021 04:22:36 -0400
X-MC-Unique: CChTQjw3O0OpCTKfQnJjfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CDBF108BD06;
 Tue,  6 Apr 2021 08:22:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D219B6267C;
 Tue,  6 Apr 2021 08:22:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F1E6113865F; Tue,  6 Apr 2021 10:22:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 1/2] block/rbd: fix memory leak in qemu_rbd_connect()
References: <20210329150129.121182-1-sgarzare@redhat.com>
 <20210329150129.121182-2-sgarzare@redhat.com>
Date: Tue, 06 Apr 2021 10:22:30 +0200
In-Reply-To: <20210329150129.121182-2-sgarzare@redhat.com> (Stefano
 Garzarella's message of "Mon, 29 Mar 2021 17:01:28 +0200")
Message-ID: <87im4zddq1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Florian Florensa <fflorensa@online.net>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella <sgarzare@redhat.com> writes:

> In qemu_rbd_connect(), 'mon_host' is allocated by qemu_rbd_mon_host()
> using g_strjoinv(), but it's only freed in the error path, leaking
> memory in the success path as reported by valgrind:
>
>   80 bytes in 4 blocks are definitely lost in loss record 5,028 of 6,516
>      at 0x4839809: malloc (vg_replace_malloc.c:307)
>      by 0x5315BB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x532B6FF: g_strjoinv (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x87D07E: qemu_rbd_mon_host (rbd.c:538)
>      by 0x87D07E: qemu_rbd_connect (rbd.c:562)
>      by 0x87E1CE: qemu_rbd_open (rbd.c:740)
>      by 0x840EB1: bdrv_open_driver (block.c:1528)
>      by 0x8453A9: bdrv_open_common (block.c:1802)
>      by 0x8453A9: bdrv_open_inherit (block.c:3444)
>      by 0x8464C2: bdrv_open (block.c:3537)
>      by 0x8108CD: qmp_blockdev_add (blockdev.c:3569)
>      by 0x8EA61B: qmp_marshal_blockdev_add (qapi-commands-block-core.c:1086)
>      by 0x90B528: do_qmp_dispatch_bh (qmp-dispatch.c:131)
>      by 0x907EA4: aio_bh_poll (async.c:164)
>
> Fix freeing 'mon_host' also when qemu_rbd_connect() ends correctly.
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

I believe this
Fixes: 0a55679b4a5061f4d74bdb1a0e81611ba3390b00

Reviewed-by: Markus Armbruster <armbru@redhat.com>


