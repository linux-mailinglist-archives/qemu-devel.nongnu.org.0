Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F43252B5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:49:11 +0100 (CET)
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIt4-0002Oj-4W
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFIqy-00017l-2u
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:47:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFIqw-0005V9-9Z
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614268017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xETs5wr7nb2W/yc2tpnquZQCwWFNXdoO03IFcqc0qKc=;
 b=ONFFahu3bYqj8xBpBnFnxwgVW4LspouI3X/MudUoPzh6f6Aaf78Q9pbH/5xtr0XJPzD1XO
 5wFFjFH6DBiUIV4iX4RuL8/jITwHweUryNhnP3DymYm+CfMqzi5y9pcbg+DNrz53wfpb7T
 /N248AKMoGBnoCZ1+oSHwvCaj0qQHxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-0b1AasAPPOmQCcT39twf-w-1; Thu, 25 Feb 2021 10:46:43 -0500
X-MC-Unique: 0b1AasAPPOmQCcT39twf-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0CA2100CCC0;
 Thu, 25 Feb 2021 15:46:40 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 500945B4A0;
 Thu, 25 Feb 2021 15:46:40 +0000 (UTC)
Subject: Re: [PATCH 1/5] iotests: Update 241 to expose backing layer
 fragmentation
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-2-eblake@redhat.com>
 <a31b0bf7-56af-94a8-4d83-eac366bf62b9@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <21299534-63a6-e6ac-c3f4-74dc40d882ff@redhat.com>
Date: Thu, 25 Feb 2021 09:46:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a31b0bf7-56af-94a8-4d83-eac366bf62b9@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:50 AM, Vladimir Sementsov-Ogievskiy wrote:
> 18.02.2021 23:15, Eric Blake wrote:
>> Previous commits (such as 6e280648, 75d34eb9) have mentioned that our
>> NBD server still sends unaligned fragments when an active layer with
>> large advertised minimum block size is backed by another layer with a
>> smaller block size. Expand the test to actually cover these scenario,
>> by using two different approaches: qcow2 encryption (which forces
>> 512-byte alignment) with an unaligned raw backing file, and blkdebug
>> with a 4k alignment.
>>
>> The encryption test passes with the desired results, but only because
>> the client side works around the server's non-compliance; if you
>> repeat the test manually with tracing turned on, you will see the
>> server sending a status for 1000 bytes of data then 1048 bytes of
>> hole, which is not aligned. But reverting commit 737d3f5244 shows that
>> it is indeed the client working around the bug in the server.
>>
>> Meanwhile, the blkdebug test gives incorrect results: remember, when
>> using x-dirty-bitmap with qemu-img map as a way to sniff alternative
>> metadata contexts, the meanings of "data" and "zero" are determined by
> 
> How I'm tired of this abuse:) It seems that total amount of comments
> about it in code and commit messages worth creating more intuitive
> interface.. Don't you have an idea in mind?

Yes: 'nbdinfo' as part of the libnbd project ;)

Sadly, libnbd is not available on all our common porting targets yet,
and nbdinfo is less than a year old (so even distros that have libnbd
1.0 are too old).

> 
>> that context.  Our client workaround is assuming that the fragmented
>> replies can be merged according to base:allocation rules, but those
>> rules do not work for other contexts (merging dirty and clean bitmap
>> should produce dirty; merging allocated and unallocated should produce
>> allocated; see the FIXME for more about the decoded values we expect).
> 
> You could instead keep the test output correct (without FIXME marks) but
> add the test to "disabled" group and drop it from the group when fixed.

Either way, it's fixed by the end of the series.

> 
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 

Thanks!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


