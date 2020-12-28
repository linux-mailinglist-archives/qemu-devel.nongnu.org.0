Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D262E34A8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:13:03 +0100 (CET)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktmiE-0006B9-H7
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ktmgr-0005lc-E3
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 02:11:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ktmgn-00012C-6B
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 02:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609139490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afqhDG4kaLOOGeDeijGozBVYwd3NKShj99LbLwm8u2g=;
 b=OyYOBlD9tc4pIrBBd9o/3PWwIAqMzZgzqdvnZkOM9kIGsYcduLycnE3edcz/hHxrF5aT7n
 QUfdv3f8uOtRxtIUZ/AOecK6frAYP6wV70kbwf7WcJHvINa2E7h8Q8zGo9gCnXgM5NkXkN
 JaPtT1711b03Xt8gTmuuxMhN1wB9Bi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-0ND5NQRjNcmZkORx7-ItGw-1; Mon, 28 Dec 2020 02:11:28 -0500
X-MC-Unique: 0ND5NQRjNcmZkORx7-ItGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 634541005D4C;
 Mon, 28 Dec 2020 07:11:27 +0000 (UTC)
Received: from [10.72.13.159] (ovpn-13-159.pek2.redhat.com [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11A2D1A3D8;
 Mon, 28 Dec 2020 07:11:24 +0000 (UTC)
Subject: Re: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
To: "Zhang, Chen" <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
 <a4adb965911348f4901f72e7e472c07e@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <97d593c2-222d-a3cf-e797-8d77b8701bed@redhat.com>
Date: Mon, 28 Dec 2020 15:11:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a4adb965911348f4901f72e7e472c07e@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.041,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.829, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/28 上午8:38, Zhang, Chen wrote:
>
>> -----Original Message-----
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Friday, December 25, 2020 2:20 PM
>> To: Zhang, Chen <chen.zhang@intel.com>; qemu-dev <qemu-
>> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
>> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>
>> Cc: Zhang Chen <zhangckid@gmail.com>
>> Subject: Re: [PATCH 1/3] qapi/net: Add new QMP command for COLO
>> passthrough
>>
>>
>> On 2020/12/24 上午9:09, Zhang Chen wrote:
>>> From: Zhang Chen <chen.zhang@intel.com>
>>>
>>> Since the real user scenario does not need to monitor all traffic.
>>> Add colo-passthrough-add and colo-passthrough-del to maintain a COLO
>>> network passthrough list.
>>>
>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>> ---
>>>    net/net.c     | 12 ++++++++++++
>>>    qapi/net.json | 46
>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 58 insertions(+)
>>>
>>> diff --git a/net/net.c b/net/net.c
>>> index e1035f21d1..eac7a92618 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -1151,6 +1151,18 @@ void qmp_netdev_del(const char *id, Error
>> **errp)
>>>        qemu_del_net_client(nc);
>>>    }
>>>
>>> +void qmp_colo_passthrough_add(const char *prot, const uint32_t port,
>>> +                              Error **errp) {
>>> +    /* Setup passthrough connection */ }
>>> +
>>> +void qmp_colo_passthrough_del(const char *prot, const uint32_t port,
>>> +                              Error **errp) {
>>> +    /* Delete passthrough connection */ }
>>> +
>>>    static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>>>    {
>>>        char *str;
>>> diff --git a/qapi/net.json b/qapi/net.json index
>>> c31748c87f..466c29714e 100644
>>> --- a/qapi/net.json
>>> +++ b/qapi/net.json
>>> @@ -714,3 +714,49 @@
>>>    ##
>>>    { 'event': 'FAILOVER_NEGOTIATED',
>>>      'data': {'device-id': 'str'} }
>>> +
>>> +##
>>> +# @colo-passthrough-add:
>>> +#
>>> +# Add passthrough entry according to customer's needs in COLO-compare.
>>> +#
>>> +# @protocol: COLO passthrough just support TCP and UDP.
>>> +#
>>> +# @port: TCP or UDP port number.
>>> +#
>>> +# Returns: Nothing on success
>>> +#
>>> +# Since: 5.3
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "colo-passthrough-add",
>>> +#      "arguments": { "protocol": "tcp", "port": 3389 } }
>>> +# <- { "return": {} }
>>> +#
>>> +##
>>> +{ 'command': 'colo-passthrough-add',
>>> +     'data': {'protocol': 'str', 'port': 'uint32'} }
>>
>> Do we plan to support 4-tuple (src ip,src port, dst ip, dst port) in the future? If
>> yes, let's add them now.
>>
>> And do we plan to support wildcard here?
> I think just using the port is enough for COLO compare.
> Because in this case, users need passthrough some guest services are distinguished by static ports.
> And for support 4-tuple and wildcard are a good question, do you think we should add some passthrough
> Mechanism for all Qemu net filter? If yes, we should support that in the future.


I think we can start form COLO. To avoid QMP compatibility issues, I 
would like to add the n tuple and wildcard support now.

Thanks


>
> Thanks
> Chen
>
>> Thanks
>>
>>
>>> +
>>> +##
>>> +# @colo-passthrough-del:
>>> +#
>>> +# Delete passthrough entry according to customer's needs in COLO-
>> compare.
>>> +#
>>> +# @protocol: COLO passthrough just support TCP and UDP.
>>> +#
>>> +# @port: TCP or UDP port number.
>>> +#
>>> +# Returns: Nothing on success
>>> +#
>>> +# Since: 5.3
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "colo-passthrough-del",
>>> +#      "arguments": { "protocol": "tcp", "port": 3389 } }
>>> +# <- { "return": {} }
>>> +#
>>> +##
>>> +{ 'command': 'colo-passthrough-del',
>>> +     'data': {'protocol': 'str', 'port': 'uint32'} }


