Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D74DDB53
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:12:26 +0100 (CET)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDL6-0001ig-Ti
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:12:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nVCfJ-0000YA-Ea
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:29:14 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nVCfG-00036w-Rv
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:29:13 -0400
Received: from [192.168.1.13] (lfbn-lyo-1-488-129.w2-7.abo.wanadoo.fr
 [2.7.77.129])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 6116F21A87;
 Fri, 18 Mar 2022 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1647610146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BF4s7Dnp+C96WHzpAvbeVlUC6ASjkYxrbyAdXkd8/s=;
 b=i7iQ7yi63zxykLipP+T96KrVnVGvbAmGOLVlMmDWFgBQA/dnhc+7rp4nGfmAhhrXVVE8vp
 gEc7h52c3arbwndp9GkcAyW3R8CWlfPXAetXLeYH40XkrT01tG7csXq50eS4gc9z1tAoy1
 YSsqI18kUd3O1rIckeWrsiolopLpfZ4=
Message-ID: <238f5d37-a340-329a-9944-ce4b023d64f5@greensocs.com>
Date: Fri, 18 Mar 2022 14:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 02/14] machine&vl: introduce phase_until() to handle
 phase transitions
Content-Language: en-US-large
To: qemu-devel@nongnu.org, mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-3-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220223090706.4888-3-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi !

It would nice to have some feedback about this solution.
Basically it just introduces a new function 'qemu_until' which implement
the startup fsm.
It's bit like what Markus proposed in december (hence the name), only it 
is is only internal so we can change it if we find out it should be done 
otherwise regarding startup.

In practice it is just some code move from qmp_exit_preconfig() to 
phase_until() with more indentation (not sure if there is a way to make 
that easier to read).

In the following patches I use it in device_add() to ensure the startup 
is advanced.

Thanks,
--
Damien

On 2/23/22 10:06, Damien Hedde wrote:
> phase_until() is implemented in vl.c and is meant to be used
> to make startup progress up to a specified phase being reached().
> At this point, no behavior change is introduced: phase_until()
> only supports a single double transition corresponding
> to the functionality of qmp_exit_preconfig():
> + accel-created -> machine-initialized -> machine-ready
> 
> As a result qmp_exit_preconfig() now uses phase_until().
> 
> This commit is a preparation to support cold plugging a device
> using qapi command (which will be introduced in a following commit).
> For this we need fine grain control of the phase.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/qdev-core.h | 14 ++++++++
>   softmmu/vl.c           | 78 ++++++++++++++++++++++++++++++++----------
>   2 files changed, 74 insertions(+), 18 deletions(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index e29c705b74..5f73d06408 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -909,4 +909,18 @@ extern bool phase_check(MachineInitPhase phase);
>    */
>   extern void phase_advance(MachineInitPhase phase);
>   
> +/**
> + * @phase_until:
> + * @phase: the target phase
> + * @errp: error report
> + *
> + * Make the machine init progress until the target phase is reached.
> + *
> + * Its is a no-op is the target phase is the current or an earlier
> + * phase.
> + *
> + * Returns true in case of success.
> + */
> +extern bool phase_until(MachineInitPhase phase, Error **errp);
> +
>   #endif
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 5e1b35ba48..5689d0be88 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2741,30 +2741,72 @@ void qmp_x_exit_preconfig(Error **errp)
>           error_setg(errp, "The command is permitted only before machine initialization");
>           return;
>       }
> +    phase_until(PHASE_MACHINE_READY, errp);
> +}
>   
> -    qemu_init_board();
> -    qemu_create_cli_devices();
> -    qemu_machine_creation_done();
> -
> -    if (loadvm) {
> -        load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
> -    }
> -    if (replay_mode != REPLAY_MODE_NONE) {
> -        replay_vmstate_init();
> +bool phase_until(MachineInitPhase phase, Error **errp)
> +{
> +    if (!phase_check(PHASE_ACCEL_CREATED)) {
> +        error_setg(errp, "Phase transition is not supported until accelerator"
> +                   " is created");
> +        return false;
>       }
>   
> -    if (incoming) {
> -        Error *local_err = NULL;
> -        if (strcmp(incoming, "defer") != 0) {
> -            qmp_migrate_incoming(incoming, &local_err);
> -            if (local_err) {
> -                error_reportf_err(local_err, "-incoming %s: ", incoming);
> -                exit(1);
> +    while (!phase_check(phase)) {
> +        MachineInitPhase cur_phase = phase_get();
> +
> +        switch (cur_phase) {
> +        case PHASE_ACCEL_CREATED:
> +            qemu_init_board();
> +            /* We are now in PHASE_MACHINE_INITIALIZED. */
> +            qemu_create_cli_devices();
> +            /*
> +             * At this point all CLI options are handled apart:
> +             * + -S (autostart)
> +             * + -incoming
> +             */
> +            qemu_machine_creation_done();
> +            /* We are now in PHASE_MACHINE_READY. */
> +
> +            if (loadvm) {
> +                load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
>               }
> +            if (replay_mode != REPLAY_MODE_NONE) {
> +                replay_vmstate_init();
> +            }
> +
> +            if (incoming) {
> +                Error *local_err = NULL;
> +                if (strcmp(incoming, "defer") != 0) {
> +                    qmp_migrate_incoming(incoming, &local_err);
> +                    if (local_err) {
> +                        error_reportf_err(local_err, "-incoming %s: ",
> +                                          incoming);
> +                        exit(1);
> +                    }
> +                }
> +            } else if (autostart) {
> +                qmp_cont(NULL);
> +            }
> +            break;
> +
> +        default:
> +            /*
> +             * If we end up here, it is because we miss a case above.
> +             */
> +            error_setg(&error_abort, "Requested phase transition is not"
> +                       " implemented");
> +            return false;
>           }
> -    } else if (autostart) {
> -        qmp_cont(NULL);
> +
> +        /*
> +         * Ensure we made some progress.
> +         * With the default case above, it should be enough to prevent
> +         * any infinite loop.
> +         */
> +        assert(cur_phase < phase_get());
>       }
> +    return true;
>   }
>   
>   void qemu_init(int argc, char **argv, char **envp)

