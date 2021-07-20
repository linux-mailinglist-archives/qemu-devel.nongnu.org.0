Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22CE3CF8E0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:34:29 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5o15-0000sd-J4
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5nzg-00005t-Oz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5nze-0004Ax-PI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626780776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jrBhpn/nnzHOHqTRJ0OG6sWhnYBKzVEPo1aQTDHuNA=;
 b=N4GjwS9N1u8sHi+dFQ2VfguOkaQ3xZg6LPy9qk34RYlIHjY/KLbBukFFBC1B4rzMrbZGKi
 kZqLZMJlLRvGCpY6gUUeErRf+NRO7VgZuTJ8x+CAPcFQqHwo2rEdUG/8dFGpF7Z2U8eO5i
 thZyJL1szuLOPwxG1cxNGa6RH+abSL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-SbXWhBcPPpSvo4tb7Ha39w-1; Tue, 20 Jul 2021 07:32:55 -0400
X-MC-Unique: SbXWhBcPPpSvo4tb7Ha39w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6197310557DC
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:32:53 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5892F78ABC;
 Tue, 20 Jul 2021 11:32:45 +0000 (UTC)
Date: Tue, 20 Jul 2021 13:32:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/3] vhost-user: warn when guest RAM is not shared
Message-ID: <YPa0WyuHUFdpcmJs@redhat.com>
References: <20210714092946.569516-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210714092946.569516-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.07.2021 um 11:29 hat Stefan Hajnoczi geschrieben:
> v3:
>  * Rebased
> v2:
>  * Clarify that object-memory-memfd enables share=on by default [Marc-André]
>  * Rebased
> 
> vhost-user requires -object memory-backend-*,share=on option so that QEMU uses
> mmap(MAP_SHARED) on guest RAM that is shared with the vhost-user device backend
> process. This is needed so the QEMU process sees changes made by the vhost-user
> device backend process, and vice versa.
> 
> Today QEMU and the vhost-user device process will start up and then fail with a
> confusing error message if the user forgot to specify share=on.
> 
> This patch series adds a warning letting the user know that share=on is
> required.

Hmm... This seems to work when I use shared=off for the memory backend,
even though the error message is easy to miss because more error
messages follow:

    $ LANG=C build/qemu-system-x86_64 -object memory-backend-memfd,id=mem,size=1G,share=off -m 1G -M memory-backend=mem -chardev socket,path=/tmp/vhost.sock,id=vhost1 -device vhost-user-blk-pci,chardev=vhost1
    qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1: warning: Found vhost-user memory region without MAP_SHARED (did you forget -object memory-*,share=on?)
    qemu-system-x86_64: Unexpected end-of-file before all data were read
    qemu-system-x86_64: Failed to set msg fds.
    qemu-system-x86_64: vhost VQ 0 ring restore failed: -1: Resource temporarily unavailable (11)

However, if I don't create the memory backend at all (which is probably
the most common error users will make), then the new message isn't
printed:

    $ LANG=C build/qemu-system-x86_64 -m 1G -chardev socket,path=/tmp/vhost.sock,id=vhost1 -device vhost-user-blk-pci,chardev=vhost1
    qemu-system-x86_64: Unexpected end-of-file before all data were read
    qemu-system-x86_64: Failed to set msg fds.
    qemu-system-x86_64: vhost VQ 0 ring restore failed: -1: Resource temporarily unavailable (11)

Wouldn't we want a warning for the second case, too?

Kevin


