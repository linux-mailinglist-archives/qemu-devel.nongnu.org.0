Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF513F4BAE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:28:46 +0200 (CEST)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIA0L-0003jC-Lf
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mI9zZ-00033C-29
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mI9zW-00044Y-9K
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629725273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lutGRLxUtO21jaWGqEReeyovDqupzLurTb253ysCH80=;
 b=YTbIM9k+ixKw0jThOo3mpjKP8kDO8EQcqxRhjFtmMRYrJFkHGdQYLBLKK5IkWesRikn5fM
 N6rPvrhtZ5KWOgRsh4Vu1Y7sJZ1beauf0ojxa+jHuNkk8WGF1VhmTH+qTfBkye2o+ZnFZ9
 RSFjXxevidLp/SQ77XNKWH7ynZ2fyog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-bpSUsF4XO5i0qvVXmwrzgQ-1; Mon, 23 Aug 2021 09:27:51 -0400
X-MC-Unique: bpSUsF4XO5i0qvVXmwrzgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94506779;
 Mon, 23 Aug 2021 13:27:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BDD95DF21;
 Mon, 23 Aug 2021 13:27:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C8E0F11380A9; Mon, 23 Aug 2021 15:27:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v6 1/6] qmp: add QMP command x-debug-query-virtio
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-2-git-send-email-jonah.palmer@oracle.com>
 <87o8a9e8k8.fsf@dusky.pond.sub.org>
 <a018750e-7066-8582-67a9-31584e24338a@oracle.com>
Date: Mon, 23 Aug 2021 15:27:21 +0200
In-Reply-To: <a018750e-7066-8582-67a9-31584e24338a@oracle.com> (Jonah Palmer's
 message of "Tue, 10 Aug 2021 02:36:43 -0400")
Message-ID: <87v93wcmva.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, david@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Back from my summer break, please excuse the delay.

Jonah Palmer <jonah.palmer@oracle.com> writes:

> On 8/7/21 8:35 AM, Markus Armbruster wrote:
>> QAPI schema review only.
>>
>> Jonah Palmer <jonah.palmer@oracle.com> writes:
>>
>>> From: Laurent Vivier <lvivier@redhat.com>
>>>
>>> This new command lists all the instances of VirtIODevice with
>>> their path and virtio type.
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> [...]
>>
>>> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>>> index 4912b97..0c89789 100644
>>> --- a/qapi/qapi-schema.json
>>> +++ b/qapi/qapi-schema.json
>>> @@ -91,5 +91,6 @@
>>>   { 'include': 'misc.json' }
>>>   { 'include': 'misc-target.json' }
>>>   { 'include': 'audio.json' }
>>> +{ 'include': 'virtio.json' }
>>>   { 'include': 'acpi.json' }
>>>   { 'include': 'pci.json' }
>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>> new file mode 100644
>>> index 0000000..804adbe
>>> --- /dev/null
>>> +++ b/qapi/virtio.json
>>> @@ -0,0 +1,72 @@
>> Please insert at the beginning
>>
>>     # -*- Mode: Python -*-
>>     # vim: filetype=python
>>     #
>
> Will do.
>
>>> +##
>>> +# = Virtio devices
>>> +##
>>> +
>>> +##
>>> +# @VirtioType:
>>> +#
>>> +# An enumeration of Virtio device types.
>>> +#
>>> +# Since: 6.1
>> 6.2 now, here and below.
>
> Okay, will update for entire series.
>
>>
>>> +##
>>> +{ 'enum': 'VirtioType',
>>> +  'data': [ 'unknown', 'virtio-net', 'virtio-blk', 'virtio-console',
>>> +            'virtio-rng', 'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
>>> +            'virtio-scsi', 'virtio-9p', 'virtio-mac80211-wlan',
>>> +            'virtio-serial', 'virtio-caif', 'virtio-memory-balloon',
>>> +            'unknown-14', 'unknown-15', 'virtio-gpu', 'virtio-clock',
>>> +            'virtio-input', 'vhost-vsock', 'virtio-crypto', 'virtio-signal-dist',
>>> +            'virtio-pstore', 'virtio-iommu', 'virtio-mem', 'unknown-25',
>>> +            'vhost-user-fs', 'virtio-pmem', 'unknown-28', 'virtio-mac80211-hwsim' ]
>> Please limit line length to approximately 70 characters.
>
> Fixed, sorry about that. Also, should I continue this up to 'virtio-bluetooth'? E.g:
>
> ...
> 'virtio-mac80211-hwsim', 'unknown-30', 'unknown-31',
> 'unknown-32', 'unknown-33', 'unknown-34', 'unknown-35',
> 'unknown-36', 'unknown-37', 'unknown-38', 'unknown-39',
> 'virtio-bluetooth' ]

Hmm...  how is this enum used?  In this patch:

    VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
    {
        VirtioInfoList *list = NULL;
        VirtioInfoList *node;
        VirtIODevice *vdev;

        QTAILQ_FOREACH(vdev, &virtio_list, next) {
            DeviceState *dev = DEVICE(vdev);
            node = g_new0(VirtioInfoList, 1);
            node->value = g_new(VirtioInfo, 1);
            node->value->path = g_strdup(dev->canonical_path);
--->        node->value->type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
--->                                            VIRTIO_TYPE_UNKNOWN, NULL);
            QAPI_LIST_PREPEND(list, node->value);
        }

        return list;
    }

This maps VirtioDevice member @name (a string) to an enum value.

As far as I can tell, this member is set in virtio_init() only, to its
argument.  All callers pass string literals.  They also pass a numeric
device_id, and the two seem to match, e.g. "virtio-blk" and
VIRTIO_ID_BLOCK.

Thus, the pairs (numeric device ID, string device ID) already exist in
the code, but not in a way that lets you map between them.  To get that,
you *duplicate* the pairs in QAPI.

Having two copies means we get to keep them consistent.  Can we avoid
that?

The enum has a special member 'unknown' that gets used when @name does
not parse as enum member, i.e. we failed at keeping the copies
consistent.  I'm afraid this sweeps a programming error under the rug.

The enum has a bunch of dummy members like 'unknown-14' to make QAPI
generate numeric enum values match the device IDs.  Error prone.  Can't
see offhand why we need them to match.

What about the following.  Define a map from numeric device ID to
string, like so

    const char *virtio_device_name[] = {
        [VIRTIO_ID_NET] = "virtio-net",
        [VIRTIO_ID_BLOCK] = "virtio-blk",
        ...
    }

This lets you

* map device ID to string by subscripting virtio_device_name[].
  Guarding with assert(device_id < G_N_ELEMENTS(virtio_device_name)) may
  be advisable.

* map string to device ID by searching virtio_device_name[].  May want a
  function for that,

Now you can have virtio_init() map parameter @device_id to string, and
drop parameter @name.

Then you have two options:

1. With QAPI enum VirtioType

   Define it without the special and the dummy members.

   To map from string to QAPI enum, use qapi_enum_parse().

   To map from QAPI enum to string, use VirtioType_str().

   To map from QAPI enum to device ID, map through string.

2. Without QAPI enum VirtioType

   Simply use uint16_t device_id, just like struct VirtioDevice.

The choice between 1. and 2. depends on whether you actually need
additional functionality provided by QAPI, such as types being visible
in query-qmp-schema.

[...]


