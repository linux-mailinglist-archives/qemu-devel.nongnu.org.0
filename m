Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C438B08E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:53:29 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljj7A-0001BU-KX
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ljj5d-0007eY-PA
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ljj5b-0002zc-PL
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621518710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ttWY/Nnr3cCN9m/I1t5hiiG+jIQMvTIfnx/PEc/p5I=;
 b=Fz50MxckWz1Dgl1bO/ZkfhnMqqpxFq6sVe6WXwZOLKoCDznJwYWmgrXtjuuFlpwjqfmHqB
 n6O3zZ5rWC9XhtlLhhcuIWoS6oPfvvEZWxMwsZnC6EB2b1V8MSlNhVSiQKurd1Qsa9hQQ+
 8Ker5Q8vWN7nViVnPVwl6H3DRss2FOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-1DILQmTPPT-0ecAGWOUwMw-1; Thu, 20 May 2021 09:51:47 -0400
X-MC-Unique: 1DILQmTPPT-0ecAGWOUwMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FDF28015C6;
 Thu, 20 May 2021 13:51:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-95.ams2.redhat.com
 [10.36.114.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE7D19C71;
 Thu, 20 May 2021 13:51:45 +0000 (UTC)
Subject: Re: [PULL 03/19] monitor: hmp_qemu_io: acquire aio contex, fix crash
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210514164514.1057680-1-mreitz@redhat.com>
 <20210514164514.1057680-4-mreitz@redhat.com>
 <CAFEAcA_MynMjOYHmYrkGigV2hF7sFEofFW2vxZuOOs-rxk1=Bg@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c0fd6ca3-78e9-b629-b337-9629649f72ad@redhat.com>
Date: Thu, 20 May 2021 15:51:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MynMjOYHmYrkGigV2hF7sFEofFW2vxZuOOs-rxk1=Bg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 15:44, Peter Maydell wrote:
> On Fri, 14 May 2021 at 17:45, Max Reitz <mreitz@redhat.com> wrote:
>>
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Hi; Coverity complains about this code (CID 1453194):
> 
>> diff --git a/qemu-io.c b/qemu-io.c
>> index bf902302e9..57f07501df 100644
>> --- a/qemu-io.c
>> +++ b/qemu-io.c
>> @@ -411,6 +411,19 @@ static void prep_fetchline(void *opaque)
>>       *fetchable= 1;
>>   }
>>
>> +static int do_qemuio_command(const char *cmd)
>> +{
>> +    int ret;
>> +    AioContext *ctx =
>> +        qemuio_blk ? blk_get_aio_context(qemuio_blk) : qemu_get_aio_context();
> 
> Here we check whether qemuio_blk is NULL...
> 
>> +
>> +    aio_context_acquire(ctx);
>> +    ret = qemuio_command(qemuio_blk, cmd);
> 
> ...but here we pass it to qemuio_command(), which assumes it must
> be non-NULL (via calling command() which calls blk_is_available()).
> 
> Bug, or false positive ?

It’s a false positive, Vladimir has sent a patch to silence Coverity:

https://lists.nongnu.org/archive/html/qemu-block/2021-05/msg00853.html

Max


