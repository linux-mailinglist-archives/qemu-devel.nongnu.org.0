Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0291ACDC1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 18:33:00 +0200 (CEST)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP7Ri-00050v-OG
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 12:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jP7Ph-0003s4-Ol
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jP7Pf-0004Q8-61
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:30:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49353
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jP7Pd-0004Oz-IH
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587054648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtFf1T/H68GgQAJdcnp6BaBE6PWUnUnDoWKFMTuQTX0=;
 b=biIMZhEvMvAB+P/qdBLRcVtuA72JcvBBdqxqjxR0vRIWfHvIRdTRnqALBVwXfVlRiGEtj9
 5nG7jur42TvUvrDQZ0LQR7MxI+0T1cExIXID8b9phj/2tEgr/kl01RSyhvfynPAVCgIE17
 6elu2IX2wKTj+u1iV4RI+oDgnpUAUMU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-1kXs39MYMLOePCXb8g46YQ-1; Thu, 16 Apr 2020 12:30:44 -0400
X-MC-Unique: 1kXs39MYMLOePCXb8g46YQ-1
Received: by mail-ed1-f70.google.com with SMTP id c2so5408331edx.16
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 09:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mtFf1T/H68GgQAJdcnp6BaBE6PWUnUnDoWKFMTuQTX0=;
 b=C2tqGb6UG50sgWqsurUj452vjjeZQ9m6hYAh/LPSc1N5KuiXCjmbXP2EaselaE3LAr
 PrUvaN61EKd9XBFIiAM10sTo7hudlt7BPgaIuEgG0W6Q5Pyz6F6W9Mc4LKtvxMW7w5oh
 WcLj27PlEWIagVutv4JU4mQ1+od2VxpEuQXuzzVy/WwhDvKLbAJsAcfBVphno2Yg+muQ
 ykmTs2TI+669Gzy9owt3B36kAGiJmn+01gso0iqRxll7cJF9MZn2R9fzQvLoSVE+kX3v
 QpojLEK2dYD4AABQfcGISpzxI64Zwx6Wl4qSPkUxZPezgw9Coubyprp9qkuF/9Ky6Yjh
 GuWA==
X-Gm-Message-State: AGi0PuYf+oXMOw0MAhVsd8UAf3USD+dXKdxH+Z/tMeqv+zBJ2jkb2kaM
 wPB1+DVfnI0zyEwNqcvta+NoIq8zLQJImsvWJlThbHhooSRaDYzfN1qcncXKmhhNGE6N/ltwHwy
 0WPeEiwemUDwretI=
X-Received: by 2002:a17:906:30c5:: with SMTP id
 b5mr10882831ejb.102.1587054643264; 
 Thu, 16 Apr 2020 09:30:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypI783bhpx6CO8bEAy894aKDX079CAHV3iKkGFo/+ysOM7FosLEr0/cHVBFLGYZ7FPXMFjN1Ig==
X-Received: by 2002:a17:906:30c5:: with SMTP id
 b5mr10882817ejb.102.1587054643054; 
 Thu, 16 Apr 2020 09:30:43 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id c19sm3101678ejd.48.2020.04.16.09.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 09:30:42 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] dwc-hsotg USB host controller emulation
To: Peter Maydell <peter.maydell@linaro.org>,
 Paul Zimmerman <pauldzim@gmail.com>
References: <20200329001705.15966-1-pauldzim@gmail.com>
 <20200329001705.15966-5-pauldzim@gmail.com>
 <CAFEAcA9bL=uZ3-F4bYbHW+V9REnS1OnSusGKB2UoHS0bjSbvzA@mail.gmail.com>
 <CAFEAcA-nysMVx1-xukuhaUCWaH544+2_J8AtUMru2hsyv-hPEQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7830b8bd-efea-4987-3727-165385e6dd25@redhat.com>
Date: Thu, 16 Apr 2020 18:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-nysMVx1-xukuhaUCWaH544+2_J8AtUMru2hsyv-hPEQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/20 5:47 PM, Peter Maydell wrote:
> On Thu, 16 Apr 2020 at 16:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 29 Mar 2020 at 00:18, Paul Zimmerman <pauldzim@gmail.com> wrote:
> 
>>> +    s->as = &address_space_memory;
>>
>> Ideally this should be a device property. (hw/dma/pl080.c
>> has an example of how to declare a TYPE_MEMORY_REGION
>> property and then create an AddressSpace from it in
>> the realize method. hw/arm/versatilepb.c and hw/arm/mps2-tz.c
>> show the other end, using object_property_set_link() to pass
>> the appropriate MemoryRegion to the device before realizing it.)
> 
> On closer inspection you're already doing that with the dma_as/
> dma_mr. What's this AddressSpace for if it's different?

s->as is not used, probably a leftover (s->dma_as is used).

> 
> thanks
> -- PMM
> 


