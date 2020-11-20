Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEFE2BAD33
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:14:18 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg877-0000NW-MI
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg84q-0007cg-NY
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:11:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg84p-0006gh-1t
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605885114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQTxG+j6S7QryEhs+I/iu3qDGY09FWkH1ozN1wCMetw=;
 b=Y+0gu4pbTHB2oKQ8+WaKi7UrVbf5Kb0wCDPppawOSYtDNBf1Ze7UHjDXfyreYDyixM+FA6
 EP1UAKeS/39HNtUGOcr0LWYBfiFZgDBR425gy9CgUlWjjWQ0INa4df2lrojC2FqUslIJdT
 xKFrq1JA9KHLtqflKGbXdS9dqAO9O50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-xMvam3nVODWfgwr94IFD9w-1; Fri, 20 Nov 2020 10:11:52 -0500
X-MC-Unique: xMvam3nVODWfgwr94IFD9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81A1E1842178
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 15:11:51 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB285C1D5;
 Fri, 20 Nov 2020 15:11:50 +0000 (UTC)
Date: Fri, 20 Nov 2020 16:11:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 22/29] vl: initialize displays before preconfig loop
Message-ID: <20201120161148.0dc2bdcf@redhat.com>
In-Reply-To: <20201027182144.3315885-23-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-23-pbonzini@redhat.com>
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

On Tue, 27 Oct 2020 14:21:37 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Displays should be available before the monitor starts, so that
> it is possible to use the graphical console to interact with
> the monitor itself.
> 
> This patch is quite ugly, but all this is temporary.  The double
> call to qemu_init_displays will go away as soon we can unify machine
> initialization between the preconfig and "normal" flows, and so will
> the preconfig_exit_requested variable (that is only preconfig_requested
> remains).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Doesn't apply to yer for-6.0 branch

> ---
>  softmmu/vl.c | 58 ++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1485aba8be..a46f1b9164 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -137,6 +137,7 @@ static ram_addr_t maxram_size;
>  static uint64_t ram_slots;
>  static int display_remote;
>  static int snapshot;
> +static bool preconfig_requested;
>  static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
>  static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
>  static bool nographic = false;
> @@ -3210,12 +3211,12 @@ static void qemu_validate_options(void)
>            }
>      }
>  
> -    if (loadvm && !preconfig_exit_requested) {
> +    if (loadvm && preconfig_requested) {
>          error_report("'preconfig' and 'loadvm' options are "
>                       "mutually exclusive");
>          exit(EXIT_FAILURE);
>      }
> -    if (incoming && !preconfig_exit_requested) {
> +    if (incoming && preconfig_requested) {
>          error_report("'preconfig' and 'incoming' options are "
>                       "mutually exclusive");
>          exit(EXIT_FAILURE);
> @@ -3381,6 +3382,28 @@ static void qemu_init_subsystems(void)
>      socket_init();
>  }
>  
> +static void qemu_init_displays(void)
> +{
> +    DisplayState *ds;
> +
> +    /* init local displays */
> +    ds = init_displaystate();
> +    qemu_display_init(ds, &dpy);
> +
> +    /* must be after terminal init, SDL library changes signal handlers */
> +    os_setup_signal_handling();
> +
> +    /* init remote displays */
> +#ifdef CONFIG_VNC
> +    qemu_opts_foreach(qemu_find_opts("vnc"),
> +                      vnc_init_func, NULL, &error_fatal);
> +#endif
> +
> +    if (using_spice) {
> +        qemu_spice.display_init();
> +    }
> +}
> +
>  /*
>   * Called after leaving preconfig state.  From here on runstate is
>   * RUN_STATE_PRELAUNCH or RUN_STATE_INMIGRATE.
> @@ -3449,8 +3472,6 @@ static void qemu_create_cli_devices(void)
>  
>  static void qemu_machine_creation_done(void)
>  {
> -    DisplayState *ds;
> -
>      cpu_synchronize_all_post_init();
>  
>      /* Did we create any drives that we failed to create a device for? */
> @@ -3473,23 +3494,6 @@ static void qemu_machine_creation_done(void)
>          qemu_register_reset(restore_boot_order, g_strdup(boot_order));
>      }
>  
> -    /* init local displays */
> -    ds = init_displaystate();
> -    qemu_display_init(ds, &dpy);
> -
> -    /* must be after terminal init, SDL library changes signal handlers */
> -    os_setup_signal_handling();
> -
> -    /* init remote displays */
> -#ifdef CONFIG_VNC
> -    qemu_opts_foreach(qemu_find_opts("vnc"),
> -                      vnc_init_func, NULL, &error_fatal);
> -#endif
> -
> -    if (using_spice) {
> -        qemu_spice.display_init();
> -    }
> -
>      if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
>          exit(1);
>      }
> @@ -4094,6 +4098,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                  break;
>              case QEMU_OPTION_preconfig:
>                  preconfig_exit_requested = false;
> +                preconfig_requested = true;
>                  break;
>              case QEMU_OPTION_enable_kvm:
>                  olist = qemu_find_opts("machine");
> @@ -4515,11 +4520,20 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_resolve_machine_memdev();
>      parse_numa_opts(current_machine);
>  
> +    if (preconfig_requested) {
> +        qemu_init_displays();
> +    }
> +
>      /* do monitor/qmp handling at preconfig state if requested */
>      qemu_main_loop();
> -
>      qemu_finish_machine_init();
> +
>      qemu_create_cli_devices();
> +
> +    /* initialize displays after all errors have been reported */
> +    if (!preconfig_requested) {
> +        qemu_init_displays();
> +    }
>      qemu_machine_creation_done();
>  
>      if (loadvm) {


