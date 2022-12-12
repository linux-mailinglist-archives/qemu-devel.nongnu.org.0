Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB564A207
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jAO-0002gC-II; Mon, 12 Dec 2022 08:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4j9m-0002Nl-Hi
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:47:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4j9k-0001f5-9I
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:47:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id bg10so5415411wmb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=q3uMHAY8V6R6gIw1Sdw8xUXTMSyY2KswLh/KJIMrmbI=;
 b=CEA9yFF3Z9t9MI6DCZv3qDiB3b489G6CUtI9Uky4QyV86hu3dMUXPkch8LsX8OlSyB
 lz9oNxKyjpKKR/EzLYs9W+FRtz846uIKdZlA+M2KVXFWtsJOIZXQJ8F+O4WsNgZaplN2
 GyetHy6OKE4BuzhdHKcewze0bZZxhsZoaejE/KCMRTzQryQkqfyzVn7GIS0mFAqf2aw2
 wGhTSrm7b7AR39Cc6Oy1KiLpd1n5VAiCVJahrByKWoEm/mJmvmrh0P23gvgmT8v4Cf8/
 gkgPdyCurtkjnDDHAMYl05QqgbHipdYL3TzJUDYQkl0JLxuLMFBUFBmn+2yplS6CW89o
 X8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q3uMHAY8V6R6gIw1Sdw8xUXTMSyY2KswLh/KJIMrmbI=;
 b=YuFY+xg0F3dQOWjPS1dIvc1Bk0/PqYhvgjVXAPvMgpwzMW8FN64ik3jO3cAUBjXa9y
 yh02GP9/IV4Lfio7Tna6QlkAOTPtu4h7h1n4Vm/PrdFXcoHfRuhnP2jy10IwAYFAZ/l5
 aDgZRuKpqFPyuimt58Ulpwm8G/5X0KMFs+LR5JRqY7qppgdlu1PY9ZujfnVEfq58MsOU
 7Y25lHTQUrXmQbfZoQ9thcOeSxEr49rp0/jXww5JxHfQUVNyjGUx1AWwDtQYehqcGHt0
 G4UWQm1SOowHJ1Y48ub5jRDz9pueWN7ROCAFdp0noO0/+ISNzt+5tmNXe6kbMlne9ro0
 deiA==
X-Gm-Message-State: ANoB5pmXtPHNldx+pom/b6L7W0XAU1Izs6mM68jNAgM3o4dHkf6Uv4yR
 3yMkcFPR86VZlTNV1aKeneE=
X-Google-Smtp-Source: AA0mqf6+zF1l6bwRIHS+XoSkEckZCEaUPXdPG4BxrhosJ7UkAqlDFUMM4y2eczTBjC7A68RLL8+NQQ==
X-Received: by 2002:a05:600c:5385:b0:3c6:e61e:ae71 with SMTP id
 hg5-20020a05600c538500b003c6e61eae71mr15797269wmb.1.1670852854937; 
 Mon, 12 Dec 2022 05:47:34 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 k62-20020a1ca141000000b003b492753826sm9384868wme.43.2022.12.12.05.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:47:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3f49e738-277b-5a44-4c05-6a7df235dbe0@xen.org>
Date: Mon, 12 Dec 2022 13:47:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 07/22] pc_piix: handle XEN_EMULATE backend init
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-8-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/12/2022 09:55, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> And use newly added xen_emulated_machine_init() to iniitalize
> the xenstore and the sysdev bus for future emulated devices.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Move it to xen-legacy-backend.c]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc_piix.c                   |  5 +++++
>   hw/xen/xen-legacy-backend.c         | 22 ++++++++++++++++------
>   include/hw/xen/xen-legacy-backend.h |  2 ++
>   3 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 13286d0739..3dcac2f4b6 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -47,6 +47,7 @@
>   #include "hw/sysbus.h"
>   #include "hw/i2c/smbus_eeprom.h"
>   #include "hw/xen/xen-x86.h"
> +#include "hw/xen/xen-legacy-backend.h"
>   #include "exec/memory.h"
>   #include "hw/acpi/acpi.h"
>   #include "hw/acpi/piix4.h"
> @@ -155,6 +156,10 @@ static void pc_init1(MachineState *machine,
>               x86ms->above_4g_mem_size = 0;
>               x86ms->below_4g_mem_size = machine->ram_size;
>           }
> +
> +        if (pcms->xen_version && !xen_be_xenstore_open()) {

So, this is a bit subtle... it's only *because* using real Xen results 
in xen_version being 0 that this is sane? Also does this not mean that 
we are now relying on libxenstore? Shouldn't that be called out in the 
config?

> +            xen_emulated_machine_init();
> +        }
>       }
>   
>       pc_machine_init_sgx_epc(pcms);
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 694e7bbc54..60a7bc7ab6 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -31,6 +31,7 @@
>   #include "qapi/error.h"
>   #include "hw/xen/xen-legacy-backend.h"
>   #include "hw/xen/xen_pvdev.h"
> +#include "hw/xen/xen-bus.h"
>   #include "monitor/qdev.h"
>   
>   DeviceState *xen_sysdev;
> @@ -294,13 +295,15 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
>       xendev->debug      = debug;
>       xendev->local_port = -1;
>   
> -    xendev->evtchndev = xenevtchn_open(NULL, 0);
> -    if (xendev->evtchndev == NULL) {
> -        xen_pv_printf(NULL, 0, "can't open evtchn device\n");
> -        qdev_unplug(DEVICE(xendev), NULL);
> -        return NULL;
> +    if (xen_mode != XEN_EMULATE) {
> +        xendev->evtchndev = xenevtchn_open(NULL, 0);

Doesn't this need stubbing out so that we can build without libxenevtchn?

   Paul

> +        if (xendev->evtchndev == NULL) {
> +            xen_pv_printf(NULL, 0, "can't open evtchn device\n");
> +            qdev_unplug(DEVICE(xendev), NULL);
> +            return NULL;
> +        }
> +        qemu_set_cloexec(xenevtchn_fd(xendev->evtchndev));
>       }
> -    qemu_set_cloexec(xenevtchn_fd(xendev->evtchndev));
>   
>       xen_pv_insert_xendev(xendev);
>   
> @@ -859,3 +862,10 @@ static void xenbe_register_types(void)
>   }
>   
>   type_init(xenbe_register_types)
> +
> +void xen_emulated_machine_init(void)
> +{
> +    xen_bus_init();
> +    xen_be_sysdev_init();
> +    xen_be_register_common();
> +}
> diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
> index 0aa171f6c2..aa09015662 100644
> --- a/include/hw/xen/xen-legacy-backend.h
> +++ b/include/hw/xen/xen-legacy-backend.h
> @@ -105,4 +105,6 @@ int xen_config_dev_vfb(int vdev, const char *type);
>   int xen_config_dev_vkbd(int vdev);
>   int xen_config_dev_console(int vdev);
>   
> +void xen_emulated_machine_init(void);
> +
>   #endif /* HW_XEN_LEGACY_BACKEND_H */


