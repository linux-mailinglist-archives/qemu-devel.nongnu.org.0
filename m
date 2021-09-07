Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A840268D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:54:11 +0200 (CEST)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXnu-0003zi-Qk
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXk9-0000Hz-0b
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXk7-00012g-Gk
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631008214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGfOEugBV9i2d+1aV4zj8uZwslQyPoeKOVyAEOFnsvA=;
 b=ecRuR/WjET6lPjzPjk85lZzQSMzzWVM58qSiKkgPavI74KjuhYS/xE+PLPnmJkh1T/947G
 d6dMBYv7P1LtMsftJM7GALh3SH49d/e/tOeXpG88W2xJRJ4Vl1k9T9EZ9fBIAccXwExkDF
 JML0EGIMZbGZBBmTXDYb41crP8aLlFY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-pFdRhwgkNsy1jwo5DQBEKg-1; Tue, 07 Sep 2021 05:50:10 -0400
X-MC-Unique: pFdRhwgkNsy1jwo5DQBEKg-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so901611wmj.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 02:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dGfOEugBV9i2d+1aV4zj8uZwslQyPoeKOVyAEOFnsvA=;
 b=XdxjEqhsJ8o1gMJ9H6SNyCwXTn4c/uBcOgthDSItE8XqUvjyYmHXHpx8Q1680KoIh0
 qaf8cWRr+Kd3Speyq2wGeSNpMkGlfCpqPrq1qbvIs8y42Z58zTeGecMaGta2fwEy5xio
 2SYNiGuFWA5uK9V3Z7TrhOjKTPNRt+zafXsArPw/LKdzxxv6AW9lhHfkcGOJRPZsH3/X
 +A+fXsWJ8K6Db+jZUjnrbdqCeJlpj0kAcHReli9X69fo3TIMzhR92Y+5FIajgvb3zTMn
 fFeMT2J2aHiR5TRiXbJ+IlSwl/vFlasp0AfpyoULB22GBraJVMygc7jDKF7/D5myM42q
 JGvw==
X-Gm-Message-State: AOAM532TM10/nmGi1ephP9Qw/Ad7LFt7kYn0v8JLk147lkGUq4U7AQXo
 Q6EF+yy2whmhroYZP3gL2YX5GR3W4/wXpTWDtvQegNVWkcs/vse6JdAWc/AE1FcHulXN7NdPj6w
 h+VBu5/8zGmfRJDg=
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr3110944wmq.194.1631008208899; 
 Tue, 07 Sep 2021 02:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxBT0GDg/7gWPfilbaRd4q7PWKF0u7okxOmXCJr9Qx+E1xKgcyM2pG70mMswOFq6tNREk7oQ==
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr3110923wmq.194.1631008208620; 
 Tue, 07 Sep 2021 02:50:08 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id k18sm1857745wmi.25.2021.09.07.02.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 02:50:08 -0700 (PDT)
Subject: Re: [PATCH v4 0/5] iotests/297: Cover tests/
To: qemu-block@nongnu.org
References: <20210902094017.32902-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <4c85998f-60e0-b1e6-f355-a804e5e8ef02@redhat.com>
Date: Tue, 7 Sep 2021 11:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902094017.32902-1-hreitz@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.09.21 11:40, Hanna Reitz wrote:
> v1: https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg01471.html
> v2: https://lists.nongnu.org/archive/html/qemu-block/2021-05/msg00492.html
> v3: https://lists.nongnu.org/archive/html/qemu-block/2021-05/msg00569.html
>
>
> Hi,
>
> Sorry for the long delay, here is v4 to make our lint checking iotest
> 297 cover the tests/ subdirectory.

Thanks for the review, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna


