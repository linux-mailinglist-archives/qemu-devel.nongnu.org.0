Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEB4CC85C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:48:31 +0100 (CET)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPtJG-00007U-2d
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:48:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPtI3-0006ve-9X
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:47:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPtI0-0005Ph-7A
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646344031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwmKDhVLEIOMfR+d7F2XPt/vWff/r1Sd5xZRNKwxwsM=;
 b=Hr3nohzvj5a4yfe1Lve/YnuQSZMKMsXb4p/LXKNFBa3sT/4IEABhEiZ6TEr2Mpl/aInhRh
 md2k1PIRQFVW3iTj4YnkNYuuK9QV1RvoNBx9riQCs2+4lRXWnkunr/GMT7uvpaStHaziuz
 LQwmb8jNbUIyTU8YX2ISAJDQig1rX24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-Z1WMFZqGMdeHGyeesyak1w-1; Thu, 03 Mar 2022 16:47:06 -0500
X-MC-Unique: Z1WMFZqGMdeHGyeesyak1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5816B824FA7;
 Thu,  3 Mar 2022 21:47:05 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29EDDE2E8;
 Thu,  3 Mar 2022 21:46:50 +0000 (UTC)
Date: Thu, 3 Mar 2022 15:46:48 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 03/12] block/nbd: support override of hostname for TLS
 certificate validation
Message-ID: <20220303214648.dk54amy7v24hcnnx@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303160330.2979753-4-berrange@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 04:03:21PM +0000, Daniel P. Berrangé wrote:
> When connecting to an NBD server with TLS and x509 credentials,
> the client must validate the hostname it uses for the connection,
> against that published in the server's certificate. If the client
> is tunnelling its connection over some other channel, however, the
> hostname it uses may not match the info reported in the server's
> certificate. In such a case, the user needs to explicitly set an
> override for the hostname to use for certificate validation.
> 
> This is achieved by adding a 'tls-hostname' property to the NBD
> block driver.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  block/nbd.c          | 18 +++++++++++++++---
>  qapi/block-core.json |  3 +++
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> +++ b/qapi/block-core.json
> @@ -4078,6 +4078,8 @@
>  #
>  # @tls-creds: TLS credentials ID
>  #
> +# @tls-hostname: TLS hostname override for certificate validation

Add the tag '(since 7.0)' (in the interest of soft freeze deadlines, I
can do that as part of queuing through my NBD tree if nothing else
major turns up in the series), and you can have:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


