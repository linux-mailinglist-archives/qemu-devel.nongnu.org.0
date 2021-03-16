Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6733D613
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:48:40 +0100 (CET)
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAzv-0006fO-3K
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMAtH-0007xi-I0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMAtF-0004BM-TB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTva5Bj6uWnxCUvkQRCNaMHgi7w3X+VttkiPYgifBrQ=;
 b=IEqrqXcLmXHaAKqJhaAzNVSj+tYHbwqaSipa9ZUZBLqeIB1AhF8TW/3yS5pnCwBzJLFPi9
 t0jj4mQsfCSzP0bANhle5beBSJZ6UX1Rq8ANHDVTMD7czIpC3Ol26MI8sn+YSnklhOHSOK
 xYsoVJEaJsCe1XIs9xLDYTpRLyapSzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-XmQ_l36QMvuVqMd4IjCdVQ-1; Tue, 16 Mar 2021 10:41:41 -0400
X-MC-Unique: XmQ_l36QMvuVqMd4IjCdVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 023021015C84;
 Tue, 16 Mar 2021 14:41:39 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5CFB6091A;
 Tue, 16 Mar 2021 14:41:36 +0000 (UTC)
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d6417ccf-04f3-be97-14a8-3aceda1e1e28@redhat.com>
Date: Tue, 16 Mar 2021 09:41:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 1:06 AM, Roman Kagan wrote:
> The reconnection logic doesn't need to stop while in a drained section.
> Moreover it has to be active during the drained section, as the requests
> that were caught in-flight with the connection to the server broken can
> only usefully get drained if the connection is restored.  Otherwise such
> requests can only either stall resulting in a deadlock (before
> 8c517de24a), or be aborted defeating the purpose of the reconnection
> machinery (after 8c517de24a).
> 
> This series aims to just stop messing with the drained section in the
> reconnection code.
> 
> While doing so it undoes the effect of 5ad81b4946 ("nbd: Restrict
> connection_co reentrance"); as I've missed the point of that commit I'd
> appreciate more scrutiny in this area.

Soft freeze is today.  I'm leaning towards declaring this series as a
bug fix (and so give it some more soak time to get right, but still okay
for -rc1) rather than a feature addition (and therefore would need to be
in a pull request today).  Speak up now if this characterization is off
base.

> 
> Roman Kagan (7):
>   block/nbd: avoid touching freed connect_thread
>   block/nbd: use uniformly nbd_client_connecting_wait
>   block/nbd: assert attach/detach runs in the proper context
>   block/nbd: transfer reconnection stuff across aio_context switch
>   block/nbd: better document a case in nbd_co_establish_connection
>   block/nbd: decouple reconnect from drain
>   block/nbd: stop manipulating in_flight counter
> 
>  block/nbd.c  | 191 +++++++++++++++++++++++----------------------------
>  nbd/client.c |   2 -
>  2 files changed, 86 insertions(+), 107 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


