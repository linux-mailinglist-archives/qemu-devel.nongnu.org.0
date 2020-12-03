Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A412CDD26
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:12:29 +0100 (CET)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkt5f-0001Io-IO
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkt43-0000br-QX
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkt41-0002Sq-2j
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607019042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdLxSRe8vB2Y1dMHErKZQGoK9gA5GAcUOwy4yzv8YqM=;
 b=UDj+KLKlQuhTnnkQSpobVt9xtFQv7NW37cVfSs37i2dqg8aCC9gixwOUxQHhoc0aHKkrfx
 375mgjgain5Z6OstQIgAH99QRu68cUcUUyGXs11UtdgHufxzRkdmNevg/zAhbl+d6hqhyA
 rRtL55GrcnY9dLjyj8lEyLUiA2j5X4I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-_5kvXBhrM7yrXqDTvr4kNw-1; Thu, 03 Dec 2020 13:10:41 -0500
X-MC-Unique: _5kvXBhrM7yrXqDTvr4kNw-1
Received: by mail-ed1-f69.google.com with SMTP id bf13so1280863edb.10
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 10:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fdLxSRe8vB2Y1dMHErKZQGoK9gA5GAcUOwy4yzv8YqM=;
 b=njXP4dtZDNlv3IqobIUvDiwtqtKLAgzqfTyzIg6PHfekH+H9x4dOSxNb7wSwHKxorT
 DT9Oc6GxQaqkgNdTKZ0kASLR3+x6s5oseflN/nfFo+n/+LHduWCcEyczAhdUiqqSe5ms
 6K6ye6L1SdrYmQduHmA+SR6CajllyVdZca33gi/c6w5TyMtYvqO4qOIhufvIcN58X1sk
 rur70Yna8xwxPsrrIQLoj9RZy1YaltgjvbFZyJCjUueDU7GV2Bj1D/94NUy5sdVHUsM1
 nbKJDBCEExT5YFXzAvdX3kBR9IqCPbhCmVm+Q/FY2Ssdhtr4KHE63JOfuGY/nRvaqOtW
 0ThA==
X-Gm-Message-State: AOAM5333dF8SdozjAtE1KrqggOSGxs+CiPAdeCAbyWArJJbiLLJpOg29
 LxHPWdQJK/IXCrqPiKLcBBa7LYBFTr5cPN63VvdTQ8pvz64M1xZD6aijiUlxxbotP1U1vvGa6pF
 DY8DwruO+xBzG7UE=
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr3973354eds.134.1607019039955; 
 Thu, 03 Dec 2020 10:10:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1NeaZ8pcPanvpdMfPe/GK7Vww6BebULpO020SFyf5aV82XbAc1gPqnXbg3sXyzi6XjmuUMA==
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr3973331eds.134.1607019039746; 
 Thu, 03 Dec 2020 10:10:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e12sm1735605edm.48.2020.12.03.10.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 10:10:38 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net> <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net> <20201202173506.GH16765@merkur.fritz.box>
 <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
 <20201203151532.GA5409@merkur.fritz.box>
 <27f30494-225c-4407-ee1c-1a996b83c8b1@redhat.com>
 <20201203175205.GL3836@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <857d3595-73bc-db5a-1ccc-d18549e014f5@redhat.com>
Date: Thu, 3 Dec 2020 19:10:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203175205.GL3836@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/20 18:52, Eduardo Habkost wrote:
> On Thu, Dec 03, 2020 at 05:50:46PM +0100, Paolo Bonzini wrote:
>> On 03/12/20 16:15, Kevin Wolf wrote:
>>> I don't think this is an intermediate state like Eduardo wants to have.
>>> Creating the object, then setting properties, then realize [1] will fail
>>> after your change. But keeping it working was the whole point of the
>>> exercise.
>>
>> With the sample code, you must remove object_class_property_set calls at the
> 
> Do you mean object_property_set()?

Yes.

>> same time as you remove the setters.  Usually that'd be when you convert to
>> QAPI and oc->configure, but it doesn't have to be that way if there are good
>> reasons not to do so.
> 
> Having two (or more) similar but incompatible APIs to do exactly
> the same thing is a mistake we did before, and I wouldn't like us
> to repeat it.
> 
> If we can keep qdev_new() + object_property_set() + realize
> working after the device is converted, we should.  I believe we
> can.

You can.  If you want to do that, you have to give up on removing the 
setters; but that's not so beneficial for devices because they already 
use static properties anyway.  They have much less boilerplate than 
-object objects.

> If we can make object_new_configure() work with all (or most)
> device types before we manually convert them to the new system,
> we should.  I believe we can.

Yup, object_new_configure() is the low-level visitor-based API and 
therefore it supports both properties and oc->configure.

> We may be able avoid these questions with -object because
> converting all backends at the same time is doable.  With
> devices, API usability and maintainability during the transition
> period (which could be very long) needs to be taken into account.

I think we're in violent agreement. :)

Paolo


