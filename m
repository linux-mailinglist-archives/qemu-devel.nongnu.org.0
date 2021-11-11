Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C044DC25
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 20:24:24 +0100 (CET)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlFgN-0005S8-2T
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 14:24:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlFeO-0003nt-BO
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 14:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlFeK-0006GB-7p
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 14:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636658533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxjI3IFKEIxQi2zXRb5y0n/o6XdmhZrmMRzshktFfZU=;
 b=CzEl27TehXUBaVUj1XbB2DsJINwVkzrgAb8n7i0ZsU1tfNoV7lbLcdGqydfjngFMPKw0oE
 GRBE5M4QRDDkIFRjKCeo8v4ahvmZ6rfKNRXv5acRsilyroXMXxOR/euE3wHliLLXgmQZK0
 Po9XwWSgciR22lrifHGWMvk909NlKSc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-z02_7uVeMZeSJJ8szutZSQ-1; Thu, 11 Nov 2021 14:22:12 -0500
X-MC-Unique: z02_7uVeMZeSJJ8szutZSQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so3157471wmj.7
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 11:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fxjI3IFKEIxQi2zXRb5y0n/o6XdmhZrmMRzshktFfZU=;
 b=UfvIonDjvjkJSj/W0F6+X+TTXfL80hc9vaP6WuXiQVf5ypqyg/lLPxsc2AGOb7KJZ1
 NdhcYQHzsrHnZuo8Nwzy+cdG+oZORxTl4GJEJfDrfoCvTIYf+7WeKqRdkzsCZii9CDvE
 lNMcu3Bnk1P6E3r4FzS4mPBu08fFLzB8ry3RebnjpSUSH3PP0sfi1t3cp2sv10QXYr/s
 Ls1etJz0IReBdwhT7DcovX9tJ23hIzMNHhgWaU1Q3oQtDllKN9ioSxNHDNZgLJdcAXWC
 B9XYikBN4WaTI7HoB3261h3Kd2H0BAPUagoODWsYKFJ7dZYgtCN6MIkZs+SkkfigC/ep
 JXgA==
X-Gm-Message-State: AOAM5325EeONsJuwhb48lkYD2i8vK7s2qm+pqJivxS1vydm7oBJ8dBoi
 ljfw5GmAw/aK/5oO3blU7hqazo9lw7SkYTVYTKheY6q8g6ql5oW7eQSHGntxM9nNt37FiaPyQbA
 VSM783C+s2zDZY2A=
X-Received: by 2002:adf:c78d:: with SMTP id l13mr11505468wrg.134.1636658531239; 
 Thu, 11 Nov 2021 11:22:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXsefGYAqnOv+WPp7l1gQDwTnP8MKudjbp1jHiFsqc5XjuYEH9WupHlwVZ+jlnKJ0GGE5E+w==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr11505431wrg.134.1636658530884; 
 Thu, 11 Nov 2021 11:22:10 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id o10sm4992249wri.15.2021.11.11.11.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 11:22:10 -0800 (PST)
Message-ID: <13efddef-cc30-9a6a-a700-060d6fca57e3@redhat.com>
Date: Thu, 11 Nov 2021 20:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
 <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com>
 <87pmr7rzls.fsf@dusky.pond.sub.org>
 <bc437ccb-0487-a5ff-8e6a-50067715c4d4@redhat.com>
 <87mtman4h1.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87mtman4h1.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 15:37, Markus Armbruster wrote:
>> 1) PHASE_NO_MACHINE - backends can already be created here, but no
>> machine exists yet
>>
>> 2) PHASE_MACHINE_CREATED - the machine object has been created.  It's
>> not initialized, but it's there.
>>
>> 3) PHASE_ACCEL_CREATED - the accelerator object has been created.  The
>> accelerator needs the machine object, because for example KVM might
>> not support all machine types.  So the accelerator queries the machine
>> object and fails creation in case of incompatibility.  This enables
>> e.g. fallback to TCG.  -preconfig starts the monitor here.
> 
> We should be able to start monitors first, if we put in the work.

The monitor starts, the question is the availability of the event loop. 
  This requires a command (or a something) to advance to the next phase. 
   x-exit-preconfig is such a command.

In addition, one thing I don't like of preconfig is that command line 
arguments linger until they are triggered by x-exit-preconfig.  Adding 
more such commands makes things worse.

