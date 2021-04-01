Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEBA351642
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:37:27 +0200 (CEST)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzNu-0007IU-DV
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRzI0-0001PC-5P
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRzHy-0003G7-11
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617291076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GV8UiJvkcVYyHLdC3ZfEzbaO+IsAimJECYVXRz03x4=;
 b=SohYgVo6pzH01AKz13yxnjdJY8hErtSjI+hwdsHdirKqa7JGJHy70S+ZwGCudVFPTCWUEt
 Hoy4RTFreCVgPaHBlVViJeTG7atwcuLRdRVQQgmXbRlek4FG0Mtbgxt8/Xr60xX/C48s+O
 GH+xJHx3M4l0nzY6pyvkl0MUqvZSP6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-U50xLvlMN4OJZE3sBpamOA-1; Thu, 01 Apr 2021 11:31:14 -0400
X-MC-Unique: U50xLvlMN4OJZE3sBpamOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E9C718498EE;
 Thu,  1 Apr 2021 15:30:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-60.ams2.redhat.com
 [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE4D85D9CA;
 Thu,  1 Apr 2021 15:30:33 +0000 (UTC)
Subject: Re: [PATCH] iotests/qsd-jobs: Filter events in the first test
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210401132839.139939-1-mreitz@redhat.com>
 <c0f53da1-bae5-d853-1cd3-355fd296d23f@virtuozzo.com>
 <816e08d6-25ae-c84c-6d42-91f3a3a48fcd@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ec33e0a9-49cd-04e2-7afc-0cbdfc82d798@redhat.com>
Date: Thu, 1 Apr 2021 17:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <816e08d6-25ae-c84c-6d42-91f3a3a48fcd@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 16:37, Vladimir Sementsov-Ogievskiy wrote:
> 01.04.2021 17:37, Vladimir Sementsov-Ogievskiy wrote:
>> 01.04.2021 16:28, Max Reitz wrote:
>>> The job may or may not be ready before the 'quit' is issued.  Whether it
>>> is is irrelevant; for the purpose of the test, it only needs to still be
>>> there.  Filter the job status change and READY events from the output so
>>> it becomes reliable.
>>>
>>> Reported-by: Peter Maydell<peter.maydell@linaro.org>
>>> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>>> Signed-off-by: Max Reitz<mreitz@redhat.com>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>>
> 
> Hmm, in your mail (and in copypasted by r-b) there is no space between 
> name and "<"..

Are you sure?  I can see the spaces in my original mail, and on
https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg00182.html

But OTOH I don’t see a space between your name and the < in your R-b...

Max


