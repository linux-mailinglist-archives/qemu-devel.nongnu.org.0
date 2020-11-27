Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2195C2C65A0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:16:09 +0100 (CET)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicfY-0006g7-7Z
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiceQ-000629-Od
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiceO-0007gv-Ql
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606479296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbF6XJkak8LiEzmkr9e3ghW2d964vl5rK6TCIiqLpY8=;
 b=fmrpirxmCHsCH7ay1zKKn1VDAmrC6n9OqjB2YFNQneByWBhqX0gtwreVbhqZyRJPvA3Zst
 EssNIMfz2D1/mB9xvjvYzTP1Bsd9DEFMxawU9z6q1vCzGLUbasdZx3oZ+ZL6/nL4IS69dU
 RydKmqel8lKVTUNB2Pc+jCc17OMx+lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-TuHUq_2ZMmqSOYTPG1klbA-1; Fri, 27 Nov 2020 07:14:54 -0500
X-MC-Unique: TuHUq_2ZMmqSOYTPG1klbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B03E1005D5D
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 12:14:53 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 965545D9CC;
 Fri, 27 Nov 2020 12:14:52 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:14:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 30/36] vl: extract machine done notifiers
Message-ID: <20201127131451.48abe653@redhat.com>
In-Reply-To: <20201123141435.2726558-31-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-31-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, 23 Nov 2020 09:14:29 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/machine.c       | 24 ++++++++++++++++++++++++
>  include/sysemu/sysemu.h |  1 +
>  softmmu/vl.c            | 24 ------------------------
>  3 files changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a5cfbcc7cb..745531c9d9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1166,6 +1166,30 @@ void machine_run_board_init(MachineState *machine)
>      machine_class->init(machine);
>  }
>  
> +static NotifierList machine_init_done_notifiers =
> +    NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
> +
> +bool machine_init_done;
> +
> +void qemu_add_machine_init_done_notifier(Notifier *notify)
> +{
> +    notifier_list_add(&machine_init_done_notifiers, notify);
> +    if (machine_init_done) {
> +        notify->notify(notify, NULL);
> +    }
> +}
> +
> +void qemu_remove_machine_init_done_notifier(Notifier *notify)
> +{
> +    notifier_remove(notify);
> +}
> +
> +void qemu_run_machine_init_done_notifiers(void)
> +{
> +    machine_init_done = true;
> +    notifier_list_notify(&machine_init_done_notifiers, NULL);
> +}
> +
>  static const TypeInfo machine_info = {
>      .name = TYPE_MACHINE,
>      .parent = TYPE_OBJECT,
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index c94b2e7159..1b62deaf2b 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -18,6 +18,7 @@ void qemu_remove_exit_notifier(Notifier *notify);
>  
>  extern bool machine_init_done;
>  
> +void qemu_run_machine_init_done_notifiers(void);
>  void qemu_add_machine_init_done_notifier(Notifier *notify);
>  void qemu_remove_machine_init_done_notifier(Notifier *notify);
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 86ace29f98..7e13bb4a59 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -204,9 +204,6 @@ bool qemu_uuid_set;
>  static NotifierList exit_notifiers =
>      NOTIFIER_LIST_INITIALIZER(exit_notifiers);
>  
> -static NotifierList machine_init_done_notifiers =
> -    NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
> -
>  uint32_t xen_domid;
>  enum xen_mode xen_mode = XEN_EMULATE;
>  bool xen_domid_restrict;
> @@ -2432,27 +2429,6 @@ static void qemu_unlink_pidfile(Notifier *n, void *data)
>      }
>  }
>  
> -bool machine_init_done;
> -
> -void qemu_add_machine_init_done_notifier(Notifier *notify)
> -{
> -    notifier_list_add(&machine_init_done_notifiers, notify);
> -    if (machine_init_done) {
> -        notify->notify(notify, NULL);
> -    }
> -}
> -
> -void qemu_remove_machine_init_done_notifier(Notifier *notify)
> -{
> -    notifier_remove(notify);
> -}
> -
> -static void qemu_run_machine_init_done_notifiers(void)
> -{
> -    machine_init_done = true;
> -    notifier_list_notify(&machine_init_done_notifiers, NULL);
> -}
> -
>  static const QEMUOption *lookup_opt(int argc, char **argv,
>                                      const char **poptarg, int *poptind)
>  {