>> 4) PHASE_MACHINE_INIT - machine initialization consists mostly in
>> creating the onboard devices.  For this to happen, the machine needs
>> to learn about the accelerator, because onboard devices include CPUs
>> and other accelerator-dependent devices.  Devices plugged in this
>> phase are cold-plugged.
>>
>> 5) PHASE_MACHINE_READY - machine init done notifiers have been called
>> and the VM is ready.  Devices plugged in this phase already count as
>> hot-plugged.  -S starts the monitor here.
> 
> Remind us: what work is done in the machine init done notifiers?

It depends, but---generally speaking---what they do applies only to 
cold-plugged devices.  For example, fw_cfg gathers the boot order in the 
machine-init-done notifier (via get_boot_devices_list).

> What exactly necessitates "count as hot-plugged"?  Is it something done
> in these notifiers?

It depends on the bus.  It boils down to this code in device_initfn:

     if (phase_check(PHASE_MACHINE_READY)) {
         dev->hotplugged = 1;
         qdev_hot_added = true;
     }

For example, hotplugged PCI devices must define function 0 last; 
coldplugged PCI devices can define functions in any order 
(do_pci_register_device, called by pci_qdev_realize).

Another example, a device_add after machine-done causes an ACPI hotplug 
event, because acpi_pcihp_device_plug_cb checks dev->hotplugged.

>> x-exit-preconfig goes straight from PHASE_ACCEL_CREATED to
>> PHASE_MACHINE_READY.  Devices can only be created after
>> PHASE_MACHINE_INIT, so device_add cannot be enabled at preconfig
>> stage.
> 
> Now I am confused again.  Can you cold plug devices with device_add in
> presence of -preconfig, and if yes, how?

No, because the monitor goes directly from a point where device_add 
fails (PHASE_ACCEL_CREATED) to a point where devices are hotplugged 
(PHASE_MACHINE_READY).

> Related question: when exactly in these phases do we create devices
> specified with -device?

In PHASE_MACHINE_INIT---that is, after the machine has been initialized 
and before machine-done-notifiers have been called.

>> With a pure-QMP configuration flow, PHASE_MACHINE_CREATED would be
>> reached with a machine-set command (corresponding to the
>> non-deprecated parts of -machine) and PHASE_ACCEL_CREATED would be
>> reached with an accel-set command (corresponding to -accel).
> 
> I don't think this depends on "pure-QMP configuration flow".  -machine
> and -accel could advance the phase just like their buddies machine-set
> and accel-set.

They already do (see qemu_init's calls to phase_advance).

> State transition diagram:
> 
>      PHASE_NO_MACHINE (initial state)
>              |
>              |  -machine or machine-set
>              v
>      PHASE_MACHINE_CREATED
>              |
>              |  -accel or accel-set
>              v
>      PHASE_ACCEL_CREATED
>              |
>              |  ???

qmp_x_exit_preconfig() -> qemu_init_board() -> machine_run_board_init()

>              v
>      PHASE_MACHINE_INIT
>              |
>              |  ???

qmp_x_exit_preconfig() -> qemu_machine_creation_done() -> 
qdev_machine_creation_done()

The steps in qmp_x_exit_preconfig() are pretty self-explanatory:

     qemu_init_board();
     qemu_create_cli_devices();
     qemu_machine_creation_done();

qemu_init() calls qmp_x_exit_preconfig() if -preconfig is not passed on 
the command line.

>              v
>      PHASE_MACHINE_READY
>              |
>              |  cont
>              v
>             ???

No phases anymore, it's always PHASE_MACHINE_READY.  cont simply changes 
the runstate to RUNNING.

> The earlier the monitor becomes available, the better.
> Ideally, we'd process the command line strictly left to right, and fail
> options that are "out of phase".  Make the monitor available right when
> we process its -mon.  The -chardev for its character device must precede
> it.

The boat for this has sailed.  The only sane way to do this is a new binary.

> Likewise, we'd fail QMP commands that are "out of phase".
> @allow-preconfig is a crutch that only exists because we're afraid (with
> reason) of hidden assumptions in QMP commands.

At this point, it's not even like that anymore (except for block devices 
because my patches haven't been applied).  allow-preconfig is just a 
quick way to avoid writing

     if (!phase_check(PHASE_MACHINE_READY)) {
         error_setg(errp, "Please configure the machine first");
         return;
     }

over and over in many commands.

Paolo


