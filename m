Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF252B449B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:21:11 +0100 (CET)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeRS-00067Q-7g
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keeIL-0005sj-28
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:11:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keeIH-0003HX-Sj
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605532300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FN7I7848Vdss0RqiWEWSV/MciQBfb6MR7QyS2x2Kmk=;
 b=ZF32RE/tXfFgmuH4m478rJzaQgBuQSYPtUT39sgkh6Gb/Zz52lPYuvzDxaakmP+dLUxDoQ
 cX8yrMCNClHoRE+hQ3HIvYqVlrJawt+rby+YBAv9ecH/B0ftqMG6s8YUCrzu/A03lwFw/D
 cHt6KN5y438IVQ0igKOHXQTp7mrR7fs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-rwltAcO0NViD07xqkEpWJw-1; Mon, 16 Nov 2020 08:11:38 -0500
X-MC-Unique: rwltAcO0NViD07xqkEpWJw-1
Received: by mail-wr1-f70.google.com with SMTP id h11so10985631wrq.20
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/FN7I7848Vdss0RqiWEWSV/MciQBfb6MR7QyS2x2Kmk=;
 b=IwZvULNqB2RraDZo/8JFvZFlGmQoY8zAbhIXdxD4leXk73ckgg+Skl7xoXNQDs0Iof
 86x90nMBdZiYgsy2doK3/vEUQiJQQ9aAV0sFA29RNdw4DNO9xl3sXAmfqGtgTsbaovr/
 jTey4hRx5WgEtBCg/qbZJzsGCi50VqvPTCnPTg8Yjt6mDsAzhu9nhhcF3dTfBIw5/tyi
 NGcBZTzSICpotuZQDKYHrpcFNjXQBkrQadOJ/bPAgm4tDvV8GyNYa6R0bHa3S0yQm5as
 LKFUhzjHPyWnQDkQWUe5WgwfvNxf/D1B/wNSO4pwNBGOm+8CWka11q/WHsqTaG/90f9l
 Z/aA==
X-Gm-Message-State: AOAM530BZmcNFlLQy3GttFqntR1V7U3E9uq1tTMPuOGI0V00+LF9w6v/
 OO78QVJuLnJ256KeLjhZcYY3yHJhrP1NHU9vLwRYQsLRIOeOVKeeUvpBc+0glSu9rxibBSi6ehL
 kvBr9MXEy5WM/tNE=
X-Received: by 2002:adf:f24b:: with SMTP id b11mr20329723wrp.342.1605532297181; 
 Mon, 16 Nov 2020 05:11:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAcxOLzOAfqfH+qUyl5QG2Y+ZxpUlAScMFMsMA7q1gO5iJndAvWonD8RZJOHe/1lfsWQrUeQ==
X-Received: by 2002:adf:f24b:: with SMTP id b11mr20329705wrp.342.1605532297006; 
 Mon, 16 Nov 2020 05:11:37 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m21sm30094654wmi.3.2020.11.16.05.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 05:11:36 -0800 (PST)
Subject: Re: [PULL 7/9] hw/i386/acpi-build: Fix maybe-uninitialized error when
 ACPI hotplug off
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
 <20201116122417.28346-8-alex.bennee@linaro.org>
 <20201116072607-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <46c6a76d-348f-4351-656c-8ec4b07f8f8b@redhat.com>
Date: Mon, 16 Nov 2020 14:11:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116072607-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 1:27 PM, Michael S. Tsirkin wrote:
> On Mon, Nov 16, 2020 at 12:24:15PM +0000, Alex BennÃƒÂ©e wrote:
>> From: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
>>
>> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
>> is already in the "if (bsel || pcihp_bridge_en)" block statement,
>> but it isn't smart enough to figure it out.
>>
>> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
>> block statement to fix (on Ubuntu):
>>
>>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
>>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitialized
>>   in this function [-Werror=maybe-uninitialized]
>>     496 |         aml_append(parent_scope, method);
>>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   cc1: all warnings being treated as errors
>>
>> Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug is off globally")
>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
>> Signed-off-by: Alex BennÃƒÂ©e <alex.bennee@linaro.org>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> Message-Id: <20201108204535.2319870-4-philmd@redhat.com>
>> Message-Id: <20201110192316.26397-8-alex.bennee@linaro.org>
> 
> BTW it's in my pull request alredy.
> Not sure why you are merging it too ...

I suppose to unbreak Gitlab-CI...

There is no policy w.r.t. CI so maintainer don't have to use it,
but this breaking it delay the workflow of others subsystems.

I'm not asking you to use it, just explaining why this patch is
in Alex's queue.

Regards,

Phil.


