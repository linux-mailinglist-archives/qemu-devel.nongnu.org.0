Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A050AF7D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 07:20:23 +0200 (CEST)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhliQ-0001xk-9t
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 01:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhlgi-0001HG-85
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:18:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhlgg-0002RP-IQ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650604713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fqRj8+CACBzW21I9OLzoGMiprt/oP8Lzx6wVjlfubo=;
 b=V3boO5ZHAGtOdVhKcdPGEgQdtRfhlL2oUzQfM6jWEWFvi4BG6ZTMvttLIRs2/0oZ9fLYbb
 OFpjG7bCSuYwL6lfzLmnjD/wlKc1g0naNO5ksqXpyIqnllRPwy74nOom8M8Ydk631xtmQp
 vISjE4TLCunLbyliyrQ1dg4oSd8RK0c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-UXM8kkMXObeeilhPFU_fCw-1; Fri, 22 Apr 2022 01:18:30 -0400
X-MC-Unique: UXM8kkMXObeeilhPFU_fCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70F2129DD99A;
 Fri, 22 Apr 2022 05:18:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1C340D016F;
 Fri, 22 Apr 2022 05:18:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C34D21E6A1F; Fri, 22 Apr 2022 07:18:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 02/17] qdev: unplug blocker for devices
References: <cover.1650379269.git.jag.raman@oracle.com>
 <26c36cc56c0dd0021aebc9c2b7f9e6dfa1abb67e.1650379269.git.jag.raman@oracle.com>
 <875yn2qydl.fsf@pond.sub.org>
 <6BAFA4DE-0D88-40EC-92B6-6228460AB927@oracle.com>
Date: Fri, 22 Apr 2022 07:18:28 +0200
In-Reply-To: <6BAFA4DE-0D88-40EC-92B6-6228460AB927@oracle.com> (Jag Raman's
 message of "Thu, 21 Apr 2022 17:49:39 +0000")
Message-ID: <87a6cdn1az.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jag Raman <jag.raman@oracle.com> writes:

>> On Apr 21, 2022, at 10:55 AM, Markus Armbruster <armbru@redhat.com> wrot=
e:
>>=20
>> Jagannathan Raman <jag.raman@oracle.com> writes:
>>=20
>>> Add blocker to prevent hot-unplug of devices
>>=20
>> Why do you need this?  I'm not doubting you do, I just want to read your
>> reasons here :)
>
> Hi Markus, :)
>
> The x-vfio-user-server depends on an attached PCIDevice. As long as x-vfi=
o-user-server
> is used, we don=E2=80=99t want the PCIDevice to be unplugged. This blocke=
r prevents an user
> from removing PCIDevice while the vfio-user server is in use.

Please work that into your commit message.  Perhaps along the lines of

    One of the next commits will do <stuff>.  <badness> will happen when
    the PCI device is unplugged.  Create the means to prevent that.

>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>
> I recall receiving a =E2=80=9CReviewed-by=E2=80=9D from Stefan previously.
>
> I=E2=80=99m very sorry I didn=E2=80=99t add that here. I=E2=80=99ll go ov=
er all the patches once again to confirm that
> the =E2=80=9CReviewed-by=E2=80=9D status reflects accurately.
>
>>> ---
>>> include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
>>> hw/core/qdev.c         | 24 ++++++++++++++++++++++++
>>> softmmu/qdev-monitor.c |  4 ++++
>>> 3 files changed, 57 insertions(+)
>>>=20
>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>> index 92c3d65208..1b9fa25e5c 100644
>>> --- a/include/hw/qdev-core.h
>>> +++ b/include/hw/qdev-core.h
>>> @@ -193,6 +193,7 @@ struct DeviceState {
>>>     int instance_id_alias;
>>>     int alias_required_for_version;
>>>     ResettableState reset;
>>> +    GSList *unplug_blockers;
>>> };
>>>=20
>>> struct DeviceListener {
>>> @@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *=
hotplug_dev,
>>> void qdev_machine_creation_done(void);
>>> bool qdev_machine_modified(void);
>>>=20
>>> +/*
>>> + * qdev_add_unplug_blocker: Adds an unplug blocker to a device
>>> + *
>>> + * @dev: Device to be blocked from unplug
>>> + * @reason: Reason for blocking
>>> + */
>>> +void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
>>> +
>>> +/*
>>> + * qdev_del_unplug_blocker: Removes an unplug blocker from a device
>>> + *
>>> + * @dev: Device to be unblocked
>>> + * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
>>> + *          Used as a handle to lookup the blocker for deletion.
>>> + */
>>> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
>>> +
>>> +/*
>>> + * qdev_unplug_blocked: Confirms if a device is blocked from unplug
>>> + *
>>> + * @dev: Device to be tested
>>> + * @reason: Returns one of the reasons why the device is blocked,
>>> + *          if any
>>> + *
>>> + * Returns: true if device is blocked from unplug, false otherwise
>>> + */
>>> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
>>> +
>>> /**
>>>  * GpioPolarity: Polarity of a GPIO line
>>>  *
>>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>>> index 84f3019440..0806d8fcaa 100644
>>> --- a/hw/core/qdev.c
>>> +++ b/hw/core/qdev.c
>>> @@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
>>>     return NULL;
>>> }
>>>=20
>>> +void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
>>> +{
>>> +    dev->unplug_blockers =3D g_slist_prepend(dev->unplug_blockers, rea=
son);
>>> +}
>>> +
>>> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
>>> +{
>>> +    dev->unplug_blockers =3D g_slist_remove(dev->unplug_blockers, reas=
on);
>>> +}
>>> +
>>> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
>>> +{
>>> +    ERRP_GUARD();
>>> +
>>> +    if (dev->unplug_blockers) {
>>> +        error_propagate(errp, error_copy(dev->unplug_blockers->data));
>>> +        return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>=20
>> This cites the most recently added blocker as reason.  Your function
>> comment covers it: "Returns one of the reasons".  Okay.
>
> I could change the comment to say that it returns the recently added reas=
on.

Up to you.


