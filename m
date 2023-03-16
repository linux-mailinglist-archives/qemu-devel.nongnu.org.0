Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410A66BC946
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcj68-0005GB-Hg; Thu, 16 Mar 2023 04:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcj66-0005Fm-LM
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcj64-0007e8-9C
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678955787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgscJDgUHxzaned6KfMUyInvCM1VgLmoELHhZcxPrjw=;
 b=LHbVGGoAYbWsnv6L4z8PJFj/077d/ZT9n20z1vhYfMh/L9EF1EMQPGdAriXukgUcnrOiYb
 rsooZ9asABcByMexLeOg0wsRDJVyqPD+jjzhYtHP7FY09HAOnDU1+KddOjtiW8vKX3fG8x
 V+v1GTVYYexrmK+w3/liBKd6uVuXmsI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-mxweQxwxNZat81qRL8XUww-1; Thu, 16 Mar 2023 04:36:25 -0400
X-MC-Unique: mxweQxwxNZat81qRL8XUww-1
Received: by mail-ed1-f71.google.com with SMTP id
 es16-20020a056402381000b004fa3e04c882so1951663edb.10
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 01:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955784;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rgscJDgUHxzaned6KfMUyInvCM1VgLmoELHhZcxPrjw=;
 b=22NsmayUQPAnnW6TVN+VTuPMnft8X0+CDg099Of8LcRkxAMdXuDREyNJ9MWVExBCXv
 +tgke4ZJKUAY1nNGl81bp0gByKniBzACpgn6q3APGcRDIxdJ1IMpPzENL8lvhStKVUFs
 9hr1hnMGp6UhsjaGY6PQsKmbeBDXO/RWavk8wnl9Y9s94hggXh8qZBsCqFpq37f6rrjH
 WgN6BHp4xkU9kKjvQeKh38+ToNxjZpX3tiZCzcyYk8eHypQnY719A6pmX4JOw/VuIEiB
 clAJrMsye03WcNwY9J7BJboScLkEFv7zDjnYqoMFJXuUAT5j15SQE2d+rWq+xjUvR/GW
 qxig==
X-Gm-Message-State: AO0yUKW6ZejR+nYd4oakf2JJGDhc+CmdtH+wXRTL4pIZyVvZoWgmccps
 ozvr/nCL0gpwPyirdSbrlaeGEc75dQezXVaW8goNQ9bML42qbig8U4JekvtulsgqrBzWJoitg7H
 2xakIwj+q2QnjnjM=
X-Received: by 2002:a17:907:d507:b0:92f:c6b5:de08 with SMTP id
 wb7-20020a170907d50700b0092fc6b5de08mr3516657ejc.76.1678955784552; 
 Thu, 16 Mar 2023 01:36:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set+rqU+JKDQSsTE9IWTS4vQ+UnCNjZp2tDcge1wQQApKwQdjUF25ClXhUWwROqwXF/RmoLjoRQ==
X-Received: by 2002:a17:907:d507:b0:92f:c6b5:de08 with SMTP id
 wb7-20020a170907d50700b0092fc6b5de08mr3516644ejc.76.1678955784270; 
 Thu, 16 Mar 2023 01:36:24 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 qq11-20020a17090720cb00b008c6c47f59c1sm3578054ejb.48.2023.03.16.01.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:36:23 -0700 (PDT)
Message-ID: <5fbcb311-228f-2590-e5c5-21e7f043c1cf@redhat.com>
Date: Thu, 16 Mar 2023 09:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: dropping 32-bit host support
Content-Language: en-US
To: Liviu Ionescu <ilg@livius.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>, qemu-discuss@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <3DD8295F-4BE0-4262-8C68-4A85A56D63C7@livius.net>
 <35022ff8-bf4b-1f52-73f9-db25c776cec1@linaro.org>
 <5C828A13-12A1-42D5-9DC1-9DB232294798@livius.net>
 <F852C238-77B8-4E24-9494-8D060EB78F9F@livius.net>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <F852C238-77B8-4E24-9494-8D060EB78F9F@livius.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/03/2023 09.07, Liviu Ionescu wrote:
> 
> 
>> On 16 Mar 2023, at 09:57, Liviu Ionescu <ilg@livius.net> wrote:
>>
>> I'm not targeting RPi2; there are a lot of RPi4 with less than 8GB RAM (most of them, actually), and even more RPi3, with even less RAM), and people prefer to continue using the 32-bit OS on them, which works quite fine;
> 
> Like it or not, as long as Raspberry does not explicitly deprecate the 32-bit OS, people will continue to use it, and for good reasons.
> 
> As of now, it is even 'Our recommended operating system for most users.':

I'd say "most users" != "the people who want to run QEMU here". If you 
really really want to run QEMU on such a system, you can also install a 
64-bit OS there.

Please also consider that we're only talking about marking the 32-bit arm 
hosts as deprecated in our docs right now. It will take another year (or 
maybe more) until the deprecation will turn into a real unsupported state. I 
assume by that point in time, more and more RPi users will have switched to 
a 64-bit OS instead.

  Thomas


