Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E154F6C8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 13:36:27 +0200 (CEST)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2AH3-0008Dy-M8
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 07:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2AF2-0006tZ-RU
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2AEy-0000yq-Ln
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655465655;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hSQeum1DLMyTE/BNHo1KnHse848ZIi1sSpAjZZ8sATA=;
 b=Qc0aXPrsP+2ISjsI/2JJgWbPG8if/nj0em8jCsmBoysG8ucnP92RxTrMnvVh1BEwZZZqUK
 onflB33lhDZoNyoJKYDYy9gheKzCekiJxZiE22sx/smxPe+rV35pSzHtyG8AITyJzO/5oD
 qdDb5Kj46tIrsH4W3aIXxcHkPL2b8hM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-I_UqFXYtPle3-n8uFai2yQ-1; Fri, 17 Jun 2022 07:34:13 -0400
X-MC-Unique: I_UqFXYtPle3-n8uFai2yQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5610719705AB;
 Fri, 17 Jun 2022 11:34:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF7CA9D7F;
 Fri, 17 Jun 2022 11:34:11 +0000 (UTC)
Date: Fri, 17 Jun 2022 12:34:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 pizhenwei@bytedance.com, jasowang@redhat.com
Subject: Re: [PATCH 4/7] crypto: Add ECDSA key parser
Message-ID: <YqxmsU0HHHjDtOSG@redhat.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-5-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220613084531.8086-5-helei.sig11@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Mon, Jun 13, 2022 at 04:45:28PM +0800, Lei He wrote:
> Add ECDSA key parser and ECDSA signautre parser.

                         typo:  'signature'

> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  crypto/ecdsakey-builtin.c.inc | 248 ++++++++++++++++++++++++++++++++++++++++++
>  crypto/ecdsakey.c             | 118 ++++++++++++++++++++
>  crypto/ecdsakey.h             |  66 +++++++++++
>  crypto/meson.build            |   1 +
>  4 files changed, 433 insertions(+)
>  create mode 100644 crypto/ecdsakey-builtin.c.inc
>  create mode 100644 crypto/ecdsakey.c
>  create mode 100644 crypto/ecdsakey.h
> 
> diff --git a/crypto/ecdsakey-builtin.c.inc b/crypto/ecdsakey-builtin.c.inc
> new file mode 100644
> index 0000000000..5da317ec44
> --- /dev/null
> +++ b/crypto/ecdsakey-builtin.c.inc
> @@ -0,0 +1,248 @@
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
> +#include "der.h"
> +#include "ecdsakey.h"
> +
> +#define QCRYPTO_ECDSA_PUBKEY_FMT_UNCOMPRESSED 0x04
> +
> +static int extract_mpi(void *ctx, const uint8_t *value,
> +                       size_t vlen, Error **errp)
> +{
> +    QCryptoAkCipherMPI *mpi = (QCryptoAkCipherMPI *)ctx;
> +    if (vlen == 0) {
> +        error_setg(errp, "Empty mpi field");
> +        return -1;
> +    }
> +    mpi->data = g_memdup2(value, vlen);
> +    mpi->len = vlen;
> +    return 0;
> +}
> +
> +static int extract_version(void *ctx, const uint8_t *value,
> +                           size_t vlen, Error **errp)
> +{
> +    uint8_t *version = (uint8_t *)ctx;
> +    if (vlen != 1 || *value > 1) {
> +        error_setg(errp, "Invalid rsakey version");
> +        return -1;
> +    }
> +    *version = *value;
> +    return 0;
> +}
> +
> +static int extract_cons_content(void *ctx, const uint8_t *value,
> +                                size_t vlen, Error **errp)
> +{
> +    const uint8_t **content = (const uint8_t **)ctx;
> +    if (vlen == 0) {
> +        error_setg(errp, "Empty sequence");
> +        return -1;
> +    }
> +    *content = value;
> +    return 0;
> +}
> +
> +static int __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
> +    QCryptoAkCipherECDSAKey *ecdsa,
> +    const uint8_t *key, size_t keylen, Error **errp);

It is not good practice to use '_' on the start of method
names in apps, as names with a leading '_' are reserved.

