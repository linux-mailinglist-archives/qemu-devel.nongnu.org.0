Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1A31FA55
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:11:30 +0100 (CET)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6VE-0006mL-Fw
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD6Tg-00069r-IM
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD6Te-0004gX-VM
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613743790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KMwmVlH/z2qZExmshtv3w6IE60rnM1PqUZtapCETsw=;
 b=iBA/hD1wRfj15OeTduIEdUVfEqVT1TTx9uteCQwO90qIt50CDxnE6nzwyoq9BNtJ3qJ8wi
 9lCfZEKZEuglZ+ies3d62+AT87GWvGfNLiEx5whbdRe7Z/JS77PruMFLtTS/E4X1/Ypg6R
 Z5/PmcDjuwGVqeHAP5Z+W2K2NkCVdXc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-u_Jzi_adM0C5JxbXGFvZ2g-1; Fri, 19 Feb 2021 09:09:46 -0500
X-MC-Unique: u_Jzi_adM0C5JxbXGFvZ2g-1
Received: by mail-wr1-f69.google.com with SMTP id l10so2478849wry.16
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5KMwmVlH/z2qZExmshtv3w6IE60rnM1PqUZtapCETsw=;
 b=QwKZ+PPvRhJLIxfZJUevGrDkDAuwZyKAHGA+VsqKmnUOIw3S9MeaiBILKQhwO3fW/P
 VTIBejEeuzbA0tJq1fGLyiOecK4sLIo17tNQw4da5gwkf0AOP9NgW5HeEZbbmQpMR1Pe
 u1J2qezNRTi+iPbfwyy/+PPcSLTRq1OWKnBK4FNmaoTRXqq4ynNNjfa0ScMrCy1u4NJl
 xJi37pmiUWxrrIAerNUiTINHQrsYFhnbIYmRbwoWu9bJZ+PwgM3A7XZM0yFuTOYfNgS2
 acjgeFtCRenK2HV18DpdFY9xoMkW5uogsSY4UabHwWJ7/KwZTt/VJexQrhDRapxoi635
 y3gQ==
X-Gm-Message-State: AOAM5306BPtA6uaiE/k/GxR6niKDxMSA2bwjvaoS18mo40LydiqbmA6G
 t4ODA+Y4yzUCgSQfXuRnsipy4R5iTo/9JrKeqgtw1wD0uBeeeHs+Avngkbon9VQ30QOX9K2ZN+g
 xXl1sR6N5v7Ut9e0=
X-Received: by 2002:a1c:356:: with SMTP id 83mr8626760wmd.31.1613743785500;
 Fri, 19 Feb 2021 06:09:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsq2Iv6/vbfWkvWHutcsX+Jw97xqNR461HS+TBzfP1IwBMhrItzQrK4M2viKvWDztY+q6tgQ==
X-Received: by 2002:a1c:356:: with SMTP id 83mr8626732wmd.31.1613743785275;
 Fri, 19 Feb 2021 06:09:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v15sm13472071wra.61.2021.02.19.06.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 06:09:44 -0800 (PST)
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
To: Max Reitz <mreitz@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
Date: Fri, 19 Feb 2021 15:09:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:07 PM, Max Reitz wrote:
> On 13.02.21 22:54, Fam Zheng wrote:
>> On 2021-02-11 15:26, Philippe Mathieu-Daudé wrote:
>>> The null-co driver doesn't zeroize buffer in its default config,
>>> because it is designed for testing and tests want to run fast.
>>> However this confuses security researchers (access to uninit
>>> buffers).
>>
>> I'm a little surprised.
>>
>> Is changing default the only way to fix this? I'm not opposed to
>> changing the default but I'm not convinced this is the easiest way.
>> block/nvme.c also doesn't touch the memory, but defers to the device
>> DMA, why doesn't that confuse the security checker?

Generally speaking, there is a balance between security and performance.
We try to provide both, but when we can't, my understanding is security
is more important.

Customers expect a secure product. If they prefer performance and
at the price of security, it is also possible by enabling an option
that is not the default.

I'm not sure why you mention block/nvme here. I have the understanding
the null-co driver is only useful for testing. Are there production
cases where null-co is used?

BTW block/nvme is a particular driver where performance matters more
than security (but we have to make sure the users are aware of that).

>> Cannot we just somehow annotate it in a way that the checker can
>> understand (akin to how we provide coverity models) and be done?
> 
> The question is, why wouldn’t we change the default?  read-zeroes=true
> seems the better default to me.  I consider silencing valgrind warnings
> and the like a nice side effect.
> 
> Max
> 


