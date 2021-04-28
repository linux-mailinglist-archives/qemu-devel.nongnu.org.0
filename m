Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC3E36DE8D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:42:39 +0200 (CEST)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboCs-0000Dl-KZ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lbnxq-0001S7-Ky
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lbnxn-0007Bc-Lr
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619630820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPEgWsqQRUrKjsZe0Qgn9/PJcXrqly6YCK78i285n70=;
 b=CMvSm40YgQ6Yx8wjPzbeAtJLs0kJIRnXRMt+44grYnJFvrnHLY2IA3GqvxItOC/hL0+SkD
 43DAJO89QyduXHZCaUyGwZQWD0+iMhlhjX09w1Zxj+jOCgq7DlwE8sDkmXKAukSqupOK90
 OQ7QQD0V5euM9nmwkrGJv+lZqEf84d0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-tqRCG_-IM_ycS77U8UxPLA-1; Wed, 28 Apr 2021 13:26:56 -0400
X-MC-Unique: tqRCG_-IM_ycS77U8UxPLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB165802948;
 Wed, 28 Apr 2021 17:26:54 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-86.gru2.redhat.com
 [10.97.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C279C5D9C6;
 Wed, 28 Apr 2021 17:26:50 +0000 (UTC)
Subject: Re: [PATCH] tests/migration: fix unix socket migration
To: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
 <8a8d72ee-d24c-5aac-3b89-192d4d54f7cb@redhat.com>
 <4b1e91a5-73e8-912a-32c4-b78a7412a8bc@chinatelecom.cn>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <decc942d-c801-f460-d2aa-d75756551c61@redhat.com>
Date: Wed, 28 Apr 2021 14:26:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4b1e91a5-73e8-912a-32c4-b78a7412a8bc@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Hyman Huang <huangy81@chinatelecom.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleber,

Maybe you could review then queue this one?

- Wainer

On 4/20/21 10:16 PM, Hyman Huang wrote:
>
> 在 2021/3/10 0:55, Philippe Mathieu-Daudé 写道:
>> On 3/9/21 5:00 PM, huangy81@chinatelecom.cn wrote:
>>> From: Hyman <huangy81@chinatelecom.cn>
>>>
>>> The test aborts and error message as the following be throwed:
>>> "No such file or directory: '/var/tmp/qemu-migrate-{pid}.migrate",
>>> when the unix socket migration test nearly done. The reason is
>>> qemu removes the unix socket file after migration before
>>> guestperf.py script do it. So pre-check if the socket file exists
>>> when removing it to prevent the guestperf program from aborting.
>>>
>>> Signed-off-by: Hyman <huangy81@chinatelecom.cn>
>>> ---
>>>   tests/migration/guestperf/engine.py | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Interesting, we have in MAINTAINERS:
>>
>> Python scripts
>> M: Eduardo Habkost <ehabkost@redhat.com>
>> M: Cleber Rosa <crosa@redhat.com>
>> S: Odd Fixes
>> F: scripts/*.py
>> F: tests/*.py
>>
>> However:
>>
>> ./scripts/get_maintainer.pl -f tests/migration/guestperf/engine.py
>> get_maintainer.pl: No maintainers found, printing recent contributors.
>> get_maintainer.pl: Do not blindly cc: them on patches!  Use common 
>> sense.
>
> Ping
>
> The following patch has fixed it
> https://patchew.org/QEMU/91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn/ 
>
>
>>
>>> diff --git a/tests/migration/guestperf/engine.py 
>>> b/tests/migration/guestperf/engine.py
>>> index 83bfc3b..86d4f21 100644
>>> --- a/tests/migration/guestperf/engine.py
>>> +++ b/tests/migration/guestperf/engine.py
>>> @@ -405,7 +405,7 @@ def run(self, hardware, scenario, 
>>> result_dir=os.getcwd()):
>>>               progress_history = ret[0]
>>>               qemu_timings = ret[1]
>>>               vcpu_timings = ret[2]
>>> -            if uri[0:5] == "unix:":
>>> +            if uri[0:5] == "unix:" and os.path.exists(uri[5:]):
>>>                   os.remove(uri[5:])
>>>               if self._verbose:
>>>                   print("Finished migration")
>>>
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>