> +
> +static int extract_pubkey(void *ctx, const uint8_t *value,
> +                          size_t vlen, Error **errp)
> +{
> +    QCryptoAkCipherECDSAKey *ecdsa = (QCryptoAkCipherECDSAKey *)ctx;
> +    if (vlen < 4) {
> +        error_setg(errp, "Public key part too short");
> +        return -1;
> +    }
> +    /* Skip meta bit of BIT STRING */
> +    value++;
> +    vlen--;
> +    return __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
> +        ecdsa, value, vlen, errp);
> +}
> +
> +/**
> + *
> + *        ECDSASignature ::= SEQUENCE {
> + *             r           INTEGER
> + *             s           INTEGER
> + *         }
> + */
> +QCryptoAkCipherECDSASig *qcrypto_akcipher_ecdsasig_parse(
> +    const uint8_t *signature, size_t len, Error **errp)
> +{
> +    QCryptoAkCipherECDSASig *sig = g_new0(QCryptoAkCipherECDSASig, 1);

Use  g_autoptr(QCryptoAkCipherECDSASig) sig  here

> +    const uint8_t *seq;
> +    size_t seq_length;
> +    int decode_ret;
> +
> +    decode_ret = qcrypto_der_decode_seq(&signature, &len,
> +                                        extract_cons_content, &seq, errp);
> +
> +    if (decode_ret < 0 || len != 0) {
> +        goto error;
> +    }

If 'decode_ret < 0' then errp should be set by qcrypto_der_decode_seq
which is fine.  For len != 0, we need to report an error ourselves.
I see you pushed it to the error label so later codepath can share it.
I think it is better to do it here though, because it makes it clear
to the reader which codepaths are triggering this generic error
messages. So

     if (decode_ret < 0)
         goto error;
     }
     if (len != 0) {
         error_setg(errp, "Invalid RSA public key");
     }


> +    seq_length = decode_ret;
> +
> +    if (qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
> +                               &sig->r, errp) < 0 ||
> +        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
> +                               &sig->s, errp) < 0) {
> +        goto error;
> +    }
> +    if (seq_length != 0) {

Add

        error_setg(errp, "Invalid RSA public key");

> +        goto error;
> +    }
> +
> +    return sig;

return g_steal_pointer(&sig)

> +
> +error:
> +    if (errp && !*errp) {
> +        error_setg(errp, "Invalid RSA public key");
> +    }

and remove this

> +    qcrypto_akcipher_ecdsasig_free(sig);
> +    return NULL;
> +}

This error block won't need to exist at all. Everywhere can
just 'return NULL' instead of 'goto error'



> +static QCryptoAkCipherECDSAKey *qcrypto_akcipher_builtin_ecdsa_privkey_parse(
> +    const uint8_t *key, size_t keylen, Error **errp)
> +{
> +    QCryptoAkCipherECDSAKey *ecdsa = g_new0(QCryptoAkCipherECDSAKey, 1);

g_autoptr(QCryptoAkCipherECDSAKey)

and change all the 'goto error' to 'return NULL'

> +    uint8_t version;
> +    const uint8_t *seq, *pubkey;
> +    int decode_ret;
> +    size_t seq_length, pubkey_length;
> +
> +    decode_ret = qcrypto_der_decode_seq(&key, &keylen, extract_cons_content,
> +                                        &seq, errp);
> +    if (decode_ret < 0 || keylen != 0) {
> +        goto error;
> +    }
> +    seq_length = decode_ret;
> +
> +    if (qcrypto_der_decode_int(&seq, &seq_length, extract_version,
> +                               &version, errp) < 0 ||
> +        qcrypto_der_decode_octet_str(&seq, &seq_length, extract_mpi,
> +                                     &ecdsa->priv, errp) < 0) {
> +        goto error;
> +    }
> +
> +    /* Here we just ignore curve id */
> +    qcrypto_der_decode_ctx_tag(&seq, &seq_length, 0, NULL, NULL, NULL);
> +
> +    decode_ret = qcrypto_der_decode_ctx_tag(&seq, &seq_length, 1,
> +                                            extract_cons_content,
> +                                            &pubkey, NULL);
> +    if (decode_ret > 0) {
> +        pubkey_length = decode_ret;
> +        if (qcrypto_der_decode_bit_str(&pubkey, &pubkey_length,
> +                                       extract_pubkey, ecdsa, errp) < 0 ||
> +            pubkey_length != 0) {
> +            goto error;
> +        }
> +    }
> +
> +    if (seq_length != 0) {
> +        goto error;
> +    }
> +
> +    return ecdsa;

return g_steal_pointer(&ecdsa)

> +
> +error:
> +    if (errp && !*errp) {
> +        error_setg(errp, "Failed to parse ecdsa private key");
> +    }

Same note as earlier, about having this error_setg earlier
at the exact places where the relevant error condition first
occurs

> +    qcrypto_akcipher_ecdsakey_free(ecdsa);
> +    return NULL;
> +}



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


