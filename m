Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895E373DB6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:32:35 +0200 (CEST)
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIZm-0003HO-Nr
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leIX6-0002Iq-JE
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:29:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leIX4-00079d-5u
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620224984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjgsGdv6rWfsr9/T52xcJDKUHNhIfNf/b6H7La3R9Sw=;
 b=KzVrVCtM7i2zZRcpXed5nm8SJH2wWCWNvw3qJogyEjteB02bGCR9/sxCjNPkuHPwQ2HnpE
 rskgWexGH2NFmLBiZALEdYXBNOQ6iehLnpvVmwDqovcjBVkLztmMgBlf3K9Zrru63EWcfb
 ABQD1TEYd2EOl6Psmwh5kNffTgFPj1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-QBUw0fyPPpGvnTQU9j4bkg-1; Wed, 05 May 2021 10:29:41 -0400
X-MC-Unique: QBUw0fyPPpGvnTQU9j4bkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE4F1800D41;
 Wed,  5 May 2021 14:29:40 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17C885C1C5;
 Wed,  5 May 2021 14:29:34 +0000 (UTC)
Subject: Re: [PATCH v2 1/9] block/write-threshold: don't use write notifiers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-2-vsementsov@virtuozzo.com>
 <712e9661-e296-b960-d6ca-9173f9ecb2f3@redhat.com>
 <384228c1-3e4c-f28f-aaf6-3c2515b99dcf@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a80c8ebc-649c-db0b-c53c-7b6fcdfb5d07@redhat.com>
Date: Wed, 5 May 2021 16:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <384228c1-3e4c-f28f-aaf6-3c2515b99dcf@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.05.21 15:35, Vladimir Sementsov-Ogievskiy wrote:
> 05.05.2021 15:37, Max Reitz wrote:
>>> write-notifiers are used only for write-threshold. New code for such
>>> purpose should create filters.
>>>
>>> Let's better special-case write-threshold and drop write notifiers at
>>> all. (Actually, write-threshold is special-cased anyway, as the only
>>> user of write-notifiers)
>>
>> Not noted here: That write-threshold.c is also reorganized.  (Doesn’t 
>> seem entirely necessary to do right in this patch, but why not.)
> 
> You mean, we probably could only add new interface here, keeping other 
> things as is, and drop them in a separate patch?

Something like that, yes.  But not important.

> If keep as is we can add the following here:
> 
>    So, create a new direct interface for bdrv_co_write_req_prepare() and 
> drop
>    all write-notifier related logic from write-threshold.c.
> 

Sounds good!

Max


