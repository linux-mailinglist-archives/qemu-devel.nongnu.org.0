Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5B31A482
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:28:26 +0100 (CET)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdB3-0008ES-44
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAd4D-0001li-6M
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:21:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAd45-0004NV-IT
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613154069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJx23acFOU5dcJx/UU/PUNASoGdQEZ3RG3B/zPIYsZg=;
 b=Eo3b7WwOeA6XfrCd2fFU6z+qdFFF/91xo8/mHLyscA/ebbwsKjbMdxHOJi0fHQDsExWaKq
 rrjyfGp729b052BmmOxwjqfnOYFTb52wUZifoMPo1FTv/w1RPKKJ09iDILWFKjR+PQCevo
 d8MY38NGcx7tyDunVxl15hxFjDYrkqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-7Y9a2qmuMVGkmZe9Krv8lA-1; Fri, 12 Feb 2021 13:21:06 -0500
X-MC-Unique: 7Y9a2qmuMVGkmZe9Krv8lA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3027F801975;
 Fri, 12 Feb 2021 18:21:05 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93F375D9FC;
 Fri, 12 Feb 2021 18:21:01 +0000 (UTC)
Subject: Re: [PATCH v2 00/10] mirror: cancel nbd reconnect
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ab5238f2-d256-c60e-873d-b9e4f5157808@redhat.com>
Date: Fri, 12 Feb 2021 12:21:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 10:37 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> The problem
> 
> Assume we have mirror job with nbd target node with enabled reconnect.
> Connection failed. So, all current requests to nbd node are waiting for
> nbd driver to reconnect. And they will wait for reconnect-delay time
> specified in nbd blockdev options. This timeout may be long enough, for
> example, we in Virtuozzo use 300 seconds by default.
> 
> So, if at this moment user tries to cancel the job, job will wait for
> its in-flight requests to finish up to 300 seconds. From the user point
> of view, cancelling the job takes a long time. Bad.
> 
> Solution
> 
> Let's just cancel "waiting for reconnect in in-flight request coroutines"
> on mirror (and backup) cancel. Welcome the series below.
> 
> v2: wording, rebase on master, add Eric's r-bs, update test-output in
>     last commit

Thanks; I'm queuing this through my NBD tree.

> 
> Vladimir Sementsov-Ogievskiy (10):
>   block: add new BlockDriver handler: bdrv_cancel_in_flight
>   block/nbd: implement .bdrv_cancel_in_flight
>   block/raw-format: implement .bdrv_cancel_in_flight handler
>   job: add .cancel handler for the driver
>   block/mirror: implement .cancel job handler
>   iotests/264: move to python unittest
>   iotests.py: qemu_nbd_popen: remove pid file after use
>   iotests/264: add mirror-cancel test-case
>   block/backup: implement .cancel job handler
>   iotests/264: add backup-cancel test-case
> 
>  include/block/block.h         |   3 +
>  include/block/block_int.h     |   9 +++
>  include/qemu/job.h            |   5 ++
>  block/backup.c                |  10 +++
>  block/io.c                    |  11 +++
>  block/mirror.c                |   9 +++
>  block/nbd.c                   |  15 ++++
>  block/raw-format.c            |   6 ++
>  job.c                         |   3 +
>  tests/qemu-iotests/264        | 140 ++++++++++++++++++++++------------
>  tests/qemu-iotests/264.out    |  20 ++---
>  tests/qemu-iotests/iotests.py |   6 +-
>  12 files changed, 172 insertions(+), 65 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


