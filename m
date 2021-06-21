Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E383AE635
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:40:06 +0200 (CEST)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGPV-0003oR-1j
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGOB-0002Hw-8m
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGO8-00022v-2M
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624268319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XX6W9Zcc4r3N1gp5mXNZGTIdYQF/i5z23lYeA3EjQAo=;
 b=WbTrz3zDHg21MSaYA1V1s1+t5AzpuRUV/0O/FRh9qrkyQbZw9bK6knd1iK7bF6dpPrGiim
 +Fz6NpBBCtvuYyJ7xYOUijcm1co9rFzonMUjDBI0IAxHbJcnycZI7BNfDkcWllFg37YjsR
 0q9hlNrjWNw66jWtLtynH9BJGoCAJoU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-9ycG3VOTM1qqk0JfScMNoA-1; Mon, 21 Jun 2021 05:38:37 -0400
X-MC-Unique: 9ycG3VOTM1qqk0JfScMNoA-1
Received: by mail-ej1-f72.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so1388829ejc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XX6W9Zcc4r3N1gp5mXNZGTIdYQF/i5z23lYeA3EjQAo=;
 b=LQYb45D9qIpom7G+a4Vv1gF9HFISZRMEezFlaheeV/nNdOsJxsi+RcaNApGmOhxp2O
 8VVf4AmsSNJIqJiDS8diZYD7pbfbhtB16wBklpAf24n9eOonShRwC5Kd6wZBOsn2YAK4
 p6kCKkDDepUvqipeGq2hLtj2IJ9Q7SLQQxGEfpvzskL/+3maXTxQTJFqyt34rdAY9RXm
 jN1/gQgWUJh1aqEo05hkfuvtrLZZO4B9474U1UkTekpQrEokTj7fl3bzKWYLoDihI6Sj
 7twbnRBJHJybKKISW3wmVlRMKPPumQzDfKBn3fxm5qA+lmq/bKsrwq97Ps+ORvBVLC91
 FRgA==
X-Gm-Message-State: AOAM532qO2mWjqqkSv7JfZGPsHwGa0qSB8JOGdsqWdyo7Hu9XsszEPJo
 f+gvFCm1Sik2PhV73iL/V0tBRkq7+UaTg3bb2QwT3mNERMjnRWbHsflHMRgfWx5JkvDzoZdnhtO
 OQhVHDyruhPTbkc3EK4eCJo+rO/ws2BWDk+vrFylCJKPHSbUg0A05/613W8QNLuNp
X-Received: by 2002:a05:6402:5143:: with SMTP id
 n3mr459137edd.80.1624268316405; 
 Mon, 21 Jun 2021 02:38:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx58I+/o0QXLGymEdtR2G47kzAid3FF/FssklXROQMdyK5xfw/0mYE2s8aUBqS7Q8NOx6L7zg==
X-Received: by 2002:a05:6402:5143:: with SMTP id
 n3mr459118edd.80.1624268316190; 
 Mon, 21 Jun 2021 02:38:36 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 b27sm2708555ejl.10.2021.06.21.02.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:38:35 -0700 (PDT)
Subject: Re: [PATCH 3/6] block/file-posix: Do not force-cap *pnum
To: Eric Blake <eblake@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-4-mreitz@redhat.com>
 <20210618201647.qv7m4ygneqol33ro@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <dff1c258-a04f-64fc-780b-1741aa77f70a@redhat.com>
Date: Mon, 21 Jun 2021 11:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618201647.qv7m4ygneqol33ro@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.06.21 22:16, Eric Blake wrote:
> On Thu, Jun 17, 2021 at 05:52:44PM +0200, Max Reitz wrote:
>> bdrv_co_block_status() does it for us, we do not need to do it here.
>>
>> The advantage of not capping *pnum is that bdrv_co_block_status() can
>> cache larger data regions than requested by its caller.
> We should update the documentation in include/block/block_int.h to
> mention that the driver's block_status callback may treat *pnum as a
> soft cap, and that returning a larger value is fine.

Oh, sure.

Max

> But I agree with this change in the individual drivers, as long as we
> remember to make our global contract explicit that we can now rely on
> it ;)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>


