Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515824404F0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:32:04 +0200 (CEST)
Received: from localhost ([::1]:49320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZTn-0000Av-An
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgYYr-0004xr-La
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgYYo-0006JL-JL
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635539588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F6r18W0RKJ3kxpci2cIANG74Yj8oLMXOh1hAOS2PZeU=;
 b=jOCpUvi7mWCdXePQALAAtrJYBz0H0Ogxr3g+teN6FI6hh3bStmU+5iF19e84aFuXc0lRcS
 IUjRDKJ+6o+H6XJXxRU2TuYmOp+bXjOjm2BZG9D2nbazFEWZNtcWrY0GSHh6L8iMVS5rpY
 dV2bu8VuOeaPXA96vuH1z8h5ruxp208=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-7Cob-CS8MRKJOlD8GkDVOQ-1; Fri, 29 Oct 2021 16:33:07 -0400
X-MC-Unique: 7Cob-CS8MRKJOlD8GkDVOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A12D100CCC7;
 Fri, 29 Oct 2021 20:33:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2943C604CC;
 Fri, 29 Oct 2021 20:32:59 +0000 (UTC)
Date: Fri, 29 Oct 2021 15:32:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 2/4] qemu-img: make --block-size optional for compare
 --stat
Message-ID: <20211029203257.zzu7rzzdlg6tdhwe@redhat.com>
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
 <20211028102441.1878668-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211028102441.1878668-3-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, nikita.lapshin@virtuozzo.com,
 qemu-devel@nongnu.org, nsoffer@redhat.com, hreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 12:24:39PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> Let's detect block-size automatically if not specified by user:
> 
>  If both files define cluster-size, use minimum to be more precise.
>  If both files don't specify cluster-size, use default of 64K
>  If only one file specify cluster-size, just use it.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/tools/qemu-img.rst |  7 +++-
>  qemu-img.c              | 71 +++++++++++++++++++++++++++++++++++++----
>  qemu-img-cmds.hx        |  4 +--
>  3 files changed, 72 insertions(+), 10 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

> +    if (cluster_size1 > 0 && cluster_size2 > 0) {
> +        if (cluster_size1 == cluster_size2) {
> +            block_size = cluster_size1;
> +        } else {
> +            block_size = MIN(cluster_size1, cluster_size2);
> +            qprintf(quiet, "%s and %s have different cluster sizes: %d and %d "
> +                    "respectively. Using minimum as block-size for "
> +                    "accuracy: %d. %s\n",
> +                    fname1, fname2, cluster_size1,
> +                    cluster_size2, block_size, note);

Results in a long line; I don't know if it's worth trying to wrap it
(if we had a generic utility function that took arbitrary text, then
outputs it wrapped to the user's current terminal column width, I'd
suggest using that instead - but that's NOT something I expect you to
write, and I don't know if glib has such a utility).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


