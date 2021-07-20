Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B352E3D010C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:56:51 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tz8-0000BS-QJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5txl-0007bp-La
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5txj-0002u8-8E
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626803722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7AkJRGmSorVPz8oqXG7ByeNiNDybQ/2kCQ/OLkuojE=;
 b=E/KnXwWdDRetRLL2RrusVo98IgWDPmaB3C59ITRejD4ThzYZQyRnYzN3fgNCF6WUWguy84
 L0IkbVO4fANxFG4VeWVjLlR5tKy8M07oqCFRId3LCsePu4KnNx9rpsg5F5ZtYqM0Uhhwlm
 rFqr47lDeaUa9XaNtfrFhmyppkXMfUA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-7jb6wyydOQ-0ACIqKvBT1w-1; Tue, 20 Jul 2021 13:55:20 -0400
X-MC-Unique: 7jb6wyydOQ-0ACIqKvBT1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2314543wmj.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 10:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S7AkJRGmSorVPz8oqXG7ByeNiNDybQ/2kCQ/OLkuojE=;
 b=c3OoRXmFhDLxdGp8YICcjX2gWdKPf1Xac6Wd6gVGy96/33yIOUHXBSAOU5VSrAAD5i
 oAXsemYxrg+Krx+Mv2kcfihOEzcGx6xi5Bicz52lmsLbluhZC72TB1S9DpzZg97N7bPj
 rHYbeESDRh4JKcsQVG7VHmRHOSml6gAU3m+idUgAXuWYULq8o+V412Tkg0K//nPezp0b
 R4K2eCZvaA3b39UUlrrMxVAb5hsuoEnYmYWKqVQsA3nzXLHpRtlTw8RxXGf+ytu4ePb6
 mD3zOEqO7VDNC4+KHCURXlJjRrVFEkvreU7dXpJncqSznfa/hoF0KbCi3wtB0k7WTFoV
 hgmQ==
X-Gm-Message-State: AOAM533rgiySzoouidz76BGs9O59JSGQyjKXua04rBbDvYPpMVjdiHM3
 zGi0wdHLtnXPl5hc2wmViQNx3Vin9JhK9HnKFnxBGLpTiHlerCDa2jUWp75T9pAhLCUaT0MAKfU
 8qSJWqEFVN+offzo=
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr32845842wmi.21.1626803719600; 
 Tue, 20 Jul 2021 10:55:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjA9bmOfopN/5l0NcWRjrQO0ULcaS+jB1Ok+QIcUhUsmiPX2kk13qSHDFH6rYoHp1qLGNkkw==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr32845818wmi.21.1626803719331; 
 Tue, 20 Jul 2021 10:55:19 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 6sm3131457wmi.3.2021.07.20.10.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 10:55:18 -0700 (PDT)
Subject: Re: [PATCH v2 01/17] iotests: use with-statement for open() calls
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210720173336.1876937-1-jsnow@redhat.com>
 <20210720173336.1876937-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cf575519-9c74-5aa7-a14b-c6367c1e1264@redhat.com>
Date: Tue, 20 Jul 2021 19:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720173336.1876937-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 7:33 PM, John Snow wrote:
> Silences a new pylint warning. The dangers of *not* doing this are
> somewhat unclear; I believe the file object gets garbage collected
> eventually, but possibly the way in which it happens is
> non-deterministic. Maybe this is a valid warning, but if there are
> consequences of not doing it, I am not aware of them at present.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


