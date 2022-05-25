Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED5533B26
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 13:00:21 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntokW-0006SN-1p
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 07:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntofL-0002iG-8B
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntofI-0004Gb-35
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653476094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hrJGnGDBRvi/2RDwkMTo4HCsh3pkbeG7b3P7lEc/74=;
 b=JqCxrNsuSxIjZWoaFVqZTBFvfsl4OqPnrUmL7shGHHUX9tFU3TKqcP7EACj/9ZW2oiy+Ff
 J6IEC7X6NgMnVtIlaqMg3EPdUi0l+Jb7KW2oMHVzot2TXhAdHPry5hDBJK5XSY4llYo2jx
 TC2C35zv8BviX0a80Syxj6D0/kRtOps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-tE4r0lWROHaogC8zoTrqyQ-1; Wed, 25 May 2022 06:54:49 -0400
X-MC-Unique: tE4r0lWROHaogC8zoTrqyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC7C2101A54E;
 Wed, 25 May 2022 10:54:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 981C6C27E8F;
 Wed, 25 May 2022 10:54:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 61B0521E6906; Wed, 25 May 2022 12:54:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
References: <165296995578.196133.16183155555450040914.stgit@buzz>
Date: Wed, 25 May 2022 12:54:47 +0200
In-Reply-To: <165296995578.196133.16183155555450040914.stgit@buzz> (Konstantin
 Khlebnikov's message of "Thu, 19 May 2022 17:19:16 +0300")
Message-ID: <87zgj5hog8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I almost missed this series.  Please cc: maintainers.
scripts/get_maintainer.pl can help you find them, but do use your
judgement to maybe trim its output.

Konstantin Khlebnikov <khlebnikov@yandex-team.ru> writes:

> This event represents device runtime errors to give time and
> reason why device is broken.

Can you give an or more examples of the "device runtime errors" you have
in mind?

>
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> ---
>  hw/core/qdev.c         |    7 +++++++
>  include/hw/qdev-core.h |    1 +
>  qapi/qdev.json         |   26 ++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 84f3019440..e95ceb071b 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -347,6 +347,13 @@ void qdev_unrealize(DeviceState *dev)
>      object_property_set_bool(OBJECT(dev), "realized", false, &error_abort);
>  }
>  
> +void qdev_report_runtime_error(DeviceState *dev, const Error *err)
> +{
> +    qapi_event_send_device_runtime_error(!!dev->id, dev->id,
> +                                         dev->canonical_path,
> +                                         error_get_pretty(err));
> +}
> +
>  static int qdev_assert_realized_properly_cb(Object *obj, void *opaque)
>  {
>      DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..9ced2e0f09 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -396,6 +396,7 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
>   * the life of the simulation and should not be unrealized and freed.
>   */
>  void qdev_unrealize(DeviceState *dev);
> +void qdev_report_runtime_error(DeviceState *dev, const Error *err);
>  void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
>                                   int required_for_version);
>  HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev);
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 26cd10106b..89ef32eef7 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -159,3 +159,29 @@
>  ##
>  { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_RUNTIME_ERROR:
> +#
> +# Emitted when a device fails in runtime.

at runtime

I figure there are plenty of device state transitions in the tree that
are failures.  Better express that here.  Unless you intend to hunt them
all down so you can add this event :)

> +#
> +# @device: the device's ID if it has one
> +#
> +# @path: the device's QOM path
> +#
> +# @reason: human readable description
> +#
> +# Since: 7.1
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_RUNTIME_ERROR"
> +#      "data": { "device": "virtio-net-pci-0",
> +#                "path": "/machine/peripheral/virtio-net-pci-0",
> +#                "reason": "virtio-net header incorrect" },
> +#      },
> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> +#
> +##
> +{ 'event': 'DEVICE_RUNTIME_ERROR',
> +        'data': { '*device': 'str', 'path': 'str', 'reason': 'str' } }


