Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DDA3C13E0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:09:06 +0200 (CEST)
Received: from localhost ([::1]:60324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tm5-0005Kd-S8
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1Tek-0007og-8l
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1Tei-000714-1t
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YTcrAV3Y28bzpuvp5cnTC+eK3Gu3yTmzdQ1ul5+nxrM=;
 b=TRIisqYRwxEf4uI7H3pvPCfjyQC6PI0AX5ZsW/LOxfYTReSDmqWWGxtpkE2UNlanVgy3uv
 vEmpcQ7bdHoVXW6yvmkdJ8yFu8w40NLb4xSK2JfRnAngXKYDBVyUtccCqPf/1PNtCv+jQy
 T/2nQz/57HUC3yS6PK9vM8GTdx5RUyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-kMz62RYaNqOnw7F2mpH2lg-1; Thu, 08 Jul 2021 09:01:24 -0400
X-MC-Unique: kMz62RYaNqOnw7F2mpH2lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC596804308;
 Thu,  8 Jul 2021 13:01:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3CD5D9FC;
 Thu,  8 Jul 2021 13:01:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D978E1132B52; Thu,  8 Jul 2021 15:01:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-2-danielhb413@gmail.com>
Date: Thu, 08 Jul 2021 15:01:20 +0200
In-Reply-To: <20210707003314.37110-2-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 6 Jul 2021 21:33:12 -0300")
Message-ID: <87r1g96jtr.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eblake@redhat.com, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
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
> unplug errors in the future.
>
> With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  docs/system/deprecated.rst | 10 ++++++++++
>  qapi/machine.json          |  6 +++++-
>  qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
>  3 files changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 70e08baff6..ca6c7f9d43 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>  this CPU is also deprecated.
>  
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
> index b83178220b..349d7439fa 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -84,7 +84,9 @@
>  #        This command merely requests that the guest begin the hot removal
>  #        process.  Completion of the device removal process is signaled with a
>  #        DEVICE_DELETED event. Guest reset will automatically complete removal
> -#        for all devices.
> +#        for all devices. If an error in the hot removal process is detected,
> +#        the device will not be removed and a DEVICE_UNPLUG_ERROR event is
> +#        sent.

"If an error ... is detected" kind of implies that some errors may go
undetected.  Let's spell this out more clearly.  Perhaps append "Some
errors cannot be detected."

DEVICE_UNPLUG_ERROR's unrelability is awkward.  Best we can do in the
general case.  Can we do better in special cases, and would it be
worthwhile?  If yes, it should probably be done on top.

Two spaces between sentences for consistency with the existing text, please.

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
> +#                "msg": "Memory hotunplug rejected by the guest for device dimm1"
> +#      },
> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> +#
> +##
> +{ 'event': 'DEVICE_UNPLUG_ERROR',
> +  'data': { 'device': 'str', 'msg': 'str' } }

Hmm.

DEVICE_DELETED provides the device ID if the device has one, and the QOM
path.  Documentation is less than clear for both (not your patch's
fault).

DEVICE_UNPLUG_ERROR provides the device ID unconditionally, and doesn't
provide the QOM path.  What if the device doesn't have a device ID?

I suspect DEVICE_UNPLUG_ERROR should match DEVICE_DELETED exactly.

Bonus (for me, not for you): improving the unclear documentation becomes
your patch's problem.  Here's my attempt:

   # @device: the device's ID if it has one
   #
   # @path: the device's path within the object model


