Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A51F5440E2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 03:06:52 +0200 (CEST)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz6dN-0005Op-3a
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 21:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nz6Z9-00044h-0F
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 21:02:28 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nz6Z1-0003F7-J5
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 21:02:21 -0400
Received: by mail-pl1-x635.google.com with SMTP id t2so19065927pld.4
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 18:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VhCSI4/82p7maI+6hlpm39k7fZXsdvnmQOl9zbSCHak=;
 b=Kx2ZWz/2O8/FyqkIAzfWB3nPuVCn1WoKkcUfxzFGZUaAomsE01EcPN5ZWNlFJcLOT2
 2D74wXTyQCgqGl4cL+LMwuTPgsj1g0zkvTpZV/7jSSDf1eBJaGvycPwUrcpOzs1mbxnE
 aQfgbRwexqw5Jl2Meuqwh99hihxeNWN4kIJ0vS88GlpNPDigi8Gk+FcOnQoTQmmi/ebo
 Yeg9BjYAm87Zf8UPkbGs67JgX2Nc9vkucKujrU950le5hWcSOtp6nb5ZqMcOBpGgLXH6
 L77Rvf4Gmo1fKKC/Gl5DLfVgbAPCSKK0A/+MnXP++8RWgc6dbxRzlAHJyuNyl+i8Fc3N
 Si+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VhCSI4/82p7maI+6hlpm39k7fZXsdvnmQOl9zbSCHak=;
 b=icuOmjIDEFStJEpplYkVSxY6PEg/aE4FcT4vh4SsNn/ftahs6gCGNjJnBKhI+jIVV0
 hK5rNZn1mhT83kOjWSTJIITAxtqzJnx+W5k+RzJrKEkHi8U3bc0LQzZ0QcN9bKJkKNVT
 5G9+tv81r+l8vY4zufn1uWAREkLhRPzeeKQAULCfABL3CahRjSm+pLZ8bgfGgwr0lAI5
 gQk2UjKHvMvlygTDmQC3P+gFoM8R6qIODUOfY3ep97CGNEiNMYtiCZKLAuWoyFJ4I9DQ
 9ouxeg2MVjtaSPcNTMYvIEH3c1tQRgm7TjrnKD7jpqQ8RuiwSlwNCDqUPgD6uMlLtM2P
 DRJQ==
X-Gm-Message-State: AOAM531lcpE4gwFdXn4E7KV6O9nHOjf1+CexF6+6bFjk0LGDxgYvVtSb
 nnNfLd32GwDl80J6JS2zmqsbJQ==
X-Google-Smtp-Source: ABdhPJzPbYlu81kIpByG9BMXMf41AW8Z/E2L0Wt/v+mXSqWzgIZA4Diie6fnPh+SLJDwLNhS0n6FpQ==
X-Received: by 2002:a17:903:230e:b0:166:3781:1e50 with SMTP id
 d14-20020a170903230e00b0016637811e50mr36887944plh.20.1654736536513; 
 Wed, 08 Jun 2022 18:02:16 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 x193-20020a6286ca000000b0051ceaa47cbdsm484753pfd.79.2022.06.08.18.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 18:02:15 -0700 (PDT)
Message-ID: <e1a2af04-ef33-60df-0ada-a17a7d508344@bytedance.com>
Date: Thu, 9 Jun 2022 08:57:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: PING: RE: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
Content-Language: en-US
To: "mst@redhat.com" <mst@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220527084734.2649594-1-pizhenwei@bytedance.com>
 <20220527084734.2649594-2-pizhenwei@bytedance.com>
 <848d579e2c504ba493cd57510a7ff3b0@huawei.com>
 <b2ee77ae-2044-32b4-20c5-43fa78e8213c@bytedance.com>
 <39f884dbc25d4b0cbec510ab090e6778@huawei.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <39f884dbc25d4b0cbec510ab090e6778@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Michael

QEMU side was reviewed by Gonglei a week ago. To avoid this to be 
ignored, PING!

