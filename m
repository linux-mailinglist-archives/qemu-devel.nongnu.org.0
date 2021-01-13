Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B963B2F4DFA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:56:34 +0100 (CET)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhZZ-000213-RU
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzhXA-0000KI-0j
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:54:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzhX7-0007jr-HF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610549640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkKw4GSpwX5n6cInSyQYJCjOQeuWYTYlqFthH3ic5Ac=;
 b=Qu0oBN5xzq0vVDZbMp4EIQHdPtwDQClsbwTkP+2d42OxdIGDYeoKmn4SAdhFRkLMd8UBtk
 mWdPi0elhM4HjRbIC8W8BAmyaI0N0UWvRYrtVSrNTObgbwpYndYcf0eNwGpc1VW+ap0jdq
 jjql+5pRHQIArjkiGQU4ewqTkCeRdJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-se0Zg8QiM5OoA_hVCxloVA-1; Wed, 13 Jan 2021 09:53:56 -0500
X-MC-Unique: se0Zg8QiM5OoA_hVCxloVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75365806666;
 Wed, 13 Jan 2021 14:53:55 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 118E619C47;
 Wed, 13 Jan 2021 14:53:54 +0000 (UTC)
Subject: Re: [PATCH 4/7] iotests/129: Use throttle node
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-5-mreitz@redhat.com>
 <0bbc2785-cfeb-ac64-6c19-5d86e7a0ca75@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6b4ee213-9c5f-5750-b385-30e4495776f5@redhat.com>
Date: Wed, 13 Jan 2021 08:53:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0bbc2785-cfeb-ac64-6c19-5d86e7a0ca75@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 8:10 AM, Max Reitz wrote:
> On 13.01.21 15:06, Max Reitz wrote:
>> Throttling on the BB has not affected block jobs in a while, so it is
>> possible that one of the jobs in 129 finishes before the VM is stopped.
>> We can fix that by running the job from a throttle node.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/129 | 39 +++++++++++++++------------------------
>>   1 file changed, 15 insertions(+), 24 deletions(-)
>>

>>           result = self.vm.qmp("stop")
>>           self.assert_qmp(result, 'return', {})
>>           result = self.vm.qmp("query-block-jobs")
>> +
>>           self.assert_qmp(result, 'return[0]/status', 'running')
>>           self.assert_qmp(result, 'return[0]/ready', False)
>>   +        self.vm.qmp("block-job-cancel", device="drive0", force=True)
>> +
> 
> Sorry, somewhere along the way I forgot to remove this block-job-cancel.
>  It’s still from
> https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html
> and I don’t know why I added it there.  It should probably go.
> 
> ('stop' should have drained, that’s the point, so there shouldn’t be any
> further delay if we quit the VM without cancelling the job.)

Since the test still passes without the added block-job-cancel, I'm fine
with removing that line then adding:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


