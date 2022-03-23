Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF24E4D86
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:44:50 +0100 (CET)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvfl-00048z-Fs
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:44:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWvXQ-0002iO-GF
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:36:16 -0400
Received: from [2607:f8b0:4864:20::102d] (port=56137
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWvXJ-0002cm-RO
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:36:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id jx9so859086pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zvylfPpDD9P7LaVoOftyiAyZ4rjtzB+zBl0Umv/tVM8=;
 b=DRpcKWazqF/j9WlI8wmS2svwLYoi3ZrvlWHtWFCRpaYYQad4aGM5+KqGDh3unwJKNO
 nCeZrxwS//AlUXG0MZGTCWTc4MzpKlyri/EZR9aT7g3aCDodJUtmoGKvkeVOhaojjptD
 qaQ8/hZO2wpgYFHGvwBzmYLTwT9+opQ/Xo8maJo6ZJGGYb2OsGEVYcWY9hOdRDGwtTyg
 299GeeOXfEOrc5ZO6Ho/0skuS/yEe19FHUJcd/9qxKH1j92hWH7vNqgg/nGTjini/NkZ
 fRLTFYZuk4xfRIYoel7PdNUz1GXEGZkwUtiOl/CyTIBv2TW8tTATGeNYaKUkmgqejH/U
 qz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zvylfPpDD9P7LaVoOftyiAyZ4rjtzB+zBl0Umv/tVM8=;
 b=0luRQhE+9vZG0LdhKDAFS29piU0D+Ir9AE5w/3snP5torGll7ClDAVzxQQVRF4I9J9
 OfXyJvWCMBUGqQ2X/zMpg62GNU0G/tl70dsHJ9luzAN7HroEse91i6vRwobooquziDQE
 pE+ykGFIGoWMEYR8dNhrY62iStkCGh6UR8nS3Gc/nV1JQ1mGGIiL/E2Mg8tIUy03dhhG
 k3yJpqV02aa2N6fuD8wnxxXbVStYxuwMDfYbYVJK1OkWpzD0Sm3lx0vpnd377yREj+we
 DCUCipXwHa1YFlOBiGRVuL9F1Imgel/4tuXYhmc7cYVzC8zwjUCrB40eB/Lilr4ffHKf
 T9Jw==
X-Gm-Message-State: AOAM531iu6BaBso4SU4fEmAa80ebzMOoPC61Cov+0nr63ukRjeRa29ht
 0w2ryX3lUe5ihtOQahTcSArwTw==
X-Google-Smtp-Source: ABdhPJyiRm/ds9KsWZNW+LTcMfpWdOU27E0yNqDGEitACnD7dqxgZWBF8j1F3DZKQNh5UngmIs8tgw==
X-Received: by 2002:a17:90a:4581:b0:1bc:d215:8722 with SMTP id
 v1-20020a17090a458100b001bcd2158722mr9837129pjg.149.1648020964224; 
 Wed, 23 Mar 2022 00:36:04 -0700 (PDT)
Received: from [10.255.146.117] ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 il3-20020a17090b164300b001c6d5ed3cacsm5713618pjb.1.2022.03.23.00.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 00:36:03 -0700 (PDT)
Message-ID: <f806c17c-cc7e-e2eb-e187-e83148160322@bytedance.com>
Date: Wed, 23 Mar 2022 15:32:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Re: [PATCH v3 0/6] Support akcipher for virtio-crypto
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
 <YjqtXFvfDq0kELl7@sol.localdomain>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <YjqtXFvfDq0kELl7@sol.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: herbert@gondor.apana.org.au, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 arei.gonglei@huawei.com, linux-crypto@vger.kernel.org,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/23/22 13:17, Eric Biggers wrote:
> On Wed, Mar 23, 2022 at 10:49:06AM +0800, zhenwei pi wrote:
>> v2 -> v3:
>> - Introduce akcipher types to qapi
>> - Add test/benchmark suite for akcipher class
>> - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
>>    - crypto: Introduce akcipher crypto class
>>    - virtio-crypto: Introduce RSA algorithm
>>
>> v1 -> v2:
>> - Update virtio_crypto.h from v2 version of related kernel patch.
>>
>> v1:
>> - Support akcipher for virtio-crypto.
>> - Introduce akcipher class.
>> - Introduce ASN1 decoder into QEMU.
>> - Implement RSA backend by nettle/hogweed.
>>
>> Lei He (3):
>>    crypto-akcipher: Introduce akcipher types to qapi
>>    crypto: Implement RSA algorithm by hogweed
>>    tests/crypto: Add test suite for crypto akcipher
>>
>> Zhenwei Pi (3):
>>    virtio-crypto: header update
>>    crypto: Introduce akcipher crypto class
>>    virtio-crypto: Introduce RSA algorithm
> 
> You forgot to describe the point of this patchset and what its use case is.
> Like any other Linux kernel patchset, that needs to be in the cover letter.
> 
> - Eric
Thanks Eric for pointing this missing part.

This feature provides akcipher service offloading capability. QEMU side 
handles asymmetric requests via virtio-crypto devices from guest side, 
do encrypt/decrypt/sign/verify operations on host side, and return the 
result to guest.

This patchset implements a RSA backend by hogweed from nettle, it works 
together with guest patch:
https://lkml.org/lkml/2022/3/1/1425

-- 
zhenwei pi

