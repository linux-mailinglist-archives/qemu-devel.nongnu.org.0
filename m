Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7BC581A7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 13:36:06 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgShB-0002L2-K7
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 07:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56639)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hgSCS-0000MI-Lc
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hgSC7-00005M-EE
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:04:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1hgSC7-0008W6-7b
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:03:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7013F309265B;
 Thu, 27 Jun 2019 11:03:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-154.ams2.redhat.com
 [10.36.116.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6C6A60856;
 Thu, 27 Jun 2019 11:03:46 +0000 (UTC)
Date: Thu, 27 Jun 2019 13:03:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190627110344.GD5618@localhost.localdomain>
References: <20190620173709.14753-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620173709.14753-1-stefanha@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 27 Jun 2019 11:03:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 0/3] virtio-scsi: restart DMA after
 iothread
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.06.2019 um 19:37 hat Stefan Hajnoczi geschrieben:
> v5:
>  * Plumbing vm change state handlers into DeviceClass/BusClass is a rather
>    large bug fix.  Instead I've combined the previous priorities approach with
>    the observation from Kevin and Paolo that we really want to order by qdev
>    tree depth.
> 
>    The new qdev_add_vm_change_state_handler() API lets DeviceStates register
>    callbacks that execute in qdev tree depth order.  This solves the
>    virtio-scsi bug since the virtio-scsi device's callback must complete before
>    its child scsi-disk's callback runs.
> 
>    Is this a good compromise for everyone?

I'd still call it a hack, but I can also see that doing the real thing
would be a lot of work that might not be worth the effort.

Thanks, applied to the block branch.

Kevin

