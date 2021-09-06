Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF840199C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:18:23 +0200 (CEST)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBhl-00005c-KH
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBeT-0006Rs-7T
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:14:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBeR-0006U9-M6
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630923294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmYWdxp+g2ViH/NgufpVstVDEPj29rqnu1qHzq35sKk=;
 b=MXOLOyt6SvXEaImjBg4CrNonLtisKojRcIZbrz8HIMExYtP5LdiIajQVL+yvFY4zPBnnMw
 bs6be1sy/qu3kGlsWiULYsIR8amkY5gVQNtrIcSqcKaODNn7kTxgT5mfs7aYgLl4l16dWo
 pBPlOY8nkSKYQaSFwNmlvfVgm4+7Th8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-X-lITdYMP0i8A4QTtSuqrQ-1; Mon, 06 Sep 2021 06:14:54 -0400
X-MC-Unique: X-lITdYMP0i8A4QTtSuqrQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso1058031wrn.19
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UmYWdxp+g2ViH/NgufpVstVDEPj29rqnu1qHzq35sKk=;
 b=kIPHPlRSFZ2IBrb2K+cETURdwdJYozDzczHbksXOqMV9Lt9kD4xe+fujuc8Y0ScqRf
 fOnXG8R9zHS8WqAYkNZCVWUdT0W8wfBwHmT6AsJwZd30wWhPeRX8P4c1dhNGbBFN/dUq
 Y/ic79aq0/6hEshYLZgJFSInehx5+O/ZLYjeKNkOZCn2BQc7qUMLiYNfOTx3WsYKvlzP
 AHfrXftDN/V1cS9M7xU85sc9mWzHHEezOugWHtjGEeca3aVkzBT9RAoEJbjF8i8APqoa
 qJvuW1QxzCCAP7ko6jYAZFndcc3hP8jL7OargXkEbWVRoZD6MioMKUCRNTFWEko6xSzj
 UcjQ==
X-Gm-Message-State: AOAM531xABWSdWP1ns8e7l2rWbVKvXElBVMGQLVGU8vCX00iIzNywncp
 Rs9BB7U07Au8Mx5clX4c6J5dfR1Qpfq04TrxBMZfwHfQCkOX7xS6UdwxuhxAPzuHmm8T0/9uBnp
 oM31qh4Xu0uOWEW4=
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr12332260wrw.240.1630923292875; 
 Mon, 06 Sep 2021 03:14:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWoBY2u7CRaJv/lPXn4beREpZN8MvZOxdixZkN9d8aIO2E2iOVUQy+sEVhRRct0ziX1dNREA==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr12332234wrw.240.1630923292638; 
 Mon, 06 Sep 2021 03:14:52 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id u16sm7740290wmc.41.2021.09.06.03.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 03:14:52 -0700 (PDT)
Subject: Re: [PATCH v3 13/13] hw/s390x/s390-skeys: lazy storage key enablement
 under TCG
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210903155514.44772-1-david@redhat.com>
 <20210903155514.44772-14-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <42361b1a-4264-4c2d-4e42-72bdf5670168@redhat.com>
Date: Mon, 6 Sep 2021 12:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903155514.44772-14-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17.55, David Hildenbrand wrote:
> Let's enable storage keys lazily under TCG, just as we do under KVM.
> Only fairly old Linux versions actually make use of storage keys, so it
> can be kind of wasteful to allocate quite some memory and track
> changes and references if nobody cares.
> 
> We have to make sure to flush the TLB when enabling storage keys after
> the VM was already running: otherwise it might happen that we don't
> catch references or modifications afterwards.
> 
> Add proper documentation to all callbacks.
> 
> The kvm-unit-tests skey tests keeps on working with this change.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/s390x/s390-skeys.c           | 65 ++++++++++++++++++++++++++-------
>   include/hw/s390x/storage-keys.h | 63 ++++++++++++++++++++++++++++++++
>   target/s390x/mmu_helper.c       |  8 ++++
>   target/s390x/tcg/mem_helper.c   |  9 +++++
>   4 files changed, 131 insertions(+), 14 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


