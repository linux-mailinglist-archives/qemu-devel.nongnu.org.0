Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0CC32273C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:48:19 +0100 (CET)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETMg-0006D8-Af
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lETJj-0004xZ-6w
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lETJh-0008Ep-1x
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614069912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4zr+ibQKMvt3BQjvIVWipfgOo9oivRQ+wLnFjTwYM0=;
 b=e19YRPH73vrTH3SounCdD7XgN4n4ev+pGzxpuX9DM105C6fl6nA2qiF3lY+jEZqxJq+HIR
 b6XiONe7u10QuyV5xiIOBn3Uuvij1m+ubWVziao1zwoUo5MMPsQKi0y1KFV+QR4Rrj84Ol
 DP/K6bXiQdZsjOSVTZAx8+t9XUxhHzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-rFLz-YwwNVCx7Y0ugZPuRg-1; Tue, 23 Feb 2021 03:45:07 -0500
X-MC-Unique: rFLz-YwwNVCx7Y0ugZPuRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED52A107ACED;
 Tue, 23 Feb 2021 08:45:05 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-44.ams2.redhat.com
 [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B5570476;
 Tue, 23 Feb 2021 08:44:53 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
 <YDP0sZHoT45skArd@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d6602268-c447-d26c-dbe5-d7611dd882b4@redhat.com>
Date: Tue, 23 Feb 2021 09:44:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDP0sZHoT45skArd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.21 19:15, Daniel P. Berrangé wrote:
> On Fri, Feb 19, 2021 at 03:09:43PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/19/21 12:07 PM, Max Reitz wrote:
>>> On 13.02.21 22:54, Fam Zheng wrote:
>>>> On 2021-02-11 15:26, Philippe Mathieu-Daudé wrote:
>>>>> The null-co driver doesn't zeroize buffer in its default config,
>>>>> because it is designed for testing and tests want to run fast.
>>>>> However this confuses security researchers (access to uninit
>>>>> buffers).
>>>>
>>>> I'm a little surprised.
>>>>
>>>> Is changing default the only way to fix this? I'm not opposed to
>>>> changing the default but I'm not convinced this is the easiest way.
>>>> block/nvme.c also doesn't touch the memory, but defers to the device
>>>> DMA, why doesn't that confuse the security checker?
>>
>> Generally speaking, there is a balance between security and performance.
>> We try to provide both, but when we can't, my understanding is security
>> is more important.
>>
>> Customers expect a secure product. If they prefer performance and
>> at the price of security, it is also possible by enabling an option
>> that is not the default.
>>
>> I'm not sure why you mention block/nvme here. I have the understanding
>> the null-co driver is only useful for testing. Are there production
>> cases where null-co is used?
> 
> Do we have any real world figures for the performance of null-co
> with & without  zero'ing ?  Before worrying about a tradeoff of
> security vs performance, it'd be good to know if there is actually
> a real world performance problem in the first place. Personally I'd
> go for zero'ing by defualt unless the performance hit was really
> bad.

AFAIU, null-co is only used for testing, be it to just create some block 
nodes in the iotests, or perhaps for performance testing where you want 
to get the minimal roundtrip time through the block layer.  So there is 
no "real world performance problem", because there is no real world use 
of null-co or null-aio.  At least there shouldn’t be.

That begs the question of whether read-zeroes=off even makes sense, and 
I think it absolutely does.

In cases where we have a test that just wants a simple block node that 
doesn’t use disk space, the memset() can’t be noticeable.  But it’s just 
a test, so do we even need the memset()?  Strictly speaking, perhaps 
not, but if someone is to run it via Valgrind or something, they may get 
false positives, so just doing the memset() is the right thing to do.

For performance tests, it must be possible to set read-zeroes=off, 
because even though “that memset() isn’t noticeable in a functional 
test”, in a hard-core performance test, it will be.

So we need a switch.  It should default to memset(), because (1) making 
tools like Valgrind happy seems like a reasonable objective to me, and 
(2) in the majority of cases, the memset() cannot have a noticeable impact.

Max


