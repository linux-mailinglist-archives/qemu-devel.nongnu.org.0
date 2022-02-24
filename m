Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD234C2BBB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:29:09 +0100 (CET)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDF5-0000f9-VK
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:29:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nND6q-0006so-Uq
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nND6m-0004W4-Ox
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645705231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eaE2KYc5kB1sNbeKyQY0iY7Fyu3UOCbSSaSJzO9jEro=;
 b=I/9gYplnAU7vj5Qafx4fLTcM13hs+NWTx3Jw5jd9t666k3jYgZkssgx9nPscZxrf3E+AB0
 tuIWUwtlcw1Y2LXHZaPaaFN2blMy75tGRgfxOa6CFbhlubHUyCeB5uvDyaNruE9qEs1RMp
 SUKe/0e80eWF0A8KxR5qyHDrSFNplhc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-pR3XrGZJNb-588_GUciUYg-1; Thu, 24 Feb 2022 07:20:28 -0500
X-MC-Unique: pR3XrGZJNb-588_GUciUYg-1
Received: by mail-ej1-f69.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so1143083eje.6
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eaE2KYc5kB1sNbeKyQY0iY7Fyu3UOCbSSaSJzO9jEro=;
 b=CG4qUEncwuzpRs98bjrknTIl5WAR697+MlReSFVXY0blh8UlwydoMdqMNVA2b1P17a
 kmEfvHFvNJJJeaOwPyMWqUC8fYPtuwYC6lJfTzylmwvpmRqhhRQdN1UglexyzEG7wk/2
 JJ6m1uBvcOOysl8LoGJ0dAh1X8/NbWkYDN1YocVuH8QVRQFbCSPUjQXM5l/Fys1CeJOz
 qu5PIOyDrvbB4qoO4LKPHt4273R43/0AWUCDrPgGPZQJRj/2RbCp9x1BfpWYTgSvkHxi
 8bmkeUk06433XsSGGB0Ld3/S6oXBoJYC1G2+anLaBdpEWkhIRBZ3us/wIwPlXc2jJuw9
 QRoA==
X-Gm-Message-State: AOAM533/+lxHXMORDr5SR8qpHwrr1yDl3jSIP2QNbeFCQTJF1SQViLEw
 7X3/7jwbSIxahcX0qwggTAuXxSGBwY3ue5tMbFwmOvRvSPRO60RSY24lYz2+pQikKKwJJpWud1T
 LnpRD6K3BAm9ltZI=
X-Received: by 2002:aa7:c612:0:b0:40f:2a41:bddb with SMTP id
 h18-20020aa7c612000000b0040f2a41bddbmr2036720edq.291.1645705227398; 
 Thu, 24 Feb 2022 04:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwenUzQGVEb31SQPVgNzqPNcYH9qV0Buu9BB63c2636FQBwIpYYWglnCQoZK6KpO660KMC0w==
X-Received: by 2002:aa7:c612:0:b0:40f:2a41:bddb with SMTP id
 h18-20020aa7c612000000b0040f2a41bddbmr2036696edq.291.1645705227189; 
 Thu, 24 Feb 2022 04:20:27 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id fy35sm1199527ejc.36.2022.02.24.04.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:20:26 -0800 (PST)
Message-ID: <86a2e10c-37bc-da5e-9c74-343d998114de@redhat.com>
Date: Thu, 24 Feb 2022 13:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 08/18] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-9-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-9-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Add a convenient function similar with bdrv_block_status() to get
> status of dirty bitmap.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/dirty-bitmap.h |  2 ++
>   include/qemu/hbitmap.h       | 12 ++++++++++++
>   block/dirty-bitmap.c         |  6 ++++++
>   util/hbitmap.c               | 33 +++++++++++++++++++++++++++++++++
>   4 files changed, 53 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


