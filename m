Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A05389B6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 03:53:03 +0200 (CEST)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvr4A-0007y7-B9
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 21:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nvr32-0007Ik-Fq
 for qemu-devel@nongnu.org; Mon, 30 May 2022 21:51:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nvr2u-0000gf-Q9
 for qemu-devel@nongnu.org; Mon, 30 May 2022 21:51:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso959988pjf.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 18:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KmXOhOKHGR1vGePMG8VRHG4c52PZJ9+TG/+1WQ5Zjj0=;
 b=YmA+1r+7grFxgBZ5EytDPadjP2fm3hIUtwTniDELQlZ6ExHSvcawoPiSH3Y2RTcnBX
 K7+uewQxw0kPMMtcrAldq8FWWgIbkThUbuKbcvai2Kyj3r12iKoGgxuT66aDUcZntK1f
 mqVATkfwMFjmQMIFqcWgBFe1UM3/bwMQNd4hFXE7wsG39F4OUgGjJBQjOcK9gNjJ11E6
 nRPa01iGVXeWgR4gUbs89f1HlVNWGJaQ2KUssLseIZm2RbQBztd+9ZqkTAH+5BHxl4fv
 PwoGM/txw0J/T3P1Y4Q/L8gSSjkh18E3pP8AlPPeayRFbbXw1T3kxn+OQTsc650SPXQV
 uTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KmXOhOKHGR1vGePMG8VRHG4c52PZJ9+TG/+1WQ5Zjj0=;
 b=epPtXeZNwQ93D70MbmdexKKQECxX8mGN16dzzhgOA4oQ7TXnKcXaWih1ss4Kar3ooZ
 facRqXdlwi4iEyQvY+hDjzOMmx0VCY1+XS373rkGrGhNbqdjanqyUInbvNiUB8a/t/5S
 APDrux9kNusnUqofz7XkRGOnZqxO7lIEybvdzPjgph1VLak2O2TcCUOkj/XM6wN4yFst
 neNEP4pPIg0IvtJ3Ui64tZTnxfd0WojL6gWzMlHdTbgnPn5liK9WwFEeZB35vFMwhGRa
 LZ9n/1kirih+vQ/2sSqmJaqTTlzuetXhsY38RlqB2sBzv27sxqPdZq8q7+C59CDF6fpQ
 aaqg==
X-Gm-Message-State: AOAM533KjRJKZufSMkcjFX04OeKs29ZBilCqJDft6LzFXo9//IwvB9Ti
 WzuRtDtQ+ugzxapPoP+aQhCaqw==
X-Google-Smtp-Source: ABdhPJx+3iY92taAy6pVX7D+ECDjEuy9jyUENbikEfIoPMi5rinonne48/JeuRQmz5BxgnmUPTMY3A==
X-Received: by 2002:a17:90a:2c43:b0:1e0:b3fe:1bf5 with SMTP id
 p3-20020a17090a2c4300b001e0b3fe1bf5mr26049348pjm.27.1653961902534; 
 Mon, 30 May 2022 18:51:42 -0700 (PDT)
Received: from [10.255.89.136] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a170902bb8200b0016191b843e2sm9792155pls.235.2022.05.30.18.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 18:51:41 -0700 (PDT)
Message-ID: <b2ee77ae-2044-32b4-20c5-43fa78e8213c@bytedance.com>
Date: Tue, 31 May 2022 09:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
Content-Language: en-US
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20220527084734.2649594-1-pizhenwei@bytedance.com>
 <20220527084734.2649594-2-pizhenwei@bytedance.com>
 <848d579e2c504ba493cd57510a7ff3b0@huawei.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <848d579e2c504ba493cd57510a7ff3b0@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 21:31, Gonglei (Arei) wrote:
> 
> 
>> -----Original Message-----
>> From: zhenwei pi [mailto:pizhenwei@bytedance.com]
>> Sent: Friday, May 27, 2022 4:48 PM
>> To: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>
>> Cc: qemu-devel@nongnu.org; virtualization@lists.linux-foundation.org;
>> helei.sig11@bytedance.com; berrange@redhat.com; zhenwei pi
>> <pizhenwei@bytedance.com>
>> Subject: [PATCH v8 1/1] crypto: Introduce RSA algorithm
>>
>>
> Skip...
> 
>> +static int64_t
>> +virtio_crypto_create_asym_session(VirtIOCrypto *vcrypto,
>> +               struct virtio_crypto_akcipher_create_session_req
>> *sess_req,
>> +               uint32_t queue_id, uint32_t opcode,
>> +               struct iovec *iov, unsigned int out_num) {
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
>> +    CryptoDevBackendSessionInfo info = {0};
>> +    CryptoDevBackendAsymSessionInfo *asym_info;
>> +    int64_t session_id;
>> +    int queue_index;
>> +    uint32_t algo, keytype, keylen;
>> +    g_autofree uint8_t *key = NULL;
>> +    Error *local_err = NULL;
>> +
>> +    algo = ldl_le_p(&sess_req->para.algo);
>> +    keytype = ldl_le_p(&sess_req->para.keytype);
>> +    keylen = ldl_le_p(&sess_req->para.keylen);
>> +
>> +    if ((keytype != VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC)
>> +         && (keytype != VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE)) {
>> +        error_report("unsupported asym keytype: %d", keytype);
>> +        return -VIRTIO_CRYPTO_NOTSUPP;
>> +    }
>> +
>> +    if (keylen) {
>> +        key = g_malloc(keylen);
>> +        if (iov_to_buf(iov, out_num, 0, key, keylen) != keylen) {
>> +            virtio_error(vdev, "virtio-crypto asym key incorrect");
>> +            return -EFAULT;
> 
> Memory leak.
> 
>> +        }
>> +        iov_discard_front(&iov, &out_num, keylen);
>> +    }
>> +
>> +    info.op_code = opcode;
>> +    asym_info = &info.u.asym_sess_info;
>> +    asym_info->algo = algo;
>> +    asym_info->keytype = keytype;
>> +    asym_info->keylen = keylen;
>> +    asym_info->key = key;
>> +    switch (asym_info->algo) {
>> +    case VIRTIO_CRYPTO_AKCIPHER_RSA:
>> +        asym_info->u.rsa.padding_algo =
>> +            ldl_le_p(&sess_req->para.u.rsa.padding_algo);
>> +        asym_info->u.rsa.hash_algo =
>> +            ldl_le_p(&sess_req->para.u.rsa.hash_algo);
>> +        break;
>> +
>> +    /* TODO DSA&ECDSA handling */
>> +
>> +    default:
>> +        return -VIRTIO_CRYPTO_ERR;
>> +    }
>> +
>> +    queue_index = virtio_crypto_vq2q(queue_id);
>> +    session_id = cryptodev_backend_create_session(vcrypto->cryptodev,
>> &info,
>> +                     queue_index, &local_err);
>> +    if (session_id < 0) {
>> +        if (local_err) {
>> +            error_report_err(local_err);
>> +        }
>> +        return -VIRTIO_CRYPTO_ERR;
>> +    }
>> +
>> +    return session_id;
> 
> Where to free the key at both normal and exceptional paths?
> 

Hi, Lei

The key is declared with g_autofree:
g_autofree uint8_t *key = NULL;

> 
> Regards,
> -Gonglei
> 
> 

-- 
zhenwei pi

