Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7964837FCD6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:51:19 +0200 (CEST)
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFUU-0001vt-FW
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFO9-0006Sh-IW
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFO4-0004Xj-4U
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0jPYJ8WskNkeX0DsMStOo0TcUYZN4EvnIndwtNmzSY=;
 b=dd49qCxEbEaYbgcSxQ3KEghwdFLv8fxvvs+4GhlgM6bIX8vCJU7DCIjBEPOnz+B7SqEn+a
 mx2dlpHv3tKhWXR13h/DgDu/aKDXlnwhAdx8r8mFZtGRvZ2URgEgbKcIusQSCxASgp4Iqy
 e57vuDeHeOUOqFwYhWDhBeyn8iRiwvY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-x8THAkLgOa-7jh9oR1CFUw-1; Thu, 13 May 2021 13:44:38 -0400
X-MC-Unique: x8THAkLgOa-7jh9oR1CFUw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y15-20020aa7d50f0000b02903885ee98723so14957205edq.16
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j0jPYJ8WskNkeX0DsMStOo0TcUYZN4EvnIndwtNmzSY=;
 b=ORm6PGqwQd4I0Ec6cyQNOm7Yv40qYuWM2m5myqV6Imf1TaHQDX6WLtmNIcDE0wHoNH
 301/EVxuTkXTZ+ENDhSEsA86fsICdPXq03Kltzvvqu3MhYmSrVlghBaPrr9iB1V+Tj/Q
 uEC+33Q6pBuRwCCo7qDXEd7rFetaivGuMn/jDe9wxZvRSwB0mfZbXyGu3D8zSytovBx/
 YMrtmR7AJ62ifXi0FIYswW1b1ocddFoUkMIUdEUJPhe3U6KwPDj+PdzFJeLut2m9MbVv
 v5kvBAzWCMqiyMzh1aRCWfoj/5r91yfOvhHgpMlACm+aigUz0JhOu4LUji3yz+DWRDOP
 uWNA==
X-Gm-Message-State: AOAM532a4JecV7y4Yxo1V2t+/Boy6I5S1AyNs3lssvupuzLbuMV0NHWQ
 NjfiJedAOlQhYEMhXCNuur7/2QeIOCB71m+PyDzs8zmUNNNA/wI8TARNcy48y4UjeRHfMMqLMCc
 dU31u6htd3ZLfFZo=
X-Received: by 2002:a17:906:dbdc:: with SMTP id
 yc28mr24093522ejb.130.1620927876748; 
 Thu, 13 May 2021 10:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy4oMsBPs8A9hJiLtDr64wr6F9SOKpSZLyCL/ae2pWlTSjY3l63MLmSFg0bOAheKrBFD+zgQ==
X-Received: by 2002:a17:906:dbdc:: with SMTP id
 yc28mr24093505ejb.130.1620927876507; 
 Thu, 13 May 2021 10:44:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z22sm2126809ejo.113.2021.05.13.10.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:44:35 -0700 (PDT)
