Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790263A86F8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:57:01 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCN2-0005d5-HR
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCHm-0004ZO-1f
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCHk-0005ZO-B6
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775891;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAx5zJLl5UDrsxtDv1Q1HhOnqglO0e1yJ6aLTU0BlWs=;
 b=V/yXMIyQ8J9zGGvIpO8ctvYwUilvLQsIDCM69uZtjgNNFG0SQ199BeO7ICpEnrybi0tOpZ
 XjTFnR8jcV4tGgkn97hxxSIRlppCoGV5dRQN9ew9wLUXwP4w4cB+ZZF5peMrmocSBeBsXn
 Rfe+mX4XoisW3ZkeKdprnLaacRoHyqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-A0w8qI6eMdOlQx0p9c_Lkw-1; Tue, 15 Jun 2021 12:51:22 -0400
X-MC-Unique: A0w8qI6eMdOlQx0p9c_Lkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80DC6192CC63;
 Tue, 15 Jun 2021 16:51:19 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 901C85C1C2;
 Tue, 15 Jun 2021 16:51:14 +0000 (UTC)
Date: Tue, 15 Jun 2021 17:51:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/7] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Message-ID: <YMjafxJWN5XOtC62@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
 <20210615164751.2192807-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210615164751.2192807-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 06:47:46PM +0200, Philippe Mathieu-Daudé wrote:
> Avoid accessing QCryptoTLSCreds internals by using
> the qcrypto_tls_creds_check_endpoint() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/nbd.c    | 3 ++-
>  blockdev-nbd.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 616f9ae6c4d..c3523ebf785 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -2159,7 +2159,8 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
>          return NULL;
>      }
>  
> -    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
> +    if (!qcrypto_tls_creds_check_endpoint(creds,
> +                                          QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT)) {
>          error_setg(errp,
>                     "Expecting TLS credentials with a client endpoint");

I'd suggest we pass 'errp' into the qcrypto_tls_creds_check_endpoint
method, so we don't duplicate the error message in all callers.

>          return NULL;
> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index b264620b98d..b6023052ac7 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -108,7 +108,8 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
>          return NULL;
>      }
>  
> -    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
> +    if (!qcrypto_tls_creds_check_endpoint(creds,
> +                                          QCRYPTO_TLS_CREDS_ENDPOINT_SERVER)) {
>          error_setg(errp,
>                     "Expecting TLS credentials with a server endpoint");
>          return NULL;
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


