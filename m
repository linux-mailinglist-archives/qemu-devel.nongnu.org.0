Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA09368A7D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 03:45:11 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZksY-0005Eg-2v
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 21:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZkrL-0004dk-8z
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZkrG-00038s-Te
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619142229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB+ZGH9oaXytz/D/RLXPOQAmvLe6cLh3zEf0m9rQYss=;
 b=i0+yXBAQC8IHZz0FbPEIBC8B4jlcCQh758cNFKdMbG02v1rOoJa640lfHPz3ED/Zg6Cqd9
 4QHLCbJQhjf/T9ZS9q/e15YYpB3WzJ1FggfCmY5aPoIPYEBf20+481GXP7I7btSYcHyxFK
 UFqjDebYxJ1e1JNXkgu59GR0BvQdX4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-ScXM-oDROji6rANS-gJkKw-1; Thu, 22 Apr 2021 21:43:46 -0400
X-MC-Unique: ScXM-oDROji6rANS-gJkKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBEBC881276;
 Fri, 23 Apr 2021 01:43:44 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-201.pek2.redhat.com
 [10.72.12.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27A196362B;
 Fri, 23 Apr 2021 01:43:41 +0000 (UTC)
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: Cole Robinson <crobinso@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
 <fe1f97bc-5ff9-002b-debc-5bc2c449c8b8@redhat.com>
 <CAEUhbmXR1Yn5paL+d0DMjgZUiinQGNRazj3neScL4_=CGvC8zg@mail.gmail.com>
 <CAFEAcA_4TSF1KKxVQUDt3r+aAnZqT-A2uA8m7O0ZaxHQVWgKJg@mail.gmail.com>
 <CAEUhbmX-XvJ6ViPjTsiQ2GhmhwefTSbF_m1CRwzphf82SNQixA@mail.gmail.com>
 <716bf384-3ba6-179e-afa9-5b02e4573845@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <04625377-f307-03b1-11ed-1f02dd05253b@redhat.com>
Date: Fri, 23 Apr 2021 09:43:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <716bf384-3ba6-179e-afa9-5b02e4573845@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/4/23 上午5:34, Cole Robinson 写道:
> On 4/22/21 5:42 AM, Bin Meng wrote:
>> On Thu, Apr 22, 2021 at 5:36 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Thu, 22 Apr 2021 at 05:29, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>> On Thu, Apr 22, 2021 at 12:36 AM Philippe Mathieu-Daudé
>>>> <philmd@redhat.com> wrote:
>>>>> Cc'ing Bin.
>>>>>
>>>>> On 4/21/21 5:22 PM, Cole Robinson wrote:
>>>>>> Attempting to hotplug a tap nic with libvirt will crash qemu:
>>>>>>
>>>>>> $ sudo virsh attach-interface f32 network default
>>>>>> error: Failed to attach interface
>>>>>> error: Unable to read from monitor: Connection reset by peer
>>>>>>
>>>>>> 0x000055875b7f3a99 in tap_send (opaque=0x55875e39eae0) at ../net/tap.c:206
>>>>>> 206           if (!s->nc.peer->do_not_pad) {
>>>>>> gdb$ bt
>>>>>>
>>>>>> s->nc.peer may not be set at this point. This seems to be an
>>>>>> expected case, as qemu_send_packet_* explicitly checks for NULL
>>>>>> s->nc.peer later.
>>>>>>
>>>>>> Fix it by checking for s->nc.peer here too. Padding is applied if
>>>>>> s->nc.peer is not set.
>>>>>>
>>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1949786
>>>>>> Fixes: 969e50b61a2
>>>>>>
>>>>>> Signed-off-by: Cole Robinson <crobinso@redhat.com>
>>>>>> ---
>>>>>> * Or should we skip padding if nc.peer is unset? I didn't dig into it
>>>>>> * tap-win3.c and slirp.c may need a similar fix, but the slirp case
>>>>>>    didn't crash in a simple test.
>>>>>>
>>>>>>   net/tap.c | 2 +-
>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/net/tap.c b/net/tap.c
>>>>>> index dd42ac6134..937559dbb8 100644
>>>>>> --- a/net/tap.c
>>>>>> +++ b/net/tap.c
>>>>>> @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
>>>>>>               size -= s->host_vnet_hdr_len;
>>>>>>           }
>>>>>>
>>>>>> -        if (!s->nc.peer->do_not_pad) {
>>>>>> +        if (!s->nc.peer || !s->nc.peer->do_not_pad) {
>>>> I think we should do:
>>>>
>>>> if (s->nc.peer && !s->nc.peer->do_not_pad)
>>> Yes. If there is no peer then the qemu_send_packet() that we're about
>>> to do is going to discard the packet anyway, so there's no point in
>>> padding it.
>>>
>>> Maybe consider
>>>
>>> static inline bool net_peer_needs_padding(NetClientState *nc)
>>> {
>>>      return nc->peer && !nc->peer->do_not_pad;
>>> }
>>>
>>> since we want the same check in three places ?
>> Sounds good to me.
>>
> I did not get to this today. Bin/Jason/anyone want to write the patch,


I will send a patch soon.

Thanks


> I
> will test it tomorrow (US EDT time). If not I'll write the patch tomorrow.
>
> Thanks,
> Cole
>
>


