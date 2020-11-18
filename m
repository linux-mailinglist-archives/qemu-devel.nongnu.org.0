Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C22B826B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:59:07 +0100 (CET)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQnS-0006EQ-G0
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfQlq-0005W2-Ez
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfQln-0007TR-2h
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605718641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4STyV+AFocuk5UU9RwF7fvvfle7OOo9wVl8UcQl4aM=;
 b=E75WKCRLOqKW8a4iSJ0S0ReSDxCdVXfwoIVFZJk3kUvMBVZlDib++PKexEsZptnzV1YfYA
 yYUYcYoX4ttu7l1XGyQVcEhCUAiUJZiTwXwZWfceQ5XNSbwrTdcVQFGYiurMurqDkiBnM5
 vdkjl8pkuA1x8BXhw97UimXNNNbSKUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-jOjSqTeANGCYHWf6gNp3VQ-1; Wed, 18 Nov 2020 11:57:20 -0500
X-MC-Unique: jOjSqTeANGCYHWf6gNp3VQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18934107466F
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 16:57:19 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B53D5C1BB;
 Wed, 18 Nov 2020 16:57:17 +0000 (UTC)
Date: Wed, 18 Nov 2020 17:57:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 20/29] vl: separate qemu_apply_machine_options
Message-ID: <20201118175717.78a7ddd5@redhat.com>
In-Reply-To: <20201027182144.3315885-21-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-21-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, 27 Oct 2020 14:21:35 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 66 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 37 insertions(+), 29 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 38ad3cc895..9a3c92387e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2700,6 +2700,41 @@ static bool object_create_early(const char *type, QemuOpts *opts)
>      return true;
>  }
>  
> +static void qemu_apply_machine_options(void)
> +{
> +    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
> +    QemuOpts *machine_opts = qemu_get_machine_opts();
> +    QemuOpts *opts;
> +
> +    qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
> +                     &error_fatal);
> +    current_machine->ram_size = ram_size;
> +    current_machine->maxram_size = maxram_size;
> +    current_machine->ram_slots = ram_slots;
> +
> +    opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
> +    if (opts) {
> +        boot_order = qemu_opt_get(opts, "order");
> +        if (boot_order) {
> +            validate_bootdevices(boot_order, &error_fatal);
> +        }
> +
> +        boot_once = qemu_opt_get(opts, "once");
> +        if (boot_once) {
> +            validate_bootdevices(boot_once, &error_fatal);
> +        }
> +
> +        boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
> +        boot_strict = qemu_opt_get_bool(opts, "strict", false);
> +    }
> +
> +    if (!boot_order) {
> +        boot_order = machine_class->default_boot_order;
> +    }
> +
> +    current_machine->boot_order = boot_order;
> +}
> +
>  static void qemu_create_early_backends(void)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
> @@ -3455,7 +3490,7 @@ static void qemu_machine_creation_done(void)
>  
>  void qemu_init(int argc, char **argv, char **envp)
>  {
> -    QemuOpts *opts, *machine_opts;
> +    QemuOpts *opts;
>      QemuOpts *icount_opts = NULL, *accel_opts = NULL;
>      QemuOptsList *olist;
>      int optind;
> @@ -4397,12 +4432,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_create_default_devices();
>      qemu_create_early_backends();
>  
> -    machine_opts = qemu_get_machine_opts();
> -    qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
> -                     &error_fatal);
> -    current_machine->ram_size = ram_size;
> -    current_machine->maxram_size = maxram_size;
> -    current_machine->ram_slots = ram_slots;
> +    qemu_apply_machine_options();
>  
>      /*
>       * Note: uses machine properties such as kernel-irqchip, must run
> @@ -4438,30 +4468,8 @@ void qemu_init(int argc, char **argv, char **envp)
>       */
>      migration_object_init();
>  
> -    opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
> -    if (opts) {
> -        boot_order = qemu_opt_get(opts, "order");
> -        if (boot_order) {
> -            validate_bootdevices(boot_order, &error_fatal);
> -        }
> -
> -        boot_once = qemu_opt_get(opts, "once");
> -        if (boot_once) {
> -            validate_bootdevices(boot_once, &error_fatal);
> -        }
> -
> -        boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
> -        boot_strict = qemu_opt_get_bool(opts, "strict", false);
> -    }
> -
> -    if (!boot_order) {
> -        boot_order = machine_class->default_boot_order;
> -    }
> -
>      qemu_create_late_backends();
>  
> -    current_machine->boot_order = boot_order;
> -
>      /* parse features once if machine provides default cpu_type */
>      current_machine->cpu_type = machine_class->default_cpu_type;
>      if (cpu_option) {


