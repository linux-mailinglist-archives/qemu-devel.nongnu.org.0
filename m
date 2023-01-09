Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7AF6627DB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsem-0007xj-56; Mon, 09 Jan 2023 08:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pEsek-0007xE-8u
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:57:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pEsei-00056N-Sq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673272660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8mCBkNMVJxWjJXDqaPcCixpTvoo/4R5FdNHi5FXGONo=;
 b=JkzNK8/qOtbWEqNJouLFlU2W2ryuWbFDPMWwsVceVlIvIX7sesNfGvtBR1o+RA2BZQ9Djx
 M6pMHuP6Suthcucai5KrMQlYvmOZPilBLZCv/dDV0WTe7hbBpV8rh9Hl3+jFSAwHKvSmKC
 W2Wt8rqbY3z53dDG3Vk+DSIfQbeSRGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-TLSF3E54MBms7TaXGF8Glw-1; Mon, 09 Jan 2023 08:57:37 -0500
X-MC-Unique: TLSF3E54MBms7TaXGF8Glw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A87193811F28;
 Mon,  9 Jan 2023 13:57:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF4BFC16026;
 Mon,  9 Jan 2023 13:57:35 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:57:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Questions about how block devices use snapshots
Message-ID: <Y7wdTurqBjWXIGmo@redhat.com>
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 09.01.2023 um 13:45 hat Zhiyong Ye geschrieben:
> Qemu provides powerful snapshot capabilities for different file
> formats. But this is limited to the block backend being a file, and
> support is not good enough when it is a block device. When creating
> snapshots based on files, there is no need to specify the size of the
> snapshot image, which can grow dynamically as the virtual machine is
> used. But block devices are fixed in size at creation and cannot be
> dynamically grown at a later time.
> 
> So is there any way to support snapshots when the block backend is a
> block device?

In order to have snapshots, you need to have an image format like qcow2.

A qcow2 file can have a raw block device as its backing file, so even if
you store the overlay image on a filesystem, you have technically
snapshotted a block device. This may or may not be enough for your use
case.

It is also possible to store qcow2 files on block devices, though
depending on your requirements, it can get very tricky because then
you're responsible for making sure that there is always enough free
space on the block device.

So a second, still very simple, approach could be taking a second block
device that is a little bit larger than the virtual disk (for the qcow2
metadata) and use that as the external snapshot. Obviously, you require
a lot of disk space this way, because each snapshots needs to be able to
store the full image.

You could also use internal snapshots. In this case, you just need to
make sure that the block device is a lot larger than the virtual disk,
so that there is enough space left for storing the snapshots. At some
point it will be full.

And finally, for example if your block devices are actually LVs, you
could start resizing the block device dynmically as needed. This becomes
very complex quickly and you're on your own, but it is possible and has
been done by oVirt.

Kevin


