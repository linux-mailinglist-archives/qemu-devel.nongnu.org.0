Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602B2FDB34
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:51:50 +0100 (CET)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KSD-0002zX-BC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2KQ0-000288-6H
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:49:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2KPy-0004S8-Fj
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611175769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23A/75KbwZnsvqTRag47B6GWCzmLaeoYFCZRLMfkt3w=;
 b=ccMY0JsUiKfWpx1jx2/Ap1K02yAPqGS58f9DxnyZ7PtakqiZw37Cwx5XHV3Vnzxx0qC1SV
 w8b0ge90Ld6jYrzaByb0SzYrZ5Vn3N6yO3swBNp31MCswqa9ONWvn2klGdsjv/C8CiWFRS
 7jkMaTgF7g4tznKS2mglbjDQoS+AURI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-WbpvzPbVMw-q5r_TsagfXg-1; Wed, 20 Jan 2021 15:49:27 -0500
X-MC-Unique: WbpvzPbVMw-q5r_TsagfXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1149107ACE3;
 Wed, 20 Jan 2021 20:49:24 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8DF19CB1;
 Wed, 20 Jan 2021 20:49:14 +0000 (UTC)
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
References: <20201214170519.223781-1-slp@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 0/4] nbd/server: Quiesce coroutines on context switch
Message-ID: <cb4c9e40-065f-228b-b805-1ed10fd605a3@redhat.com>
Date: Wed, 20 Jan 2021 14:49:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 11:05 AM, Sergio Lopez wrote:
> This series allows the NBD server to properly switch between AIO contexts,
> having quiesced recv_coroutine and send_coroutine before doing the transition.
> 
> We need this because we send back devices running in IO Thread owned contexts
> to the main context when stopping the data plane, something that can happen
> multiple times during the lifetime of a VM (usually during the boot sequence or
> on a reboot), and we drag the NBD server of the correspoing export with it.
> 
> While there, fix also a problem caused by a cross-dependency between
> closing the export's client connections and draining the block
> layer. The visible effect of this problem was QEMU getting hung when
> the guest request a power off while there's an active NBD client.
> 
> v2:
>  - Replace "virtio-blk: Acquire context while switching them on
>  dataplane start" with "block: Honor blk_set_aio_context() context
>  requirements" (Kevin Wolf)
>  - Add "block: Avoid processing BDS twice in
>  bdrv_set_aio_context_ignore()"
>  - Add "block: Close block exports in two steps"
>  - Rename nbd_read_eof() to nbd_server_read_eof() (Eric Blake)
>  - Fix double space and typo in comment. (Eric Blake)

ping - where do we stand on this series?  Patches 1 and 3 have positive
reviews, I'll queue them now; patches 2 and 4 had enough comments that
I'm guessing I should wait for a v3?


> 
> Sergio Lopez (4):
>   block: Honor blk_set_aio_context() context requirements
>   block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()
>   nbd/server: Quiesce coroutines on context switch
>   block: Close block exports in two steps
> 
>  block.c                         |  27 ++++++-
>  block/export/export.c           |  10 +--
>  blockdev-nbd.c                  |   2 +-
>  hw/block/dataplane/virtio-blk.c |   4 ++
>  hw/block/dataplane/xen-block.c  |   7 +-
>  hw/scsi/virtio-scsi.c           |   6 +-
>  include/block/export.h          |   4 +-
>  nbd/server.c                    | 120 ++++++++++++++++++++++++++++----
>  qemu-nbd.c                      |   2 +-
>  stubs/blk-exp-close-all.c       |   2 +-
>  10 files changed, 156 insertions(+), 28 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


