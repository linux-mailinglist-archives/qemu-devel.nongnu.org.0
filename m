Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6979D408B37
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:42:00 +0200 (CEST)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlHb-0001lb-CK
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPkdC-0007V5-Kx
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPkd8-0007Qz-Nl
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631534409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aB+gRdh8pq0s258i1su1ru8qCrSfm9wn3WLbLIPDC8s=;
 b=WTK3nI5TIyKoFGUYEjIQJCVh/+4MBpQF+YLCsVYvdASkJaJM5QCeSCWIPtHmmvk9o9DcGT
 wPcM3U6hsGU+filVXLpWqq7rGVrVndVfLLk2oj3hWETmK49Ssz1rmB3WqptRQ5RXNMXLuo
 SorXmZDvfC0MM5iKJWBESy5p/gnQaRc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-eUaT-1kYNdK7q4b3428hag-1; Mon, 13 Sep 2021 08:00:08 -0400
X-MC-Unique: eUaT-1kYNdK7q4b3428hag-1
Received: by mail-wr1-f71.google.com with SMTP id
 i4-20020a5d5224000000b0015b14db14deso2576039wra.23
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aB+gRdh8pq0s258i1su1ru8qCrSfm9wn3WLbLIPDC8s=;
 b=SuadDxPt9hgV/Q7r+R4cofoVAPm3ca+h392zC82vuJEkKvd84M/dgmbYOXAltMJ38O
 g0idXsS9KY40DHaY0MN620u05RF18KMJmb4Yg+0naMgQVJUjhH9UdlZnr5hi7RmdGo9I
 scA8QYAe+i7WoZTOOSjGCu1mhf+sP5qNzInIxEHAWtsHcq7x00dKAtG4LNFjftqvTcPG
 7WDAHLOl1Yaex/U9N/JWr1tMDXCNAPZTW0DvtSwoqoQbEEk4SGxTW3x5VSrJQxDHc4S+
 SXn7N4XiC4IOv+YWrXji+0RELtTCOHCpUoNH88Vg4lnPNQ6ryMxTkmV7zR3opgrnztoX
 /bFg==
X-Gm-Message-State: AOAM533Q7Uzk6cRerCCXzrGziJtj5HnRQeyKuAzEUTPcWbA5wS9leDau
 qZ0k0cI/rsVze6zqctbxy/OAk6lh/etsMX6LgODHsY3Upsfc82lQoP8NMfE0xZcqN/vJMzg0oSQ
 tX7NcCfRNSY7PA9k=
X-Received: by 2002:a5d:5903:: with SMTP id v3mr9177088wrd.232.1631534406722; 
 Mon, 13 Sep 2021 05:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6IcZPfl0M4BEg5sPP0Wd5XY/RFcxUzki6uMgpkFLH1IHYdk1KZiqjMcqLI5MNuDuNXHfdqA==
X-Received: by 2002:a5d:5903:: with SMTP id v3mr9176862wrd.232.1631534404417; 
 Mon, 13 Sep 2021 05:00:04 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id y4sm6684882wmi.22.2021.09.13.05.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 05:00:04 -0700 (PDT)
Subject: Re: [PATCH v2 08/17] iotests.py: filter compression type out
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-9-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <8aedae6e-ad7c-1bf5-d24c-36f20a47cfd8@redhat.com>
Date: Mon, 13 Sep 2021 14:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-9-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> We want iotests pass with both the default zlib compression and with
> IMGOPTS='compression_type=zstd'.
>
> Actually the only test that is interested in real compression type in
> test output is 287 (test for qcow2 compression type) and it's in bash.
> So for now we can safely filter out compression type in all qcow2
> tests.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/206.out    | 10 +++++-----
>   tests/qemu-iotests/242.out    | 10 +++++-----
>   tests/qemu-iotests/274.out    | 10 +++++-----
>   tests/qemu-iotests/iotests.py |  2 ++
>   4 files changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


