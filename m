Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4156A69FD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJ0t-00019g-6l; Wed, 01 Mar 2023 04:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXJ0b-000163-C6
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:44:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXJ0X-0001OP-Is
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677663860;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=u8B6G5xmNpd5/UCsiOgt1f0QvREdaclMW1+e+iYF/u4=;
 b=DiZQE0sLq24zhWyszrQkOkd9TciD4fA5iqe6tG1yjTg8Lpex3WJEhD4myXGSdxe+ghrIXM
 oVVEpPlhW4e0QIq6zMZDfKoFw8NIzMXz32drZAYiRdUg42SuGOJm1N44WIL/QVT7lK5zyR
 /R/dTx/fB/VXpZ9WSGkI5+P+3I5/v9c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-9HWVebRLPu-QwBigiUjv8g-1; Wed, 01 Mar 2023 04:44:17 -0500
X-MC-Unique: 9HWVebRLPu-QwBigiUjv8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E93603C0E442;
 Wed,  1 Mar 2023 09:44:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 866FE40C6EC4;
 Wed,  1 Mar 2023 09:44:15 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:44:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 09/12] cryptodev: Account statistics
Message-ID: <Y/8ebZjswgBXlH81@redhat.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-10-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230301025124.3605557-10-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 10:51:21AM +0800, zhenwei pi wrote:
> Account OPS/BPS for crypto device, this will be used for 'query-stats'
> QEMU monitor command and QoS in the next step.
> 
> Note that a crypto device may support symmetric mode, asymmetric mode,
> both symmetric and asymmetric mode. So we use two structure to
> describe the statistics of a crypto device.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev.c       | 68 +++++++++++++++++++++++++++++++++++---
>  include/sysemu/cryptodev.h | 31 +++++++++++++++++
>  qapi/cryptodev.json        | 54 ++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+), 5 deletions(-)
> 
> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> index ba7b0bc770..cc824e9665 100644
> --- a/backends/cryptodev.c
> +++ b/backends/cryptodev.c
> @@ -107,6 +107,9 @@ void cryptodev_backend_cleanup(
>      if (bc->cleanup) {
>          bc->cleanup(backend, errp);
>      }
> +
> +    g_free(backend->sym_stat);
> +    g_free(backend->asym_stat);
>  }
>  
>  int cryptodev_backend_create_session(
> @@ -154,16 +157,61 @@ static int cryptodev_backend_operation(
>      return -VIRTIO_CRYPTO_NOTSUPP;
>  }
>  
> +static int cryptodev_backend_account(CryptoDevBackend *backend,
> +                 CryptoDevBackendOpInfo *op_info)
> +{
> +    enum QCryptodevBackendAlgType algtype = op_info->algtype;
> +    int len;
> +
> +    if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
> +        CryptoDevBackendAsymOpInfo *asym_op_info = op_info->u.asym_op_info;
> +        len = asym_op_info->src_len;
> +        switch (op_info->op_code) {
> +        case VIRTIO_CRYPTO_AKCIPHER_ENCRYPT:
> +            QCryptodevAsymStatIncEncrypt(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
> +            QCryptodevAsymStatIncDecrypt(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_AKCIPHER_SIGN:
> +            QCryptodevAsymStatIncSign(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
> +            QCryptodevAsymStatIncVerify(backend, len);
> +            break;
> +        default:
> +            return -VIRTIO_CRYPTO_NOTSUPP;
> +        }
> +    } else if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
> +        CryptoDevBackendSymOpInfo *sym_op_info = op_info->u.sym_op_info;
> +        len = sym_op_info->src_len;
> +        switch (op_info->op_code) {
> +        case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
> +            QCryptodevSymStatIncEncrypt(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_CIPHER_DECRYPT:
> +            QCryptodevSymStatIncDecrypt(backend, len);
> +            break;
> +        default:
> +            return -VIRTIO_CRYPTO_NOTSUPP;
> +        }
> +    } else {
> +        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
> +        return -VIRTIO_CRYPTO_NOTSUPP;
> +    }
> +
> +    return len;
> +}
> +
>  int cryptodev_backend_crypto_operation(
>                   CryptoDevBackend *backend,
>                   CryptoDevBackendOpInfo *op_info)
>  {
> -    QCryptodevBackendAlgType algtype = op_info->algtype;
> +    int ret;
>  
> -    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
> -        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
> -        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
> -        return -VIRTIO_CRYPTO_NOTSUPP;
> +    ret = cryptodev_backend_account(backend, op_info);
> +    if (ret < 0) {
> +        return ret;
>      }
>  
>      return cryptodev_backend_operation(backend, op_info);
> @@ -202,10 +250,20 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
>  {
>      CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
>      CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
> +    uint32_t services;
>  
>      if (bc->init) {
>          bc->init(backend, errp);
>      }
> +
> +    services = backend->conf.crypto_services;
> +    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_CIPHER)) {
> +        backend->sym_stat = g_new0(QCryptodevBackendSymStat, 1);
> +    }
> +
> +    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER)) {
> +        backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
> +    }
>  }
>  
>  void cryptodev_backend_set_used(CryptoDevBackend *backend, bool used)
> diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
> index 048a627035..15e8c04dcf 100644
> --- a/include/sysemu/cryptodev.h
> +++ b/include/sysemu/cryptodev.h
> @@ -253,8 +253,39 @@ struct CryptoDevBackend {
>      /* Tag the cryptodev backend is used by virtio-crypto or not */
>      bool is_used;
>      CryptoDevBackendConf conf;
> +    QCryptodevBackendSymStat *sym_stat;
> +    QCryptodevBackendAsymStat *asym_stat;
>  };
>  
> +#define QCryptodevSymStatInc(be, op, bytes) do { \
> +   be->sym_stat->op##_bytes += (bytes); \
> +   be->sym_stat->op##_ops += 1; \
> +} while (/*CONSTCOND*/0)
> +
> +#define QCryptodevSymStatIncEncrypt(be, bytes) \
> +            QCryptodevSymStatInc(be, encrypt, bytes)
> +
> +#define QCryptodevSymStatIncDecrypt(be, bytes) \
> +            QCryptodevSymStatInc(be, decrypt, bytes)
> +
> +#define QCryptodevAsymStatInc(be, op, bytes) do { \
> +    be->asym_stat->op##_bytes += (bytes); \
> +    be->asym_stat->op##_ops += 1; \
> +} while (/*CONSTCOND*/0)
> +
> +#define QCryptodevAsymStatIncEncrypt(be, bytes) \
> +            QCryptodevAsymStatInc(be, encrypt, bytes)
> +
> +#define QCryptodevAsymStatIncDecrypt(be, bytes) \
> +            QCryptodevAsymStatInc(be, decrypt, bytes)
> +
> +#define QCryptodevAsymStatIncSign(be, bytes) \
> +            QCryptodevAsymStatInc(be, sign, bytes)
> +
> +#define QCryptodevAsymStatIncVerify(be, bytes) \
> +            QCryptodevAsymStatInc(be, verify, bytes)
> +
> +
>  /**
>   * cryptodev_backend_new_client:
>   *
> diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
> index f33f96a692..54d7f9cb58 100644
> --- a/qapi/cryptodev.json
> +++ b/qapi/cryptodev.json
> @@ -87,3 +87,57 @@
>  # Since: 8.0
>  ##
>  { 'command': 'query-cryptodev', 'returns': ['QCryptodevInfo']}
> +
> +##
> +# @QCryptodevBackendSymStat:
> +#
> +# The statistics of symmetric operation.
> +#
> +# @encrypt-ops: the operations of symmetric encryption
> +#
> +# @decrypt-ops: the operations of symmetric decryption
> +#
> +# @encrypt-bytes: the bytes of symmetric encryption
> +#
> +# @decrypt-bytes: the bytes of symmetric decryption
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'QCryptodevBackendSymStat',
> +  'data': { 'encrypt-ops': 'int',
> +            'decrypt-ops': 'int',
> +            'encrypt-bytes': 'int',
> +            'decrypt-bytes': 'int' } }
> +
> +##
> +# @QCryptodevBackendAsymStat:
> +#
> +# The statistics of asymmetric operation.
> +#
> +# @encrypt-ops: the operations of asymmetric encryption
> +#
> +# @decrypt-ops: the operations of asymmetric decryption
> +#
> +# @sign-ops: the operations of asymmetric signature
> +#
> +# @verify-ops: the operations of asymmetric verification
> +#
> +# @encrypt-bytes: the bytes of asymmetric encryption
> +#
> +# @decrypt-bytes: the bytes of asymmetric decryption
> +#
> +# @sign-bytes: the bytes of asymmetric signature
> +#
> +# @verify-bytes: the bytes of asymmetric verification
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'QCryptodevBackendAsymStat',
> +  'data': { 'encrypt-ops': 'int',
> +            'decrypt-ops': 'int',
> +            'sign-ops': 'int',
> +            'verify-ops': 'int',
> +            'encrypt-bytes': 'int',
> +            'decrypt-bytes': 'int',
> +            'sign-bytes': 'int',
> +            'verify-bytes': 'int' } }

AFAICT, these two structs are no longer used in QAPI since the switch
to using query-stats. IOW this has become just an indirect way to
declare a C struct for private use in the C code.

As such, I'd suggest that this QAPI addition be removed, and just
declare a normal C struct directly in the code which needs it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


