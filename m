Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C3605E1D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:45:25 +0200 (CEST)
Received: from localhost ([::1]:36658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olT3A-0004iC-Cf
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:45:20 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olT2h-0000jr-R3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olShf-0000rE-9J
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olShd-0005pP-Df
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666261384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TfOkpGu3n1Tioz9GJHRmwzGEyNM3g7ymXrDN/7gskxw=;
 b=c2Bk2bUgk9vBlLY2ZeCrPB2ANO9kvPKpiBgDS3HuXz1GE1AZKe8BIGR5Psne+8qHI32GAc
 E8r4PNW3928TIFM4kHwxQsJXAfIpGbzg7iTsosAt0bFVd8WMqg8Yw65U5NrgFEEQ61c6CQ
 xEOSincdREmdzJ3ZpRualQUcwNjbdyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-qPPDbW3POkONa7b3GzeZfw-1; Thu, 20 Oct 2022 06:23:01 -0400
X-MC-Unique: qPPDbW3POkONa7b3GzeZfw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F013800B23;
 Thu, 20 Oct 2022 10:23:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E66B049BB60;
 Thu, 20 Oct 2022 10:22:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C20321E6936; Thu, 20 Oct 2022 12:22:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Stefano Stabellini <sstabellini@kernel.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Jason Wang <jasowang@redhat.com>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Anthony
 Perard <anthony.perard@citrix.com>,  Greg Kurz <groug@kaod.org>,  Eric
 Blake <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Thomas Huth
 <thuth@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Paul
 Durrant <paul@xen.org>,  David Gibson <david@gibson.dropbear.id.au>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v11 17/17] net: stream: add QAPI events to report
 connection state
References: <20221011200539.1486809-1-lvivier@redhat.com>
 <20221011200539.1486809-18-lvivier@redhat.com>
 <87mt9u4m9d.fsf@pond.sub.org>
 <7eaa3255-7580-7e06-8b28-ae60ed5e1be6@redhat.com>
Date: Thu, 20 Oct 2022 12:22:57 +0200
In-Reply-To: <7eaa3255-7580-7e06-8b28-ae60ed5e1be6@redhat.com> (Laurent
 Vivier's message of "Mon, 17 Oct 2022 16:03:36 +0200")
Message-ID: <87pmemdcam.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for the slow replay, too many distractions...

Laurent Vivier <lvivier@redhat.com> writes:

> On 10/17/22 15:23, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>> is connected, and NETDEV_STREAM_EOC when it is disconnected.
>>>
>>> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
>>> address.
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>

[...]

>>> diff --git a/qapi/net.json b/qapi/net.json
>>> index 6a1a49749294..69f83bceff3f 100644
>>> --- a/qapi/net.json
>>> +++ b/qapi/net.json
>>> @@ -895,3 +895,49 @@
>>>   ##
>>>   { 'event': 'FAILOVER_NEGOTIATED',
>>>     'data': {'device-id': 'str'} }
>>> +
>>> +##
>>> +# @NETDEV_STREAM_CONNECTED:
>>> +#
>>> +# Emitted when the netdev stream backend is connected
>>> +#
>>> +# @netdev-id: QEMU netdev id that is connected
>>> +# @uri: The Uniform Resource Identifier identifying the destination address
>>
>> Is an URI the appropriate representation here?  It's not how we specify
>> such addresses elsewhere in QAPI/QMP...
>
> I put in the event the same information we have in info_str and displayed by the HMP command 'info network'. What would be a more appropriate reprensation?

SocketAddress?

>>> +#
>>> +# Since: 7.2
>>> +#
>>> +# Example:
>>> +#
>>> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
>>> +#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},
>>> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
>>> +#
>>> +# or
>>> +#
>>> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
>>> +#      'data': {'uri': ''unix:/tmp/qemu0', 'netdev-id': 'netdev0'},
>>> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
>>> +#
>>> +##
>>> +{ 'event': 'NETDEV_STREAM_CONNECTED',
>>> +  'data': { 'netdev-id': 'str',
>>> +            'uri': 'str' } }
>>> +
>>> +##
>>> +# @NETDEV_STREAM_EOC:
>>
>> What does "EOC" mean?
>
> End-Of-Connection, this is the nomenclature used in the code when the socket is disconnected.
>
>> Could this be named NETDEV_STREAM_DISCONNECTED, for symmetry with
>> NETDEV_STREAM_CONNECTED?
>
> Yes, it can. EOC is shorter, it's why I used it, but if you prefer "disconnected"...

For better or worse, we've always preferred longhand to abbreviations in
QAPI schema names.  Exceptions have crept in, of course.

[...]


