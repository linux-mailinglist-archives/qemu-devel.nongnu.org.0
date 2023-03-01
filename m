Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E06A6AB8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:23:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJbb-000710-DS; Wed, 01 Mar 2023 05:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXJbW-00070T-Rz
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:22:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXJbU-0000YT-7j
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:22:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id a9so3336385plh.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677666150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ftJFj6N8MOxnSkoK1R3vI8ooiI8KTBg6SM2nDO0wMYM=;
 b=gHvS3szy4Jhg/VrqaE7h7+BRhdQGgrKjzb1cc7WkqfEDszr7fzPPYI9gQCQsRih3rk
 6T6sWR6yfXMXLi1O3ZlJlfxDsgcGeJZjyYdxTfrgP7L/G9sVDVCWOaX/I7jvzlKpoxeq
 atQmR/5lb0yNcxDTzWEj2zcZ4Sn2OTxw8PdNSZgLbqBZFiR3PDcKmjEA1mp+CwBbQ1xT
 kR3ERDV6mk2ENVepFRsuEg92dG+6FiVMOa05Osu91/uL3TVD6kbQr1ZdARm56Re+7efz
 Jk52rVu8DpABWEYKT2PJvbdK4hBXwprq21kI/mXK6YVix48DNOfH4a89gyGcDtNQavg9
 YjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677666150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ftJFj6N8MOxnSkoK1R3vI8ooiI8KTBg6SM2nDO0wMYM=;
 b=QNmDKi0nLelfCC5bx1di85KRI0XQKWR9K2Ya0gr3xRVJfDES5GQO11jQfx2Eetrpyw
 y65VAnGJLdrh5W5Qgmc5RskO2uo9uCLpuSNIYgW8HgO5Yu8UWBQ+4fhumYXJqE7E+D28
 mTOljGFk91nK2sfljnZO9tHuX68GiRRy7mVPXgPvZINdeS4C3d+0LXCD8lmXzGSPf8Bm
 dJL0Mt5837sjFpd5GKsdQLgOG6I2NFMs94oAhp9Sp50kpzy7ZkX8qkNymBGtRODZZMWF
 6ITVVHNTK+R1u5+9E3A4CtrDr2voCqE/AHjfbsTzpefld6S12zaRFMHntFcRnuMNp071
 dW7g==
X-Gm-Message-State: AO0yUKXEP56wHWRy+TgxNTZuvAYKBs6u98PuZl27VFz3p1NGX0T31Jhw
 43Yt4ZFa6DEOR/n/EgCmCgaPcg==
X-Google-Smtp-Source: AK7set8vDMLcb0BaHxrX7m0c1CsmOyHkp3yqY1UQdXAt3XzUYZ7RVdn8s3r8FdIx/B8aJKl61YvhyQ==
X-Received: by 2002:a17:90b:164e:b0:234:944d:dd6b with SMTP id
 il14-20020a17090b164e00b00234944ddd6bmr6980472pjb.12.1677666150465; 
 Wed, 01 Mar 2023 02:22:30 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.9]) by smtp.gmail.com with ESMTPSA id
 d17-20020a17090ab31100b002340d317f3esm7781990pjr.52.2023.03.01.02.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 02:22:30 -0800 (PST)
Message-ID: <d700920e-b9a8-0d99-3804-eefb7f64c582@bytedance.com>
Date: Wed, 1 Mar 2023 18:20:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Re: [PATCH v5 09/12] cryptodev: Account statistics
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-10-pizhenwei@bytedance.com>
 <Y/8ebZjswgBXlH81@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Y/8ebZjswgBXlH81@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/1/23 17:44, Daniel P. Berrangé wrote:
