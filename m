Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942313F278D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 09:19:08 +0200 (CEST)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGynz-0002xa-MH
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 03:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGymS-0001N9-OK
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGymP-0000BJ-Lh
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629443848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAMEqdq8B6pmYdjgqp0YvXF+7ChCTa9KkwfN9YjcrZ4=;
 b=gKGcvrPPpYvtSmV92lsrn0Zagtlq0OUoGIQTdxB8Fcty9hkRJdw0cOm0zNQ9h6HtU5RMsZ
 aI+KWa1KeqMHY7dcxSUK+1xPJcx9JVXkrzn6hS+rBRYK8mjCF+JvRLtBtVZLfUyA6fMm8y
 jZuw+Vni7FIhw/YvrBmFbts5VHJAEUk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-8M8ldu0NMW2IItmDEHgCYg-1; Fri, 20 Aug 2021 03:17:25 -0400
X-MC-Unique: 8M8ldu0NMW2IItmDEHgCYg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so4441620wmj.8
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 00:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GAMEqdq8B6pmYdjgqp0YvXF+7ChCTa9KkwfN9YjcrZ4=;
 b=RGBsSLf7Y1tO68CyXHxIdpRnGK3h2i1N1woHzMLj8IvOcRlcwY28GYnJubuCkuFACY
 6qur/GqEJS0IdcPjRU2VQGHIjwoVgohkMX3t8lYaIhcMv+B4QlVAi2cmAS2RZ1RRf+4b
 tZVnw+eNxblvGMjpyO/yojKq/Sp1mrplHoZpxpWEmdwC1ZznJeVWMoLzrBKYqOeW7751
 tRdUOhwWhacsT1Yyj9chfX7vQfbWF6pipB6SOawTXqVT5GlIrIxWA2XY88sLdypkLwlr
 QA7UPGC8dCXKsHQgzaYllBGNLxO4O19rJF0p8g6ZrcyR2qR+3u1OmmYj/AiKu34J72Rv
 DZyQ==
X-Gm-Message-State: AOAM530AzuY/KeJuddIIDY5OsW1Xgq7Tu/lQdre+p33iLBLHIc0IT4Yo
 jr3S9axDT0LD8RyK9QVev3FnzNWDtHGyJ1A62k8XNx/nFbUaePN4lM5iUj/oYeJuSXzUcCdzj4q
 RsfihZtyfg8+ToPo=
X-Received: by 2002:adf:feca:: with SMTP id q10mr8156432wrs.420.1629443844093; 
 Fri, 20 Aug 2021 00:17:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw8zrJwPVk30r9Oz+qrys23qa9kQrc9MAdqxb32QjqDIpgriY9r5uGzCPc4EMIzQ2j/Ce2Ww==
X-Received: by 2002:adf:feca:: with SMTP id q10mr8156402wrs.420.1629443843828; 
 Fri, 20 Aug 2021 00:17:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p5sm5560295wrd.25.2021.08.20.00.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:17:23 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] memory: Have address_space_create() re-use global
 &address_space_memory
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-7-philmd@redhat.com>
 <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
 <20210820060703.njdj5pfa3lz66zjb@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccdaacfb-4c3c-33c9-77b7-782a0be4fa58@redhat.com>
Date: Fri, 20 Aug 2021 09:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820060703.njdj5pfa3lz66zjb@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 8:07 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>> This also seems to me to be the tail wagging the dog. If we think
>> 'info mtree' has too much duplicate information (which it certainly
>> does) then we should make mtree_info() smarter about reducing that
>> duplication. Off the top of my head, we could change the code that
>> prints ASes to do something like:
> 
>>            qemu_printf("...same as address-space %s\n", name);
> 
> Neat idea.
> 
> Having 'info mtree' accept an (optional) 'name' parameter to pick an
> address space to be printed would be useful too.

Yeah, for now I am thinking of a match string (for my use cases):

  (qemu) info mtree -a dma # all address spaces matching *dma*


