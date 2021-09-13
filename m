Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F940864C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:17:50 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPh9w-0005id-W7
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPh86-0004Ci-Fx
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPh82-000249-D0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631520947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mQRF1D327LgYWJ9iQtDP/DkXi3LYlsBlAHx0/wpzeU=;
 b=UQ3zxMVvyAYndExyC8D4jdaeAccLKfdYQUfCZk61Bl01wMjyw8XaeDzqluHTnWXNgFLI1K
 aH0paqY/gJMF0fx079ao6B3SG99MRfRWGDNSc9R8qdy1ftteyURg1LMdJ+jWuobMGoney7
 BZ6030AaIN6IMx7v0wlHegBNOHXcCio=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-AgMVUTcONZCpd32JAQ-c3g-1; Mon, 13 Sep 2021 04:15:45 -0400
X-MC-Unique: AgMVUTcONZCpd32JAQ-c3g-1
Received: by mail-wm1-f72.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so3678284wms.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1mQRF1D327LgYWJ9iQtDP/DkXi3LYlsBlAHx0/wpzeU=;
 b=td/AlQ8tbvcvNsigrf54Xg/2MYrl11BPFzuJgllFBYzjwMF/1QRgUtZAsJPnacRvrV
 dD7G1/TAtQOmlMgvUgeB3wc4NLdFoJKkyK875EjkUHW6op2wEXFFKo/PRulXEFxSEm1r
 a+UiMusZ6MRtFQcG63gDFxUADcvu73rEwDbdJ81UQu3KDWHFvxmIRQwrZO2DXXj/St73
 YDDHoUk/ULRSzfoaIg2+Ykb3Lf1ivYba5HxNVYMoaqz3dTpRm8Nz0RXoK5H6SmT3scHU
 H8PYCBEssI1ASC6O0HjkzMfzURjEkyRuOi1as3uuyphEdUUUyHDMdg4EpTgOhvLsvpuU
 +pEQ==
X-Gm-Message-State: AOAM532Q21kuM+zLmwlwZn9zHpJfN85WnwJ3EoXOfxPAwyw7b2Z/AXFK
 sHC+2rb2grPDRLRZINl/rr5hri4dY/g0jJhgljSadvgQfZ6a6okQa3wgjKNLEWi8ZH1yOpuIS8W
 J3BCmO1jid1z2qpM=
X-Received: by 2002:a1c:7ec9:: with SMTP id z192mr9923745wmc.152.1631520944014; 
 Mon, 13 Sep 2021 01:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMdN0HdIhgiX75cIMIsP+UJHPKLqSMaHR3MALwAjmj/byUm3EXjJaz6gfdgewBDAFG7PDHIQ==
X-Received: by 2002:a1c:7ec9:: with SMTP id z192mr9923730wmc.152.1631520943780; 
 Mon, 13 Sep 2021 01:15:43 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id z13sm7653902wrs.90.2021.09.13.01.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 01:15:43 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] fix crash if try to migrate during backup
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210911120027.8063-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <714e93c1-6456-3c7c-e0a1-01deb0fa6a95@redhat.com>
Date: Mon, 13 Sep 2021 10:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210911120027.8063-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.09.21 14:00, Vladimir Sementsov-Ogievskiy wrote:
> v2:
> 01: check that migration fails
> 02: Add Hanna's r-b
>
> Vladimir Sementsov-Ogievskiy (2):
>    tests: add migrate-during-backup
>    block: bdrv_inactivate_recurse(): check for permissions and fix crash
>
>   block.c                                       |  8 ++
>   .../qemu-iotests/tests/migrate-during-backup  | 97 +++++++++++++++++++
>   .../tests/migrate-during-backup.out           |  5 +
>   3 files changed, 110 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
>   create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna


