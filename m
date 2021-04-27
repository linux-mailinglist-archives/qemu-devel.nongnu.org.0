Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D236C607
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:24:38 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMlZ-0004Vh-Qu
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMif-0003C0-1u
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMic-0005T4-Kl
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619526092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5J1w+8VcpIIPnR4f60viVMV1L4kYu/hvn7a0n+Su5M=;
 b=QAQ0Tw+bcW/CX3UssGYqs4XUnzD3s+pgb/Ppa6Vlv/ANISs6R4RzDgTf8BeQfoaIowRxcQ
 PUnTDbU5j+LZBN0RE1v0o1SYM7X2nYkmI4QHFC+m0fnQ0JUK8mwjJlNGw7ZUM6qUt8uTDu
 zFFbg081+tuj71DFW0nd23Pe+hcd6iQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-gDwP8jgpMHG78dyxxHjsAQ-1; Tue, 27 Apr 2021 08:21:31 -0400
X-MC-Unique: gDwP8jgpMHG78dyxxHjsAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n9-20020a1c40090000b02901401bf40f9dso2678757wma.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 05:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y5J1w+8VcpIIPnR4f60viVMV1L4kYu/hvn7a0n+Su5M=;
 b=L6hamIih+Jz2GHZgGP5KdHstqJehwWeUxegEQC/B5YRDbF0UfbJ/gu6fFXwOkVkqHF
 0J0LZ/eSyWRs9AQ4daacQ+u5k0zNxR7vZKhvR8pcTHOUpO2duhWOm2UW7+RMz2UnNFsB
 Kt8clGhuPS3C/tcSTO/mIGLhBYqo3YwWejbsmDKaItxBglEbrS2oHydEfop0th6dPfPc
 rLtSIYtmP7QP2c/t2eOlbU0xttr8+r/C/QzYlUihj4ysWWqqCYFxmj4pMc1MHA2RsyUX
 Rf7dDin/70szaUNMiKeJYGMsVPagRQsxMT83uBWBesqnU/eFRDMqPIyBGmjmxvDpBHWe
 KDow==
X-Gm-Message-State: AOAM532NhUgx9AEWM69ueaQpTYUSOBAqX91hR0EZptiMHrAiW5hjezaz
 kglw9ZEUPDZD4SYGOtrE+Zg/o//DCv8mQtsutQYLQD8Gx0mhjLs0c7k3b26c+3fsuRWvhA+lK2T
 Lvpzi5gpYtspC+nM=
X-Received: by 2002:a1c:4382:: with SMTP id q124mr17218509wma.63.1619526089852; 
 Tue, 27 Apr 2021 05:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlgiiHGni9asEck+7X7dOoSjNrefxpPaVy0/Pj0MqbkTyOU0Wb7wkMuufqDfNDnYV+4qEIrA==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr17218484wma.63.1619526089653; 
 Tue, 27 Apr 2021 05:21:29 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x23sm20036981wmj.43.2021.04.27.05.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:21:29 -0700 (PDT)
Subject: Re: [PATCH v8 08/11] hw/core: deprecate old reset functions and
 introduce new ones
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>,
 Luc Michel <luc@lmichel.fr>, peter.maydell@linaro.org
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
 <20200123132823.1117486-9-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9fb8a6ed-137b-7269-91f1-69c11c6d876a@redhat.com>
Date: Tue, 27 Apr 2021 14:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20200123132823.1117486-9-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, edgari@xilinx.com,
 pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/20 2:28 PM, Damien Hedde wrote:
> Deprecate device_legacy_reset(), qdev_reset_all() and
> qbus_reset_all() to be replaced by new functions
> device_cold_reset() and bus_cold_reset() which uses resettable API.
> 
> Also introduce resettable_cold_reset_fn() which may be used as a
> replacement for qdev_reset_all_fn and qbus_reset_all_fn().
> 
> Following patches will be needed to look at legacy reset call sites
> and switch to resettable api. The legacy functions will be removed
> when unused.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/qdev-core.h  | 27 +++++++++++++++++++++++++++
>  include/hw/resettable.h |  9 +++++++++
>  hw/core/bus.c           |  5 +++++
>  hw/core/qdev.c          |  5 +++++
>  hw/core/resettable.c    |  5 +++++
>  5 files changed, 51 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 1b4b420617..b84fcc32bf 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -406,6 +406,13 @@ int qdev_walk_children(DeviceState *dev,
>                         qdev_walkerfn *post_devfn, qbus_walkerfn *post_busfn,
>                         void *opaque);
>  
> +/**
> + * @qdev_reset_all:
> + * Reset @dev. See @qbus_reset_all() for more details.
> + *
> + * Note: This function is deprecated and will be removed when it becomes unused.
> + * Please use device_cold_reset() now.
> + */
>  void qdev_reset_all(DeviceState *dev);
>  void qdev_reset_all_fn(void *opaque);
>  
> @@ -418,10 +425,28 @@ void qdev_reset_all_fn(void *opaque);
>   * hard reset means that qbus_reset_all will reset all state of the device.
>   * For PCI devices, for example, this will include the base address registers
>   * or configuration space.
> + *
> + * Note: This function is deprecated and will be removed when it becomes unused.
> + * Please use bus_cold_reset() now.

Some time passed, so looking at this with some retrospective.

If there is an effort to introduce a new API replacing another one,
we should try convert all the uses of the old API to the new one,
instead of declaring it legacy.

Declare an API legacy/deprecated should be the last resort if there
is no way to remove it. I'd recommend to move the deprecated/legacy
declarations in a separate header, with the '_legacy' suffix.

Else:

1/ we never finish API conversions,
2/ the new API might not be ready for all the legacy API use cases,
3/ we end up having to maintain 2 different APIs.


So the recommendation is to use bus_cold_reset(), but it isn't
used anywhere...:

$ git grep bus_cold_reset
docs/devel/reset.rst:64:- ``bus_cold_reset()``
hw/core/bus.c:73:void bus_cold_reset(BusState *bus)
include/hw/qdev-core.h:715: * Please use bus_cold_reset() now.
include/hw/qdev-core.h:728: * bus_cold_reset:
include/hw/qdev-core.h:733:void bus_cold_reset(BusState *bus);

IMHO we shouldn't add new public prototypes without callers.

I see it is similar to device_cold_reset(), but TBH I'm scared
to be the first one using it.

Regards,

Phil.

>   */
>  void qbus_reset_all(BusState *bus);
>  void qbus_reset_all_fn(void *opaque);
>  
> +/**
> + * device_cold_reset:
> + * Reset device @dev and perform a recursive processing using the resettable
> + * interface. It triggers a RESET_TYPE_COLD.
> + */
> +void device_cold_reset(DeviceState *dev);
> +
> +/**
> + * bus_cold_reset:
> + *
> + * Reset bus @bus and perform a recursive processing using the resettable
> + * interface. It triggers a RESET_TYPE_COLD.
> + */
> +void bus_cold_reset(BusState *bus);


