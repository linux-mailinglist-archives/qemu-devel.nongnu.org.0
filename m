Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFF3BE596
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:28:08 +0200 (CEST)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m13qh-00012U-GF
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m13pc-0008SN-VD
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:27:00 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:33979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m13pb-0002Ty-Ga
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:27:00 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-TRy1CKP3OWGr13EulTH5jQ-1; Wed, 07 Jul 2021 05:26:48 -0400
X-MC-Unique: TRy1CKP3OWGr13EulTH5jQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B956A100CD00;
 Wed,  7 Jul 2021 09:26:46 +0000 (UTC)
Received: from bahia.lan (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D12815D9D3;
 Wed,  7 Jul 2021 09:26:44 +0000 (UTC)
Date: Wed, 7 Jul 2021 11:26:43 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
Message-ID: <20210707112643.3fd33edd@bahia.lan>
In-Reply-To: <20210707003314.37110-2-danielhb413@gmail.com>
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-2-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  6 Jul 2021 21:33:12 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> At this moment we only provide one event to report a hotunplug error,
> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> machine is now able to report unplug errors for other device types, such
> as CPUs.
>=20
> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> unplug errors in the future.
>=20
> With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated=
.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  docs/system/deprecated.rst | 10 ++++++++++
>  qapi/machine.json          |  6 +++++-
>  qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
>  3 files changed, 41 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 70e08baff6..ca6c7f9d43 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, =
which is deprecated
>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>  this CPU is also deprecated.
> =20
> +
> +QEMU API (QAPI) events
> +----------------------
> +
> +``MEM_UNPLUG_ERROR`` (since 6.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
> +
> +
>  System emulator machines
>  ------------------------
> =20
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..a595c753d2 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1271,6 +1271,9 @@
>  #
>  # @msg: Informative message
>  #
> +# Features:
> +# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR instea=
d.
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
> =20
>  ##
>  # @SMPConfiguration:
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..349d7439fa 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -84,7 +84,9 @@
>  #        This command merely requests that the guest begin the hot remov=
al
>  #        process.  Completion of the device removal process is signaled =
with a
>  #        DEVICE_DELETED event. Guest reset will automatically complete r=
emoval
> -#        for all devices.
> +#        for all devices. If an error in the hot removal process is dete=
cted,
> +#        the device will not be removed and a DEVICE_UNPLUG_ERROR event =
is
> +#        sent.
>  #
>  # Since: 0.14
>  #
> @@ -124,3 +126,26 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_UNPLUG_ERROR:
> +#
> +# Emitted when a device hot unplug error occurs.
> +#
> +# @device: device name
> +#
> +# @msg: Informative message
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_UNPLUG_ERROR"
> +#      "data": { "device": "dimm1",
> +#                "msg": "Memory hotunplug rejected by the guest for devi=
ce dimm1"
> +#      },
> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> +#
> +##
> +{ 'event': 'DEVICE_UNPLUG_ERROR',
> +  'data': { 'device': 'str', 'msg': 'str' } }


