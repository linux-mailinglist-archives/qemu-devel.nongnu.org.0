Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29994CD862
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:56:20 +0100 (CET)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAHz-000738-Vg
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQAG2-0004UY-GM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQAFz-0004xD-9q
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646409254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVqC1uIHnT4h/N8RwU6uHQTKJyUfhmwbY1h/8kFDpUI=;
 b=gP8tlnsYuKs/xfdB6wv08vHAdZed5VXHlL2zAAluparh7eKZO3veuE8oy2rkVMPYpqGRxv
 iTcTshqO0bdINA+hQb87ewtKjX98iuGqH4RPm25UzN6cufct0Ny+MpjCz9W+53dRRHmL6n
 gHFS7kn/Cm6sQclS/SBGZFtrU6lTIO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-ZUJ7EejAO-Sbr7bZ126k9A-1; Fri, 04 Mar 2022 10:54:09 -0500
X-MC-Unique: ZUJ7EejAO-Sbr7bZ126k9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AAE21091DA0;
 Fri,  4 Mar 2022 15:54:08 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AA90303F8;
 Fri,  4 Mar 2022 15:54:06 +0000 (UTC)
Date: Fri, 4 Mar 2022 09:54:04 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 05/12] block/nbd: don't restrict TLS usage to IP sockets
Message-ID: <20220304155404.42qjnwgicqrzx54r@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-6-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303160330.2979753-6-berrange@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Thu, Mar 03, 2022 at 04:03:23PM +0000, Daniel P. Berrangé wrote:
> The TLS usage for NBD was restricted to IP sockets because validating
> x509 certificates requires knowledge of the hostname that the client
> is connecting to.
> 
> TLS does not have to use x509 certificates though, as PSK (pre-shared
> keys) provide an alternative credential option. These have no
> requirement for a hostname and can thus be trivially used for UNIX
> sockets.
> 
> Furthermore, with the ability to overide the default hostname for
> TLS validation in the previous patch, it is now also valid to want
> to use x509 certificates with FD passing and UNIX sockets.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  block/nbd.c    | 8 ++------
>  blockdev-nbd.c | 6 ------
>  qemu-nbd.c     | 8 +++-----
>  3 files changed, 5 insertions(+), 17 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


