Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277D3A44BD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 17:13:57 +0200 (CEST)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrir6-0001Bn-EA
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 11:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lripv-0000Lk-OQ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lript-0006q6-3p
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623424360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M/dvk9Sedgy59jxKGehanAsWZKVIY7nH/q4j3huJ0sM=;
 b=BdbfC1NnWcQIEvFfmNltJdULwfFIfLudJINP7+GokRDGcnAzvddjmj1rj7OwuIUh0D1i4T
 Fr+HOi5qAh3Zpr0V5tUEU6TjLjQQZ3G9RQ/dUgQ3mJCwg8w8O8RJftHsE5qqX3SvPHTL7y
 OHFonj2dP8kfNG6pPb7QE5Y+wf+pAvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ldI6z7rXMK2OW0Ex9ZIa9g-1; Fri, 11 Jun 2021 11:12:38 -0400
X-MC-Unique: ldI6z7rXMK2OW0Ex9ZIa9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E3B41850600;
 Fri, 11 Jun 2021 15:12:37 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6E419C59;
 Fri, 11 Jun 2021 15:12:36 +0000 (UTC)
Date: Fri, 11 Jun 2021 10:12:35 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 20/32] nbd/client-connection: implement connection retry
Message-ID: <20210611151235.7ega7ijga6okwwot@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-21-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210610100802.5888-21-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 01:07:50PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add an option for a thread to retry connection until succeeds. We'll

for a thread to retry connecting until it succeeds.

> use nbd/client-connection both for reconnect and for initial connection
> in nbd_open(), so we need a possibility to use same NBDClientConnection
> instance to connect once in nbd_open() and then use retry semantics for
> reconnect.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/nbd.h     |  2 ++
>  nbd/client-connection.c | 56 +++++++++++++++++++++++++++++++----------
>  2 files changed, 45 insertions(+), 13 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


