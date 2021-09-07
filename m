Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2C4024E8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:11:43 +0200 (CEST)
Received: from localhost ([::1]:34698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWCk-0000mH-Gw
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNW9y-0005jV-AR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNW9u-0001Ak-7l
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cIhAvV8xnks+/oa8wMaoPaWgG0GH476idpiPepSRfU=;
 b=QBm4tZreYnC63bwMkFGWLzdNTIR6Idsy8qaoCqdk5xEIavPNmnhXUZ6co97CZreOtBxc81
 va/qVmnsypeHQsKK9jpFSpbIo49+mEWbsTB6S3Zvz943BjTE1BQ0qA78OePHwlL1oD4cKp
 0gibqKUDXHEmlJM8lKfxwgsqdAthvxw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-aaSWnnZqOj-xLYJOVxenJg-1; Tue, 07 Sep 2021 04:08:40 -0400
X-MC-Unique: aaSWnnZqOj-xLYJOVxenJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n16-20020a1c7210000000b002ea2ed60dc6so641285wmc.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 01:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4cIhAvV8xnks+/oa8wMaoPaWgG0GH476idpiPepSRfU=;
 b=M1WMza/r+qRDJDT3N2aBfpVHdSbGw5Pi3ppEG+phFXQw08yuVcypsTfeQqLu4fQ7qx
 Ym8ytdOh43ZmAQBhnZWeeOAWODhfFB0bMDAxSe3Lo8XfBDMxxP9cz9q/MXXYsi/5eG1s
 M0oppzGcTsAuwJtMRrKHxMbOo7+Mp5IVoIyfv+m5o/prhr9aa5lsHnC/xaBHOt0zt4ag
 9mYs14U+3Il12s8O8mE0q+9uh4Re1hrKIzjU8ZHy29mnaLh2zm72nBAZaZULCszDZgrs
 kjvabxGNlG0ipRIXIL5S4QM0dvt7bR1/n0yr0G84iH6lOzaEATrhg+GHHO4Pp9j7Cfq8
 Drsg==
X-Gm-Message-State: AOAM532sH9H8dckB3seMwNkAdy423YpZseGSgRIv2riQMwtRlkX9YHNU
 svP7LQE0GH/+5YInx8eGYe0/CPle0BQG8mAasxz1Y+NdK+8PrLl7Wi70alsmgWIogMnHGod6INw
 KrBV6nNbMYVFn0Uw=
X-Received: by 2002:adf:e712:: with SMTP id c18mr17272060wrm.438.1631002119663; 
 Tue, 07 Sep 2021 01:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznA2bXb1w1hCkgKmUY8c8rGZl+OqbYmYk+MJ/BvWvv3vOaavORwpH8/VuecArmwcT9otoRHQ==
X-Received: by 2002:adf:e712:: with SMTP id c18mr17272021wrm.438.1631002119362; 
 Tue, 07 Sep 2021 01:08:39 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id w20sm7606057wrg.1.2021.09.07.01.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 01:08:39 -0700 (PDT)
Subject: Re: [PATCH] gluster: Align block-status tail
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210805143603.59503-1-mreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <8751dedd-9240-b56c-f7cc-864e609a6c44@redhat.com>
Date: Tue, 7 Sep 2021 10:08:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805143603.59503-1-mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.08.21 16:36, Max Reitz wrote:
> gluster's block-status implementation is basically a copy of that in
> block/file-posix.c, there is only one thing missing, and that is
> aligning trailing data extents to the request alignment (as added by
> commit 9c3db310ff0).
>
> Note that 9c3db310ff0 mentions that "there seems to be no other block
> driver that sets request_alignment and [...]", but while block/gluster.c
> does indeed not set request_alignment, block/io.c's
> bdrv_refresh_limits() will still default to an alignment of 512 because
> block/gluster.c does not provide a byte-aligned read function.
> Therefore, unaligned tails can conceivably occur, and so we should apply
> the change from 9c3db310ff0 to gluster's block-status implementation.
>
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/gluster.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Thanks for the review, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna


