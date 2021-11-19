Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA6456EE7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 13:36:08 +0100 (CET)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo37f-0004v0-8N
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 07:36:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo35k-0003Tj-MV
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo35g-0002G2-0l
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637325242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xxVmFn5ONnQQW28Kw6qhIsQvwkI7ALRMq25HWE6EFwI=;
 b=RN2QXhqJUULcDgO8vb1HOzA4opSSPHjuNudKhnScloItEHJ92QwWaBrVqsaoL/Pl5oa9su
 9DGVz0Cf9aoPnpB/oyKcrKb+2Wkopf2yJ39SXk+tm7lBz5wB557FkVH7nagmK7PnxN2ADA
 VCr42zbfGHI44afL6eYB2i945DZKtUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-Jvzgc0oTNLyl8dCBWJF0GA-1; Fri, 19 Nov 2021 07:33:59 -0500
X-MC-Unique: Jvzgc0oTNLyl8dCBWJF0GA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A9F510168C3;
 Fri, 19 Nov 2021 12:33:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E0B57CAD;
 Fri, 19 Nov 2021 12:32:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E68711380A7; Fri, 19 Nov 2021 13:32:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v9 5/8] qmp: decode feature & status bits in virtio-status
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-6-git-send-email-jonah.palmer@oracle.com>
 <87fss4w275.fsf@dusky.pond.sub.org>
 <2221d5d7-b65e-1157-fd9f-57defd974556@oracle.com>
Date: Fri, 19 Nov 2021 13:32:58 +0100
In-Reply-To: <2221d5d7-b65e-1157-fd9f-57defd974556@oracle.com> (Jonah Palmer's
 message of "Thu, 11 Nov 2021 05:15:13 -0500")
Message-ID: <871r3cnx51.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

> On 11/10/21 08:49, Markus Armbruster wrote:
>> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>>
>>> From: Laurent Vivier<lvivier@redhat.com>
>>>
>>> Display feature names instead of bitmaps for host, guest, and
>>> backend for VirtIODevice.
>>>
>>> Display status names instead of bitmaps for VirtIODevice.
>>>
>>> Display feature names instead of bitmaps for backend, protocol,
>>> acked, and features (hdev->features) for vhost devices.
>>>
>>> Decode features according to device type. Decode status
>>> according to configuration status bitmap (config_status_map).
>>> Decode vhost user protocol features according to vhost user
>>> protocol bitmap (vhost_user_protocol_map).
>>>
>>> Transport features are on the first line. Undecoded bits
>>> (if any) are stored in a separate field. Vhost device field
>>> wont show if there's no vhost active for a given VirtIODevice.
>>>
>>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>> [...]
>>
>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>> index 54212f2..6b11d52 100644
>>> --- a/qapi/virtio.json
>>> +++ b/qapi/virtio.json
>>> @@ -67,6 +67,466 @@
>>>   }
>>>   
>>>  ##
>>> +# @VirtioType:
>>> +#
>>> +# An enumeration of Virtio device types (or names)
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioType',
>>> +  'data': [ 'virtio-net', 'virtio-blk', 'virtio-serial', 'virtio-rng',
>>> +            'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
>>> +            'virtio-scsi', 'virtio-9p', 'virtio-mac-wlan',
>>> +            'virtio-rproc-serial', 'virtio-caif', 'virtio-mem-balloon',
>>> +            'virtio-gpu', 'virtio-clk', 'virtio-input', 'vhost-vsock',
>>> +            'virtio-crypto', 'virtio-signal', 'virtio-pstore',
>>> +            'virtio-iommu', 'virtio-mem', 'virtio-sound', 'vhost-user-fs',
>>> +            'virtio-pmem', 'virtio-mac-hwsim', 'vhost-user-i2c',
>>> +            'virtio-bluetooth' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioConfigStatus:
>>> +#
>>> +# An enumeration of Virtio device configuration statuses
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioConfigStatus',
>>> +  'data': [ 'driver-ok', 'features-ok', 'driver', 'needs-reset',
>>> +            'failed', 'acknowledge' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioDeviceStatus:
>>> +#
>>> +# A structure defined to list the configuration statuses of a virtio
>>> +# device
>>> +#
>>> +# @dev-status: List of decoded configuration statuses of the virtio
>>> +#              device
>>> +#
>>> +# @unknown-statuses: virtio device statuses bitmap that have not been decoded
>>
>> Why is @dev-status singular, and @unknown-statuses plural?
>
> I'm guessing that when I wrote it I used singular here since it was one list of
> statuses, but the representation here does feel off. Maybe @statuses & @unknown-statuses
> would be a better choice?

I figure either singular or plural would work better than using both.
Beware, I'm not a native speaker.

>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceStatus',
>>> +  'data': { 'dev-status': [ 'VirtioConfigStatus' ],
>>> +            '*unknown-statuses': 'uint8' } }
>>> +
>>> +##
>>> +# @VhostProtocolFeature:
>>> +#
>>> +# An enumeration of Vhost User protocol features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VhostProtocolFeature',
>>> +  'data': [ 'mq', 'log-shmfd', 'rarp', 'reply-ack', 'net-mtu',
>>> +            'slave-req', 'cross-endian', 'crypto-session', 'pagefault',
>>> +            'config', 'slave-send-fd', 'host-notifier',
>>> +            'inflight-shmfd', 'reset-device', 'inband-notifications',
>>> +            'configure-mem-slots' ]
>>> +}
>>> +
>>> +##
>>> +# @VhostDeviceProtocols:
>>> +#
>>> +# A structure defined to list the vhost user protocol features of a
>>> +# Vhost User device
>>> +#
>>> +# @features: List of decoded vhost user protocol features of a vhost
>>> +#            user device
>>> +#
>>> +# @unknown-protocols: vhost user device protocol features bitmap that
>>> +#                     have not been decoded
>>
>> Why are the known protocol features called @features, and the unknown
>> ones @unknown-protocols?
>
> I agree that this is inconsistent. Maybe @protocols & @unknown-protocols
> would be a better choice here as well?

Makes sense to me.

>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VhostDeviceProtocols',
>>> +  'data': { 'features': [ 'VhostProtocolFeature' ],
>>> +            '*unknown-protocols': 'uint64' } }
>>> +
>>> +##
>>> +# @VirtioTransportFeature:
>>> +#
>>> +# An enumeration of Virtio device transport features, including virtio-ring
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioTransportFeature',
>>> +  'data': [ 'notify-on-empty', 'any-layout', 'protocol-features',
>>> +            'version-1', 'iommu-platform', 'ring-packed', 'order-platform',
>>> +            'sr-iov', 'indirect-desc', 'event-idx' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioMemFeature:
>>> +#
>>> +# An enumeration of Virtio mem features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioMemFeature',
>>> +  'data': [ 'acpi-pxm' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioSerialFeature:
>>> +#
>>> +# An enumeration of Virtio serial/console features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioSerialFeature',
>>> +  'data': [ 'size', 'multiport', 'emerg-write' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioBlkFeature:
>>> +#
>>> +# An enumeration of Virtio block features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioBlkFeature',
>>> +  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size',
>>> +            'topology', 'mq', 'discard', 'write-zeroes', 'barrier',
>>> +            'scsi', 'flush', 'config-wce', 'log-all' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioGpuFeature:
>>> +#
>>> +# An enumeration of Virtio gpu features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioGpuFeature',
>>> +  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob',
>>> +            'log-all' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioNetFeature:
>>> +#
>>> +# An enumeration of Virtio net features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioNetFeature',
>>> +  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
>>> +            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
>>> +            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo',
>>> +            'mrg-rxbuf', 'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan',
>>> +            'ctrl-rx-extra', 'guest-announce', 'mq', 'ctrl-mac-addr',
>>> +            'hash-report', 'rss', 'rsc-ext', 'standby', 'speed-duplex',
>>> +            'gso', 'virtio-net-hdr', 'log-all' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioScsiFeature:
>>> +#
>>> +# An enumeration of Virtio scsi features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioScsiFeature',
>>> +  'data': [ 'inout', 'hotplug', 'change', 't10-pi', 'log-all' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioBalloonFeature:
>>> +#
>>> +# An enumeration of Virtio balloon features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioBalloonFeature',
>>> +  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom',
>>> +            'free-page-hint', 'page-poison', 'reporting' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioIommuFeature:
>>> +#
>>> +# An enumeration of Virtio iommu features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioIommuFeature',
>>> +  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass',
>>> +            'probe', 'mmio' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioInputFeature:
>>> +#
>>> +# An enumeration of Virtio input features. Note that virtio-input
>>> +# has no device-specific features except when its vhost is active,
>>> +# then it may have the VHOST_F_LOG_ALL feature.
>>
>> VHOST_F_LOG_ALL is talking C.  Better, I think: "may have the @log-all
>> feature.  More of the same below.
>
> Got it. Will fix this for all occurrences!
>
>>
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioInputFeature',
>>> +  'data': [ 'log-all' ]
>>> +}
>>> +
>>> +##
>>> +# @VhostUserFsFeature:
>>> +#
>>> +# An enumeration of vhost user FS features. Note that vhost-user-fs
>>> +# has no device-specific features other than the vhost-common
>>> +# VHOST_F_LOG_ALL feature.
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VhostUserFsFeature',
>>> +  'data': [ 'log-all' ]
>>> +}
>>> +
>>> +##
>>> +# @VhostVsockFeature:
>>> +#
>>> +# An enumeration of vhost vsock features. Note that vhost-vsock has
>>> +# no device-specific features other than the vhost-common
>>> +# VHOST_F_LOG_ALL feature.
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VhostVsockFeature',
>>> +  'data': [ 'log-all' ]
>>> +}
>>> +
>>> +##
>>> +# @VirtioCryptoFeature:
>>> +#
>>> +# An enumeration of virtio crypto features. Not that virtio-crypto
>>> +# has no device-specific features other than when it is a vhost
>>> +# device, then it may have the VHOST_F_LOG_ALL feature.
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'enum': 'VirtioCryptoFeature',
>>> +  'data': [ 'log-all' ]
>>> +}
>> Four identical enum types...  any particular reason against just one?
>
> See comment at the end.
>
>>
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesBase:
>>> +#
>>> +# The common fields that apply to all Virtio devices
>>> +#
>>> +# @type: virtio device name
>>> +# @transport: the list of transport features of the virtio device
>>> +# @unknown-features: virtio device features bitmap that have not been decoded
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesBase',
>>> +  'data': { 'type': 'VirtioType',
>>> +            'transport': [ 'VirtioTransportFeature' ],
>>> +            '*unknown-features': 'uint64' } }
>>
>> Pardon my virtio ignorance... are the @unknown-features unknown
>> transport features?
>
> Yes in this case they would be unknown transport features.

