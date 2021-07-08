Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16233C154A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:39:00 +0200 (CEST)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VB4-0001Ew-BS
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1V9l-0007mJ-UC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1V9i-0002j3-Ct
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625755052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yUhGuogmgnFoG5d/3kf0H9bH5b6bJLhyVv1ebOoKO5I=;
 b=Yx6SMRFMhQz1+RByMM9F1nuwUb+Bjq6W0BNbWDLwoMT0Z7F1AYlbUYt7ebhbEkbmIGTJHp
 UKDHmJUWsUuZQndYXm00ekfYkFg5hhFkKcswOvaA4Tt7t/G/n96tQBVn+SSnh34fzGdhbE
 aP7evNRY2LqC9f/dRd8bi7Nlx6ynzoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-HR_LvzQdMn6MUKC17M4iSA-1; Thu, 08 Jul 2021 10:37:29 -0400
X-MC-Unique: HR_LvzQdMn6MUKC17M4iSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC835100C660;
 Thu,  8 Jul 2021 14:37:28 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5446719C66;
 Thu,  8 Jul 2021 14:37:28 +0000 (UTC)
Date: Thu, 8 Jul 2021 09:37:26 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v6 6/6] block: Make blockdev-reopen stable API
Message-ID: <20210708143726.n2lcvqakh6mbur4k@redhat.com>
References: <20210708114709.206487-1-kwolf@redhat.com>
 <20210708114709.206487-7-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708114709.206487-7-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 01:47:09PM +0200, Kevin Wolf wrote:
> From: Alberto Garcia <berto@igalia.com>
> 
> This patch drops the 'x-' prefix from x-blockdev-reopen.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/qapi/block-core.json
> @@ -4219,7 +4219,7 @@
>  { 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
>  
>  ##
> -# @x-blockdev-reopen:
> +# @blockdev-reopen:
>  #
>  # Reopens one or more block devices using the given set of options.
>  # Any option not specified will be reset to its default value regardless
> @@ -4257,9 +4257,9 @@
>  # image does not have a default backing file name as part of its
>  # metadata.
>  #
> -# Since: 4.0
> +# Since: 6.0

6.1 now

And yay! We are finally getting here!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


