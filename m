Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B463BC3B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozwO9-0001yS-88; Tue, 29 Nov 2022 03:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ozwNq-0001wR-Np
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ozwNo-0005me-U7
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669712064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuTjmZKMXLt09NKE2r9n8UPD/ZVjckTvq50X8AP/pNw=;
 b=fbkAAGmKenRg2ZuPZ0VE2Cdiykj9EhKTmCro8t6gYj1jUQczJrfsmUxGSnrqpML3SJaPDn
 NJhDQNOoCfVczrZRelavfiqJFpIFmh/UlI1/OwWu1m0mzDM9SRQt2lFZqFexQRIJIs41NG
 arc1w2nRCdbXSbV2+TZye0EzIyGziIc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-glQgTr_tM6GE4B7h1NphBw-1; Tue, 29 Nov 2022 03:54:22 -0500
X-MC-Unique: glQgTr_tM6GE4B7h1NphBw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hp16-20020a1709073e1000b007adf5a83df7so6028736ejc.1
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 00:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UuTjmZKMXLt09NKE2r9n8UPD/ZVjckTvq50X8AP/pNw=;
 b=kOVJyCjmZA+zIi14bYBq1Ds1msPN3YgJh4WmYrWSDAD91AMxNSRyGicPHpVytpdBny
 tQOhNaELu4cR9lvFam9wcTXnAXexvqA4Y4DzyZ7pAFREOIyzz+6dMnu2rAFNh7wxnpfC
 bbYmhUsVYhSWfionGAuP8qkI1cFYuPXJ8T2qveMcs9dbOElnlP+vhgyWTJ7h7t1mDMFa
 fsl/mYkjP9Jhe6Bja70h+il2NVHBD2wJhUjYCx4tel8+goHcymmSpjvXGvwCp1j52Qso
 X7hDQ+maJbG0pSkHveDkcQ4bvPDZSfR32DW8q3sgMbfh50MXJCf2YpDjXLhEiaMADAlH
 xjjw==
X-Gm-Message-State: ANoB5pkuzYPW1qP3P2voLmbf+xBt9Ubaw364wNpXTfpWlIiwXJBcHfCM
 mIxHLq3sJ+W3dOu+7cETpxojYxFZXsLLZl8b4vnpVuwKa7wLoKvcno9lyE+FaHihzuqAuf3bUIW
 CJtvmKOfo6rYXsPM=
X-Received: by 2002:a17:906:350e:b0:7ae:f441:6ade with SMTP id
 r14-20020a170906350e00b007aef4416ademr35169047eja.436.1669712061602; 
 Tue, 29 Nov 2022 00:54:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ae+sAGwY6WMpDu9sdWtRteWPDEh8u+KFbyYzBiNJjeas7dYfksE0JmvUYd55HI6SzSPlSfA==
X-Received: by 2002:a17:906:350e:b0:7ae:f441:6ade with SMTP id
 r14-20020a170906350e00b007aef4416ademr35169027eja.436.1669712061386; 
 Tue, 29 Nov 2022 00:54:21 -0800 (PST)
Received: from sgarzare-redhat ([62.205.9.89])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa7c7d3000000b00461bacee867sm5280954eds.25.2022.11.29.00.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 00:54:20 -0800 (PST)
Date: Tue, 29 Nov 2022 09:54:18 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH  v3 1/7] include/hw: attempt to document VirtIO feature
 variables
Message-ID: <20221129085418.tehbe2geolpelyv6@sgarzare-redhat>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221128164105.1191058-2-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 04:40:59PM +0000, Alex Bennée wrote:
>We have a bunch of variables associated with the device and the vhost
>backend which are used inconsistently throughout the code base. Lets
>start trying to bring some order by agreeing what each variable is
>for.
>
>Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>Cc: Stefano Garzarella <sgarzare@redhat.com>
>Cc: "Michael S. Tsirkin" <mst@redhat.com>
>Cc: Stefan Hajnoczi <stefanha@gmail.com>
>
>---
>v2
>  - dropped DISCUSS and commentary
>  - separated protocol section for clarity
>  - updated working on vhost->backend_features
>  - made clear guest_features was the written state
>---
> include/hw/virtio/vhost.h  | 25 ++++++++++++++++++++++---
> include/hw/virtio/virtio.h | 19 ++++++++++++++++++-
> 2 files changed, 40 insertions(+), 4 deletions(-)

Thanks for this effort to improve our documentation!

Acked-by: Stefano Garzarella <sgarzare@redhat.com>


