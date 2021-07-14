Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597303C80FC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:10:43 +0200 (CEST)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3aug-00051W-Ei
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3at6-0004BA-GV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3at2-0001q5-8f
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626253738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cfZWeU0fxR8OWVekrh8SVdsTRJDJS8jAj3M9zzrF5M=;
 b=VE+PykalmxQCsZ2a3s+Aqt20PWswX/puu5uUOMs3oQZP8lu6h0KnTMEiEQ43Pxh3HASH5v
 FnazxzPeq4EqfAPBq18fnmvJLpuWEZs5cgImyI5H5WNLzFmbdTuTdCfLtMbPx+8uc9Jl10
 w1dExul6ccaXmbX7KPQjM28HId521to=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-UrugjoSGOsyP10S4-i7N1Q-1; Wed, 14 Jul 2021 05:08:57 -0400
X-MC-Unique: UrugjoSGOsyP10S4-i7N1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l33-20020a05600c1d21b029021c6168367bso263453wms.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+cfZWeU0fxR8OWVekrh8SVdsTRJDJS8jAj3M9zzrF5M=;
 b=plesemcT+SWL0TYftYKhtIq8JigwIpeV7gmcGA7AxBhnAztDDijnoyrgUa5HBp8av/
 fn62iOR3EvkRiUSO7vtXxRyf9sdJ5EnA66gVYogMBQ0pHh128LkBdW9Duxso22jkwnNk
 zO+DaUMEUshsjrilTwFU3M+inKLGvN7WDOTGg3qroR4gBRnRDp+0YnDPO9WUx+eEjKR1
 QLTvgIrdtSgfleRVw7dCByiYmrrFxa/9HOxupupPg+fQuNfQRqGpdjmYvqV5LmbC699U
 5rpiCNHnhbqNrgloocmExL+ae9RB8mDvbRoncqeGIdI9yGW3zL2bF5raCN0BCSfvtNCf
 2MHQ==
X-Gm-Message-State: AOAM530pU9D6oHnh+yTYFgGcpd9recQI/kInH/cfdT3UsPEx/1qg8idz
 AGVopbrXwBkHanpLm/3zEwZv2ZpqNcDfKmuy+HN69OhyKjxGh0jDRANvpAb5Hp0G1/4bN3GRr6A
 kR2Tg+nlhMBmo834=
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr11780205wrr.92.1626253736279; 
 Wed, 14 Jul 2021 02:08:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXnGSFXC1Tfx0yuYeK4Su6nRRoAekUBYoO8pqMwIu+dPiknbYj76MS1OuTY7WJP/nD/v08TA==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr11780171wrr.92.1626253736086; 
 Wed, 14 Jul 2021 02:08:56 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id r16sm4644540wmg.11.2021.07.14.02.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 02:08:55 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] hw/nvme: use symbolic names for registers
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a686a20f-c003-d972-3de3-32fdd60320e0@redhat.com>
Date: Wed, 14 Jul 2021 11:08:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714060125.994882-3-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 8:01 AM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add the NvmeBarRegs enum and use these instead of explicit register
> offsets.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  include/block/nvme.h | 29 ++++++++++++++++++++++++++++-
>  hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
>  2 files changed, 50 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


