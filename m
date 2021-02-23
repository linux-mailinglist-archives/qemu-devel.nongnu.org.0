Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59957322E42
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:04:31 +0100 (CET)
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaAn-00040E-SC
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lEa8S-0002eH-9x
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lEa8M-0002tO-FW
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhmT2rL8rkWMXboEr9TMWRe2JqavtbfRC/obTY87S38=;
 b=JiDz0dVO6SmY3qk33dHSEpXsLnPOlbwJJB0ujTBN9vXGMcB7yb+v3BJ3RaL4dPM4E1srBm
 wnUnXVDeZ8KvIbltwSV6uKsHQJ9OasTWj0zb/Zz4RfjEHiJi/h3Icj9SfHkWWiGci8fxIV
 czTC5KndOu54JC3PsnbwsoWRhS/o3Lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-lYzoa_XcMFutvDgW3ZUq7A-1; Tue, 23 Feb 2021 11:01:29 -0500
X-MC-Unique: lYzoa_XcMFutvDgW3ZUq7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A3BA1074642;
 Tue, 23 Feb 2021 16:01:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-44.ams2.redhat.com
 [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E50B05D9D0;
 Tue, 23 Feb 2021 16:01:15 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
To: Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
 <20210222173532.GA117898@ip-172-44-255-31>
 <5f6c8e8f-ccc9-7098-0fb0-53ec1da33466@redhat.com>
 <20210223092153.GA122030@ip-172-44-255-31>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <74e3128c-b7e6-20da-c0a7-a799d1da560c@redhat.com>
Date: Tue, 23 Feb 2021 17:01:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223092153.GA122030@ip-172-44-255-31>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.21 10:21, Fam Zheng wrote:
> On 2021-02-22 18:55, Philippe Mathieu-Daudé wrote:
>> On 2/22/21 6:35 PM, Fam Zheng wrote:
>>> On 2021-02-19 15:09, Philippe Mathieu-Daudé wrote:
>>>> On 2/19/21 12:07 PM, Max Reitz wrote:
>>>>> On 13.02.21 22:54, Fam Zheng wrote:
>>>>>> On 2021-02-11 15:26, Philippe Mathieu-Daudé wrote:
>>>>>>> The null-co driver doesn't zeroize buffer in its default config,
>>>>>>> because it is designed for testing and tests want to run fast.
>>>>>>> However this confuses security researchers (access to uninit
>>>>>>> buffers).
>>>>>>
>>>>>> I'm a little surprised.
>>>>>>
>>>>>> Is changing default the only way to fix this? I'm not opposed to
>>>>>> changing the default but I'm not convinced this is the easiest way.
>>>>>> block/nvme.c also doesn't touch the memory, but defers to the device
>>>>>> DMA, why doesn't that confuse the security checker?
>>>>
>>>> Generally speaking, there is a balance between security and performance.
>>>> We try to provide both, but when we can't, my understanding is security
>>>> is more important.
>>>
>>> Why is hiding the code path behind a non-default more secure? What is
>>> not secure now?
>>
>> Se we are back to the problem of having default values.
>>
>> I'd like to remove the default and have the option explicit,
>> but qemu_opt_get_bool() expects a 'default' value.
>>
>> Should we rename qemu_opt_get_bool() -> qemu_opt_get_bool_with_default()
>> and add a simpler qemu_opt_get_bool()?
> 
> My point is I still don't get the full context of the problem this
> series is trying to solve. If the problem is tools are confused, I would
> like to understand why. What is the thing that matters here, exactly?

My personal opinion is that it isn’t even about tools, it’s just about 
the fact that operating on uninitialized data is something that should 
generally be avoided.  For the null drivers, there is a reason to allow 
it (performance testing), but that should be a special case, not the 
default.

> But there's always been nullblk.ko in kernel that doesn't lie in the
> name. If we change the default we are not very honest any more about
> what the driver actually does.

Then we’re already lying, because if we model it after /dev/null, we 
should probably return -EIO on every read.

If a null device returns data, that data may be arbitrary, so we might 
as well memset() it to 0.  As I wrote in my reply to Daniel, I find it 
perfectly reasonable to make that the default: For functional tests 
(which I think are the majority of null’s users), it doesn’t make a 
difference except that operating on uninitialized data just isn’t a nice 
thing to do.

The only reasons I can see we wouldn’t change the default are (1) 
compatibility, which I don’t think is an issue for a test driver (plus, 
the only thing it might break are performance tests, which naively I 
think wouldn’t be a problem), and (2) it’s an additional gotcha when 
performance testing, but there are usually so many gotchas with 
performance testing, that I don’t see this as a problem either.

> Even if null-co:// and null-aio:// is a bad idea, then let's add
> zero-co://co and zero-aio://, and deprecate null-*://.
I find that too much work simply because it’s more work than just making 
read-zeroes=on the default, and I find doing that reasonable.

(Furthermore, we wouldn’t deprecate null-*, because it’s needed for 
performance testing.  We could add read-zeroes as an option to the new 
zero-* drivers, but I find that silly.)

Max


