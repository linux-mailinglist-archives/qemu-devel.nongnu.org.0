Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711CF3B5BDF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 12:00:17 +0200 (CEST)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxo3r-0000ym-La
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 06:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lxnzv-0007AW-56
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 05:56:11 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lxnzq-0003AG-92
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 05:56:10 -0400
Received: from [192.168.2.107] (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 317F620779;
 Mon, 28 Jun 2021 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1624874160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cui9bJDT4oh7I+bs+g3PHluUzcG7kmuzWWq1mNVYIYI=;
 b=4OXaMGHaQeSlXnPw0LglCV9LwOKnMozgy446zVw0N28ani6wUU0S/JrBLJg9e/ozXZFnfH
 fXlVGH+n0zk/4lH55yxpixjZLUExmx/L5bo5mlnzSSYqI/tC5kTN1zEUAUeZaU7d4lHQu6
 rY6sgU9yiIB51aQLCCLDNL4UJsrvPk4=
Subject: Re: [RFC PATCH] docs/specs: QMP configuration design specification
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210601100729.23006-1-mirela.grujic@greensocs.com>
 <a3d3febe-d2ec-6917-01ab-2c31fee1eee2@redhat.com>
From: Mirela Grujic <mirela.grujic@greensocs.com>
Message-ID: <58f0e3c2-a68b-aff4-7cc5-4e7426245323@greensocs.com>
Date: Mon, 28 Jun 2021 11:55:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3d3febe-d2ec-6917-01ab-2c31fee1eee2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.765,
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
Cc: edgar.iglesias@xilinx.com, damien.hedde@greensocs.com,
 peter.maydell@linaro.org, mark.burton@greensocs.com, armbru@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

While implementing a prototype we run into a couple of challenges. We're 
not sure whether our current implementation would be acceptable and 
whether there is a better solution, so we would highly appreciate your 
feedback.

The device_add command, which was originally used for hot-plugging 
devices, initializes and realizes the device in a single step. In 
contrast, existing models in C code heavily rely on disjoint initialize 
and realize steps. Due to this discrepancy, it's challenging to replace 
hard-coded configurations with the QMP equivalent.

For example, we need to create a CPU cluster with two CPUs. In C code, 
this is done as follows:
1) Initialize the CPU cluster
2) Create CPUs as children of the cluster
3) Realize cluster

Note that the cluster cannot be realized empty (without the CPU 
children). We need to establish parent-child relationships between the 
cluster and its CPU children before realizing the cluster. Consequently, 
we cannot simply add the cluster and CPUs using the existing device_add 
command. A similar issue exists if there are bidirectional links between 
the devices.

An approach to solve the problem above is to allow the device_add 
command to skip realizing the device and to use the qom-set command to 
realize the device later. To support this, we would add a 'realized' 
option to the device_add command with the default true value. Setting 
'realized' to false would be only allowed during the machine 
initialization phase, thus the existing behavior of the device_add 
command for hot-plugging devices wouldn't change.

To initialize and realize the device in two steps we would run:

     device_add driver=cpu-cluster id=cluster0 cluster-id=0 realized=false
     qom-set path=cluster0 property=realized value=true

Additionally, to set the parent we would add the 'parent' option to the
device_add command. The cluster and its CPUs would be added as follows:

     device_add driver=cpu-cluster cluster-id=0 id=cluster0 realized=false
     device_add driver=cortex-a72-arm-cpu id=apu-cpu0 parent=cluster0 ...
     device_add driver=cortex-a72-arm-cpu id=apu-cpu1 parent=cluster0 ...
     qom-set path=cluster0 property=realized value=true

The implementation is quite simple. If anyone would like to take a look 
we can submit an RFC or point to a repository.

An alternative to the proposal above would be to create device wrappers 
that would allow creating multiple devices that mutually depend, using a 
single device_add command.

While the first approach is generic, it requires users to have some 
knowledge of QEMU internals (isn't this expected from someone who is 
configuring the machine at this level?). The second approach appears to 
be more user-friendly, but it would require additional device models 
just to enable the use of existing ones with the QMP configuration.

Could you please let us know what do you think? Any other proposals?

Thanks,
Mirela



