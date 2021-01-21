Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945662FDF3B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:18:57 +0100 (CET)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PYm-0007Gv-Mx
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PXp-0006rD-AA
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PXn-0005YY-R3
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611195475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDP8bQaTI0vk10wdMrEW49z+PXvuKDRMmU4D9RUvCKM=;
 b=D6vmFLbRCps0NwwlE1OzwP/ZdT9GH+LKIPN+48XIyyyhsby9wgfohOWGzrSoZB8r/MjerO
 Uf7hFZ+z0yfU746Ors2AbBWnzBJ0bFqQfoaBQRzTOOYp+NF48/4ame149BzrlBJFoRYVB8
 6hm81sMxYno/1L6gpq4JSJyKZktMd04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-zU_anlnjO5yWTVF8spclDw-1; Wed, 20 Jan 2021 21:17:53 -0500
X-MC-Unique: zU_anlnjO5yWTVF8spclDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C24958143E5;
 Thu, 21 Jan 2021 02:17:51 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54CDE708E0;
 Thu, 21 Jan 2021 02:17:51 +0000 (UTC)
Subject: Re: [PATCH v2 for-6.0 0/8] nbd reconnect on open
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <262704ac-33c6-d693-b08e-907cfe76ba49@redhat.com>
Date: Wed, 20 Jan 2021 20:17:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 7:40 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all! There is a new feature: reconnect on open. It is useful when
> start of vm and start of nbd server are not simple to sync.
> 
> v2: rebase on master.
> Also, I've discovered that I've sent downstream version of test which
> doesn't work here. So, the test is rewritten (with appropriate
> improvements of iotests.py)

Because of my questions on 2, I haven't queued the series yet; but 3 and
4 were independent enough to take now.

> 
> Vladimir Sementsov-Ogievskiy (8):
>   block/nbd: move initial connect to coroutine
>   nbd: allow reconnect on open, with corresponding new options
>   iotests.py: fix qemu_tool_pipe_and_status()
>   iotests.py: qemu_io(): reuse qemu_tool_pipe_and_status()
>   iotests.py: add qemu_tool_popen()
>   iotests.py: add and use qemu_io_wrap_args()
>   iotests.py: add qemu_io_popen()
>   iotests: add 306 to test reconnect on nbd open
> 
>  block/nbd.c                   | 173 +++++++++++++++++++++++++---------
>  tests/qemu-iotests/306        |  71 ++++++++++++++
>  tests/qemu-iotests/306.out    |  11 +++
>  tests/qemu-iotests/group      |   1 +
>  tests/qemu-iotests/iotests.py |  56 +++++++----
>  5 files changed, 246 insertions(+), 66 deletions(-)
>  create mode 100755 tests/qemu-iotests/306
>  create mode 100644 tests/qemu-iotests/306.out
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


