Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90CC3CBDDE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 22:38:30 +0200 (CEST)
Received: from localhost ([::1]:49476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4UbN-0000UJ-Pp
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 16:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m4UYr-0006L4-U6
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 16:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m4UYq-0004n5-A3
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 16:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626467751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GbHIQHVfeCf23X/erZeWVtd7mkScjmbCjYriqDrN3nw=;
 b=i71Ewk8LJqKpYHNQEyVej+OQ59iMHSRsJjAVqcT6h52PiaU/sHhc/+Re+Y0RCMwafTzjtz
 pxUMhfzSTL5UCduiwh1boZzr//fmh3x33vhh2FJVYaZGZhNCMuw6vDfhW7MV14q42PzyXf
 oN+46EcGjQpWH6f+AJWqnVLrRsLIAzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-zIJlY2b5OBehFgleniygwg-1; Fri, 16 Jul 2021 16:35:50 -0400
X-MC-Unique: zIJlY2b5OBehFgleniygwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02AFC804144;
 Fri, 16 Jul 2021 20:35:49 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89DA060C0F;
 Fri, 16 Jul 2021 20:35:48 +0000 (UTC)
Date: Fri, 16 Jul 2021 15:35:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 2/5] block/nbd: move nbd_recv_coroutines_wake_all() up
Message-ID: <20210716203546.osup25gqm4ovjdlp@redhat.com>
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
 <20210714165916.102363-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210714165916.102363-3-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-574-3fb1cf
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 07:59:13PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are going to use it in nbd_channel_error(), so move it up. Note,
> that we are going also refactor and rename
> nbd_recv_coroutines_wake_all() in future anyway, so keeping it where it
> is and making forward declaration doesn't make real sense.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


