Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BBD3E359E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 15:49:23 +0200 (CEST)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCMhW-0005jg-HM
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 09:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMfx-0003dY-K0
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMfv-0001eD-2x
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628344061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O9hkrI+roMPzvqynCUh+r3OEs1LUrLAfWBVKBNXFLAs=;
 b=YwSHHge83HBL7I4hCz1VdMcT+w9M4ovM0o4JNGQmv8IGxxx95w8t0pSfkhVxnhcc2eDppg
 khoCSviy2pE6+RNH6EEai6pFGYp0yU3eLUOOrHzddmGnMjFvuqs5LUpe4pUk2jGsaJlv3T
 c8L6lbQpcNB5XJcwp5BA2zL/fXdUJuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-v1li4IA0PFO7Z7XZDLH8_g-1; Sat, 07 Aug 2021 09:47:40 -0400
X-MC-Unique: v1li4IA0PFO7Z7XZDLH8_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 179FA87D542;
 Sat,  7 Aug 2021 13:47:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B920B1700F;
 Sat,  7 Aug 2021 13:47:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 526CC11380A0; Sat,  7 Aug 2021 15:47:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 5/7] qapi/qdev.json: add DEVICE_UNPLUG_ERROR
 QAPI event
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-6-danielhb413@gmail.com>
Date: Sat, 07 Aug 2021 15:47:37 +0200
In-Reply-To: <20210719200827.1507276-6-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 19 Jul 2021 17:08:25 -0300")
Message-ID: <87tuk1bc3q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> At this moment we only provide one event to report a hotunplug error,
> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> machine is now able to report unplug errors for other device types, such
> as CPUs.
>
> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> unplug errors in the future. This event has a similar API as the
> existing DEVICE_DELETED event, with an extra optional 'msg' parameter
> that can be used to explain the reason for the error.
>
> With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  qapi/machine.json         |  6 +++++-
>  qapi/qdev.json            | 30 +++++++++++++++++++++++++++++-
>  stubs/qdev.c              |  7 +++++++
>  4 files changed, 51 insertions(+), 2 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d438f1c8d..c0c3431ada 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>  this CPU is also deprecated.
>  
> +
> +QEMU API (QAPI) events
> +----------------------
> +
> +``MEM_UNPLUG_ERROR`` (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
> +
> +
>  System emulator machines
>  ------------------------
>  
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..a595c753d2 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1271,6 +1271,9 @@
>  #
>  # @msg: Informative message
>  #
> +# Features:
> +# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR instead.
> +#
>  # Since: 2.4
>  #
>  # Example:
> @@ -1283,7 +1286,8 @@
>  #
>  ##
>  { 'event': 'MEM_UNPLUG_ERROR',
> -  'data': { 'device': 'str', 'msg': 'str' } }
> +  'data': { 'device': 'str', 'msg': 'str' },
> +  'features': ['deprecated'] }
>  
>  ##
>  # @SMPConfiguration:
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index d1d3681a50..52c36c7b9c 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -84,7 +84,9 @@
>  #        This command merely requests that the guest begin the hot removal
>  #        process.  Completion of the device removal process is signaled with a
>  #        DEVICE_DELETED event. Guest reset will automatically complete removal
> -#        for all devices.
> +#        for all devices.  If an error in the hot removal process is detected,
> +#        the device will not be removed and a DEVICE_UNPLUG_ERROR event is
> +#        sent.  Some errors cannot be detected.
>  #
>  # Since: 0.14
>  #
> @@ -124,3 +126,29 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_UNPLUG_ERROR:
> +#
> +# Emitted when a device hot unplug error occurs.
> +#
> +# @device: the device's ID if it has one
> +#
> +# @path: the device's path within the object model

Recommend "the device's QOM path".

> +#
> +# @msg: optional informative message

Is this useful?  I guess the remaining patches will tell.

> +#
> +# Since: 6.2
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_UNPLUG_ERROR"
> +#      "data": { "device": "core1",
> +#                "msg": "Device hotunplug rejected by the guest for device core1",
> +#                "path": "/machine/peripheral/core1" },
> +#      },
> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> +#
> +##
> +{ 'event': 'DEVICE_UNPLUG_ERROR',
> +  'data': { '*device': 'str', 'path': 'str' , '*msg': 'str' } }
> diff --git a/stubs/qdev.c b/stubs/qdev.c
> index 92e6143134..ffa8f7b59e 100644
> --- a/stubs/qdev.c
> +++ b/stubs/qdev.c
> @@ -21,3 +21,10 @@ void qapi_event_send_device_deleted(bool has_device,
>  {
>      /* Nothing to do. */
>  }
> +
> +void qapi_event_send_device_unplug_error(bool has_device, const char *device,
> +                                         const char *path,
> +                                         bool has_msg, const char *msg)
> +{
> +    /* Nothing to do. */
> +}

I'm reserving judgement on member @msg.  Other than that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


