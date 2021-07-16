Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01113CB7FD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:39:47 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4O4A-0003Ix-PQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4O0e-0004De-RB
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:36:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4O0b-0001Qw-Fd
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626442565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDMS1vrYnTed0WjxAj0gsayvShNtz9Ra75BDxsKnUZM=;
 b=XzAIGh7aBlGV9OvNnKwD6qftpeLZ/bGeE17CVJ7ZAlpJobQsf3i60Oyr84rQgRmcbBxD0X
 oFIit0mbQ0y6O6qtwPgR+ZVf8tak41jw7z/xwoDHNqTRo1n+kDm0tqc8wKbBIcwRrT002g
 gOrLPL/bv4kTW+8aeNJ5Ve+dRdG62TQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-MAnxgUBXPY2GBgIMukV_bQ-1; Fri, 16 Jul 2021 09:36:01 -0400
X-MC-Unique: MAnxgUBXPY2GBgIMukV_bQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o21-20020a05600c4fd5b029023448cbd285so2532686wmq.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gDMS1vrYnTed0WjxAj0gsayvShNtz9Ra75BDxsKnUZM=;
 b=eATN3PHiESjWZwO1/rJQIdg+iOI0a4+uMVq3YRVF9Dje0Dg5ZXfqYYRbwJ+pDybSZw
 WpnaVzdIokBxd04vTWySUQw6N01V7CeCfzyuM079MwzI926hf6peRsO1V0JlXoyRK6N9
 JtC9BhsobZprmgc5aSKbxFmWUPCL7/GT7NYUVp+3fmukVUb3ynBrp+2Klwny85Wb8KoO
 wwZ6JypLeFSOeJUEXmxjCvn8xrLxMQbamTDlOfeiWTMvQPYPaNg71WZ4lDuSM1e74DR+
 yK96XSPGYCQl/SuiqwMizmKIzOFCW3mTtTUbW1VEDH1VtjQteUeGjCqjwluxIjL719zj
 MdPw==
X-Gm-Message-State: AOAM5300VlAwlke3w2vN9wn+Qllb7uoTrcG7YUxcfuxPah/sBNnq5Vmx
 95jhsQ8nV+C/ex4b+TEU9O89fWH2VChuv2VgokLpRazaSk5ecCOb1ZSypK/SPvBKShl6hjvTgnR
 cqsqZuJ41oG79BTI=
X-Received: by 2002:adf:cf07:: with SMTP id o7mr12357718wrj.216.1626442560485; 
 Fri, 16 Jul 2021 06:36:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAA/1ULsRm4mvv9dsK27HAlU6CNQfvdH7TpZjrtES4LKY/R70kY1J7deY0ynoZE7mZFT+GCg==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr12357700wrj.216.1626442560295; 
 Fri, 16 Jul 2021 06:36:00 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 d29sm12515587wrb.63.2021.07.16.06.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 06:36:00 -0700 (PDT)
Subject: Re: [PATCH 14/14] iotest 214: explicit compression type
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-15-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5d63d037-6fca-2efd-12d8-2340239c98b3@redhat.com>
Date: Fri, 16 Jul 2021 15:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-15-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> The test-case "Corrupted size field in compressed cluster descriptor"
> heavily depends on zlib compression type. So, make it explicit. This
> way test passes with IMGOPTS='compression_type=zstd'.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/214 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


