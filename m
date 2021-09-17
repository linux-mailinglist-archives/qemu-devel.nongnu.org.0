Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC940F43F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:37:40 +0200 (CEST)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9NL-0003AO-My
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9Ky-0000ku-75
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9Kv-0007ci-Cs
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+MtPlxiTJ1sbZSGdmRD7ZM4QhbUEC+V3ZnkqTHQhhk=;
 b=JAhHgxjbb7Aiz6+eNLL2oemD99XJs9U/qgauhsZVjj5Qk7KkOSRBnzNKa8Y61vJnAJXJWF
 VUhJ8l/8Y/ufgkv9hW9MnkwgiGyk097y6fsQzWxUZ6NFbDbaWX6aQI0D1B3Yss2XoRne1N
 k3Z6ih1vDuYGR1+bXNiWAHbLfEMfnKo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-b-ianO6MMgSzymOGzD5NUw-1; Fri, 17 Sep 2021 04:35:05 -0400
X-MC-Unique: b-ianO6MMgSzymOGzD5NUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so1587848wmr.9
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 01:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=P+MtPlxiTJ1sbZSGdmRD7ZM4QhbUEC+V3ZnkqTHQhhk=;
 b=tPQ8AJ2/oqRDZDZe3RYzHMiJTKicHvOhkpD2DicJfZT/N8hh89l7gHTx1dMnO0H5MB
 jHYA555rkqgTx4ZTqzNM8MEUKT8Aj+6S7AAGHqtkWr/ZsCmDzc9/OQG4J2M+7fw735se
 8F25sui0kmRlmwpkds04wuhSVgfTW0IYfB/NuJ8OXivopvN2wSOEsl7hLegjpsyKlbi1
 vcG6Vty2L6DOyNEapamHnvbWm71snck8DxFGISM6ft60mWFC29SrPjbTymoF2mwDvEnp
 Sa6crQuGFOz0RTmHXcf9JZGPxYx1ENrmX4r7dvYtKSX5sedtnJRQcF28zluN0yK7tcHD
 Vmqg==
X-Gm-Message-State: AOAM532djns76MtSMXWNTWqVPaFPjzXJ15MLHrqdizZOfHwVFxtdHMjk
 UIplPzK5fEGhVqjQYuJ8krne1x6bEX0CrZN65Q8SglUXaWgm4eEEI2C+y0XwBOzSJkQ/mdEEn24
 lCPCuck1qPrITgHM=
X-Received: by 2002:a1c:f606:: with SMTP id w6mr9145155wmc.42.1631867703794;
 Fri, 17 Sep 2021 01:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNCUPuk2D5kc0ZWxTX1OhbwhJj7Vh+z0vBW0UnOtQ9m2LPPkaxbzhPruwEZPe70ypLzxtxog==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr9145132wmc.42.1631867703509;
 Fri, 17 Sep 2021 01:35:03 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id m1sm5527304wmq.10.2021.09.17.01.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 01:35:03 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] iotests/mirror-top-perms: Adjust imports
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <bd29eec2-8e8f-356b-3063-d6b37928b386@redhat.com>
Date: Fri, 17 Sep 2021 10:35:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> We need to import things from the qemu namespace; importing the
> namespace alone doesn't bring the submodules with it -- unless someone
> else (like iotests.py) imports them too.
>
> Adjust the imports.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


