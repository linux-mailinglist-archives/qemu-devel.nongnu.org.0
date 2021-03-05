Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C232F020
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:33:06 +0100 (CET)
Received: from localhost ([::1]:42844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDNx-0002Fp-SZ
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lIDLU-0000W3-Pe
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lIDLQ-0003sO-1q
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614961826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13DDur8KN/JrFGRr7IWguOCDT07Az8FyrW7HuvJSVWk=;
 b=TdY0YnaHX9XGK+aGbiuPcfRUohgOG6REZrEeLEyf9pqU/VyJzdr0HO1R60HAuN8SnXpP7c
 z4IB7uWWNYS+EBzAo87nNvUyVa4kqHmgQri5B/Cz+pMEN9c53QSwndlBcbTEMqfHJap/wt
 BqTb5PW+2hj2tW2Mrhg6xw1FKQEWIUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-qa94DwI7MzqhmhAnDYSrtg-1; Fri, 05 Mar 2021 11:30:24 -0500
X-MC-Unique: qa94DwI7MzqhmhAnDYSrtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D979D1B2C981;
 Fri,  5 Mar 2021 16:30:22 +0000 (UTC)
Received: from [10.10.117.80] (ovpn-117-80.rdu2.redhat.com [10.10.117.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E91760BF3;
 Fri,  5 Mar 2021 16:30:22 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] simplebench/bench_block_job: drop caches before
 test run
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-9-vsementsov@virtuozzo.com>
 <f7d24c40-eb01-4df6-52c7-5f48aa30656f@redhat.com>
 <c3c9571b-5999-378e-1915-88eaaf93b2de@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <efe7e17b-1edd-7db7-174e-c0ed1bf80001@redhat.com>
Date: Fri, 5 Mar 2021 11:30:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c3c9571b-5999-378e-1915-88eaaf93b2de@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 4:11 AM, Vladimir Sementsov-Ogievskiy wrote:
> 05.03.2021 04:30, John Snow wrote:
>> On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> It probably may improve reliability of results when testing in cached
>>> mode.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   scripts/simplebench/bench_block_job.py | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/scripts/simplebench/bench_block_job.py 
>>> b/scripts/simplebench/bench_block_job.py
>>> index 4f03c12169..fa45ad2655 100755
>>> --- a/scripts/simplebench/bench_block_job.py
>>> +++ b/scripts/simplebench/bench_block_job.py
>>> @@ -53,6 +53,8 @@ def bench_block_job(cmd, cmd_args, qemu_args):
>>>           return {'error': 'qemu failed: ' + str(vm.get_log())}
>>>       try:
>>> +        subprocess.run('sync; echo 3 > /proc/sys/vm/drop_caches', 
>>> shell=True,
>>> +                       check=True)
>>>           res = vm.qmp(cmd, **cmd_args)
>>>           if res != {'return': {}}:
>>>               vm.shutdown()
>>>
>>
>> Worth adding a conditional to allow "hot" or "cold" runs? nah?
>>
> 
> You mean, make this addition optional? Make sense
> 
> 

I was thinking (along the lines of allowing both old and new behavior, 
in case anyone except you used these scripts) of this sort of thing:

def bench_block_job(cmd, cmd_args, qemu_args, drop_cache=True): ...

I don't insist on it; I was just earnestly wondering if it had any 
utility. If it doesn't, don't respin on my account.

--js


