Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE73357C18
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 08:02:15 +0200 (CEST)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUNk5-0001Ry-Nu
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 02:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUNi6-0000oY-KC
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 02:00:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUNi1-0000qf-2s
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 02:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617861602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4tebhi5+IzGYYu1kIATZp7y3+t2sQZM764v2IZUNAE=;
 b=CLRBiEXd3qCsGnVMtOE7nJ3XuFebYcKLYNp22kguzmU8Dt3DGjV7rygdLarXhnlUpDHBHz
 yqQZjMxfuBbxN4KF5yLLkK3UsvXsU4wRi0Lxk0fURNyBcV6s5w6BWAtVkKhkiw+hCzgncH
 5UVi1UmqXbqhsbPMU663fC8R2Ax9Ud8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-iBYewcs_Mcmm7Z2-OEEunQ-1; Thu, 08 Apr 2021 02:00:00 -0400
X-MC-Unique: iBYewcs_Mcmm7Z2-OEEunQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6E316D4E0;
 Thu,  8 Apr 2021 05:59:58 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-96.pek2.redhat.com
 [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57C6560241;
 Thu,  8 Apr 2021 05:59:42 +0000 (UTC)
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
 <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
 <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
 <9248ae00-9a7d-c960-a673-9b3a3ede0452@oracle.com>
 <da0ae46e-da09-5894-21d4-732e5e20d070@redhat.com>
 <2e48f463-0a17-4ffd-c3a6-4a847e0e34c6@oracle.com>
 <5b21b2a2-e3bd-3812-61d7-bd3550cf680f@redhat.com>
 <f2a81508-e000-4a48-a023-290d40a77b8e@oracle.com>
 <b96ca94e-01a6-f018-6d11-d3837c9501c1@oracle.com>
 <41cec775-8d41-8bf4-7ea6-ea45343dc451@redhat.com>
 <7074ef2d-8410-3815-791b-84c3e034e872@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e02cf3d6-29ce-8421-63c6-4d2bcbf9d25c@redhat.com>
Date: Thu, 8 Apr 2021 13:59:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7074ef2d-8410-3815-791b-84c3e034e872@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/4/8 下午1:51, Dongli Zhang 写道:
>
> On 4/6/21 7:20 PM, Jason Wang wrote:
>> 在 2021/4/7 上午7:27, Dongli Zhang 写道:
>>>> This will answer your question that "Can it bypass the masking?".
>>>>
>>>> For vhost-scsi, virtio-blk, virtio-scsi and virtio-net, to write to eventfd is
>>>> not able to bypass masking because masking is to unregister the eventfd. To
>>>> write to eventfd does not take effect.
>>>>
>>>> However, it is possible to bypass masking for vhost-net because vhost-net
>>>> registered a specific masked_notifier eventfd in order to mask irq. To write to
>>>> original eventfd still takes effect.
>>>>
>>>> We may leave the user to decide whether to write to 'masked_notifier' or
>>>> original 'guest_notifier' for vhost-net.
>>> My fault here. To write to masked_notifier will always be masked:(
>>
>> Only when there's no bug in the qemu.
>>
>>
>>> If it is EventNotifier level, we will not care whether the EventNotifier is
>>> masked or not. It just provides an interface to write to EventNotifier.
>>
>> Yes.
>>
>>
>>> To dump the MSI-x table for both virtio and vfio will help confirm if the vector
>>> is masked.
>>
>> That would be helpful as well. It's probably better to extend "info pci" command.
>>
>> Thanks
> I will try if to add to "info pci" (introduce new arg option to "info pci"), or
> to introduce new command.


It's better to just reuse "info pci".


>
> About the EventNotifier, I will classify them as guest notifier or host notifier
> so that it will be much more easier for user to tell if the eventfd is for
> injecting IRQ or kicking the doorbell.


Sounds good.


>
> Thank you very much for all suggestions!
>
> Dongli Zhang


Thanks


>>
>>> Thank you very much!
>>>
>>> Dongli Zhang
>>>


