Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3937D392
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:32:49 +0200 (CEST)
Received: from localhost ([::1]:55840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtf5-0005wD-3S
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtbk-0002uU-OP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtbh-0000Cv-4W
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620844155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwMamt25vK6J6E0ucTWJduW0An5086brZgZmt2BCUWA=;
 b=d3RT9nX+cy9c1hEDn/gYcjHp6d/hbhx0lQ+CAA8vi6PXu6QAX/rtbZt1mgYlT4KT0Irk21
 V/9smzPymyehqlzST8vrJR4eBiNPbkD+0na3aGhytovYHdnSm17DvZ1tb2hTU4TBEaICYU
 4/IXuVcfttlAH2uFCS0k4sBmz7hCZhI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-SyMkW4Q-PXqLPas_OAyhdg-1; Wed, 12 May 2021 14:29:12 -0400
X-MC-Unique: SyMkW4Q-PXqLPas_OAyhdg-1
Received: by mail-ed1-f72.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so13289888edc.15
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XwMamt25vK6J6E0ucTWJduW0An5086brZgZmt2BCUWA=;
 b=Q10BJHczsgo3dHIpsotey3e7pS+Y3RLAoh90c/anetHGe1nh4vJsrykv4u1xMkvwIB
 tin9hJONH5j+zCruLmZvezv8V/Yfhk+Qd6Mo6btWs0XPkXSDxnt7YSx8JLe1G7kgxcmb
 i0nhH6v0dNZjBYgks5us+V0BfrfM8WFpfrhSuKtCoDG31PoiejBNBP5ehE0cGucx0V7q
 E7o0xB4071hIOchzj7krFJQIUmX2zu1xaJnWrVR2etxAm236/6VecCVZwQUZU2mixSgU
 DCEkQP3qLHhFdUc1ihkw+BHOPzsHT7t9Hww4F/l8PVlRB5yz6UE54VwXGZEWQm4+J4Jd
 RNxA==
X-Gm-Message-State: AOAM532r+oLq/vXOwguTEDp+YoK5DVEacfUaZ99ipSIlGu09FDEgeppj
 s8l1pwm9YAMZLWaOQEBbU1YivW25aHtkRRexO8tKdKNoLeBqlJ85IxIprIGM3tPlQ6vtE4r8ER9
 WNVOQiACLFsBCbQKlslZJWhwj4ogna+QUd0AXuUeVL0k2G3VE4q3JXJYugkwfFntUVZs=
X-Received: by 2002:a17:907:f86:: with SMTP id
 kb6mr38152923ejc.428.1620844151258; 
 Wed, 12 May 2021 11:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdwipOKbI4MAAVHSzeFfsmFt6Dc79jowl4iKNCoNcWxYGdycBkyhsFYTHXSrCEjM8WedjNgg==
X-Received: by 2002:a17:907:f86:: with SMTP id
 kb6mr38152903ejc.428.1620844151030; 
 Wed, 12 May 2021 11:29:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b17sm434920edr.80.2021.05.12.11.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:29:09 -0700 (PDT)
Subject: Re: [PATCH] add Visual Studio Code configuration
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210512100906.621504-1-pbonzini@redhat.com>
 <CAFEAcA-Vy3uG=PjKnDfaX0BoCLUDS=Za=aZ7BgG6iHc0wRYopw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <22e50f9b-e62a-799b-b0f2-03103119c804@redhat.com>
Date: Wed, 12 May 2021 20:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Vy3uG=PjKnDfaX0BoCLUDS=Za=aZ7BgG6iHc0wRYopw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 13:02, Peter Maydell wrote:
>> --- /dev/null
>> +++ b/scripts/rebuild.py
>> @@ -0,0 +1,22 @@
>> +#! /usr/bin/env python3
>> +#
>> +# Author: Paolo Bonzini <pbonzini@redhat.com>
>> +#
>> +# This program compiles the input files using commands from the
>> +# compile_commands.json file.  (Unlike Make/ninja, the _source_
>> +# file is passed to the program rather than the targe).  It is
>> +# mostly intended to be called from editors.
> 
> This seems weird. I don't think we should try to support multiple
> ways of building QEMU -- editors should just run make the same
> way everybody else does...

Right, it's possible to include a "whole build" task in tasks.json, and 
it will invoke Make/ninja (I haven't done it yet though so it's not 
included in this first attempt).

This script instead is used to rebuild the one file that is being 
edited, for example to check quickly for syntax errors.  I did find it 
quite surprising that VS Code could not do this on its own, since it can 
use compile_commands.json to retrieve the header file paths for example; 
still, this script is not a replacement for make, as this functionality 
of reverse-mapping from .c to .o is not available natively in either 
Make or ninja.  It might even be handy for vim or Emacs users.

(This series really should have been tagged as RFC).

Paolo


