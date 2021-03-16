Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C597E33D3D0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:28:13 +0100 (CET)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8nz-00041j-2A
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lM8l8-0002BS-MC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lM8l5-0006Fq-SQ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615897511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EkNumiPDKeg76zYImKx6qX0AuvHLWBb+x2FrL/FG3EQ=;
 b=MfdVNSgqQ6psrTXbfJY+ZmcV2tO59nNHbaH5m5E/Cm9zl4RMv160HuUGcWgCBKK1XukvkO
 Ir9gOn+yQfKLXwQg0gZFnyLNTUAmUuIIpmM9kf8sP1sV9GBoxghdeusUitN4dmR+yTBnQu
 /iRYwKe5Of7F5DR4L5tzxI48Fu1jqdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-BKeZn5jCPMqIBLaDWCSglA-1; Tue, 16 Mar 2021 08:25:06 -0400
X-MC-Unique: BKeZn5jCPMqIBLaDWCSglA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25F51084C9D;
 Tue, 16 Mar 2021 12:25:05 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-92.ams2.redhat.com
 [10.36.115.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70A635C6DF;
 Tue, 16 Mar 2021 12:25:04 +0000 (UTC)
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
 <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
 <d5acfe9d-2095-a601-20b7-bd0b677df68a@virtuozzo.com>
 <6056196d-a0cc-7de2-5d6f-b223fdee98ff@redhat.com>
 <7fb10a80-8001-966d-533e-3f74c739571a@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cec9f2d3-af82-1de2-2ddf-be1b9dde73f9@redhat.com>
Date: Tue, 16 Mar 2021 13:25:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7fb10a80-8001-966d-533e-3f74c739571a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.03.21 15:40, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2021 12:58, Max Reitz wrote:

[...]

>> The question is whether it really makes sense to even have a 
>> seqcache_read() path when in reality it’s probably never accessed.  I 
>> mean, besides the fact that it seems based purely on chance whether a 
>> read might fetch something from the cache even while we’re writing, in 
>> practice I don’t know any case where we’d write to and read from a 
>> compressed qcow2 image at the same time.  (I don’t know what you’re 
>> doing with the 'compress' filter, though.)
>>
> 
> Note, that for user that's not a parallel write and read to the same 
> cluster:
> 
> 1. user writes cluster A, request succeeded, data is in the cache
> 
> 2. user writes some other clusters, cache filled, flush started
> 
> 3. in parallel to [2] user reads cluster A. From the POV of user, 
> cluster A is written already, and should be read successfully

Yes, but when would that happen?

> And seqcache_read() gives a simple non-blocking way to support read 
> operation.

OK, that makes sense.  We’d need to flush the cache before we can read 
anything from the disk, so we should have a read-from-cache branch here.

> But rewriting compressed clusters is sensible only when we run real 
> guest on compressed image.. Can it be helpful? Maybe for scenarios with 
> low disk usage ratio..

I’m not sure, but the point is that rewrites are currently not 
supported.  The whole compression implementation is mainly tailored 
towards just writing a complete image (e.g. by qemu-img convert or the 
backup job), so that’s where my question is coming from: It’s difficult 
for me to see a currently working use case where you’d read from and 
write to a compressed image at the same time.

Max


