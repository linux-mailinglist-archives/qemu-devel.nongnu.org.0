Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80B55C109
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:43:08 +0200 (CEST)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AYd-0004q6-2m
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AW0-0002iO-Lo
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AVT-00018i-1O
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656419975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grVl6Ac35MUpg+tMzRSYueGRW0+9qZuDiiMAOIX3yws=;
 b=DiJVncsxT5OC8JLkkD+sAg41k2nCdjppeqGUlItZdEuYoMZx1/vJRHMQrsf/am290jb4yY
 80bAgvKMHRhZvlq7moJoHwTc2LnVewHO2k/VSPsIVbo/fu7Rq4CqKX6otg+wm4wicROwgN
 Yw2AwD4Ntkqff3d/4WWx7ZZxIA9AZy0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-9I5IFQpaMp2ZXCjm3NUNKA-1; Tue, 28 Jun 2022 08:39:34 -0400
X-MC-Unique: 9I5IFQpaMp2ZXCjm3NUNKA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso1761248wrz.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=grVl6Ac35MUpg+tMzRSYueGRW0+9qZuDiiMAOIX3yws=;
 b=Ro5M/y/l5itT4GaXsUwlm7XhReXbr54yVdNkUDB1bQX/XJGy/m9QBf2cL26ImD+Pa4
 m5+fU+zEMSXsAInD0+mX2uyRZ3IRQ67rmof21z0Zmfs8jpru3JJop3MH2qKZpSh2DZPb
 cvO4+9BXsbkh7Vwl/jG7x1J561gZqvfIndM8uu8g6AHw3WeEoZsJ3bX11bqq7b9ebStw
 TwYkERAjzGJ/4Kt/exPHt1xhQ1wlqRqK3SAi6FxKqqbYFErgc4mezbkxCkYk7ynxE3pX
 NkbIIntHrlFyVOfNfkbTFaZRNnvO+WhUSk1RI/enALvqZzJtELZZPOg1Eh5AY4KKwCJb
 tZ4g==
X-Gm-Message-State: AJIora+H4RBHhAz9WAmm9B9059noXRt+iw+DKPM658u4ErlJvUiF3J8X
 XJuUIXqtYDUGQSftv+h3ar60eQoCzl0dJrl3P5jRi7C8Ziznfb3+qBG1oHWM3il9RdOBdWJvOQW
 LPo68h8QG9YLOCZA=
X-Received: by 2002:a05:6000:18aa:b0:21b:946f:94d8 with SMTP id
 b10-20020a05600018aa00b0021b946f94d8mr18051532wri.259.1656419973305; 
 Tue, 28 Jun 2022 05:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxzd2cxIm3eU5v7pGCAp1VCKiDSSk+pkoEAL+/E4m6Lyx9BVXI7hhTxXYE+M7T9a+t3wc+3A==
X-Received: by 2002:a05:6000:18aa:b0:21b:946f:94d8 with SMTP id
 b10-20020a05600018aa00b0021b946f94d8mr18051512wri.259.1656419973125; 
 Tue, 28 Jun 2022 05:39:33 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c158400b0039c457cea21sm16039060wmf.34.2022.06.28.05.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 05:39:32 -0700 (PDT)
Message-ID: <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
Date: Tue, 28 Jun 2022 14:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Why we should avoid new submodules if possible
In-Reply-To: <20220628070151-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 13.14, Michael S. Tsirkin wrote:
> On Tue, Jun 28, 2022 at 12:50:06PM +0200, Thomas Huth wrote:
[...]
>>> Come on, this is just a test. We *really* don't care if an ISO
>>> we use to test ACPI is using an exploitable version of grub.
>>
>> Wait, I thought we were only talking about tappy here? The ISO binaries
>> should certainly *not* be bundled in the QEMU tarballs (they are too big
>> already anyway, we should rather think of moving the firmware binaries out
>> of the tarball instead).
>>
>>   Thomas
> 
> IIUC there are three things we are discussing
> - biosbits source
> - biosbits image
> - tappy

Oh well, I missed that part of the discussion so far since the corresponding 
patches did not make it to the mailing list ¯\_(ツ)_/¯

Anyway, that's just another indication that it might not be the right fit 
for inclusion into the QEMU source tree. So either download it similar to 
(or included in) the avocado tests, or maybe another solution would be to 
have a separate "qemu-ci" or "qemu-testing" repository for stuff like this ... ?

  Thomas