Subject: Re: [RFC PATCH 4/9] qapi: Implement 'query-machine-phase' command
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-5-mirela.grujic@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6b57511-7cef-5e0f-afbe-81a1d410e524@redhat.com>
Date: Thu, 13 May 2021 19:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513082549.114275-5-mirela.grujic@greensocs.com>
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
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 10:25, Mirela Grujic wrote:
> The command returns current machine initialization phase.
>  From now on, the MachineInitPhase enum is generated.
> 
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> ---
>   qapi/machine.json          | 54 ++++++++++++++++++++++++++++++++++++++
>   include/hw/qdev-core.h     | 29 +-------------------
>   hw/core/machine-qmp-cmds.c |  9 +++++++
>   3 files changed, 64 insertions(+), 28 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6e90d463fc..47bdbec817 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1274,3 +1274,57 @@
>   ##
>   { 'event': 'MEM_UNPLUG_ERROR',
>     'data': { 'device': 'str', 'msg': 'str' } }
> +
> +##
> +# @MachineInitPhase:
> +#
> +# Enumeration of machine initialization phases.
> +#
> +# @no-machine: machine does not exist
> +#
> +# @machine-created: machine is created, but its accelerator is not
> +#
> +# @accel-created: accelerator is created, but the machine properties have not
> +#                 been validated and machine initialization is not done yet
> +#
> +# @initialized: machine is initialized, thus creating any embedded devices and
> +#               validating machine properties. Devices created at this time are
> +#               considered to be cold-plugged.
> +#
> +# @ready: QEMU is ready to start CPUs and devices created at this time are
> +#         considered to be hot-plugged. The monitor is not restricted to
> +#         "preconfig" commands.
> +##
> +{ 'enum': 'MachineInitPhase',
> +  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initialized',
> +            'ready' ] }
> +
> +##
> +# @MachineInitPhaseStatus:
> +#
> +# Information about machine initialization phase
> +#
> +# @phase: the machine initialization phase
> +#
> +# Since:  #FIXME
> +##
> +{ 'struct': 'MachineInitPhaseStatus',
> +  'data': { 'phase': 'MachineInitPhase' } }
> +
> +##
> +# @query-machine-phase:
> +#
> +# Return machine initialization phase
> +#
> +# Since: #FIXME
> +#
> +# Returns: MachineInitPhaseStatus
> +#
> +# Example:
> +#
> +# -> { "execute": "query-machine-phase" }
> +# <- { "return": { "phase": "initialized" } }
> +#
> +##
> +{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
> +             'allow-preconfig': true }
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index dc2f63478b..ca39b77ae6 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -1,6 +1,7 @@
>   #ifndef QDEV_CORE_H
>   #define QDEV_CORE_H
>   
> +#include "qapi/qapi-types-machine.h"
>   #include "qemu/queue.h"
>   #include "qemu/bitmap.h"
>   #include "qemu/rcu.h"
> @@ -811,34 +812,6 @@ void device_listener_unregister(DeviceListener *listener);
>    */
>   bool qdev_should_hide_device(QemuOpts *opts);
>   
> -typedef enum MachineInitPhase {
> -    /* current_machine is NULL.  */
> -    MACHINE_INIT_PHASE_NO_MACHINE,
> -
> -    /* current_machine is not NULL, but current_machine->accel is NULL.  */
> -    MACHINE_INIT_PHASE_MACHINE_CREATED,
> -
> -    /*
> -     * current_machine->accel is not NULL, but the machine properties have
> -     * not been validated and machine_class->init has not yet been called.
> -     */
> -    MACHINE_INIT_PHASE_ACCEL_CREATED,
> -
> -    /*
> -     * machine_class->init has been called, thus creating any embedded
> -     * devices and validating machine properties.  Devices created at
> -     * this time are considered to be cold-plugged.
> -     */
> -    MACHINE_INIT_PHASE_INITIALIZED,
> -
> -    /*
> -     * QEMU is ready to start CPUs and devices created at this time
> -     * are considered to be hot-plugged.  The monitor is not restricted
> -     * to "preconfig" commands.
> -     */
> -    MACHINE_INIT_PHASE_READY,
> -} MachineInitPhase;
> -
>   extern bool phase_check(MachineInitPhase phase);
>   extern void phase_advance(MachineInitPhase phase);
>   extern MachineInitPhase phase_get(void);
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index be286882cc..23f837dadb 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -198,3 +198,12 @@ MemdevList *qmp_query_memdev(Error **errp)
>       object_child_foreach(obj, query_memdev, &list);
>       return list;
>   }
> +
> +MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
> +{
> +    MachineInitPhaseStatus *status = g_malloc0(sizeof(*status));
> +
> +    status->phase = phase_get();
> +
> +    return status;
> +}
> 

This command is a good idea, and we can in fact even include it already 
in QEMU.

Paolo


