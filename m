Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C771A25B975
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 05:57:48 +0200 (CEST)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDgNf-0007pJ-Rm
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 23:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kDgMu-0007OL-P5
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 23:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kDgMt-0002Nr-0U
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 23:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599105418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/JG5XyDsHqWumfAnTXInft4dB6pdMmLiaHw7ZBejpY=;
 b=Jmfmbme7qFnWNLrTNBLOd5IGqy365aESeskkG1CZ0zQzKMjSz6Jdk209Jcs96kVVphGkML
 IzLYjDRdqk5EkU2a3u7iZpVWqsvC/1MD/i1ECm/XcoVm1uHmNObWDYK7VaTCpfe+CUVzaV
 H+iV337fPbeFRikN2ywwGP07WIrWCfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-S8TNl2GyMlOFlQEjCEcoSQ-1; Wed, 02 Sep 2020 23:56:43 -0400
X-MC-Unique: S8TNl2GyMlOFlQEjCEcoSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C65B10051AE;
 Thu,  3 Sep 2020 03:56:42 +0000 (UTC)
Received: from [10.72.13.109] (ovpn-13-109.pek2.redhat.com [10.72.13.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 847027049D;
 Thu,  3 Sep 2020 03:56:31 +0000 (UTC)
Subject: Re: [PATCH 1/2] net: forbid the reentrant RX
To: Alexander Bulekov <alxndr@bu.edu>
References: <20200722085747.6514-1-jasowang@redhat.com>
 <0fd8eb52-6410-1bbd-2462-598c6fcebeb9@redhat.com>
 <20200902155614.aubuw5ygll35p3vp@mozz.bu.edu>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9a6be1f3-84dd-d710-1a18-50e7972c30a2@redhat.com>
Date: Thu, 3 Sep 2020 11:56:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902155614.aubuw5ygll35p3vp@mozz.bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 23:55:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: dmitry.fleytman@gmail.com, mst@redhat.com, liq3ea@gmail.com, liq3ea@163.com,
 qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/2 下午11:56, Alexander Bulekov wrote:
> On 200728 1200, Jason Wang wrote:
>> On 2020/7/22 下午4:57, Jason Wang wrote:
>>> The memory API allows DMA into NIC's MMIO area. This means the NIC's
>>> RX routine must be reentrant. Instead of auditing all the NIC, we can
>>> simply detect the reentrancy and return early. The queue->delivering
>>> is set and cleared by qemu_net_queue_deliver() for other queue helpers
>>> to know whether the delivering in on going (NIC's receive is being
>>> called). We can check it and return early in qemu_net_queue_flush() to
>>> forbid reentrant RX.
>>>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>>    net/queue.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/net/queue.c b/net/queue.c
>>> index 0164727e39..19e32c80fd 100644
>>> --- a/net/queue.c
>>> +++ b/net/queue.c
>>> @@ -250,6 +250,9 @@ void qemu_net_queue_purge(NetQueue *queue, NetClientState *from)
>>>    bool qemu_net_queue_flush(NetQueue *queue)
>>>    {
>>> +    if (queue->delivering)
>>> +        return false;
>>> +
>>>        while (!QTAILQ_EMPTY(&queue->packets)) {
>>>            NetPacket *packet;
>>>            int ret;
>>
>> Queued for rc2.
>>
>> Thanks
>>
> Hi Jason,
> I don't think this ever made it in. Are there any remaining problems?
> Thanks
> -Alex


Hi Alex:

It should have been merged:

https://git.qemu.org/?p=qemu.git;a=commit;h=22dc8663d9fc7baa22100544c600b6285a63c7a3

Thanks


>


