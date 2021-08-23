Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220AE3F516C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:41:06 +0200 (CEST)
Received: from localhost ([::1]:39674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFFG-0007eQ-Oh
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFER-0006lY-DH
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFEM-0001Ib-Vu
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPSnTnUbDrQeN3FhSK/QZa4Xmec0PAXj74jCIRoq5WE=;
 b=VqXAFVgcwlaG9OitPApuTYj/hI4pb6l3ZhhuEjjGBaSUewseLdIosmz9ZIUS5BJJFbT0av
 9BuH6RrJ3tOn82bBgTcJwGgzZJiSLKP9rGw3yPiZXpFFX22088LKSK9E23Ahs+cZkkEkSn
 UAB8sl3Sto6Mxy4UEFgLFEcEq5/DFNk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-wD-_Gf6aPMmSnaEECNFFtQ-1; Mon, 23 Aug 2021 15:03:32 -0400
X-MC-Unique: wD-_Gf6aPMmSnaEECNFFtQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so1299098wrv.16
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EPSnTnUbDrQeN3FhSK/QZa4Xmec0PAXj74jCIRoq5WE=;
 b=AxlJUxPv18SDDtxAGf2krgSu6Gt3O+vff14XaHdgpxWbyLHGGbHn1+57Oun1fShXI2
 79IG15wLFm2LAUDGK6PAJ/Us8xdvRyjbbYhdpDybkCW0n9V9qge/kFBQXlh22DgnJJW+
 cndUfAcoYArPRRXDCx16uONW2cZvk8rW8iH+5r3pvVy89muzNVVviaCy2CkrIH0WshkU
 nKi+JcZM7lf+huUybysVZw+H4vCQEBsLxbGSTsPvHSIsZpsLccylMAq+JoYjOHzs/0Ki
 4XfFeL7K+xU2zHr0uuftKJ/eAmtKSAZNylL97FLvvfy2c4HX8gR9Dc/Edz6OiFDYRVVj
 /aZA==
X-Gm-Message-State: AOAM5307dSDKFvgK1D81JqAyIS1dZl6P1Rzsnpt2OU3uffasKa1XseIf
 l3QhgibREV1dzDGQiQ2T1CAA82/54dRbmlq9AKCNQwU5kY6lsTIbgNtSooq4bbxlxPyzyuwjXpx
 4Yr2vDLtPXbePfHA=
X-Received: by 2002:adf:e30c:: with SMTP id b12mr14977743wrj.347.1629745411781; 
 Mon, 23 Aug 2021 12:03:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcHhm+IFAHwRh3yYDH9NQ69R9wMUWlSQ5bs6Nkk4L0jasiK68+h9M37dC0EXvzPq+IyxHYhQ==
X-Received: by 2002:adf:e30c:: with SMTP id b12mr14977727wrj.347.1629745411658; 
 Mon, 23 Aug 2021 12:03:31 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id f7sm35822wmh.20.2021.08.23.12.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:03:31 -0700 (PDT)
Subject: Re: [RFC PATCH v2 4/5] softmmu/physmem: Introduce
 flatview_access_allowed() to check bus perms
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-5-philmd@redhat.com> <YSPsNA2WW8Sa0LCE@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2160a13d-211d-5e3a-3a07-9d412a257eba@redhat.com>
Date: Mon, 23 Aug 2021 21:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSPsNA2WW8Sa0LCE@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 20:43, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 06:41:56PM +0200, Philippe Mathieu-Daudé wrote:
>> Introduce flatview_access_allowed() to check bus permission
>> before running any bus transaction. For now this is a simple
>> stub.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Shall we squash this patch into the next one?  It helps explain better on why
> it's needed.  Thanks,
> 

I'd even go one step further and squash 3-5 into a single one.

-- 
Thanks,

David / dhildenb


