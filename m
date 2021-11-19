Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB12456EEF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 13:37:59 +0100 (CET)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo39S-0007ex-S0
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 07:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo36g-00055s-AR
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:35:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo36d-0002O9-BR
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:35:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637325302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s3YrcKOizHuprwQRhcLXEdC5i5+8DNje0utXTNzmW7s=;
 b=Ba0HK/1RsKMd2FuClgPBZxR5T0GZpHxIZQ2FuBAGdFhYqOPV3YiUl2V9XmHjQgNQmcW/8L
 TCOUCz+buJEoO0LnkwO75fZRtZFvTMCqd97AMMVpUYucasSSoAPqA5PTJl93LCQnCeIq0+
 kKLQSQvyahHTD2aceQBvarse//MIgD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-2u93OYlSNieZuy8zvVmOOw-1; Fri, 19 Nov 2021 07:34:59 -0500
X-MC-Unique: 2u93OYlSNieZuy8zvVmOOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 501B510168D8;
 Fri, 19 Nov 2021 12:34:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CC624ABA6;
 Fri, 19 Nov 2021 12:33:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2872D11380AA; Fri, 19 Nov 2021 13:33:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v9 7/8] qmp: add QMP command x-query-virtio-queue-element
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-8-git-send-email-jonah.palmer@oracle.com>
 <87a6icw227.fsf@dusky.pond.sub.org>
 <4bfacace-2cb4-9df9-8990-dce3a9a2d9ba@oracle.com>
Date: Fri, 19 Nov 2021 13:33:40 +0100
In-Reply-To: <4bfacace-2cb4-9df9-8990-dce3a9a2d9ba@oracle.com> (Jonah Palmer's
 message of "Thu, 11 Nov 2021 05:18:48 -0500")
Message-ID: <87wnl4mijf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> On 11/10/21 08:52, Markus Armbruster wrote:
>> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>>
>>> From: Laurent Vivier<lvivier@redhat.com>
>>>
>>> This new command shows the information of a VirtQueue element.
>>>
>>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>> [...]
>>
>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>> index 0f65044..c57fbc5 100644
>>> --- a/qapi/virtio.json
>>> +++ b/qapi/virtio.json
>>> @@ -1061,3 +1061,180 @@
>>>   { 'command': 'x-query-virtio-vhost-queue-status',
>>>     'data': { 'path': 'str', 'queue': 'uint16' },
>>>     'returns': 'VirtVhostQueueStatus', 'features': [ 'unstable' ] }
>>> +
>>> +##
>>> +# @VirtioRingDescFlags:
>>> +#
>>> +# An enumeration of the virtio ring descriptor flags
>>> +#
>>> +# Since: 6.3
>>> +#
>>> +##
>>> +
>>> +{ 'enum': 'VirtioRingDescFlags',
>>> +  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioRingDesc:
>>> +#
>>> +# Information regarding the VRing descriptor area
>>> +#
>>> +# @addr: guest physical address of the descriptor data
>>> +#
>>> +# @len: length of the descriptor data
>>> +#
>>> +# @flags: list of descriptor flags
>>> +#
>>> +# Since: 6.3
>>> +#
>>> +##
>>> +
>>> +{ 'struct': 'VirtioRingDesc',
>>> +  'data': { 'addr': 'uint64',
>>> +            'len': 'uint32',
>>> +            'flags': [ 'VirtioRingDescFlags' ] } }
>>> +
>>> +##
>>> +# @VirtioRingAvail:
>>> +#
>>> +# Information regarding the avail VRing (also known as the driver
>>> +# area)
>>> +#
>>> +# @flags: VRingAvail flags
>>> +#
>>> +# @idx: VRingAvail index
>>> +#
>>> +# @ring: VRingAvail ring[] entry at provided index
>>> +#
>>> +# Since: 6.3
>>> +#
>>> +##
>>> +
>>> +{ 'struct': 'VirtioRingAvail',
>>> +  'data': { 'flags': 'uint16',
>>> +            'idx': 'uint16',
>>> +            'ring': 'uint16' } }
>>> +
>>> +##
>>> +# @VirtioRingUsed:
>>> +#
>>> +# Information regarding the used VRing (also known as the device
>>> +# area)
>>> +#
>>> +# @flags: VRingUsed flags
>>> +#
>>> +# @idx: VRingUsed index
>>> +#
>>> +# Since: 6.3
>>> +#
>>> +##
>>> +
>>> +{ 'struct': 'VirtioRingUsed',
>>> +  'data': { 'flags': 'uint16',
>>> +            'idx': 'uint16' } }
>>> +
>>> +##
>>> +# @VirtioQueueElement:
>>> +#
>>> +# Information regarding a VirtQueue VirtQueueElement including
>>> +# descriptor, driver, and device areas
>>> +#
>>> +# @device-name: name of the VirtIODevice which this VirtQueue belongs
>>> +#               to (for reference)
>>> +#
>>> +# @index: index of the element in the queue
>>> +#
>>> +# @ndescs: number of descriptors
>>> +#
>>> +# @descs: list of the descriptors
>>
>> Can @ndescs ever be not equal to the length of @descs?
>>
>> If no, it's redundant.
>
> I don't believe so, no. Should I just remove @ndescs then?

Yes, please.

[...]


