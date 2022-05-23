Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A9530C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:43:11 +0200 (CEST)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4ak-0003lX-Jo
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt4YD-0002JV-TI
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt4YB-00085f-3D
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653298828;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nx0F2upiPenzA/N8IHYkNFz5WS3VzOzTAlo4y6sAXjA=;
 b=MYIKC1nel2iNaX/R1RknkT2huR7gY+hMD7hTqiXa1G6Xf3MkvJl+dr2uQIRtb4aIvW4Tsr
 5KuJ64GDoiIeI208ca3XnQ8eBzax/qcK4WCPM2m77ORF/2kQPlISU4Y/9nHTjzXqagGzZK
 XfGzR5jmcOfHyfvMOFQXTILYMVIN11k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-CtaIJETkONef60Hv_PfcFw-1; Mon, 23 May 2022 05:40:23 -0400
X-MC-Unique: CtaIJETkONef60Hv_PfcFw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA6C580419C;
 Mon, 23 May 2022 09:40:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CFA4492CA2;
 Mon, 23 May 2022 09:40:21 +0000 (UTC)
Date: Mon, 23 May 2022 10:40:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, cohuck@redhat.com
Subject: Re: [PATCH v6 6/9] crypto: Implement RSA algorithm by gcrypt
Message-ID: <YotWg3KXjbyx9CrN@redhat.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
 <20220514005504.1042884-7-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220514005504.1042884-7-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 14, 2022 at 08:55:01AM +0800, zhenwei pi wrote:
> From: Lei He <helei.sig11@bytedance.com>
> 
> Added gcryt implementation of RSA algorithm, RSA algorithm
> implemented by gcrypt has a higher priority than nettle because
> it supports raw padding.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  crypto/akcipher-gcrypt.c.inc | 597 +++++++++++++++++++++++++++++++++++
>  crypto/akcipher.c            |   4 +-
>  2 files changed, 600 insertions(+), 1 deletion(-)
>  create mode 100644 crypto/akcipher-gcrypt.c.inc
> 
> diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
> new file mode 100644
> index 0000000000..6c5daa301e
> --- /dev/null
> +++ b/crypto/akcipher-gcrypt.c.inc
> @@ -0,0 +1,597 @@
> +/*
> + * QEMU Crypto akcipher algorithms
> + *
> + * Copyright (c) 2022 Bytedance
> + * Author: lei he <helei.sig11@bytedance.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include <gcrypt.h>
> +static QCryptoGcryptRSA *qcrypto_gcrypt_rsa_new(
> +    const QCryptoAkCipherOptionsRSA *opt,
> +    QCryptoAkCipherKeyType type,
> +    const uint8_t *key, size_t keylen,
> +    Error **errp)
> +{
> +    QCryptoGcryptRSA *rsa = g_new0(QCryptoGcryptRSA, 1);
> +    rsa->padding_alg = opt->padding_alg;
> +    rsa->hash_alg = opt->hash_alg;
> +    rsa->akcipher.driver = &gcrypt_rsa;
> +
> +    switch (type) {
> +    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
> +        if (qcrypto_gcrypt_parse_rsa_private_key(rsa, key, keylen, errp) != 0) {
> +            error_setg(errp, "Failed to parse rsa private key");

Not need now, since qcrypto_gcrypt_parse_rsa_private_key reports the
real error message.

> +            goto error;
> +        }
> +        break;
> +
> +    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
> +        if (qcrypto_gcrypt_parse_rsa_public_key(rsa, key, keylen, errp) != 0) {
> +            error_setg(errp, "Failed to parse rsa public rsa key");

Likewise not needed.

> +            goto error;
> +        }
> +        break;
> +
> +    default:
> +        error_setg(errp, "Unknown akcipher key type %d", type);
> +        goto error;
> +    }
> +
> +    return rsa;
> +
> +error:
> +    qcrypto_gcrypt_rsa_free((QCryptoAkCipher *)rsa);
> +    return NULL;
> +}

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


