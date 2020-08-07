Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D023E658
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 05:36:27 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3tBB-00037C-SP
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 23:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k3tAH-0002gx-Az
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 23:35:29 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23213
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k3tAE-0002sv-Hy
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 23:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596771324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzD1aZW27As4sQOSEoFwffFyztx83cRaX7sXgNmwGsk=;
 b=GewCrEWjqXVqaIlC30RhiYefP5LZqY/YPLbDA3zTQB+5KICAXsJ3G9rg3nDNQISoBfMEoP
 hNCRibjlYXmH9RDTdEL0E7sPpbtyoG38V4lknQilxEGPj/zVHzRpPgXNzLZNq0enlSXmOp
 7iMUmVPLBxSn5X6/tsNRbKIA/Kb61Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-JKeQ_umPNoyS3t8eZwqa7w-1; Thu, 06 Aug 2020 23:35:20 -0400
X-MC-Unique: JKeQ_umPNoyS3t8eZwqa7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3526710059A9;
 Fri,  7 Aug 2020 03:35:19 +0000 (UTC)
Received: from [10.72.13.215] (ovpn-13-215.pek2.redhat.com [10.72.13.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F5D65C8C;
 Fri,  7 Aug 2020 03:35:10 +0000 (UTC)
Subject: Re: Any reason VIRTQUEUE_MAX_SIZE is 1024? Can we increase this limit?
To: Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
References: <AM7PR05MB6695D4FF6766BF2942C345D6BB710@AM7PR05MB6695.eurprd05.prod.outlook.com>
 <20200805121107.GG361702@stefanha-x1.localdomain>
 <20200805081144-mutt-send-email-mst@kernel.org>
 <20200806123708.GC379937@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e9f6ae61-c2d5-e204-f9b0-5113ef7fc330@redhat.com>
Date: Fri, 7 Aug 2020 11:35:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806123708.GC379937@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 23:35:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yajun Wu <yajunw@mellanox.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/8/6 下午8:37, Stefan Hajnoczi wrote:
> On Wed, Aug 05, 2020 at 08:13:29AM -0400, Michael S. Tsirkin wrote:
>> On Wed, Aug 05, 2020 at 01:11:07PM +0100, Stefan Hajnoczi wrote:
>>> On Thu, Jul 30, 2020 at 07:46:09AM +0000, Yajun Wu wrote:
>>>> I'm doing iperf test on VIRTIO net through vhost-user(HW VDPA).
>>>> Find maximal acceptable tx_queue_size/rx_queue_size is 1024.
>>>> Basically increase queue size can get better RX rate for my case.
>>>>
>>>> Can we increase the limit(VIRTQUEUE_MAX_SIZE) to 8192 to possibly gain better performance?
>>> Hi,
>>> The VIRTIO 1.1 specification says the maximum number of descriptors is
>>> 32768 for both split and packed virtqueues.
>>>
>>> The vhost kernel code seems to support 32768.
>>>
>>> The 1024 limit is an implementation limit in QEMU. Increasing it would
>>> require QEMU code changes. For example, VIRTQUEUE_MAX_SIZE is used as
>>> the size of arrays.
>>>
>>> I can't think of a fundamental reason why QEMU needs to limit itself to
>>> 1024 descriptors. Raising the limit would require fixing up the code and
>>> ensuring that live migration remains compatible with older versions of
>>> QEMU.
>>>
>>> Stefan
>> There's actually a reason for a limit: in theory the vq size
>> also sets a limit on the number of scatter/gather entries.
>> both QEMU and vhost can't handle a packet split over > 1k chunks.
>>
>> We could add an extra limit for s/g size like block and scsi do,
>> this will need spec, guest and host side work.
> Interesting, thanks for explaining! This could be made explicit by
> changing the QEMU code to:
>
> include/hw/virtio/virtio.h:#define VIRTQUEUE_MAX_SIZE IOV_MAX
>
> Looking more closely at the vhost kernel code I see that UIO_MAXIOV is
> used in some places but not in vhost_vring_set_num() (ioctl
> VHOST_SET_VRING_NUM). Is there a reason why UIO_MAXIOV isn't enforced
> when the application sets the queue size?


Actually three things:

1) queue size
2) #descriptors in a list
3) IOV size

Spec limit the 2) to 1) but 2) may not equal to 3).

So enforcing UIO_MAXIOV can not solve the problem completely.

For vhost-net, it depends on socket to build skb which requires an iov 
array to work. We need remove this limitation by:

- build skb by vhost-net itself
- do piecewise copying

Then we're not limited with #iov and more and support up to what spec 
supports.

Thanks


>
> Stefan


