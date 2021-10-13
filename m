Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD042B94F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:37:29 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYpM-0002x2-Bo
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maYn5-00013O-P9
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maYn3-0007sU-Ld
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634110504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/odJWlhlcv6zmZuiJKjpXNeRyNlVZ/Rin8j8eeKaJA=;
 b=S0ryUdtHtzQZIQQXnkSXeO0h5j+QgSFeicTWdeMVBvHLCpWB/c+ShszdbvypEE/GEU2YFt
 QClV3wRzhkGl3mfKX5vnvI0UM+7dj/cjOhIvTfalYaIl82b84dNZlfSP8X3IDitTrFqqs5
 bEd5ESUa0oGyJ8r8514wZF7H+EVWHTk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-ZFM43vwDPBySZLxG4vbSOw-1; Wed, 13 Oct 2021 03:35:03 -0400
X-MC-Unique: ZFM43vwDPBySZLxG4vbSOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so1244443wrb.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y/odJWlhlcv6zmZuiJKjpXNeRyNlVZ/Rin8j8eeKaJA=;
 b=G52jkCodxcbvYJGVO3ed9TXOebwrXJPX7WXqyZOwlsPF5mNeaY0dxdqET6QeZY5v5M
 YnqsAamPge7HCzX91ratEo+aR2cdiggHuUlrs1z03GKf+ZqQVt7oCG/+IJfP2d44KtIE
 ZVIgoLDn3G7zav9AMbzPIS9YwSpwDrRqmhDJwkphPW91tV2uAIQbAIZBPW20HagL0KrR
 jb8k7PL894R/fzTpMGtkijX5erEY/ebvaJPS3o34pNctY0TuTUjwaYB3AYG7Dj5brbPR
 bGIs2iWTGxMYVlVn1adXz5+TZexGEJA64l9PSlKbB/mYo2ZfOTke6x3UScgDFgCauVyI
 tXjA==
X-Gm-Message-State: AOAM531DK7O5gLZyYPp4gXE06ei09mvztBOJbk68exw2TQHUOJRI9cmj
 ZRxVpWPBwgkoAJS3rogGjw338BU8qfMKVpW3vqxYWBVPST/NF7SOtSqyrUE0+CeJDepI9daeoM5
 JkhKqC1V0PSvcfjw=
X-Received: by 2002:adf:a390:: with SMTP id l16mr37579430wrb.291.1634110502201; 
 Wed, 13 Oct 2021 00:35:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz90UZWZY9uETi4eoBGw9wyeBQl9jwSBGm2+x4AWWWkgzVE3QmhDjWRIMxrydxwWaoQFEA9yw==
X-Received: by 2002:adf:a390:: with SMTP id l16mr37579408wrb.291.1634110502025; 
 Wed, 13 Oct 2021 00:35:02 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id j13sm3488466wro.97.2021.10.13.00.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 00:35:01 -0700 (PDT)
Message-ID: <03222158-e27e-2a6b-713c-f4542db75a2c@redhat.com>
Date: Wed, 13 Oct 2021 09:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 3/7] python/aqmp: Remove scary message
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <20211012223445.1051101-4-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211012223445.1051101-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 00:34, John Snow wrote:
> The scary message interferes with the iotests output. Coincidentally, if
> iotests works by removing this, then it's good evidence that we don't
> really need to scare people away from using it.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/__init__.py | 12 ------------
>   1 file changed, 12 deletions(-)

Acked-by: Hanna Reitz <hreitz@redhat.com>


