Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB62403CE3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:53:23 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzt4-0004DU-KK
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNzmD-00014P-JH
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:46:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNzlz-0003kl-V5
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631115962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGVFhY6JhFtdJSkQ4805m6I+AyM6lpy1IEZQu2gMkzs=;
 b=MirXdaH38N+3plbN6tkOixxNsyZcwhXnUU1eVrWjJ1rbj44BohhGhv6D2oHqWFTSyjNitN
 W5TSsxCBZpH8xemFuNq4ooIlUKTqYc8XG2wSEQx+nz/E8nUsvyIxQK7EKkw0EfuvyYc97s
 pwkZbqwTtUXJDnjQvmJGjJS0iZ3nADs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-iKOyvfsLOqWjDtcdzJapCw-1; Wed, 08 Sep 2021 11:46:00 -0400
X-MC-Unique: iKOyvfsLOqWjDtcdzJapCw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso631646wrw.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rGVFhY6JhFtdJSkQ4805m6I+AyM6lpy1IEZQu2gMkzs=;
 b=FtR82V2GkZzL45GuyG34XHd7eSGyn8nioFy/8uVOPbI+kh2r50UI8sOklxB+EXCw3t
 /4yApq4BWRMazrU4BlC37NUfWrUgkn2NZm9gcrLQdrEMz9Y0885cwult3iJ2InSl2zYi
 m5lgGCZV2E+pDqwI3DzBxf9dJ+/tsT1EtJPp0cNft2gOXL76g7p0m5v/lasovtzGMhdY
 2Y7soEBiVTk3YxsDurJXl+KEYAmriDAcHoJS5cmdrWmY9t4xrdfC8DX5RqADEVQsOi+j
 DROVgfn/hDabdA5mYXzeiL9JeoT4wSNYkkQtnb2JGameyiLCPKaSXsqCuTITG6z/dlQJ
 meVA==
X-Gm-Message-State: AOAM530SiLcc2jPbGJCPaF7ER9J4rDsD04+hVi3nKzY7yMPvsGIDcTtF
 D1ouTCFX4cpeWm1kA4hMF5o0YNCWLH2+mimo5Od7sE4vKGGlwf1r0dNFZX8uquFmTB7j3ftqXuk
 GGn2lm58fCGbk/aw=
X-Received: by 2002:a5d:634f:: with SMTP id b15mr4727253wrw.220.1631115959714; 
 Wed, 08 Sep 2021 08:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY/gpZL7/jOjrZjbb52R+ozENvBCGnxB9G4Bo94gy+IVQdoRuT7LVTuy+WlVGqi5MFi40WvA==
X-Received: by 2002:a5d:634f:: with SMTP id b15mr4727231wrw.220.1631115959567; 
 Wed, 08 Sep 2021 08:45:59 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s13sm2444173wmc.47.2021.09.08.08.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 08:45:59 -0700 (PDT)
Subject: Re: [PATCH v1 4/4] tests: rename virtio_seg_max_adjust to
 virtio_check_params
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
 <20200129140702.5411-5-dplotnikov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a695ab4d-3fcd-f4ef-6a9d-b14d1df80fa3@redhat.com>
Date: Wed, 8 Sep 2021 17:45:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20200129140702.5411-5-dplotnikov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/20 3:07 PM, Denis Plotnikov wrote:
> Since, virtio_seg_max_adjust checks not only seg_max, but also
> virtqueue_size parameter, let's make the test more general and
> add new parameters to be checked there in the future.
> 
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> ---
>  .../{virtio_seg_max_adjust.py => virtio_check_params.py}          | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename tests/acceptance/{virtio_seg_max_adjust.py => virtio_check_params.py} (100%)

Old one... reminds me of
https://lore.kernel.org/qemu-devel/20200129212345.20547-1-philmd@redhat.com/
:~(

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