On 6/3/21 6:02 PM, Paolo Bonzini wrote:
> On 01/06/21 12:07, Mirela Grujic wrote:
>> diff --git a/docs/specs/qmp-configuration.txt 
>> b/docs/specs/qmp-configuration.txt
>> new file mode 100644
>> index 0000000000..69ff49cae6
>> --- /dev/null
>> +++ b/docs/specs/qmp-configuration.txt
>
> docs/specs is not the right place, as it is for guest devices. But 
> this is completely irrelevant to the proposal, which doesn't need to 
> live in docs/ at all.  So forget about it. :)
>
> In general this is a good starting point.  We can either deprecate or 
> stabilize x-machine-init once there is enough code written to have a 
> working qemu-qmp-* binary.  Then we will know whether an 
> accel-created->machine-init transition is needed or can be left implicit.
>
> For now, what you propose is a very nice compromise that allows 
> parallel work on machine/accel configuration on one hand, and device 
> configuration on the other hand.  One other reason why that works well 
> is that we have more or less opposite interests (I care mostly about 
> machine/accel for example) so that's a natural way to split the work.
>
> Thanks!
>
> Paolo
>
>> @@ -0,0 +1,112 @@
>> +
>> +Overview
>> +--------
>> +
>> +The QMP configuration in the context of this design stands for 
>> customizing an
>> +existing machine using the QEMU Monitor Protocol (QMP). The 
>> requirement for such
>> +a configuration comes from the use cases where a complete 
>> system-on-chip can be
>> +customized: from the number of cores, available peripherals, 
>> memories, IRQ
>> +mapping, etc. Our goal is to enable the emulation of customized 
>> platforms
>> +without requiring modifications in QEMU, and thus the QEMU 
>> recompilation.
>> +
>> +We will perform the QMP configuration from a QMP client that will 
>> communicate
>> +with QEMU via a socket. As an example of a QMP client, we will 
>> include a script,
>> +namely the QMP configurator, that will read QMP commands from a 
>> configuration
>> +file and send them to QEMU, one by one. The configuration file will 
>> be a text
>> +file that includes only a list of QMP commands to be executed.
>> +
>> +We will start QEMU with the -preconfig command-line option, thus 
>> QEMU will wait
>> +for the QMP configuration at an early initialization phase, before 
>> the machine
>> +initialization. The following configuration flow will rely on the 
>> machine
>> +initialization phases. In each initialization phase, a set of QMP 
>> commands will
>> +be available for configuring the machine and advancing it to the next
>> +initialization phase. Upon reaching the final initialization phase, 
>> the machine
>> +shall be ready to run. We specify detailed configuration flow in
>> +"QMP configuration flow in QEMU."
>> +
>> +
>> +QMP configurator
>> +----------------
>> +
>> +We decided to include the QMP configurator, a QMP client script that 
>> will
>> +communicate with QEMU, to automate the configuration. The QMP 
>> configurator will
>> +read the QMP commands from the configuration file, send each QMP 
>> command to
>> +QEMU, and quit at the end or exit earlier in the case of an error. 
>> We have not
>> +envisioned the QMP configurator to be interactive. For debugging 
>> purposes, one
>> +could use the QMP shell instead (scripts/qmp/qmp-shell).
>> +
>> +
>> +QMP configuration file
>> +----------------------
>> +
>> +The QMP configuration file will be a text file that includes only a 
>> list of
>> +QMP commands which configure the machine. QMP commands in the 
>> configuration file
>> +shall be in the same format and order as if they were issued using 
>> the QMP
>> +shell. The QMP configurator will convert each command into JSON 
>> format before
>> +sending it to QEMU, similarly as the QMP shell does.
>> +
>> +There are several ways to create a configuration file. One approach 
>> is to
>> +manually create a list of QMP commands which specify how to 
>> configure the
>> +machine. Another convenient method is to generate QMP commands from 
>> existing
>> +descriptions, such as the device tree or a proprietary format. 
>> Either way, the
>> +creation of the configuration file is out of the scope of this work.
>> +
>> +However, along with the QMP configurator, we will include an example 
>> of the
>> +machine and its configuration file to demonstrate the QMP configuration
>> +approach.
>> +
>> +
>> +QMP configuration flow in QEMU
>> +------------------------------
>> +
>> +We will build the QMP configuration flow on top of the machine 
>> initialization
>> +phases, that are:
>> +1) no-machine: machine does not exist yet (current_machine == NULL)
>> +2) machine-created: machine exists, but its accelerator does not
>> +   (current_machine->accelerator == NULL)
>> +3) accel-created: machine's accelerator is configured
>> +   (current_machine->accelerator != NULL), but machine class's 
>> init() has not
>> +   been called (no properties validated, machine_init_done notifiers 
>> not
>> +   registered, no sysbus, etc.)
>> +4) initialized: machine class's init() has been called, thus machine 
>> properties
>> +   are validated, machine_init_done notifiers registered, sysbus 
>> realized, etc.
>> +   Devices added at this phase are considered to be cold-plugged.
>> +5) ready: machine_init_done notifiers are called, then QEMU is ready 
>> to start
>> +   CPUs. Devices added at this phase are considered to be hot-plugged.
>> +
>> +We can stop QEMU today using the -preconfig command-line option at 
>> phase 3
>> +('accel-created'). This option was introduced to enable the QMP 
>> configuration of
>> +parameters that affect the machine initialization. We cannot add 
>> devices at
>> +this point because the machine class's init() has not been called, 
>> thus sysbus
>> +does not exist yet (a device cannot be added because there is no bus 
>> to attach
>> +it to).
>> +
>> +QEMU can be also stopped using the -S command-line option at the 
>> machine 'ready'
>> +phase. However, it is too late to add devices at this phase because 
>> the machine
>> +is already configured, and any devices added at this point are 
>> considered to be
>> +hot-plugged.
>> +
>> +Since the existing -preconfig command-line option stops QEMU too 
>> early, and the
>> +-S option stops too late, we need a way to stop QEMU in between 
>> (after the
>> +machine is initialized and before it becomes ready).
>> +
>> +We will reuse the existing -preconfig command-line option to stop 
>> QEMU at the
>> +'accel-created' phase. Then, we will add a QMP command, namely 
>> 'x-machine-init',
>> +to advance and stop the machine in the next initialization phase
>> +('initialized' phase). We will configure the machine during this 
>> phase using the
>> +existing 'device_add' QMP command. Note that the use of 'device_add' 
>> QMP command
>> +is currently not allowed before the machine is ready. We will enable 
>> the use of
>> +'device_add' during the 'initialized' phase.
>> +
>> +Once we complete the configuration, we will advance the machine to 
>> the 'ready'
>> +phase using the existing 'x-exit-preconfig' command. Upon the 
>> execution of
>> +'x-exit-preconfig' command, the machine will immediately start 
>> running the guest
>> +unless the -S option is provided as the command-line argument.
>> +
>> +We will also implement a QMP command to query the current machine 
>> initialization
>> +phase, namely the 'query-machine-phase' command.
>> +
>> +-------------------------------------------------------------------------------- 
>>
>> +
>> +This work is supported by Xilinx, SiFive, and Greensocs.
>> +
>>
>
>