Suggest to call them @transports and @unknown-transports then, similar
to @protocols and @unknown-protocols in VhostDeviceProtocols.

>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsMem:
>>> +#
>>> +# The options that apply to Virtio mem devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsMem',
>>> +  'data': { 'features': [ 'VirtioMemFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsSerial:
>>> +#
>>> +# The options that apply to Virtio serial devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
>>> +  'data': { 'features': [ 'VirtioSerialFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsBlk:
>>> +#
>>> +# The options that apply to Virtio block devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
>>> +  'data': { 'features': [ 'VirtioBlkFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsGpu:
>>> +#
>>> +# The options that apply to Virtio GPU devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
>>> +  'data': { 'features': [ 'VirtioGpuFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsNet:
>>> +#
>>> +# The options that apply to Virtio net devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
>>> +  'data': { 'features': [ 'VirtioNetFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsScsi:
>>> +#
>>> +# The options that apply to Virtio SCSI devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
>>> +  'data': { 'features': [ 'VirtioScsiFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsBalloon:
>>> +#
>>> +# The options that apply to Virtio balloon devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
>>> +  'data': { 'features': [ 'VirtioBalloonFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsIommu:
>>> +#
>>> +# The options that apply to Virtio IOMMU devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
>>> +  'data': { 'features': [ 'VirtioIommuFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsInput:
>>> +#
>>> +# The options that apply to Virtio input devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsInput',
>>> +  'data': { 'features': [ 'VirtioInputFeature' ] } }
>>> +
>>> +##
>>> +# @VhostDeviceFeaturesOptionsFs:
>>> +#
>>> +# The options that apply to vhost-user-fs devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VhostDeviceFeaturesOptionsFs',
>>> +  'data': { 'features': [ 'VhostUserFsFeature' ] } }
>>> +
>>> +##
>>> +# @VhostDeviceFeaturesOptionsVsock:
>>> +#
>>> +# The options that apply to vhost-vsock devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VhostDeviceFeaturesOptionsVsock',
>>> +  'data': { 'features': [ 'VhostVsockFeature' ] } }
>>> +
>>> +##
>>> +# @VirtioDeviceFeaturesOptionsCrypto:
>>> +#
>>> +# The options that apply to virtio-crypto devices
>>> +#
>>> +# @features: List of device features
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'struct': 'VirtioDeviceFeaturesOptionsCrypto',
>>> +  'data': { 'features': [ 'VirtioCryptoFeature' ] } }
>>
>> If you replace the four identical enum types by one, you get four
>> identical struct types here.  Same treatment.
>>
>>> +
>>> +##
>>> +# @VirtioDeviceFeatures:
>>> +#
>>> +# A union to define the list of features for a virtio device
>>> +#
>>> +# Since: 6.3
>>> +##
>>> +
>>> +{ 'union': 'VirtioDeviceFeatures',
>>> +  'base': 'VirtioDeviceFeaturesBase',
>>> +  'discriminator': 'type',
>>> +  'data': { 'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
>>> +            'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
>>> +            'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
>>> +            'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
>>> +            'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
>>> +            'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
>>> +            'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu',
>>> +            'virtio-input': 'VirtioDeviceFeaturesOptionsInput',
>>> +            'vhost-user-fs': 'VhostDeviceFeaturesOptionsFs',
>>> +            'vhost-vsock': 'VhostDeviceFeaturesOptionsVsock',
>>> +            'virtio-crypto': 'VirtioDeviceFeaturesOptionsCrypto',
>>> +            'virtio-mem': 'VirtioDeviceFeaturesOptionsMem' } }
>>> +
>>> +##
>>>  # @VhostStatus:
>>>  #
>>>  # Information about a vhost device. This information will only be
>>> @@ -106,10 +566,10 @@
>>>               'n-tmp-sections': 'int',
>>>               'nvqs': 'uint32',
>>>               'vq-index': 'int',
>>> -            'features': 'uint64',
>>> -            'acked-features': 'uint64',
>>> -            'backend-features': 'uint64',
>>> -            'protocol-features': 'uint64',
>>> +            'features': 'VirtioDeviceFeatures',
>>> +            'acked-features': 'VirtioDeviceFeatures',
>>> +            'backend-features': 'VirtioDeviceFeatures',
>>> +            'protocol-features': 'VhostDeviceProtocols',
>>>               'max-queues': 'uint64',
>>>               'backend-cap': 'uint64',
>>>               'log-enabled': 'bool',
>>> @@ -174,12 +634,12 @@
>>>     'data': { 'name': 'str',
>>>               'device-id': 'uint16',
>>>               'vhost-started': 'bool',
>>> -            'guest-features': 'uint64',
>>> -            'host-features': 'uint64',
>>> -            'backend-features': 'uint64',
>>> +            'guest-features': 'VirtioDeviceFeatures',
>>> +            'host-features': 'VirtioDeviceFeatures',
>>> +            'backend-features': 'VirtioDeviceFeatures',
>>>               'device-endian': 'VirtioStatusEndianness',
>>>               'num-vqs': 'int',
>>> -            'status': 'uint8',
>>> +            'status': 'VirtioDeviceStatus',
>>>               'isr': 'uint8',
>>>               'queue-sel': 'uint16',
>>>               'vm-running': 'bool',
>>> @@ -191,7 +651,7 @@
>>>               'disable-legacy-check': 'bool',
>>>               'bus-name': 'str',
>>>               'use-guest-notifier-mask': 'bool',
>>> -            'vhost-dev': 'VhostStatus' } }
>>> +            '*vhost-dev': 'VhostStatus' } }
>>>   
>>>  ##
>>>  # @x-query-virtio-status:
>>> @@ -221,28 +681,31 @@
>>>  #          "name": "virtio-crypto",
>>>  #          "started": true,
>>>  #          "device-id": 20,
>>> -#          "vhost-dev": {
>>> -#               "n-tmp-sections": 0,
>>> -#               "n-mem-sections": 0,
>>> -#               "max-queues": 0,
>>> -#               "backend-cap": 0,
>>> -#               "log-size": 0,
>>> -#               "backend-features": 0,
>>> -#               "nvqs": 0,
>>> -#               "protocol-features": 0,
>>> -#               "vq-index": 0,
>>> -#               "log-enabled": false,
>>> -#               "acked-features": 0,
>>> -#               "features": 0
>>> +#          "backend-features": {
>>> +#               "transport": [],
>>> +#               "type": "virtio-crypto",
>>> +#               "features": []
>>>  #          },
>>> -#          "backend-features": 0,
>>>  #          "start-on-kick": false,
>>>  #          "isr": 1,
>>>  #          "broken": false,
>>> -#          "status": 15,
>>> +#          "status": {
>>> +#               "dev-status": ["acknowledge", "driver", "features-ok",
>>> +#                              "driver-ok"]
>>> +#          },
>>>  #          "num-vqs": 2,
>>> -#          "guest-features": 5100273664,
>>> -#          "host-features": 6325010432,
>>> +#          "guest-features": {
>>> +#               "transport": ["event-idx", "indirect-desc", "version-1"],
>>> +#               "type": "virtio-crypto",
>>> +#               "features": []
>>> +#          },
>>> +#          "host-features": {
>>> +#               "transport": ["protocol-features", "event-idx",
>>> +#                             "indirect-desc", "version-1", "any-layout",
>>> +#                             "notify-on-empty"],
>>> +#               "type": "virtio-crypto",
>>> +#               "features": []
>>> +#          },
>>>  #          "use-guest-notifier-mask": true,
>>>  #          "vm-running": true,
>>>  #          "queue-sel": 1,
>>> @@ -270,22 +733,71 @@
>>>  #               "max-queues": 1,
>>>  #               "backend-cap": 2,
>>>  #               "log-size": 0,
>>> -#               "backend-features": 0,
>>> +#               "backend-features": {
>>> +#                       "transport": [],
>>> +#                       "type": "virtio-net",
>>> +#                       "features": []
>>> +#               },
>>>  #               "nvqs": 2,
>>> -#               "protocol-features": 0,
>>> +#               "protocol-features": {
>>> +#                       "features": []
>>> +#               },
>>>  #               "vq-index": 0,
>>>  #               "log-enabled": false,
>>> -#               "acked-features": 5100306432,
>>> -#               "features": 13908344832
>>> +#               "acked-features": {
>>> +#                       "transport": ["event-idx", "indirect-desc", "version-1",
>>> +#                                     "any-layout", "notify-on-empty"],
>>> +#                       "type": "virtio-net",
>>> +#                       "features": ["mrg-rxbuf"]
>>> +#               },
>>> +#               "features": {
>>> +#                       "transport": ["event-idx", "indirect-desc",
>>> +#                                     "iommu-platform", "version-1", "any-layout",
>>> +#                                     "notify-on-empty"],
>>> +#                       "type": "virtio-net",
>>> +#                       "features": ["log-all", "mrg-rxbuf"]
>>> +#               }
>>> +#          },
>>> +#          "backend-features": {
>>> +#               "transport": ["protocol-features", "event-idx", "indirect-desc",
>>> +#                             "version-1", "any-layout", "notify-on-empty"],
>>> +#               "type": "virtio-net",
>>> +#               "features": ["gso", "ctrl-mac-addr", "guest-announce", "ctrl-rx-extra",
>>> +#                            "ctrl-vlan", "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
>>> +#                            "host-ufo", "host-ecn", "host-tso6", "host-tso4",
>>> +#                            "guest-ufo", "guest-ecn", "guest-tso6", "guest-tso4",
>>> +#                            "mac", "ctrl-guest-offloads", "guest-csum", "csum"]
>>>  #          },
>>> -#          "backend-features": 6337593319,
>>>  #          "start-on-kick": false,
>>>  #          "isr": 1,
>>>  #          "broken": false,
>>> -#          "status": 15,
>>> +#          "status": {
>>> +#               "dev-status": ["acknowledge", "driver", "features-ok", "driver-ok"]
>>> +#          },
>>>  #          "num-vqs": 3,
>>> -#          "guest-features": 5111807911,
>>> -#          "host-features": 6337593319,
>>> +#          "guest-features": {
>>> +#               "transport": ["event-idx", "indirect-desc", "version-1"],
>>> +#               "type": "virtio-net",
>>> +#               "features": ["ctrl-mac-addr", "guest-announce", "ctrl-vlan",
>>> +#                            "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
>>> +#                            "host-ufo", "host-ecn", "host-tso6",
>>> +#                            "host-tso4", "guest-ufo", "guest-ecn",
>>> +#                            "guest-tso6", "guest-tso4", "mac",
>>> +#                            "ctrl-guest-offloads", "guest-csum", "csum"]
>>> +#          },
>>> +#          "host-features": {
>>> +#               "transport": ["protocol-features", "event-idx",
>>> +#                             "indirect-desc", "version-1", "any-layout",
>>> +#                             "notify-on-empty"],
>>> +#               "type": "virtio-net",
>>> +#               "features": ["gso", "ctrl-mac-addr", "guest-announce",
>>> +#                            "ctrl-rx-extra", "ctrl-vlan", "ctrl-rx",
>>> +#                            "ctrl-vq", "status", "mrg-rxbuf", "host-ufo",
>>> +#                            "host-ecn", "host-tso6", "host-tso4",
>>> +#                            "guest-ufo", "guest-ecn", "guest-tso6",
>>> +#                            "guest-tso4", "mac", "ctrl-guest-offloads",
>>> +#                            "guest-csum", "csum"]
>>> +#          },
>>>  #          "use-guest-notifier-mask": true,
>>>  #          "vm-running": true,
>>>  #          "queue-sel": 2,
>>
>> Sixteen enums total.
>>
>> If we replaced them by 'str', the schema would be simpler and the
>> generated code smaller, but introspection would be less informative.  I
>> didn't check how the handwritten could would be affected.
>>
>> It's a tradeoff.  Can you make an argument either way?
>
> I would make the argument for keeping them as is.
>
> One reason is that, while yes it does seem redundant, it's also a core
> data structure for device-specific features for this series, in a framework
> type of way. In other words, if / when a device gets a new feature, we would
> add them there.

Yes, but what's the concrete benefit of having to add new
device-specific features to an enum in the QAPI schema?

> Another reason is that the naming convention is very specific, and it should
> only be tied to one device type. This is because when we go to decode any
> features or statuses, we need to filter by device type (for the reason above)
> and compare that device's features bitmap to our known list of features
> *for that device*.
>
> So in qmp_decode_features():
>
> features = g_new0(VirtioDeviceFeatures, 1);
> features->type = qapi_enum_parse(&VirtioType_lookup, name, -1, NULL);
> switch (features->type) {
>
> case VIRTIO_TYPE_VIRTIO_SERIAL:
>      features->u.virtio_serial.features =
>              CONVERT_FEATURES(VirtioSerialFeatureList, serial_map, 0);
>      break;
> ...

This maps bits in @bitmap to a list of enum values.  It could just as
well map to a list of strings, couldn't it?  What do with the list
besides returning it to the QMP core?

For a "real" QMP interface, I'd certainly prefer enums to strings, not
least for introspection's benefit.  But this is just a debugging aid,
isn't it?  It's a lot of code just for debugging...  Can we make it
leaner?

By the way, macro CONVERT_FEATURES() uses free variable @bitmap.
Passing @bitmap as parameter to the macro would be cleaner.

>
> And sure while we could make the cases for virtio-input, vhost-user-fs,
> vhost-vsock, and virtio-crypto (the devices that just have the 'log-all'
> feature (and only in the vhost case)) homogeneous, e.g:
>
> case VIRTIO_TYPE_VIRTIO_CRYPTO:
>      features->u.devs_w_one_feature.features =
>              CONVERT_FEATURES(DevsWOneFeatureList, logall_map, 0);
>      break;
> case VIRTIO_TYPE_VIRTIO_INPUT:
>      features->u.devs_w_one_feature.features =
>              CONVERT_FEATURES(DevsWOneFeatureList, logall_map, 0);
>      break;
> ...
>
> We would still need to create a unique enum / data structure for one of
> those devices if / when they get their own new feature.

Having to create them then (maybe) rather than now (surely) doesn't
sound bad to me at all :)


