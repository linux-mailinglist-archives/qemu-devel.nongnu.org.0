Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5807932D639
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:16:24 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpiB-0000Ho-AT
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHpdU-0001cu-Rt
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHpdR-0000or-HG
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614870687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlaQE99YW0c+cTmPRSFwIFZEM5J9sJwFfPgwDvIEPec=;
 b=f4fCVYJ0vpFP63ah9ikohBq+ULQTLlwhU4TOBgs6nf2r8a8AhtLogVdADhEAXf8yYrSF/N
 vZpkKdCBW8ZmQpZLfIMgTiBnQTySRnfVF5Bg23/xif8FTAG093nTeOy/1ZJnS9H8880g58
 8HmYW7dPWpU2cWHl6kJqn8vcmkWi6ys=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-l5brPDG7NO6gertGwpQl6w-1; Thu, 04 Mar 2021 10:11:25 -0500
X-MC-Unique: l5brPDG7NO6gertGwpQl6w-1
Received: by mail-wr1-f71.google.com with SMTP id e7so7679959wrw.18
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qlaQE99YW0c+cTmPRSFwIFZEM5J9sJwFfPgwDvIEPec=;
 b=C+S3nJT4LYzXUNkayZC9QgCtH3iCsEfZOE7nmyID9qnFSn2FTG6QTavPCX8vfbAxPR
 Py/6/1aQYs2jYGwuE03fEfPQAEJpt913TXoVc8EKB2N9NGi0lHOBqi1egP4J8B7W1iOa
 ++3AVPCsENXCG90z5f1AYUiM0dTXUkE+3MUAoGiTHmVREz1GskeL/1KEC32Eal+JXVTN
 4g6N7b24IjK6UD+pTpvA0ry63hmTeoF+yNib6LaAgZWCOeMhbklIpQI92fJRBhgNZWZ7
 aW11fKXbm3rYyo0BD9QvD0SXljPTSIa8DlwUQBjS+iGuK25vl5wcPt3cdHSNwF52gX6h
 GOBg==
X-Gm-Message-State: AOAM530pXrFR1PvyiYKXrdnqY8TDn3W0HxD/dyH4b8YY0KeEUUMAaDo5
 1fFPie6tU1xVelM6RpUwXMtYk3HJGdcrI+GXQk9TwEhU7vVHh92qLPkk14rmdFQpXWWibJ2fIHA
 M0LeP3ANrlnGP0Yo=
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr4528169wrn.315.1614870684470; 
 Thu, 04 Mar 2021 07:11:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLRf7s1BkU1I0xpz1oVK+gBlCbqVr1uxNRSwH/QEreyrwjwEHOM5+Y+PwqXBWfmEgu0e5A5w==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr4528143wrn.315.1614870684275; 
 Thu, 04 Mar 2021 07:11:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l15sm10384651wmh.21.2021.03.04.07.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 07:11:23 -0800 (PST)
Subject: Re: [PATCH] docker: Base Fedora MinGW cross containers on the base
 Fedora image
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210303124222.1485332-1-philmd@redhat.com>
 <YD+FJarhR1yTWI0G@redhat.com>
 <138832dc-9340-2a9f-1dc8-b20cc0637c5e@redhat.com>
 <YEDsJUKudKJvZA7K@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <42ca9d3d-f3d2-68ed-f586-c833cbe3484b@redhat.com>
Date: Thu, 4 Mar 2021 16:11:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEDsJUKudKJvZA7K@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 3:18 PM, Daniel P. Berrangé wrote:
> On Thu, Mar 04, 2021 at 03:00:04PM +0100, Philippe Mathieu-Daudé wrote:
>> On 3/3/21 1:46 PM, Daniel P. Berrangé wrote:
>>> On Wed, Mar 03, 2021 at 01:42:22PM +0100, Philippe Mathieu-Daudé wrote:
>>>> The only difference between fedora-winXX-cross.docker and
>>>> fedora.docker is the specific QEMU_CONFIGURE_OPTS environment
>>>> variable. All the rest can be inherited from the generic Fedora
>>>> image.
>>>
>>> This is relying on the base Fedora image already having the
>>> mingw packages installed. My series to automate creation of
>>> the container dockerfiles removes those entirely, so we have
>>> strictly separate native and mingw images for Fedora:
>>>
>>>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03123.html
>>
>> I'm a bit confused. So instead of having one single big image,
>> you prefer to have multiple ones.
>>
>> I stopped using the fedora-winXX-cross because they lacks ccache,
>> and the "big" fedora image contains the mingwXX toolchains.
>>
>> I'll wait you respin your series and test the new created containers
>> to see if they fit my needs.
> 
> ccache will be present in any of the containers I auto-generate for
> QEMU using lcitool, as I agree its a very useful part o fthe toolchain.
> So when i convert the winXXX-cross containers, they'll gain ccache
> (and alot of other missing mingw pieces)

Cool, looking forward to QEMU using lcitool :)


