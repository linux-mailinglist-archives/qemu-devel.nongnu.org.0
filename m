Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1832D433
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:31:33 +0100 (CET)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHo4h-0004kP-Us
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHo2h-0004BU-8a
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHo2f-00059c-Ll
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614864564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaUgLzEuoTZ+j76HtUck5LmdQDfa5GlD41NRdKwQBQ8=;
 b=FzlF+Jfl8+AVDXUVAgpRFXL+xbkH3fgCX0iE5tXO6ZCpS8auAjdDOyVBU1sNhyUz77OckF
 S0YqQmelACrJQPOPqFMwLysyZUuFapFd9S93ncx4xebicrCmnIBkaTm1iRDv3IJNO2OS+6
 m780RAwVP3baS++4UizZcs6aZdT9a0o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-Ik8q4l1-Mue9AgkJIh7AuQ-1; Thu, 04 Mar 2021 08:29:22 -0500
X-MC-Unique: Ik8q4l1-Mue9AgkJIh7AuQ-1
Received: by mail-wm1-f69.google.com with SMTP id j8so2639176wmq.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 05:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OaUgLzEuoTZ+j76HtUck5LmdQDfa5GlD41NRdKwQBQ8=;
 b=Tqr5IL+6gB07SA9YvntpW2n7rIe4B6yKxw1HcD5uhWphM5YgFGeeBE6UqWRke3WZYN
 8Khukr+QbELG/Cyll/7i8RN3TNJdkNs1QgPrZZMZJfeQhFHgwDarJGmoOw62zng5VNhc
 2K4a/uf9zSkx5eIoe4n8z8w3vj9PoVT53j36/LTXocdmPevom8bn3ll0yQceXiou0PGK
 LKDhPuX1Ds/xVEASvuQ3uKieljJo1hEpViWKV+nTy/5O8ZmJPCdr3fYxLFCvbRIpYt30
 vDxMSLH3zkNZJyKST58tj9mzDhFzDaEV2tdSHoUtOUOdV6ZRBGwlvVgTBEoUX9M1ZsZ/
 perQ==
X-Gm-Message-State: AOAM531BTLcrvpCzo3aTD0xe7j85a70QRqpqD5IinfxMJ7g/ZXqAL/f7
 Q8JkZuYDZtlxTVZfIUOd0xUAzIUc7ISt9ovcgdg1JjgA3cl6Da/fuJzEtNAz8UhFNc4lkb9FsE5
 N8zYu0M2xvou0roo=
X-Received: by 2002:adf:ec46:: with SMTP id w6mr3988818wrn.213.1614864561224; 
 Thu, 04 Mar 2021 05:29:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1EwyRd1Td4emPWNCxC2X2jkSuN0JY8NjK2ueIv2/KXZ64xEbS/NSd926m1g67DXZqG32Djw==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr3988808wrn.213.1614864561122; 
 Thu, 04 Mar 2021 05:29:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b131sm10094277wmb.34.2021.03.04.05.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:29:20 -0800 (PST)
Subject: Re: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: Joel Stanley <joel@jms.id.au>
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-2-joel@jms.id.au>
 <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
 <CACPK8XddbgGgPtkK41MM5ZYeaar27RhnD4vQwh8DcXnFpgoUoA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0aae3aa6-1b82-9002-5911-cd5ec8225f72@redhat.com>
Date: Thu, 4 Mar 2021 14:29:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XddbgGgPtkK41MM5ZYeaar27RhnD4vQwh8DcXnFpgoUoA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 12:19 PM, Joel Stanley wrote:
> On Wed, 3 Mar 2021 at 10:19, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 3/3/21 2:22 AM, Joel Stanley wrote:
>>> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
>>> from ASPEED, by booting Palmetto and Romulus BMC machines.
>>>
>>> The images are fetched from OpenBMC's release directory on github.
>>
>> You need to justify here why this is safe to run that
>> on anyone workstation, or use AVOCADO_ALLOW_UNTRUSTED_CODE.
> 
> I don't completely understand. What circumstances would it be unsafe
> to run a qemu guest, aside from a bug in qemu itself?

See Alex's rationale here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg774096.html

Point taken, this should be better documented.


