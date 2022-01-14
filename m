Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB2F48EF66
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 18:54:00 +0100 (CET)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Qly-0006bo-U3
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 12:53:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8QjX-0005cu-0C
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 12:51:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8QjV-0005nI-Hb
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 12:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642182685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7V+K+HS9k19i1EUYDjzVfHmxDJXQjLuJ/CSwC9+2ako=;
 b=KArp/RrJwpUAhGzgcORbvLgeKMAJlqzhdIkANFpgyZsEW+ZCQbM9+VLhJQVrYbptUECV1v
 RWEDN59UvAOe6xGtOlZOSoyObah02T5fRNXt9D/cEhJUglLpuCJ0Ljl7alM+1bCnHdmcJ5
 vIoSRXKOZ/hTcEC79cbmGco0nMG6Nfs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-iR5UrAeLNDK68L9W0FEQrg-1; Fri, 14 Jan 2022 12:51:21 -0500
X-MC-Unique: iR5UrAeLNDK68L9W0FEQrg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso3082275wms.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 09:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7V+K+HS9k19i1EUYDjzVfHmxDJXQjLuJ/CSwC9+2ako=;
 b=UPaZAvpb/E9XLwi5I1H6VHD2UM04k+Ui79CpZCwCxom9rWSjsb9TOqyq9j++6HrHqi
 b7r16gqqCc9gN7ag/5EPi2qr3BrmGKAfo/s3KU0zTRWF/1Rf8ztfOZF3KMtJCHlaBE/Q
 2F9GoSxnJeSj4FWpICxaOXj9QmHD81VHNmJk9uXCJ5AMOOqshWPhsHq4eL/btRwmjv67
 L7jdUse4chEf/Rr1YB3a0GTx/id2Q5CRCpMNJm4O7N8D37Abv8alrVtB15WjYsq84cb9
 3PGT4uxEhFBbXbDCYIkaESVS4fgnRPH73GyXqM2dXKzqprgWkId0clB12XEbU+Rumst+
 L3RA==
X-Gm-Message-State: AOAM530SO97y8Kzn8bgjCwf246CBC77oncyyVQDObNuzdz/3VARMBWod
 uqsGCcEwY9ad9d1S4WG/3/Eig7alRXHCp9/l5c1h2u7SBDszbooyAqSfF6ohCz5DluCSsARzLUa
 cin0jR+QOXbynfsk=
X-Received: by 2002:adf:fa81:: with SMTP id h1mr9338380wrr.19.1642182680745;
 Fri, 14 Jan 2022 09:51:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAzWFJXoiX9uQnj5nDlGmGyUjlSdCluhyT3r2dUzV9rZHkNq6BEQ94hCu7LZv0pbGiy7dl+Q==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr9338356wrr.19.1642182680555;
 Fri, 14 Jan 2022 09:51:20 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o13sm7472823wrc.111.2022.01.14.09.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 09:51:20 -0800 (PST)
Message-ID: <9ee3f011-51ff-d0cf-5cc5-b6518a635c09@redhat.com>
Date: Fri, 14 Jan 2022 18:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 05/19] block/block-copy: add block_copy_reset()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-6-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-6-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> Split block_copy_reset() out of block_copy_reset_unallocated() to be
> used separately later.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h |  1 +
>   block/block-copy.c         | 21 +++++++++++++--------
>   2 files changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


