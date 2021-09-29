Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358341C0A8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 10:29:28 +0200 (CEST)
Received: from localhost ([::1]:49360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVUxz-0002Za-Cq
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 04:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVUwE-0001CU-7n
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVUwA-0004Sm-R6
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632904053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JK80QiRkp9DfSYaoajSkIpKcWjbC0I7y2mRBAX2sFwY=;
 b=biRHtx3Y7vO8lsDk/lDqC/Q3PTaSI/lOk0obpVTO4kz+NxdLf3+Pia18p+vshkmFwQi+zP
 lENjooaOPpuupCTJf7nOOZg1ExDnOwUePSYpJbs6gmR8bvSWtCEkfxnfqrHoQDqeJWOsF3
 renr12lRaWAZehrG8bfLZ5L1OGAH4oQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-V1YDhjErOamkdUoVUuc_SA-1; Wed, 29 Sep 2021 04:27:31 -0400
X-MC-Unique: V1YDhjErOamkdUoVUuc_SA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h25-20020adfa4d9000000b001607d12a0b0so141669wrb.21
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 01:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JK80QiRkp9DfSYaoajSkIpKcWjbC0I7y2mRBAX2sFwY=;
 b=tOBn2I5CTEUhM/coGnlok2IUkHf/1D0IylSYgubtf9KTmhKQIynZN5MhKRQVwHXvBb
 t+KgTpgYyPPMay/Q4htiQQiifhs0EMX2TBQ+E1au8l9RWagsUjIT9uGGR8FSt+Q8eGOd
 UkSW9fjTql+OstqtRNa8nIN+vlrikvdPOHxS01LERy1QAm81I3ulARkLw1reZKvYC9rS
 oJTaF3h+q8weTUf9ND8qWYxO2KK0/KuZaUt163oCCVKG35meGMUIt42Auu/0ygb5Jx3A
 Z6vpNB9h5j/FTENG1tfsHO/VjyWa978e9FEHcBZmv5fG1WNchsAPQW8Z+NDWpzKvuDC/
 EBDg==
X-Gm-Message-State: AOAM532OX0IG1psbFeUqYlngbEi0uh7pFlKo8cHOBfINodAhkHDV/CIJ
 +RHl+j+LkWVxeYzQ8EEgpyoA+aPl5JCH6C0jqnJIlENEVyB9Wch54jRKXc6y7mik1s42EPvo5SU
 +s4I5fsYiXx/RMdw=
X-Received: by 2002:a5d:6506:: with SMTP id x6mr3491241wru.255.1632904050697; 
 Wed, 29 Sep 2021 01:27:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZHJz8cGPNZ47HBiPeM1B03atzmM8OA588d1PtgmFWrlWcASJx3jM7QWvtbq54MzI55AfoPQ==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr3491228wru.255.1632904050567; 
 Wed, 29 Sep 2021 01:27:30 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d16sm826703wmb.2.2021.09.29.01.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 01:27:30 -0700 (PDT)
Message-ID: <c7312892-33e3-6c70-b85c-7893cc1936cc@redhat.com>
Date: Wed, 29 Sep 2021 10:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210929025816.21076-17-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 04:58, Yanan Wang wrote:
> Quoting one of the Rules described in include/qapi/error.h:
> "
> Whenever practical, also return a value that indicates success /
> failure.  This can make the error checking more concise, and can
> avoid useless error object creation and destruction.  Note that
> we still have many functions returning void.  We recommend
> • bool-valued functions return true on success / false on failure,
> • pointer-valued functions return non-null / null pointer, and
> • integer-valued functions return non-negative / negative.
> "
> 
> So make smp_parse() return true on success and false on failure,
> so that we can more laconically check whether the parsing has
> succeeded without touching the errp.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Thank you!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


