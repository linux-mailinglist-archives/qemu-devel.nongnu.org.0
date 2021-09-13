Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B530540896C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:53:39 +0200 (CEST)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjak-0000qO-Pj
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPjWu-0005Vu-8H
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPjWr-0005u5-Gf
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631530176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1AhIPlN7WObGHPi6a9hgo1HyBDCBGAv4fjr2k9jCY8=;
 b=PuoVDvVdA/EL8GaRqOvZVDLjnhSXJ2KzIZwnoIVQrjaxR5CJwiMhIaNQIOI4S4nFpkA69M
 QrXC0NxB1RtBhq5FK/M1yTl8VLCUbLQTNpKN1hWBR/5Do0lqtWMsBf2itgixcgeEdRHiUo
 H5HFUkC5Dg0nXyzGf8/7G/P3QrwgB/E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-W37t58yfMdqdnxSCBAeung-1; Mon, 13 Sep 2021 06:49:35 -0400
X-MC-Unique: W37t58yfMdqdnxSCBAeung-1
Received: by mail-wm1-f70.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so1200899wmq.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=I1AhIPlN7WObGHPi6a9hgo1HyBDCBGAv4fjr2k9jCY8=;
 b=EQno7ox7Ioe97hIb8tIR0S/KmUHVIueFmBTZxCO80FLWvN8r3ccjdvl2U3VxfKCB+9
 4UGdDnMpbRKkv/hPxcpFEei3drLX9bdk/qT54Khiu02hxH5QO0ZjIRdb3p4jN3H/WCpV
 E6BKtfjevIke2ypicIGDNWlWsNqY3Ms+qskccDd/etuXWW+zuK5Jq32kMmeDpIm3P2T5
 9KuyTD+tcklPEeeS5E+4vfjpySAC+16iIxofaf3pkwpIML384yP3cDR+9iTyKNSq+Q+9
 +GNbL4HdmpL+5E/OSjzTH1ZADd/fF6boHp/GvUo0Tce8jH5c2TVthZfuzK6f/sBa5Kgn
 LiSw==
X-Gm-Message-State: AOAM533kKEgl6Thga8J45ANEzwU/9SENUs0guIUBEcucNtBloXc/0NEc
 ps7T2ZgnhTGhHCDcJs3yZ/8g9TdRKJ+t1JZpy+iAZs9plFm1FWVc9VFP2L8Wioep3E7zvz7JRiG
 JvSRns9kvkwkVHpw=
X-Received: by 2002:a05:600c:1c9a:: with SMTP id
 k26mr1447172wms.106.1631530174284; 
 Mon, 13 Sep 2021 03:49:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAgbOMMm6Lb/qvfRP1QYo8SitdNpzB4HjXq5wRXjr8GWQYf0+dFg4JFihjwy9+u8h6LzmmcA==
X-Received: by 2002:a05:600c:1c9a:: with SMTP id
 k26mr1447155wms.106.1631530174114; 
 Mon, 13 Sep 2021 03:49:34 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id q7sm1398313wru.56.2021.09.13.03.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 03:49:33 -0700 (PDT)
Subject: Re: [PATCH v2 03/17] iotests: drop qemu_img_verbose() helper
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-4-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <d8d28e9c-64c1-ddfe-d732-b111e69a675e@redhat.com>
Date: Mon, 13 Sep 2021 12:49:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-4-vsementsov@virtuozzo.com>
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
> qemu_img_verbose() has a drawback of not going through generic
> qemu_img_pipe_and_status(). qemu_img_verbose() is not very popular, so
> update the only two users to qemu_img_log() and drop qemu_img_verbose()
> at all.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/044        | 5 +++--
>   tests/qemu-iotests/044.out    | 1 +
>   tests/qemu-iotests/209        | 7 ++++---
>   tests/qemu-iotests/209.out    | 2 ++
>   tests/qemu-iotests/iotests.py | 8 --------
>   5 files changed, 10 insertions(+), 13 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


