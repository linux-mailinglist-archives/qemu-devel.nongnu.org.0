Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCFD3988B6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:58:12 +0200 (CEST)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPVj-0005dX-0a
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loPUt-0004rd-Ms
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loPUr-0008Aq-RK
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622635037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gCIm1c2hKWwFLpLwL6eAz7Q7j0gsqHhUxSJXuIBGZJY=;
 b=DtRDaeqbffjjicA+uCvCWLGq3D30rBn1I3Halt0vwMzbCKxUsbbiZkZoP+GbN3lTaJ9mph
 cnuHSnxarDwNnfIvRBfb33kncPCxrKlqC2gnWEtPAvVipgJ28AGaJtRUmX1B8U7BDjrbMT
 jqmC2wUkn3DMyLhi9/23/7nWGed6yZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-uc6yXrDJNn2HFa90P4CuJA-1; Wed, 02 Jun 2021 07:57:13 -0400
X-MC-Unique: uc6yXrDJNn2HFa90P4CuJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5E3E8015F8;
 Wed,  2 Jun 2021 11:57:12 +0000 (UTC)
Received: from redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A2F860E3A;
 Wed,  2 Jun 2021 11:57:06 +0000 (UTC)
Date: Wed, 2 Jun 2021 13:57:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v2 0/2] nbd/server: Quiesce server on drained section
Message-ID: <YLdyEblm7cVxWoBr@redhat.com>
References: <20210602060552.17433-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210602060552.17433-1-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.06.2021 um 08:05 hat Sergio Lopez geschrieben:
> Before switching between AioContexts we need to make sure that we're
> fully quiesced ("nb_requests == 0" for every client) when entering the
> drained section. Otherwise, coroutines may be run in the wrong context
> after the switch, leading to a number of critical issues.
> 
> To accomplish this, we add ".drained_poll" to BlockDevOps and use it
> in the NBD server, along with ".drained_being" and "drained_end", to
> coordinate the quiescing of the server while entering a drained
> section.
> 
> v2:
>  - Use a bool for the value returned by .drained_poll [Kevin]
>  - Change .drained_poll comment to reflect that the returned boolean
>    value will be true if the device is still busy, or false otherwise
>  - Drop yield_co_list and use recv_coroutine and read_yielding [Kevin]
>  - Return "true" or "false" in nbd_drained_poll [Kevin]
>  - Fix grammar in the commit message of patch 2 [Eric]

Thanks, applied to the block branch.

Kevin