On 5/31/22 20:08, Gonglei (Arei) wrote:
> 
> 
>> -----Original Message-----
>> From: zhenwei pi [mailto:pizhenwei@bytedance.com]
>> Sent: Tuesday, May 31, 2022 9:48 AM
>> To: Gonglei (Arei) <arei.gonglei@huawei.com>
>> Cc: qemu-devel@nongnu.org; mst@redhat.com;
>> virtualization@lists.linux-foundation.org; helei.sig11@bytedance.com;
>> berrange@redhat.com
>> Subject: Re: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
>>
>> On 5/30/22 21:31, Gonglei (Arei) wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: zhenwei pi [mailto:pizhenwei@bytedance.com]
>>>> Sent: Friday, May 27, 2022 4:48 PM
>>>> To: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>
>>>> Cc: qemu-devel@nongnu.org; virtualization@lists.linux-foundation.org;
>>>> helei.sig11@bytedance.com; berrange@redhat.com; zhenwei pi
>>>> <pizhenwei@bytedance.com>
>>>> Subject: [PATCH v8 1/1] crypto: Introduce RSA algorithm
>>>>
>>>>
>>> Skip...
>>>
>>>> +static int64_t
>>>> +virtio_crypto_create_asym_session(VirtIOCrypto *vcrypto,
>>>> +               struct virtio_crypto_akcipher_create_session_req
>>>> *sess_req,
>>>> +               uint32_t queue_id, uint32_t opcode,
>>>> +               struct iovec *iov, unsigned int out_num) {
>>>> +    VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
>>>> +    CryptoDevBackendSessionInfo info = {0};
>>>> +    CryptoDevBackendAsymSessionInfo *asym_info;
>>>> +    int64_t session_id;
>>>> +    int queue_index;
>>>> +    uint32_t algo, keytype, keylen;
>>>> +    g_autofree uint8_t *key = NULL;
>>>> +    Error *local_err = NULL;
>>>> +
>>>> +    algo = ldl_le_p(&sess_req->para.algo);
>>>> +    keytype = ldl_le_p(&sess_req->para.keytype);
>>>> +    keylen = ldl_le_p(&sess_req->para.keylen);
>>>> +
>>>> +    if ((keytype != VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC)
>>>> +         && (keytype !=
>> VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE)) {
>>>> +        error_report("unsupported asym keytype: %d", keytype);
>>>> +        return -VIRTIO_CRYPTO_NOTSUPP;
>>>> +    }
>>>> +
>>>> +    if (keylen) {
>>>> +        key = g_malloc(keylen);
>>>> +        if (iov_to_buf(iov, out_num, 0, key, keylen) != keylen) {
>>>> +            virtio_error(vdev, "virtio-crypto asym key incorrect");
>>>> +            return -EFAULT;
>>>
>>> Memory leak.
>>>
>>>> +        }
>>>> +        iov_discard_front(&iov, &out_num, keylen);
>>>> +    }
>>>> +
>>>> +    info.op_code = opcode;
>>>> +    asym_info = &info.u.asym_sess_info;
>>>> +    asym_info->algo = algo;
>>>> +    asym_info->keytype = keytype;
>>>> +    asym_info->keylen = keylen;
>>>> +    asym_info->key = key;
>>>> +    switch (asym_info->algo) {
>>>> +    case VIRTIO_CRYPTO_AKCIPHER_RSA:
>>>> +        asym_info->u.rsa.padding_algo =
>>>> +            ldl_le_p(&sess_req->para.u.rsa.padding_algo);
>>>> +        asym_info->u.rsa.hash_algo =
>>>> +            ldl_le_p(&sess_req->para.u.rsa.hash_algo);
>>>> +        break;
>>>> +
>>>> +    /* TODO DSA&ECDSA handling */
>>>> +
>>>> +    default:
>>>> +        return -VIRTIO_CRYPTO_ERR;
>>>> +    }
>>>> +
>>>> +    queue_index = virtio_crypto_vq2q(queue_id);
>>>> +    session_id =
>>>> + cryptodev_backend_create_session(vcrypto->cryptodev,
>>>> &info,
>>>> +                     queue_index, &local_err);
>>>> +    if (session_id < 0) {
>>>> +        if (local_err) {
>>>> +            error_report_err(local_err);
>>>> +        }
>>>> +        return -VIRTIO_CRYPTO_ERR;
>>>> +    }
>>>> +
>>>> +    return session_id;
>>>
>>> Where to free the key at both normal and exceptional paths?
>>>
>>
>> Hi, Lei
>>
>> The key is declared with g_autofree:
>> g_autofree uint8_t *key = NULL;
>>
> 
> OK. For the patch:
> 
> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
> 
> 
> Regards,
> -Gonglei
>      
> 

-- 
zhenwei pi

