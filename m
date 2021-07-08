Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2D3C1A4F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:05:29 +0200 (CEST)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aH2-0006cP-QW
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZiY-0001MY-NZ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZiS-0002YO-J5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625772583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lD0OjHgFLHvU6+2rHbPBTc4lc5ZCStUCRmdBY51jr8Q=;
 b=SD7mukJiMrEhEirSaec3GuTf2+cx70KI/RfXFz6otlvT1gbIKP27KfMJSgjeBYJCp4UOnP
 0iysZY0QOU4JNxPy/OdBd/Q81tdlesAj80VyQeHAeD6SnzroeaNbgsn2csKMC/Xziqm+IJ
 R4XH9qzKyZTcBT+Bq7BFq+hDUvPVxgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-2R1aNIGEPRarBqePkTeBWw-1; Thu, 08 Jul 2021 15:29:40 -0400
X-MC-Unique: 2R1aNIGEPRarBqePkTeBWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CDF08CED65
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 19:29:22 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF98D5C1C2;
 Thu,  8 Jul 2021 19:29:21 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:29:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 15/18] crypto: add gnutls hash provider
Message-ID: <20210708192920.epkyfrla7syptmzd@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-16-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-16-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 10:59:21AM +0100, Daniel P. Berrangé wrote:
> This adds support for using gnutls as a provider of the crypto
> hash APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/hash-gnutls.c | 104 +++++++++++++++++++++++++++++++++++++++++++
>  crypto/meson.build   |   2 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 crypto/hash-gnutls.c
> 
> diff --git a/crypto/hash-gnutls.c b/crypto/hash-gnutls.c
> new file mode 100644
> index 0000000000..f88db71f00
> --- /dev/null
> +++ b/crypto/hash-gnutls.c
> @@ -0,0 +1,104 @@
> +/*
> + * QEMU Crypto hash algorithms
> + *
> + * Copyright (c) 2016 Red Hat, Inc.

Want to add 2021 here?

> +static int
> +qcrypto_gnutls_hash_bytesv(QCryptoHashAlgorithm alg,
> +                           const struct iovec *iov,
> +                           size_t niov,
> +                           uint8_t **result,
> +                           size_t *resultlen,
> +                           Error **errp)
> +{

> +
> +    ret = gnutls_hash_init(&hash, qcrypto_hash_alg_map[alg]);
> +    if (ret < 0) {
> +        error_setg(errp,
> +                   "Unable to initialize hash algorithm: %s",
> +                   gnutls_strerror(ret));
> +        return -1;
> +    }
> +
> +    for (i = 0; i < niov; i++) {
> +        gnutls_hash(hash, iov[i].iov_base, iov[i].iov_len);
> +    }
> +
> +    gnutls_hash_deinit(hash, *result);

Is there any speed penalty for creating a new gnutls_hash object for
each call to qcrypto_gnutls_hash_bytesv(), compared to creating a hash
object just once and using gnutls_hash_output() to grab results and
reset it for reuse?  But that can be a later patch (if it even works -
I may have mis-read gnutls docs), so it doesn't affect review of this
patch.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


