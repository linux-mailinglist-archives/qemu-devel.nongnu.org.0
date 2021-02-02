Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C095230CEF6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:34:55 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74G6-000482-S1
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74F5-0003cn-A4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74F0-0000Hd-MC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MsPGhb4UUWfhsN0ngzme7BZEzm3GDKMLMT7gABMYMEc=;
 b=YAI1nhzq6W1QFlZx+OVdzUqipo2eUPjs+hN3kBUzatX1BbS+jupVL+5V2YGqfCWwtj5fy/
 fpy1wRKh84zIRXJ1m4a/BjUKyGquiWWX0Wt4JTL9KaEzBQ2nZUdLawPQCZWX5aeQWJcRQN
 Gcm1yNEQjeizoLTKEl6onHUKsp4cErE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-7CgcXYDtPiuFZ9s2Fkm1EQ-1; Tue, 02 Feb 2021 17:33:43 -0500
X-MC-Unique: 7CgcXYDtPiuFZ9s2Fkm1EQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DC1D800D55;
 Tue,  2 Feb 2021 22:33:41 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 778BA5B4B2;
 Tue,  2 Feb 2021 22:33:40 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] block/nbd: fix crashers in reconnect while
 migrating
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210129073859.683063-1-rvkagan@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <baa792cb-bae0-993e-b8c0-fe0ebb5945b3@redhat.com>
Date: Tue, 2 Feb 2021 16:33:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129073859.683063-1-rvkagan@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 1:38 AM, Roman Kagan wrote:
> During the final phase of migration the NBD reconnection logic may
> encounter situations it doesn't expect during regular operation.
> 
> This series addresses some of them that make qemu crash.  They are
> reproducible when a vm with a secondary drive attached via nbd with
> non-zero "reconnect-delay" runs a stress load (fio with big queue depth)
> in the guest on that drive and is migrated (e.g. to a file), while the
> nbd server is SIGKILL-ed and restarted every second.
> 
> See the individual patches for specific crash conditions and more
> detailed explanations.
> 
> v1 -> v2:
> - fix corrupted backtraces in log messages
> - add r-b by Vladimir
> 

Thanks, queuing through my NBD tree.

> Roman Kagan (3):
>   block/nbd: only detach existing iochannel from aio_context
>   block/nbd: only enter connection coroutine if it's present
>   nbd: make nbd_read* return -EIO on error
> 
>  include/block/nbd.h |  7 ++++---
>  block/nbd.c         | 25 +++++++++++++++++--------
>  2 files changed, 21 insertions(+), 11 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


