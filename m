Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92333D0114
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:59:28 +0200 (CEST)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u1f-0004Ia-OY
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5tzg-0001xj-MX
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5tzf-0004Fd-A6
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626803842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQG0BUVkDdTTYymQ/OiKpAvgZE/odRiWGSebNjuepYY=;
 b=FfKY8N2ybCM7ui/YUpd1KtI9HLRwEirIgMhzs7iA6dc2fVd4/rHHvxfW8P2hf1si8FInvD
 XLDcL3gDmmg60dnjTYBTqKLAHoVLl5ogd9ycdbY8lvMU3G9eijdDImkd0ZddmX6vJDQYzx
 3pkg/7IS2QxUng5jFMsZncATiz4CVXU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-BESho54RM5Gjea3iXi2iwg-1; Tue, 20 Jul 2021 13:57:19 -0400
X-MC-Unique: BESho54RM5Gjea3iXi2iwg-1
Received: by mail-wr1-f71.google.com with SMTP id
 i10-20020a5d55ca0000b029013b976502b6so10641994wrw.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 10:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQG0BUVkDdTTYymQ/OiKpAvgZE/odRiWGSebNjuepYY=;
 b=d+noL0lSsy6Q4ew2WkzxRJGfTSy11GB7Q7bydvXJ2Vcc/Apb1G7RhIS6mETGknaVVY
 pNloCLLb2rWHTOXFGm86x46e/hMlslWN9PfSnZ5deMzHKTr2m+/Ats+HM9HZYi3/G/SL
 PjaVM+4wxtvzIVX3LzwDfKZgBwsHvCZ/vcHNXh9QNmFafLwPFd+dpoyU/SVwB0vdXuZ8
 wv6RSC6IzTiFNLkTrvq3etypgPws0q6Tf7AyJnlS2QPrQpNA21qbViGwlPWqYYoZ1Y+N
 8SdQwKt+NxlrHli4U4uBMlgQb3eEa11wYaUAqr5uIR4hRK41UTUDcEOqHQkIjH07OIdf
 p+WQ==
X-Gm-Message-State: AOAM531QHGZR83sANZEpnYn9HouevJrYefq/nQpXaxHE/4YpiViSEDWX
 W3B14U97qI+8gEhT97xpk0tOnL+5tOBaFft0aZuIUKbNLWiqZgZ2sqER5mPvlTTYZ34BY1gqQPC
 3HgD90a/dxoz4yvM=
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr19498426wmp.184.1626803838268; 
 Tue, 20 Jul 2021 10:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcrvemOq4OqiHoXJt4rBt7+u7RW744xAkniU0bWwZB7qJhgD/zmEVK1Jrds5UBzfac0jC63Q==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr19498410wmp.184.1626803838145; 
 Tue, 20 Jul 2021 10:57:18 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z6sm11637373wrw.9.2021.07.20.10.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 10:57:17 -0700 (PDT)
Subject: Re: [PATCH v2 02/17] iotests: use subprocess.DEVNULL instead of
 open("/dev/null")
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210720173336.1876937-1-jsnow@redhat.com>
 <20210720173336.1876937-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4c147900-ac92-3317-3a39-e40e5eaeb6ee@redhat.com>
Date: Tue, 20 Jul 2021 19:57:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720173336.1876937-3-jsnow@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 7:33 PM, John Snow wrote:
> Avoids a warning from pylint not to use open() outside of a
> with-statement, and is ... probably more portable anyway. Not that I
> think we care too much about running tests *on* Windows, but... eh.

But we should IMO, because the community expressed some interest
(see the increasing Windows fixes over last year and CI added).

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


