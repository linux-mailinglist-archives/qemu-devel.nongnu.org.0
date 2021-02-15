Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2C31C3B2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:38:34 +0100 (CET)
Received: from localhost ([::1]:55264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlZh-0001TY-37
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBlYv-0000wG-KV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:37:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBlYs-0001lO-UT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:37:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613425062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JaTNyL70JovuSPYvwS7FHkaMk35urqYYUbAf7QNHxE0=;
 b=TuXfnhSzevaZwUl0GaQrlE/pOH6JXPSOjV8+QF/DgKhlz10x2PjxEy8fOnajszT1LTsAoC
 fvnaK10hovL7vSwjEpuYBAqpDa4Oofq4s4yTo4E5nL7VCaH4oIQBwlw18UdEMO3u+yeHij
 1afOvmgTFEk7K+a6uRxrZMyJzi7U5pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-m30YKooTOGG4kpgGwO23iw-1; Mon, 15 Feb 2021 16:37:40 -0500
X-MC-Unique: m30YKooTOGG4kpgGwO23iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A31691934101;
 Mon, 15 Feb 2021 21:37:39 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0B5360C15;
 Mon, 15 Feb 2021 21:37:38 +0000 (UTC)
Subject: Re: [PULL 3/5] qemu-iotests: 300: Add test case for modifying
 persistence of bitmap
To: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
 <20210212232134.1462756-4-eblake@redhat.com>
 <20210215123152.GM7226@merkur.fritz.box>
 <0cd1617d-b22f-4ce1-38c2-df8822c3fbbe@redhat.com>
 <20210215170902.GS7226@merkur.fritz.box>
 <42192dc8-329c-ef2d-d8f7-3d02ae9d2c85@redhat.com>
 <0138182f-0e17-f225-0060-85f1776f26dc@redhat.com>
 <e0b79772-feb0-34e5-fb0c-54b28a0da042@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <05deab0a-7bab-63c3-6d7c-4af9af0869b3@redhat.com>
Date: Mon, 15 Feb 2021 16:37:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e0b79772-feb0-34e5-fb0c-54b28a0da042@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:26 PM, Eric Blake wrote:
> On 2/15/21 1:00 PM, John Snow wrote:
>> On 2/15/21 1:25 PM, Eric Blake wrote:
>>> -BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
>>> +BlockBitmapMapping = List[Dict[str,
>>> +                               Union[str,
>>> +                                     List[Dict[str,
>>> +                                               Union[str, Dict[str,
>>> bool]]]]]]]
>>
>> That looks *very* beefy.
>>
>> Is the Union because that union is valid for every key, or because every
>> key has a potentially different value that is specific to that key?
>>
>> if it's the latter, I'd ditch the Union and just go with:
>>
>> Dict[str, object], or
>> Dict[str, Any]
>>
>> object: will allow any type, but keeps strict checking enabled. If you
>> try to use that value later on without a cast, mypy will warn you if you
>> are using it in a manner not guaranteed by the "object" type. Can be
>> useful if you are passing values to a function that already does RTTI to
>> determine behavior.
> 
> We're in luck; both 297 and 300 still pass with this applied on top of
> my previous attempt:
> 
> diff --git i/tests/qemu-iotests/300 w/tests/qemu-iotests/300
> index 7501bd1018e2..adb927629747 100755
> --- i/tests/qemu-iotests/300
> +++ w/tests/qemu-iotests/300
> @@ -22,7 +22,7 @@
>   import os
>   import random
>   import re
> -from typing import Dict, List, Optional, Union
> +from typing import Dict, List, Optional
> 
>   import iotests
> 
> @@ -30,10 +30,7 @@ import iotests
>   # pylint: disable=wrong-import-order
>   import qemu
> 
> -BlockBitmapMapping = List[Dict[str,
> -                               Union[str,
> -                                     List[Dict[str,
> -                                               Union[str, Dict[str,
> bool]]]]]]]
> +BlockBitmapMapping = List[Dict[str, object]]
> 

nice :)

>   mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
> 
> 
> 
>>
>> Any: Also allows any type, but enables gradual typing. If you later
>> "assume" the type of this value, mypy will say nothing. Can be useful
>> when you've just got a job to do and the right tool would have been a
>> recursive type or a TypedDict (unavailable in Python 3.6.)
> 
> I'm not too worried about needing to further enhance the type-checking
> on an individual iotest.
> 

Yes, Agreed. I have been going very "overboard" with the python and QAPI 
types, but I consider those libraries that might have need of such 
pedantic types.

The iotests themselves? eh.

Just figured I'd give you a range of options to choose from and you'd 
pick the best one.

--js


PS: I really really really really really wish that 3.6 had TypedDict.