> On Wed, Mar 01, 2023 at 10:51:21AM +0800, zhenwei pi wrote:
>> Account OPS/BPS for crypto device, this will be used for 'query-stats'
>> QEMU monitor command and QoS in the next step.
>>
>> Note that a crypto device may support symmetric mode, asymmetric mode,
>> both symmetric and asymmetric mode. So we use two structure to
>> describe the statistics of a crypto device.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   backends/cryptodev.c       | 68 +++++++++++++++++++++++++++++++++++---
>>   include/sysemu/cryptodev.h | 31 +++++++++++++++++
>>   qapi/cryptodev.json        | 54 ++++++++++++++++++++++++++++++
>>   3 files changed, 148 insertions(+), 5 deletions(-)
>>
>> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
>> index ba7b0bc770..cc824e9665 100644
>> --- a/backends/cryptodev.c
>> +++ b/backends/cryptodev.c
>> @@ -107,6 +107,9 @@ void cryptodev_backend_cleanup(
>>       if (bc->cleanup) {
>>           bc->cleanup(backend, errp);
>>       }
>> +
>> +    g_free(backend->sym_stat);
>> +    g_free(backend->asym_stat);
>>   }
>>   
>>   int cryptodev_backend_create_session(
>> @@ -154,16 +157,61 @@ static int cryptodev_backend_operation(
>>       return -VIRTIO_CRYPTO_NOTSUPP;
>>   }
>>   
>> +static int cryptodev_backend_account(CryptoDevBackend *backend,
>> +                 CryptoDevBackendOpInfo *op_info)
>> +{
>> +    enum QCryptodevBackendAlgType algtype = op_info->algtype;
>> +    int len;
>> +
>> +    if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
>> +        CryptoDevBackendAsymOpInfo *asym_op_info = op_info->u.asym_op_info;
>> +        len = asym_op_info->src_len;
>> +        switch (op_info->op_code) {
>> +        case VIRTIO_CRYPTO_AKCIPHER_ENCRYPT:
>> +            QCryptodevAsymStatIncEncrypt(backend, len);
>> +            break;
>> +        case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
>> +            QCryptodevAsymStatIncDecrypt(backend, len);
>> +            break;
>> +        case VIRTIO_CRYPTO_AKCIPHER_SIGN:
>> +            QCryptodevAsymStatIncSign(backend, len);
>> +            break;
>> +        case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
>> +            QCryptodevAsymStatIncVerify(backend, len);
>> +            break;
>> +        default:
>> +            return -VIRTIO_CRYPTO_NOTSUPP;
>> +        }
>> +    } else if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
>> +        CryptoDevBackendSymOpInfo *sym_op_info = op_info->u.sym_op_info;
>> +        len = sym_op_info->src_len;
>> +        switch (op_info->op_code) {
>> +        case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
>> +            QCryptodevSymStatIncEncrypt(backend, len);
>> +            break;
>> +        case VIRTIO_CRYPTO_CIPHER_DECRYPT:
>> +            QCryptodevSymStatIncDecrypt(backend, len);
>> +            break;
>> +        default:
>> +            return -VIRTIO_CRYPTO_NOTSUPP;
>> +        }
>> +    } else {
>> +        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
>> +        return -VIRTIO_CRYPTO_NOTSUPP;
>> +    }
>> +
>> +    return len;
>> +}
>> +
>>   int cryptodev_backend_crypto_operation(
>>                    CryptoDevBackend *backend,
>>                    CryptoDevBackendOpInfo *op_info)
>>   {
>> -    QCryptodevBackendAlgType algtype = op_info->algtype;
>> +    int ret;
>>   
>> -    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
>> -        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
>> -        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
>> -        return -VIRTIO_CRYPTO_NOTSUPP;
>> +    ret = cryptodev_backend_account(backend, op_info);
>> +    if (ret < 0) {
>> +        return ret;
>>       }
>>   
>>       return cryptodev_backend_operation(backend, op_info);
>> @@ -202,10 +250,20 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
>>   {
>>       CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
>>       CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
>> +    uint32_t services;
>>   
>>       if (bc->init) {
>>           bc->init(backend, errp);
>>       }
>> +
>> +    services = backend->conf.crypto_services;
>> +    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_CIPHER)) {
>> +        backend->sym_stat = g_new0(QCryptodevBackendSymStat, 1);
>> +    }
>> +
>> +    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER)) {
>> +        backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
>> +    }
>>   }
>>   
>>   void cryptodev_backend_set_used(CryptoDevBackend *backend, bool used)
>> diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
>> index 048a627035..15e8c04dcf 100644
>> --- a/include/sysemu/cryptodev.h
>> +++ b/include/sysemu/cryptodev.h
>> @@ -253,8 +253,39 @@ struct CryptoDevBackend {
>>       /* Tag the cryptodev backend is used by virtio-crypto or not */
>>       bool is_used;
>>       CryptoDevBackendConf conf;
>> +    QCryptodevBackendSymStat *sym_stat;
>> +    QCryptodevBackendAsymStat *asym_stat;
>>   };
>>   
>> +#define QCryptodevSymStatInc(be, op, bytes) do { \
>> +   be->sym_stat->op##_bytes += (bytes); \
>> +   be->sym_stat->op##_ops += 1; \
>> +} while (/*CONSTCOND*/0)
>> +
>> +#define QCryptodevSymStatIncEncrypt(be, bytes) \
>> +            QCryptodevSymStatInc(be, encrypt, bytes)
>> +
>> +#define QCryptodevSymStatIncDecrypt(be, bytes) \
>> +            QCryptodevSymStatInc(be, decrypt, bytes)
>> +
>> +#define QCryptodevAsymStatInc(be, op, bytes) do { \
>> +    be->asym_stat->op##_bytes += (bytes); \
>> +    be->asym_stat->op##_ops += 1; \
>> +} while (/*CONSTCOND*/0)
>> +
>> +#define QCryptodevAsymStatIncEncrypt(be, bytes) \
>> +            QCryptodevAsymStatInc(be, encrypt, bytes)
>> +
>> +#define QCryptodevAsymStatIncDecrypt(be, bytes) \
>> +            QCryptodevAsymStatInc(be, decrypt, bytes)
>> +
>> +#define QCryptodevAsymStatIncSign(be, bytes) \
>> +            QCryptodevAsymStatInc(be, sign, bytes)
>> +
>> +#define QCryptodevAsymStatIncVerify(be, bytes) \
>> +            QCryptodevAsymStatInc(be, verify, bytes)
>> +
>> +
>>   /**
>>    * cryptodev_backend_new_client:
>>    *
>> diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
>> index f33f96a692..54d7f9cb58 100644
>> --- a/qapi/cryptodev.json
>> +++ b/qapi/cryptodev.json
>> @@ -87,3 +87,57 @@
>>   # Since: 8.0
>>   ##
>>   { 'command': 'query-cryptodev', 'returns': ['QCryptodevInfo']}
>> +
>> +##
>> +# @QCryptodevBackendSymStat:
>> +#
>> +# The statistics of symmetric operation.
>> +#
>> +# @encrypt-ops: the operations of symmetric encryption
>> +#
>> +# @decrypt-ops: the operations of symmetric decryption
>> +#
>> +# @encrypt-bytes: the bytes of symmetric encryption
>> +#
>> +# @decrypt-bytes: the bytes of symmetric decryption
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'struct': 'QCryptodevBackendSymStat',
>> +  'data': { 'encrypt-ops': 'int',
>> +            'decrypt-ops': 'int',
>> +            'encrypt-bytes': 'int',
>> +            'decrypt-bytes': 'int' } }
>> +
>> +##
>> +# @QCryptodevBackendAsymStat:
>> +#
>> +# The statistics of asymmetric operation.
>> +#
>> +# @encrypt-ops: the operations of asymmetric encryption
>> +#
>> +# @decrypt-ops: the operations of asymmetric decryption
>> +#
>> +# @sign-ops: the operations of asymmetric signature
>> +#
>> +# @verify-ops: the operations of asymmetric verification
>> +#
>> +# @encrypt-bytes: the bytes of asymmetric encryption
>> +#
>> +# @decrypt-bytes: the bytes of asymmetric decryption
>> +#
>> +# @sign-bytes: the bytes of asymmetric signature
>> +#
>> +# @verify-bytes: the bytes of asymmetric verification
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'struct': 'QCryptodevBackendAsymStat',
>> +  'data': { 'encrypt-ops': 'int',
>> +            'decrypt-ops': 'int',
>> +            'sign-ops': 'int',
>> +            'verify-ops': 'int',
>> +            'encrypt-bytes': 'int',
>> +            'decrypt-bytes': 'int',
>> +            'sign-bytes': 'int',
>> +            'verify-bytes': 'int' } }
> 
> AFAICT, these two structs are no longer used in QAPI since the switch
> to using query-stats. IOW this has become just an indirect way to
> declare a C struct for private use in the C code.
> 
> As such, I'd suggest that this QAPI addition be removed, and just
> declare a normal C struct directly in the code which needs it.
> 
> With regards,
> Daniel


OK, I'll fix this in the next version. Thanks!

-- 
zhenwei pi

