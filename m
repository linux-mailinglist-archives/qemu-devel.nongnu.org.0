Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE73351641
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:36:28 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzMx-0005K3-Ba
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRzKU-0003Xo-R3
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:33:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRzKQ-0004ln-J5
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617291229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQJK0acGyv4uxNLgb5vubua27ZmyNe7cOcVDmE0+8ZU=;
 b=UYPnbgimuBBkDS8LMX8eOJr0169e6+JTNhHIOop5sWdD9ghRX4D/MM7fN/danMLJRFZBG2
 tfiNHKiKsqh9I+fnVHVI3BX0Jqb9GxQaJSr8Da9PzW7qBRXrnrzPtA3SKDScIaK4wvS0U+
 13SoilpZvrhO8wHgMjPSaxrGSTg4zdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-OzRBJTzZOZmHhhbUOA-L8w-1; Thu, 01 Apr 2021 11:33:47 -0400
X-MC-Unique: OzRBJTzZOZmHhhbUOA-L8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA2A7107ACCA;
 Thu,  1 Apr 2021 15:33:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-60.ams2.redhat.com
 [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E4D260CCD;
 Thu,  1 Apr 2021 15:33:40 +0000 (UTC)
Subject: Re: [PATCH 2/2] iotests/qsd-jobs: Use common.qemu for the QSD
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210401132815.139575-1-mreitz@redhat.com>
 <20210401132815.139575-3-mreitz@redhat.com>
 <ff97c0ff-4756-d24e-3afb-428737985f1c@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d4008c4e-a5a2-d1b1-801f-d9e93fa0d033@redhat.com>
Date: Thu, 1 Apr 2021 17:33:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ff97c0ff-4756-d24e-3afb-428737985f1c@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 16:44, Vladimir Sementsov-Ogievskiy wrote:
> 01.04.2021 16:28, Max Reitz wrote:
>> Using common.qemu allows us to wait for specific replies, so we can for
>> example wait for events.  This allows starting the active commit job and
>> then wait for it to be ready before quitting the QSD, so we the output
>> is always the same.
>>
>> (Strictly speaking, this is only necessary for the first test in
>> qsd-jobs, but we might as well make the second one use common.qemu's
>> infrastructure, too.)
>>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/tests/qsd-jobs     | 55 ++++++++++++++++++++-------
>>   tests/qemu-iotests/tests/qsd-jobs.out | 10 ++++-
>>   2 files changed, 49 insertions(+), 16 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/tests/qsd-jobs 
>> b/tests/qemu-iotests/tests/qsd-jobs
>> index 972b6b3898..af7f886f15 100755
>> --- a/tests/qemu-iotests/tests/qsd-jobs
>> +++ b/tests/qemu-iotests/tests/qsd-jobs
>> @@ -38,6 +38,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>>   cd ..
>>   . ./common.rc
>>   . ./common.filter
>> +. ./common.qemu
>>   _supported_fmt qcow2
>>   _supported_proto generic
>> @@ -52,32 +53,58 @@ echo "=== Job still present at shutdown ==="
>>   echo
>>   # Just make sure that this doesn't crash
>> -$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
>> +qsd=y _launch_qemu \
> 
> sounds a bit strange.. Like we are starting qemu.

Yeah, well.  Yeah.  We could have a

_launch_qsd()
{
     qsd=y _launch_qemu
}

But this would still make it weird for all the other commands from 
common.qemu, and I don’t think it makes much sense to introduce aliases 
for all of them.  So I think it’d be best to live with that bit of 
weirdness.

Max


