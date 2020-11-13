Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019D2B1FCB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:12:55 +0100 (CET)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbh0-0001LC-Ax
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbff-0000iL-82
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbfd-00065e-En
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605283888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnkIHRRh8nrtjh4GrAqdUcqwkvRVvAiul6ROoDByPkE=;
 b=eD/HNNUKFyKCCF91YssLjM9TYbqKEMeOwEBTcVwnHExXKvKg3dQfWLCqXfMCJ2AfoxiWLh
 eGjDizFNHnu7ts7vbJGejSOIAx+/qCCOD/zBWwVNVcfRz83virvXTEhGKjs3A73UjjpjCM
 NIFwmjf2XxKp7V8eNgVITGOZEVuhBoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-BX0sUqAxNvC7vwRq0a0yXA-1; Fri, 13 Nov 2020 11:11:24 -0500
X-MC-Unique: BX0sUqAxNvC7vwRq0a0yXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BF9E1084C96;
 Fri, 13 Nov 2020 16:11:23 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F88560C11;
 Fri, 13 Nov 2020 16:11:22 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1605111801.git.berto@igalia.com>
 <2faad461e6bffc4a50547547b8c20c39e0f544e8.1605111801.git.berto@igalia.com>
 <5b5e73f3-a045-268d-e82a-f652668a8f02@redhat.com>
 <w51a6vlfdf1.fsf@maestria.local.igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <552f29f1-5b6a-82d3-a55f-100b460bcc6a@redhat.com>
Date: Fri, 13 Nov 2020 17:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <w51a6vlfdf1.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.11.20 17:07, Alberto Garcia wrote:
> On Fri 13 Nov 2020 12:49:04 PM CET, Max Reitz wrote:
>> On 11.11.20 17:53, Alberto Garcia wrote:
>>> This simply calls bdrv_co_pwrite_zeroes() in all children
>>>
>>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>>> ---
>>>    block/quorum.c             | 18 ++++++++++++++++--
>>>    tests/qemu-iotests/312     |  7 +++++++
>>>    tests/qemu-iotests/312.out |  4 ++++
>>>    3 files changed, 27 insertions(+), 2 deletions(-)
>>
>> Should we set supported_zero_flags to something?  I think we can at
>> least set BDRV_REQ_NO_FALLBACK.  We could also try BDRV_REQ_FUA.
> 
> We could set all supported_zero_flags as long as all children support
> them, right?

Sure, I was just thinking that we could set these regardless of whether 
the children support them, because (on zero-writes) the block layer will 
figure out for us whether the child nodes support them. O:)

>>> +    if (acb->flags & BDRV_REQ_ZERO_WRITE) {
>>> +        sacb->ret = bdrv_co_pwrite_zeroes(s->children[i], acb->offset,
>>> +                                          acb->bytes, acb->flags);
>>> +    } else {
>>> +        sacb->ret = bdrv_co_pwritev(s->children[i], acb->offset, acb->bytes,
>>> +                                    acb->qiov, acb->flags);
>>> +    }
>>
>> Seems unnecessary (bdrv_co_pwritev() can handle BDRV_REQ_ZERO_WRITE),
>> but perhaps it’s good to be explicit.
> 
> pwrite_zeroes() does this additionaly:
> 
>      if (!(child->bs->open_flags & BDRV_O_UNMAP)) {
>          flags &= ~BDRV_REQ_MAY_UNMAP;
>      }

Interesting.  Technically, Quorum doesn’t support that flag (in 
supported_zero_flags O:))), so it shouldn’t appear, but, er, well then.

Max


