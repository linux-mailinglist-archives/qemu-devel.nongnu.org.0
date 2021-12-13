Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB414473647
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 21:53:20 +0100 (CET)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwsK0-0003d7-3j
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 15:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mwsHu-0002Uw-C1
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:51:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mwsHp-0003qT-Im
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639428660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4kqmYSNwor0jSX13AYQP/XZ5nruCKxTODlI011ZC0Q=;
 b=XOt1RXyc2Y9vOapBMF/CXkeBjIzXXHEFwhAB42z70wKa4Ox50cjwxRDCpC6jwTIg7G9FuR
 QIMJ9B5g5gkiJb++EfRcmPyd+bVpWVGxrMWEmI4Xp43/UjU9YL+NFgiMqolQHPluSdDZ7r
 IgCGYfLOIuxHwoDlybd4QQp/eIg5QV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-dM3DwNwHPNmVJeb0YFeamA-1; Mon, 13 Dec 2021 15:50:58 -0500
X-MC-Unique: dM3DwNwHPNmVJeb0YFeamA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D065B102CB76;
 Mon, 13 Dec 2021 20:50:56 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C2A5F4E1;
 Mon, 13 Dec 2021 20:50:55 +0000 (UTC)
Date: Mon, 13 Dec 2021 14:50:53 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 1/7] nbd: allow reconnect on open, with corresponding
 new options
Message-ID: <20211213205053.27j3gs3ao57w5xtc@redhat.com>
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
 <20211213153240.480103-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211213153240.480103-2-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211029-46-a5fba3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 04:32:34PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> It is useful when start of vm and start of nbd server are not
> simple to sync.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  qapi/block-core.json |  9 ++++++++-
>  block/nbd.c          | 45 +++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 1d3dd9cb48..8cf82417a6 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4096,6 +4096,12 @@
>  #                   future requests before a successful reconnect will
>  #                   immediately fail. Default 0 (Since 4.2)
>  #
> +# @open-timeout: In seconds. If zero, the nbd driver tries the connection
> +#                only once, and fails to open if the connection fails.
> +#                If non-zero, the nbd driver will repeat connection attempts
> +#                until successful or until @open-timeout seconds have elapsed.
> +#                Default 0 (Since 6.2)

We'll have to tweak this to be since 7.0, now.  Easy to do on top, and
not worth a respin by itself.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


