Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30766ADE88
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:18:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWG2-0007nO-LH; Tue, 07 Mar 2023 07:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZWG0-0007ha-C1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZWFy-0007Tm-Fd
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678191445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PKOdYTPPdKo3VdIYtDevw9IPbKDAvsH3kOG9GKDYC5I=;
 b=IfL2XrQVPt41VmOxmkv3aeSh0QCvaxbSdzcwMutOzxpH5sMGO1tubNpzi6vem/WJahujWq
 n9hZEt/mlIwpE5pg9UO/Rgb5ChgP11lpWanlZQDyUOZtftwkZudD3bQ5PvvI6YYH/e9Vn9
 PDZgLGGoiTerSIMxL3YJCDR4/GLBNQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-GPXNxuJIN96x10C7n9ehJA-1; Tue, 07 Mar 2023 07:17:22 -0500
X-MC-Unique: GPXNxuJIN96x10C7n9ehJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF5B6101A5BA;
 Tue,  7 Mar 2023 12:17:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C3641121314;
 Tue,  7 Mar 2023 12:17:18 +0000 (UTC)
Date: Tue, 7 Mar 2023 13:17:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 1/4] linux-aio: use LinuxAioState from the running
 thread
Message-ID: <ZAcrTfv2wXIZnNry@redhat.com>
References: <20230203131731.851116-1-eesposit@redhat.com>
 <20230203131731.851116-2-eesposit@redhat.com>
 <Y/96WsnkiZEb0+kf@fedora> <ZAb6c+Nz7jVvNylN@redhat.com>
 <115b4902-b930-5f33-4a3c-5b767f94c2d5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <115b4902-b930-5f33-4a3c-5b767f94c2d5@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 07.03.2023 um 11:58 hat Paolo Bonzini geschrieben:
> On 3/7/23 09:48, Kevin Wolf wrote:
> > You mean we have a device that has a separate iothread, but a request is
> > submitted from the main thread? This isn't even allowed today; if a node
> > is in an iothread, all I/O must be submitted from that iothread. Do you
> > know any code that does submit I/O from the main thread instead?
> 
> I think it is allowed, you just have to take the AioContext lock around the
> bdrv_*?

Didn't we say at some point that we don't want to do this either? Though
maybe it's not strictly forbidden then.

> For example it could happen when you do block device migration.

As in migration/block.c? As far as I can tell, all of the requests made
there are actually processed in the iothread. (blk_aio_*() calls the
callback in the iothread even when it was called from the main thread
itself, which feels like a trap, but it shouldn't be affected by this
change lower in the stack.)

The potentially critical code would be coroutine_fns that call
blk_co_*() or bdrv_co_*() directly while running in a different thread.
Everything else schedules a new coroutine in the AioContext of the block
node.

Kevin


