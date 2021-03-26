Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536D34A497
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:37:08 +0100 (CET)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPitv-0000Jz-9d
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPisc-0007x4-CV
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPisX-0007nP-2P
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616751338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TpHw/ZRZvklF4zEweFSNZmDPsX+do4tXURjjd3R5O/g=;
 b=INPoUC8OrKXMXzXtGKHuXN7qiag7RV2BQN1avLnYJh2XZzuUe7F34Zo4oK/+GLCBNzeNj9
 jFP3PJa3/YmjlPugEvUof8qamZk75VZ4fuGt5pfpFMlgAzpnmj+BQkwmwdbbCUzmsua8o3
 PiAmUrixurSPY5geZSAWES/GmWw/vWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-cZ9g888HNtOM1guDtzO0Iw-1; Fri, 26 Mar 2021 05:35:34 -0400
X-MC-Unique: cZ9g888HNtOM1guDtzO0Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD99E6B9C0;
 Fri, 26 Mar 2021 09:35:32 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1DD63632;
 Fri, 26 Mar 2021 09:35:30 +0000 (UTC)
Subject: Re: [PATCH for-6.0 2/4] machine: Provide a function to check the
 dynamic sysbus whitelist
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-3-peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c841a6e8-2f98-21ff-dfc7-9e0718dcc780@redhat.com>
Date: Fri, 26 Mar 2021 10:35:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325153310.9131-3-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/25/21 4:33 PM, Peter Maydell wrote:
> Provide a new function dynamic_sysbus_dev_allowed() which checks
> the per-machine whitelist of dynamic sysbus devices and returns
> a boolean result indicating whether the device is whitelisted.
> We can use this in the implementation of validate_sysbus_device(),
> but we will also need it so that machine hotplug callbacks can
> validate devices rather than assuming that any sysbus device
> might be hotpluggable into the platform bus.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  include/hw/boards.h | 24 ++++++++++++++++++++++++
>  hw/core/machine.c   | 21 ++++++++++++++++-----
>  2 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 27106abc11d..609112a4e1a 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -51,6 +51,30 @@ void machine_set_cpu_numa_node(MachineState *machine,
>   */
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>  
> +/**
> + * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
> + * @mc: Machine class
> + * @dev: device to check
> + *
> + * Returns: true if @dev is a sysbus device on the machine's whitelist
> + * of dynamically pluggable sysbus devices; otherwise false.
> + *
> + * This function checks whether @dev is a valid dynamic sysbus device,
> + * by first confirming that it is a sysbus device and then checking it
> + * against the whitelist of permitted dynamic sysbus devices which has
> + * been set up by the machine using machine_class_allow_dynamic_sysbus_dev().
> + *
> + * It is valid to call this with something that is not a subclass of
> + * TYPE_SYS_BUS_DEVICE; the function will return false in this case.
> + * This allows hotplug callback functions to be written as:
> + *     if (device_is_dynamic_sysbus(mc, dev)) {
> + *         handle dynamic sysbus case;
> + *     } else if (some other kind of hotplug) {
> + *         handle that;
> + *     }
> + */
> +bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev);
> +
>  /*
>   * Checks that backend isn't used, preps it for exclusive usage and
>   * returns migratable MemoryRegion provided by backend.
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9935c6ddd56..8d97094736a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -529,20 +529,31 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>      QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
>  }
>  
> -static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
> +bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
>  {
> -    MachineState *machine = opaque;
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
>      bool allowed = false;
>      strList *wl;
> +    Object *obj = OBJECT(dev);
> +
> +    if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
> +        return false;
> +    }
>  
>      for (wl = mc->allowed_dynamic_sysbus_devices;
>           !allowed && wl;
>           wl = wl->next) {
> -        allowed |= !!object_dynamic_cast(OBJECT(sbdev), wl->value);
> +        allowed |= !!object_dynamic_cast(obj, wl->value);
>      }
>  
> -    if (!allowed) {
> +    return allowed;
> +}
> +
> +static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
> +{
> +    MachineState *machine = opaque;
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +
> +    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
>          error_report("Option '-device %s' cannot be handled by this machine",
>                       object_class_get_name(object_get_class(OBJECT(sbdev))));
>          exit(1);
> 


