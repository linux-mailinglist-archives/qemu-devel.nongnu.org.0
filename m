Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C537FCF5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:55:22 +0200 (CEST)
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFYP-0001ps-2Y
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFPg-0000hS-OL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:46:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFPd-0005Kp-9g
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jz9xnR5RT8x2qH85x37KCKe5brKsa9hpYsfyE+AHJSM=;
 b=PCsOTq0BJ0ZWBUHa+ECUjlAdlnGR9nZZmK8GMiOK9O81s5HsiKhmq8X4WtbkjsbBReThG8
 pA0feHBjCFD6LjiaClAXwnRZ1aPheg1AZqFZ4sgT6+OVz7QG+Hh7fvATD7VbjYy7Tilj2x
 xo6N1VaDokgTpTYseLjZ4fU0UTqY3Ag=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-6CeS6cMtNl6xgc4Aqh14WQ-1; Thu, 13 May 2021 13:46:14 -0400
X-MC-Unique: 6CeS6cMtNl6xgc4Aqh14WQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so2061096ejb.14
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jz9xnR5RT8x2qH85x37KCKe5brKsa9hpYsfyE+AHJSM=;
 b=HRjrb7/mxGsLjYRDO4bhBlHT1OWOz7uCKuLH+K2ZRoxzSUKXYyitS8U0YR+aaPHNNX
 uADOj36t0jHvrDvw95BKHwGz5LVEW2uqu95qJ/8sNlTsYK5TOLkyxIUO6wXnW2ufP4Jq
 yt2ZlX46d+6yJb1K48d1vdTqOz9G9zQhqA0N7tFkPEV3e3VyEpTXK8Um91tk+vS0eBcj
 EHiENNPVa7DjoNz7+FXSBSF28pBnEi2tqIbElM/SRjFtMr2j+72n/nv5Tvekx9a9lusx
 fbQ4G1ozVoLNJimDSMq+FZGhLSiKCT5OrrM+F0GFx8GxvCGIhS5c+iVWSw8kW3UdZvyf
 ZT5g==
X-Gm-Message-State: AOAM533Lap2c3arYrYNz5PrR7HrCyqe7uqFSOnfyCmp9uKPMphgbLvyt
 M6WR3FX6vZoTIIjzX0XUzfGcD+KPCEMyjpeYhMnSEv4r+/BAlxVq9nSkaVF4Qlh24nKxYqYEqSJ
 jTHMcG/ozxaNj2ts=
X-Received: by 2002:a17:906:4ece:: with SMTP id
 i14mr5035374ejv.249.1620927973699; 
 Thu, 13 May 2021 10:46:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHiaiVfLh0VZMjk8QV5XD5MtpF/20/4MDpry+93VscmI+7ttyT2z3MJAqgVKnDoPh3XgyOBg==
X-Received: by 2002:a17:906:4ece:: with SMTP id
 i14mr5035354ejv.249.1620927973453; 
 Thu, 13 May 2021 10:46:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g11sm2783340edt.85.2021.05.13.10.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:46:12 -0700 (PDT)
Subject: Re: [RFC PATCH 2/9] replace machine phase_check with
 machine_is_initialized/ready calls
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-3-mirela.grujic@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dcaf4794-0661-afae-a256-5043be20aa5b@redhat.com>
Date: Thu, 13 May 2021 19:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513082549.114275-3-mirela.grujic@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 mark.burton@greensocs.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 10:25, Mirela Grujic wrote:
> Once we define MachineInitPhase in qapi, the generated enumeration
> constants will be prefixed with the MACHINE_INIT_PHASE_.
> We need to define the MachineInitPhase enum in qapi in order to
> add the QMP command that will query current machine init phase.
> 
> Since in the existing definition of enum MachineInitPhase the
> enumeration constants are prefixed with PHASE_, there will be a
> massive find/replace to rename the existing enum constants.
> We'll do this in 2 phases:
> 1) hide explicit use of PHASE_ prefixed enums by replacing
>      phase_check(PHASE_MACHINE_INITIALIZED) -> machine_is_initialized()
>      phase_check(PHASE_MACHINE_READY) -> machine_is_ready()
> 2) rename enums
> 
> Once 1) and 2) are done MachineInitPhase enum will be generated.

Is it so much churn to just rename everything to MACHINE_INIT_PHASE_* 
and keep phase_check() as is?  Or is it because the QAPI-generated names 
are quite long?

Paolo

> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> ---
>   include/hw/qdev-core.h     |  2 ++
>   hw/core/machine-qmp-cmds.c |  2 +-
>   hw/core/machine.c          |  2 +-
>   hw/core/qdev.c             | 12 +++++++++++-
>   hw/pci/pci.c               |  2 +-
>   hw/usb/core.c              |  2 +-
>   hw/virtio/virtio-iommu.c   |  2 +-
>   monitor/hmp.c              |  2 +-
>   softmmu/qdev-monitor.c     |  9 ++++-----
>   softmmu/vl.c               |  2 +-
>   ui/console.c               |  2 +-
>   11 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 6e52240d92..5e3c6d4482 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -842,5 +842,7 @@ typedef enum MachineInitPhase {
>   extern bool phase_check(MachineInitPhase phase);
>   extern void phase_advance(MachineInitPhase phase);
>   extern MachineInitPhase phase_get(void);
> +extern bool machine_is_initialized(void);
> +extern bool machine_is_ready(void);
>   
>   #endif
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 68a942595a..be286882cc 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -149,7 +149,7 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
>   
>   void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>   {
> -    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
> +    if (machine_is_initialized()) {
>           error_setg(errp, "The command is permitted only before the machine has been created");
>           return;
>       }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 40def78183..eba046924d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1239,7 +1239,7 @@ static NotifierList machine_init_done_notifiers =
>   void qemu_add_machine_init_done_notifier(Notifier *notify)
>   {
>       notifier_list_add(&machine_init_done_notifiers, notify);
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (machine_is_ready()) {
>           notify->notify(notify, NULL);
>       }
>   }
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 4a4a4d8c52..71906170f9 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -904,7 +904,7 @@ static void device_initfn(Object *obj)
>   {
>       DeviceState *dev = DEVICE(obj);
>   
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (machine_is_ready()) {
>           dev->hotplugged = 1;
>           qdev_hot_added = true;
>       }
> @@ -1155,6 +1155,16 @@ MachineInitPhase phase_get(void)
>       return machine_phase;
>   }
>   
> +bool machine_is_initialized(void)
> +{
> +    return machine_phase >= PHASE_MACHINE_INITIALIZED;
> +}
> +
> +bool machine_is_ready(void)
> +{
> +    return machine_phase >= PHASE_MACHINE_READY;
> +}
> +
>   static const TypeInfo device_type_info = {
>       .name = TYPE_DEVICE,
>       .parent = TYPE_OBJECT,
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 8f35e13a0c..19b584c3d1 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1071,7 +1071,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>       address_space_init(&pci_dev->bus_master_as,
>                          &pci_dev->bus_master_container_region, pci_dev->name);
>   
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (machine_is_ready()) {
>           pci_init_bus_master(pci_dev);
>       }
>       pci_dev->irq_state = 0;
> diff --git a/hw/usb/core.c b/hw/usb/core.c
> index 975f76250a..2ec0dea6a0 100644
> --- a/hw/usb/core.c
> +++ b/hw/usb/core.c
> @@ -97,7 +97,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
>       USBDevice *dev = ep->dev;
>       USBBus *bus = usb_bus_from_device(dev);
>   
> -    if (!phase_check(PHASE_MACHINE_READY)) {
> +    if (!machine_is_ready()) {
>           /*
>            * This is machine init cold plug.  No need to wakeup anyone,
>            * all devices will be reset anyway.  And trying to wakeup can
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 1b23e8e18c..8b1bcb2848 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -948,7 +948,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>        * accept it. Having a different masks is possible but the guest will use
>        * sub-optimal block sizes, so warn about it.
>        */
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (machine_is_ready()) {
>           int new_granule = ctz64(new_mask);
>           int cur_granule = ctz64(cur_mask);
>   
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 6c0b33a0b1..c24511db6d 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -216,7 +216,7 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
>   
>   static bool cmd_available(const HMPCommand *cmd)
>   {
> -    return phase_check(PHASE_MACHINE_READY) || cmd_can_preconfig(cmd);
> +    return machine_is_ready() || cmd_can_preconfig(cmd);
>   }
>   
>   static void help_cmd_dump_one(Monitor *mon,
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index a9955b97a0..be8a892517 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -254,7 +254,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>   
>       dc = DEVICE_CLASS(oc);
>       if (!dc->user_creatable ||
> -        (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
> +        (machine_is_ready() && !dc->hotpluggable)) {
>           error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
>                      "a pluggable device type");
>           return NULL;
> @@ -636,7 +636,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>           }
>       }
>   
> -    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
> +    if (machine_is_ready() && bus && !qbus_is_hotpluggable(bus)) {
>           error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
>           return NULL;
>       }
> @@ -650,7 +650,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>       dev = qdev_new(driver);
>   
>       /* Check whether the hotplug is allowed by the machine */
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (machine_is_ready()) {
>           if (!qdev_hotplug_allowed(dev, errp)) {
>               goto err_del_dev;
>           }
> @@ -998,8 +998,7 @@ int qemu_global_option(const char *str)
>   
>   bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>   {
> -    if (!phase_check(PHASE_MACHINE_READY) &&
> -        !(cmd->options & QCO_ALLOW_PRECONFIG)) {
> +    if (!machine_is_ready() && !(cmd->options & QCO_ALLOW_PRECONFIG)) {
>           error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
>                      cmd->name);
>           return false;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index cbf62abeb4..3af9743ceb 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2636,7 +2636,7 @@ static void qemu_machine_enter_phase(MachineInitPhase target_phase,
>   
>   void qmp_x_exit_preconfig(Error **errp)
>   {
> -    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
> +    if (machine_is_initialized()) {
>           error_setg(errp, "The command is permitted only before machine initialization");
>           return;
>       }
> diff --git a/ui/console.c b/ui/console.c
> index 2de5f4105b..3513da6a54 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1353,7 +1353,7 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
>       if (QTAILQ_EMPTY(&consoles)) {
>           s->index = 0;
>           QTAILQ_INSERT_TAIL(&consoles, s, next);
> -    } else if (console_type != GRAPHIC_CONSOLE || phase_check(PHASE_MACHINE_READY)) {
> +    } else if (console_type != GRAPHIC_CONSOLE || machine_is_ready()) {
>           QemuConsole *last = QTAILQ_LAST(&consoles);
>           s->index = last->index + 1;
>           QTAILQ_INSERT_TAIL(&consoles, s, next);
> 


