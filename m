Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD4322770
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:05:54 +0100 (CET)
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETdh-0004me-2u
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lETau-0003r0-Lw
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lETaq-0007bn-JV
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614070974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZDR4c4Vtcb/LwrVxXTBCBQVLk4DtwpSIeKPgW5fElo=;
 b=M7ccMD+6ubAWaz/Q8YxF0aHre14pBJwAIq0V/fa7zmR4gvcz2CNIcm/mv2AoV8SY/GeBU6
 p3whgjrlMa0NO77wMNjRH0lyh29kZxLBdPrVGWTHVGuBaJ+YBl8uvsTQbcMshGWi9lrdLM
 YbiPAAEUpE0tu0xY38YOk/Fx2OXkaOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-hpmLSyuGOJyEF4U7HS3Uzg-1; Tue, 23 Feb 2021 04:02:36 -0500
X-MC-Unique: hpmLSyuGOJyEF4U7HS3Uzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB4BBBBEED;
 Tue, 23 Feb 2021 09:02:35 +0000 (UTC)
Received: from [10.36.114.0] (ovpn-114-0.ams2.redhat.com [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AB552CFB2;
 Tue, 23 Feb 2021 09:02:19 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-10-david@redhat.com>
 <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
 <d64fdd53-6868-15fd-ea81-fa26e153eced@redhat.com>
 <61237335-b03f-cb89-c0be-03fc3058c13b@redhat.com>
 <9b127669-f84e-7f8c-f76c-2bf7b206d68b@redhat.com>
 <fa76ac9e-933f-4cdc-0d88-d07604999f45@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v6 09/12] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
Message-ID: <f62b90b9-e3dc-f904-e511-eede76120220@redhat.com>
Date: Tue, 23 Feb 2021 10:02:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fa76ac9e-933f-4cdc-0d88-d07604999f45@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.21 18:32, Paolo Bonzini wrote:
> On 22/02/21 16:38, David Hildenbrand wrote:
>> On 22.02.21 15:02, Paolo Bonzini wrote:
>>> On 22/02/21 14:33, David Hildenbrand wrote:
>>>>> Also, uncoordinated require is unused, and therefore uncoordinated
>>>>> disable is also never going to block anything.  Does it make sense to
>>>>> keep it in the API?
>>>>
>>>> Right, "ram_block_discard_require()" is not used yet. I am planning on
>>>> using it in virtio-balloon context at some point, but can remove it for
>>>> now to simplify.
>>>>
>>>> ram_block_uncoordinated_discard_disable(), however, will block
>>>> virtio-balloon already via ram_block_discard_is_disabled(). (yes,
>>>> virtio-balloon is ugly)
>>>
>>> Oops, I missed that API.
>>>
>>> Does it make sense to turn the API inside out, with the
>>> coordinated/uncoordinated choice as an argument and the start/finish
>>> choice in the name?
>>>
>>> enum {
>>>        RAM_DISCARD_ALLOW_COORDINATED = 1,
>>> };
>>>
>>
>> Any reason to go with an enum/flags for this case and not "bool
>> allow_coordinated" ?
> 
> I find it slightly easier to remember the meaning of true for "bool
> coordinated" than for "bool allow_coordinated".  I don't like the API
> below that much, but having both RAM_DISCARD_ALLOW_COORDINATED for
> disable/enable and RAM_DISCARD_SUPPORT_COORDINATED for start/finish
> would be even uglier...
> 
> Paolo
> 
>>> bool ram_discard_disable(int flags, Error **errp);
>>> void ram_discard_enable(int flags);
>>> int ram_discard_start(bool coordinated, Error **errp);
>>> void ram_discard_finish(bool coordinated);
>>

So, the new API I propose is:

int ram_block_discard_disable(bool state)
int ram_block_uncoordinated_discard_disable(bool state)
int ram_block_discard_require(bool state)
int ram_block_coordinated_discard_require(bool state);
bool ram_block_discard_is_disabled(void);
bool ram_block_discard_is_required(void);


Some points (because I thought about this API a bit when I came up with it):

1. I'd really like to keep the functionality of 
ram_block_discard_is_disabled() / ram_block_discard_is_required(). I'd 
assume you just didn't include it in your proposal.

2. I prefer the "require" wording over "start/finish". Start/finish 
sounds like it's a temporary thing like a transaction. For example 
"ram_block_discard_is_started()" sounds misleading to me

3. "ram_discard_enable()" sounds a bit misleading to me as well. We're 
not actually enabling anything, we're not disabling it anymore.

4. I don't think returning an "Error **errp" does make a lot of sense here.


Unless there is real need for a major overhaul I'd like to keep it to 
minor changes.

-- 
Thanks,

David / dhildenb


