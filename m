Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9282C81A9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:05:27 +0100 (CET)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjg3i-0002b6-Dp
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjg1X-0001DL-QN
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:03:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjg1S-00049E-3M
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606730584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxNqo2OnkNXAMfPXrYiO3CC8arWg6oCjcZrkHQBZKXY=;
 b=a9XJNtuO4RZoKzsRWLG+oQ+aV78GX86qYTpGceBbm8ui7bYAB/TkVBeYAMsldrNaZj7ZX5
 HcbtizpNSw8RYm0TgOh+W20JobOHgjCdK++jPnbXpAoorF3cnT9e/vX7wpLEDW6j3m3yFW
 yOOOfIH/grH9o5sGBEnFGSSwD7t7Nj0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-0RKN5K4PNQeLbDKHDL8rDw-1; Mon, 30 Nov 2020 05:03:02 -0500
X-MC-Unique: 0RKN5K4PNQeLbDKHDL8rDw-1
Received: by mail-wr1-f69.google.com with SMTP id l5so8150855wrn.18
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 02:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxNqo2OnkNXAMfPXrYiO3CC8arWg6oCjcZrkHQBZKXY=;
 b=HMJfr0uofQ8FnMYSV5dR+I+Z7B6PwLvEdyrfs3Ar6GVwXQmXkfbCWXBUR35EaZW3GC
 qIHmncnopojqk0D4P2Ahxzm0h0+AweHJif0edIYvMY7YV+1vpU0wKT2DHcFoFLxJSOT3
 hPOIVTr/qZ6uKzKIfu78Afvhhjqo+yGJ4Hg5JY8LrP0J1tDm1g9/ZSkaieDNn6BHLphX
 0WLwsGIyRWZ3C6NtdnVrBXYcMUeVxEwftjvvBGuTriGY4qsz8qGUI7cVu+NsRT4Xnhn8
 CP2fJrg7dddBiAK1IJhI2NbMErb33uxkK7tFcSlbitEtmCA1m2TNhGiuYKTXXQyxJWZT
 Hcow==
X-Gm-Message-State: AOAM5321XqFXusEAtuWhwxWw+zGezONkC0t85zi/MxgsJ0p6sUR7spuX
 rY7JDIc01SL0Y5gc/laG3214qMybTAHKsMfo6fR7rC2rAFawIAGP1as9vCHqGniCsG5WtY1M+Hw
 RjKt9W/fQ7htcyKg=
X-Received: by 2002:a1c:151:: with SMTP id 78mr11081605wmb.24.1606730581608;
 Mon, 30 Nov 2020 02:03:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFDH/gpveoJHKec59++DE/QPIKg0Bl+w+ZtiY2xOXk6NCmVaCy9Yx6e81ZadU+6QWWtI9jDQ==
X-Received: by 2002:a1c:151:: with SMTP id 78mr11081579wmb.24.1606730581434;
 Mon, 30 Nov 2020 02:03:01 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id v4sm28365257wru.12.2020.11.30.02.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:03:00 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2 0/2] net: Do not accept packets with invalid
 huge size
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201127154524.1902024-1-philmd@redhat.com>
 <CAFEAcA-4hLY16ud+B2MRKM6RFSNM4zKRhzMb7Zm+_zDOhNwA9g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2e7d7849-5dfe-08d6-9e62-440443e05669@redhat.com>
Date: Mon, 30 Nov 2020 11:02:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-4hLY16ud+B2MRKM6RFSNM4zKRhzMb7Zm+_zDOhNwA9g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/28/20 9:59 PM, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 15:45, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Hi,
>>
>> This is a simple attempt to avoid the following pattern:
>>
>>   ssize_t pkt_size = get_pkt_size(); // returns errno
>>
>>   // no check
>>
>>   send_packet(size_t size=pkt_size); // size casted to unsigned
>>                                      // -> overflow
> 
> "RFC" and "for-5.2" are not a great combination at this point :-(

"RFC" because I don't understand all the effects this assert
can have. "for-5.2" because it was raised as a security bug,
but I don't have access to the information, so I can not see
the big picture.

> What are the consequences if we don't put this patchset in 5.2?

Jason suggested to postpone this. If this is security important,
we can release a 5.2.1-stable tag early I suppose.

Regards,

Phil.


