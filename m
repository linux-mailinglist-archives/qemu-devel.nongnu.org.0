Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7383252C7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:54:11 +0100 (CET)
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIxt-00073Z-R2
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFIwr-0006Jk-Dv
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFIwm-0008AV-99
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614268379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bC5yIrPoSz0qOXm+oDCTQmm/HHmGKCK/RpdLgMzK74=;
 b=PGQB1XalmE7jzBY5chmQGQBhAfzp/xxcDDeddmA7rVUxVlP7wCo0hFHEGjIK3ImJ6lyf+S
 2uKw4fKUnjGOGvnEvqc9nXGI/9BIHCDLgXjzeXzZGNYkgzDcGAfoZDkU6oLRLlENj+afkc
 TyhemoDs9O+9otCwMsNo5EcqOMtdjf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-EHKoWsmmNqyhvpiWbnFkYQ-1; Thu, 25 Feb 2021 10:52:55 -0500
X-MC-Unique: EHKoWsmmNqyhvpiWbnFkYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43E8F107ACF3;
 Thu, 25 Feb 2021 15:52:54 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADBE65D9C2;
 Thu, 25 Feb 2021 15:52:53 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-2-eblake@redhat.com>
 <a31b0bf7-56af-94a8-4d83-eac366bf62b9@virtuozzo.com>
 <b471d0e3-b7cc-f62f-25a7-d7d59fe6093c@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 1/5] iotests: Update 241 to expose backing layer
 fragmentation
Message-ID: <5a39103c-0688-5bb2-1f15-13c87d8f7892@redhat.com>
Date: Thu, 25 Feb 2021 09:52:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b471d0e3-b7cc-f62f-25a7-d7d59fe6093c@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 8:57 AM, Vladimir Sementsov-Ogievskiy wrote:
> 25.02.2021 16:50, Vladimir Sementsov-Ogievskiy wrote:
>> 18.02.2021 23:15, Eric Blake wrote:
>>> Previous commits (such as 6e280648, 75d34eb9) have mentioned that our
>>> NBD server still sends unaligned fragments when an active layer with
>>> large advertised minimum block size is backed by another layer with a
>>> smaller block size. Expand the test to actually cover these scenario,
>>> by using two different approaches: qcow2 encryption (which forces
>>> 512-byte alignment) with an unaligned raw backing file, and blkdebug
>>> with a 4k alignment.
>>>

> 
> Now I don't think that aligning qemu:allocation-depth information is a
> correct thing to do.

Why not?  First, it's very rare that you'd have a qcow2 image with
mandated 4k minimum block size, backed by another qcow2 image with 512
block size (blkdebug made it possible to expose the bug, but I could not
find a way in common day-to-day usage), so we really aren't impacting
normal users.  Second, from the perspective of copying backing chains
over NBD, what difference does it make if we have the backing chain:

A (granularity 512) <- B (granularity 512) <- C (granularity 4k)

with the allocation pattern:

A: -A-A-A-A-A-A-A-A
B: --BB--BB--BB--BB
C: --------CCCCCCCC

and report the allocation depth as:

   2222222211111111

instead of

   0322032211111111

The former may be imprecise, but it obeys our bounds, and in all
reality, if all we have access to is 4k chunks, any decisions we make
about how to handle that 4k block should be based on the fact that at
least some of the data was allocated in our backing file, and not
treating the entire 4k as unallocated merely because the first 512 bytes
are neither in A nor B.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


