Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FC62966C2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 23:47:38 +0200 (CEST)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kViQr-0005Hn-98
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 17:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kViP0-0004kK-BD
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 17:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kViOy-0002bm-2f
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 17:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603403137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9KaKIcT66VziAHts4yZi7YuDzJxEZu9u5eiJ6rv7W4=;
 b=FoUK/DgraDDE9+CCb4VLBEW2BFSGQs7m1dNgzbS0YDyof9HT/T5OO15o1yzlo1SM8j2Vsc
 F6gZ03z6pM+P0Ov/3+egUlSk8hdjtkiV5PGtNdhH4nID1gN2IMcz6i1drJ6amlz2jQV54i
 5zKpXHcoQsMRA6KNuU6jjeTSYHadPHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-vY-0baQDMW2a8xTvIN7XTw-1; Thu, 22 Oct 2020 17:45:26 -0400
X-MC-Unique: vY-0baQDMW2a8xTvIN7XTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DAAC1009E21;
 Thu, 22 Oct 2020 21:45:25 +0000 (UTC)
Received: from [10.3.114.232] (ovpn-114-232.phx2.redhat.com [10.3.114.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE9D6EF48;
 Thu, 22 Oct 2020 21:45:21 +0000 (UTC)
Subject: Re: [PATCH v4 2/7] nbd: Add new qemu:allocation-depth metadata context
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20201009215533.1194742-1-eblake@redhat.com>
 <20201009215533.1194742-3-eblake@redhat.com>
 <85c7c5bf-a6cd-77d0-3dba-3e0df0e9570d@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5c416fc3-2f3f-047b-7248-562b9ffb43c1@redhat.com>
Date: Thu, 22 Oct 2020 16:45:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <85c7c5bf-a6cd-77d0-3dba-3e0df0e9570d@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:09:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, rjones@redhat.com,
 stefanha@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/20 6:52 AM, Vladimir Sementsov-Ogievskiy wrote:

>>   docs/interop/nbd.txt | 27 ++++++++++---
> 
> [..]
> 
>> +In the allocation depth context, bits 0 and 1 form a tri-state value:
>> +
>> +    bits 0-1: 00: NBD_STATE_DEPTH_UNALLOC, the extent is unallocated
>> +              01: NBD_STATE_DEPTH_LOCAL, the extent is allocated in the
>> +                  top level of the image
> 
> Hmm. I always thought that "image" == file, so backing chain is a chain
> of images,
> not a several levels of one image. If it is so, than it should be "the
> top level image".
> And "levels of the image" may designate internal qcow2 snapshots
> unrelated here..

It's fuzzy.  From the guest point of view, we are serving a single guest
image by use of multiple files in the host.  I will do s/level/layer/,
to match the wording I already had on the next line:

>               10: NBD_STATE_DEPTH_BACKING, the extent is inherited from a
>                   backing layer

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


