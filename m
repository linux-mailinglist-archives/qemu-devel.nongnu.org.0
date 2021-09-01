Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B433F3FDDDB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:35:34 +0200 (CEST)
Received: from localhost ([::1]:34244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRKv-0003wa-RF
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRIw-0002QO-2j
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:33:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRIs-0002hP-Ei
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630506804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R07ssJ6evm393rirbJSSDK68ddIueLAWdMxKkaPBhLA=;
 b=TUjxJ4kPsCXM9cajRPXPHrvWp32RnAmUUI3eyg3sThJPFcYhibhHkakHjPt35TevBT7U4p
 /X7E0mzwYVg0W2gSy1BcEjk8H7kS0aVxsrin4zXtm1VYr5Bu+Kn1CcJXRlN04hQfcYlc12
 CyTuuVcv6E9TPy2ctlrlNNmUWvAM/uA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-WkZuVYUhP_K21JeFanXKEg-1; Wed, 01 Sep 2021 10:33:22 -0400
X-MC-Unique: WkZuVYUhP_K21JeFanXKEg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b126-20020a1c8084000000b002f152a868a2so2115823wmd.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 07:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=R07ssJ6evm393rirbJSSDK68ddIueLAWdMxKkaPBhLA=;
 b=eJpwy2ejBavuIFDhoYnfH1ApfklQLXOMeB9oUZ09vyiPgdl2uLloY5v6yadBEFXBM3
 6GO2UM5upRs/iWPNP+tRxzHJaTIw40fz35yPVhvFN9qEPEPB5FfdBmEOhrRV5HMt5uSs
 GCzIl0sWwWAjvFTYdPpFC1HnqM3tN6TK4Dra/XXO5U7jh4bFLCnTybv1uXrRshOCqGEe
 0ioduGAzUbykEdvjH2snO58qNsf0obBH2DkxzRAazHgOOo2DcCMVsR5JWMvArbCgOMPr
 T3xl0sq46hwB2GZ+vFhzFaiGH7Pqg8sMJApfqgf+13X/gNgmAp5nTUvLmVtmf/vQsy2N
 s3dg==
X-Gm-Message-State: AOAM532Iwbyz0aB1HLaUUazbUJ+D8/ZwI+p35afsF2XlUH7tw9Jc5BqL
 LsdOsX2yXZO4FwTve1JE+5Zj6SbyTMPF+j/wXj4tUhfxSxklYz8eP8QoBkiwSPjrAtbuEDppvFz
 WHmeaRT5Zrje7pPI=
X-Received: by 2002:adf:db07:: with SMTP id s7mr39103561wri.106.1630506801093; 
 Wed, 01 Sep 2021 07:33:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8s3tEVpZWPZuQAVJvteYgLAftq7r6bGRprmH+GhIHfFsdClrcaBZyV2fk6Q5ftwP1PHD03g==
X-Received: by 2002:adf:db07:: with SMTP id s7mr39103538wri.106.1630506800919; 
 Wed, 01 Sep 2021 07:33:20 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 p9sm5521088wrg.14.2021.09.01.07.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 07:33:20 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] iotests/297: Cover tests/
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210514154351.629027-1-mreitz@redhat.com>
 <7260b639-c50b-c758-0e60-2e36acae35b0@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <0fa5d384-23b6-c370-c124-490a1b200b5c@redhat.com>
Date: Wed, 1 Sep 2021 16:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7260b639-c50b-c758-0e60-2e36acae35b0@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 15:34, Vladimir Sementsov-Ogievskiy wrote:
> A kind of ping:)
>
> Seems that never landed into master?

Yes, that’s true…

I was waiting for John (CC-ed) to send v3 of 
https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00611.html, 
because in 
https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00611.html, 
John was proposing to have it include these patches here.

But I guess there was no plan to change the patches (other than 
correcting the comment in patch 3), so I suppose I might as well. (And 
it seems like John has other things going on, so I don’t want to exert 
pressure by waiting for a v3 with these patches O:))

But I think I do have to send v4, because of that comment.  I suppose 
there can be no harm in doing so.  (And now I really wonder why I 
haven’t done so all this time...)

Hanna


