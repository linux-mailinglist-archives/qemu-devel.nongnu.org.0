Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2E392668
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:30:55 +0200 (CEST)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7fa-0002Tx-3b
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm7dY-0001nc-54
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm7dW-0000V3-Fp
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622089725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wI2FOzI1rxKE8YRkij0Di68pNkm8myTsTVoRe+8zglc=;
 b=eW17YFTOr7A4mCW0ZC6L6uz0hQkpP0IXQ16CL6uGh0lbHsfJtrey+cS5FbC5vdidN2CW9u
 nWyLbRrj1Nh0cUpD5Y3LXjudVTU7r0nVdTnNfb1Tt8VfN+MR6sMRRjMSi9z9w7IcGWpjtK
 oy5X0Z1dOeXN+RSuFyU+sfXnOAAowvo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-G9J81PWXP0SD6OB9pHQS2g-1; Thu, 27 May 2021 00:28:43 -0400
X-MC-Unique: G9J81PWXP0SD6OB9pHQS2g-1
Received: by mail-pf1-f198.google.com with SMTP id
 t20-20020aa793940000b02902e8f588ec26so2064987pfe.17
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wI2FOzI1rxKE8YRkij0Di68pNkm8myTsTVoRe+8zglc=;
 b=frC5xdhbWp1AAUl9fuI7PKTP+gt7n8FvKREcgm9SEAhqoNgyqnJh87Ut7WZOhuFRTl
 6u/FuRGzkrEuZz+sh8cvNJf1NxTbcrLm6Roo58QEeIakfoKTo+KoK29dMqE7qdeTIaZ8
 xYxN5vdSyajudFPIqTi8kPcXDY809o4GQsbR0hvRQI11JOK3FBDFYg/zLJo2fnsywtq6
 TNerLejdCoztoa2I0Sz4N5UT6tn9kJ8S/c4WbZ286DoQ0yZinZIAv6iDqAZy7tVUFFc6
 kLoaIyj5qgDX6B3XsXZYzC2Bdib+EYYJk2nCgDy7GpALsW4fJCbFw0lrG6pr9H4kYukx
 B+PA==
X-Gm-Message-State: AOAM532Ui4Z0/wxVK5BnH1vXc85xuzjSDDTXFj+SAgAc7B+ce9+5raY2
 dAgDkIGNsob9jFzNC/FpK1iWQiBW2gV2NFlhhO9uqOcXlHv/Y04wQGu1hl0mOSBopQ+cyLlyWXl
 yEAXOqyf2eFg1pfM=
X-Received: by 2002:aa7:8c59:0:b029:28e:9093:cd4d with SMTP id
 e25-20020aa78c590000b029028e9093cd4dmr1860384pfd.25.1622089722240; 
 Wed, 26 May 2021 21:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzApZwK9mwpf6zaN55PFFPgjWYdly+Ngyf9q66VsJj1zIqfp59g5+YUPSjgOVnfcGOXS2JBg==
X-Received: by 2002:aa7:8c59:0:b029:28e:9093:cd4d with SMTP id
 e25-20020aa78c590000b029028e9093cd4dmr1860367pfd.25.1622089721964; 
 Wed, 26 May 2021 21:28:41 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p30sm632108pfq.218.2021.05.26.21.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 21:28:41 -0700 (PDT)
Subject: Re: [PULL 1/3] hw/net/imx_fec: return 0xffff when accessing
 non-existing PHY
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 peter.maydell@linaro.org
References: <1622017492-7770-1-git-send-email-jasowang@redhat.com>
 <1622017492-7770-2-git-send-email-jasowang@redhat.com>
 <7a56c641-4c32-44a1-2a28-37c9b4846f42@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <729a5862-5514-00e7-47d7-2112bc066266@redhat.com>
Date: Thu, 27 May 2021 12:28:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <7a56c641-4c32-44a1-2a28-37c9b4846f42@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/26 下午5:08, Philippe Mathieu-Daudé 写道:
> On 5/26/21 10:24 AM, Jason Wang wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> If a PHY does not exist, attempts to read from it should return 0xffff.
>> Otherwise the Linux kernel will believe that a PHY is there and select
>> the non-existing PHY. This in turn will result in network errors later
>> on since the real PHY is not selected or configured.
>>
>> Since reading from or writing to a non-existing PHY is not an emulation
>> error, replace guest error messages with traces.
>>
>> Fixes: 461c51ad4275 ("Add a phy-num property to the i.MX FEC emulator")
>> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>> Reviewed-by: Philippe Mathieu-Daud茅 <f4bug@amsat.org>
> Mojibake :/


My bad, v2 sent.

Thanks


>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/net/imx_fec.c    | 8 +++-----
>>   hw/net/trace-events | 2 ++
>>   2 files changed, 5 insertions(+), 5 deletions(-)


