Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F25042BC35
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:54:24 +0200 (CEST)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaxr-00008L-22
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maawW-0006AV-BW
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maawU-0005Px-PI
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634118778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNxLbT06giX8ydSZu5qMvUqIX5PNs+OBjgPicu/4xek=;
 b=XzNcBbFJPJjPIOrijyqRSBU25CikS31bC8fV7kY4aSYud6DozDIrub/Dk97OWPJ6x0b6yK
 y/lnnYx3j0QDpuHNa4Elon/iAUtInAii33PdJ1Hii3tQblwLqqMF4zmOV/XHJgl2/Ntz3d
 h6gIiZJkLZUryuMXmY3jfIA0/sikdXI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-rPw55VZ_MlKeBrIwyt3OcQ-1; Wed, 13 Oct 2021 05:52:56 -0400
X-MC-Unique: rPw55VZ_MlKeBrIwyt3OcQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so1522027wrk.12
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KNxLbT06giX8ydSZu5qMvUqIX5PNs+OBjgPicu/4xek=;
 b=XFid7u+kdgL2+WPquuJa2HJg30os8G/kcARuPv5chbXNozmfLmM+hW1QbgQ1tuP8+W
 j2kyMyyifXbWgZ2Nq3IWqswUA26NJzRi6lXcfla8m42cqZKk9vdJBGPb8EHjbb74ldoi
 x4ev4BZn/ctjZ3p8FyUuDldwO71Nw2IVbZ5BKsCXrNvYWS2A8wm2tvhndur/EtSpZw5O
 STA/ndObLVQg51YVVLgutJd9Id1Ij/ACGWt97ssLjfrrQzVTQdeDI1Gv+2h4qxEDQH4z
 qNGfVHBFr5HsZnWaVZ0PGwCuIvGKkJNuxVHXl73MfXk6gsan8wqEl51Gq6I1lzEUaWpw
 h75g==
X-Gm-Message-State: AOAM531nOKeUNe1Z+kd+tOSEtjlJ/6X9nvCD3d9VyjTJ3dPiPtWICP6F
 kLf3A9Tt9lUxUUtnQj1SuvBQNlsDDXiL1+ZHvyZt4deke7xxxCq945OScmYDSAct+w2yhfDY1RF
 jf0qvIPtLXqcl9xo=
X-Received: by 2002:a1c:a9d5:: with SMTP id
 s204mr11739857wme.193.1634118775717; 
 Wed, 13 Oct 2021 02:52:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFOmaMcd80h9JHY5rkU+FHnL/B7adZM0aUF59dmkIGfgFD0Py/uD+nLFakRksjdDGFKsMQfg==
X-Received: by 2002:a1c:a9d5:: with SMTP id
 s204mr11739845wme.193.1634118775552; 
 Wed, 13 Oct 2021 02:52:55 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id v191sm4954319wme.36.2021.10.13.02.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 02:52:55 -0700 (PDT)
Message-ID: <dc78b45d-9026-9763-62a4-488abb7332b4@redhat.com>
Date: Wed, 13 Oct 2021 11:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] block/vpc: Add a sanity check that fixed-size images have
 the right type
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20211012082702.792259-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211012082702.792259-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.10.21 10:27, Thomas Huth wrote:
> The code in vpc.c uses BDRVVPCState->footer.type in various places
> to decide whether the image is a fixed-size (VHD_FIXED) or a dynamic
> (VHD_DYNAMIC) image. However, we never check that this field really
> contains VHD_FIXED if we detected a fixed size image in vpc_open(),
> so a wrong value here could cause quite some trouble during runtime.
>
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   block/vpc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block/

Hanna


