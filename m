Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FC2C84B0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:09:47 +0100 (CET)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiw6-0002Oq-Ap
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kjiZM-0001Z1-M4
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kjiZH-0008DK-KZ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606740370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0Y1sBMwXxFnvCnFKpmoGWRuawLBeFMpBoyLJY24EqQ=;
 b=GZJlWBvJCvEwPP1CD1V5NE3qUnpX7j4gbGuecYzYVGu+1Mu0X3MbojNbgMb1wBVlXflIhh
 jXNpDfvcOWsfYdGiN6tL0L/5UgBnx3/5MrrzqjDScCqNUET3ScQKZIp4dqjnMZ9pFI6CcO
 poLmk7qjIPmfoc5WCHRzemEG9Ne2jBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-CQ5_DWK6NimKDrR1dJbJpg-1; Mon, 30 Nov 2020 07:46:08 -0500
X-MC-Unique: CQ5_DWK6NimKDrR1dJbJpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1E8539389
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 12:46:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0597D5C1BB;
 Mon, 30 Nov 2020 12:46:06 +0000 (UTC)
Date: Mon, 30 Nov 2020 13:46:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 27/36] vl: remove separate preconfig main_loop
Message-ID: <20201130134604.15f4b5ef@redhat.com>
In-Reply-To: <20201123141435.2726558-28-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-28-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 09:14:26 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Move post-preconfig initialization to the x-exit-preconfig.  If preconfig
> is not requested, just exit preconfig mode immediately with the QMP
> command.
> 
> As a result, the preconfig loop will run with accel_setup_post
> and os_setup_post restrictions (xen_restrict, chroot, etc.)
> already done.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

with a comment at qmp_x_exit_preconfig():
 Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
[...]
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 95c62bdad4..aa11fc4871 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
[...]
> @@ -3517,6 +3507,43 @@ static void qemu_machine_creation_done(void)
>      register_global_state();
>  }
>  
> +void qmp_x_exit_preconfig(Error **errp)

this needs a comment that it shouldn't be split without taking care of
qmp commands that were allowed to be called before qemu_init_board(),
otherwise there would be nothing to remind us about it.

> +{
> +    if (qdev_hotplug) {
> +        error_setg(errp, "The command is permitted only before machine initialization");
> +        return;
> +    }
> +
> +    qemu_init_board();
> +    qemu_create_cli_devices();
> +    qemu_machine_creation_done();
> +
> +    if (loadvm) {
> +        Error *local_err = NULL;
> +        if (load_snapshot(loadvm, &local_err) < 0) {
> +            error_report_err(local_err);
> +            autostart = 0;
> +            exit(1);
> +        }
> +    }
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        replay_vmstate_init();
> +    }
> +
> +    if (incoming) {
> +        Error *local_err = NULL;
> +        if (strcmp(incoming, "defer") != 0) {
> +            qmp_migrate_incoming(incoming, &local_err);
> +            if (local_err) {
> +                error_reportf_err(local_err, "-incoming %s: ", incoming);
> +                exit(1);
> +            }
> +        }
> +    } else if (autostart) {
> +        qmp_cont(NULL);
> +    }
> +}
> +
>  void qemu_init(int argc, char **argv, char **envp)
>  {
>      QemuOpts *opts;
[...]


