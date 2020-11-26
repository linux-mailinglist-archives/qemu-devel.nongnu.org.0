Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F202C5B1E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:54:24 +0100 (CET)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLTL-0002PE-Qn
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiLQs-0000nB-43
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiLQo-0000Xh-Gr
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606413105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmiftN3DhcWT2tK/At9APaqCh9IvSHm/oXX3qzCI8Vo=;
 b=be3Kgf6wvHAQC0V/WQbmmD6WIJV27dBig3uW4SCuk11Mrkdu9R6YNl8eDjwwGs7blry+M9
 E9r2TkyfY89D3x2U6FZoiPubEfMyi+Wz5+9PtMoSjzQp2uRs08WwqS9i4xRyDyCRBpgBw8
 4gfBV0kUjasB692oPow8zZQIAaC7flM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-bB3PNdy5P4KlFjnsUowXnA-1; Thu, 26 Nov 2020 12:51:43 -0500
X-MC-Unique: bB3PNdy5P4KlFjnsUowXnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FBF8101AFA9
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 17:51:42 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 693551002388;
 Thu, 26 Nov 2020 17:51:41 +0000 (UTC)
Date: Thu, 26 Nov 2020 18:51:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 21/36] vl: initialize displays before preconfig loop
Message-ID: <20201126185140.114d218b@redhat.com>
In-Reply-To: <20201123141435.2726558-22-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-22-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

On Mon, 23 Nov 2020 09:14:20 -0500
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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 57 +++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 21 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 6c8a103178..073d7412ad 100644
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
> @@ -3211,12 +3212,12 @@ static void qemu_validate_options(void)
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
> @@ -3380,6 +3381,28 @@ static void qemu_init_subsystems(void)
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
> @@ -3443,8 +3466,6 @@ static void qemu_create_cli_devices(void)
>  
>  static void qemu_machine_creation_done(void)
>  {
> -    DisplayState *ds;
> -
>      cpu_synchronize_all_post_init();
>  
>      /* Did we create any drives that we failed to create a device for? */
> @@ -3467,23 +3488,6 @@ static void qemu_machine_creation_done(void)
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
> @@ -4083,6 +4087,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                  break;
>              case QEMU_OPTION_preconfig:
>                  preconfig_exit_requested = false;
> +                preconfig_requested = true;
>                  break;
>              case QEMU_OPTION_enable_kvm:
>                  olist = qemu_find_opts("machine");
> @@ -4506,11 +4511,21 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_resolve_machine_memdev();
>      parse_numa_opts(current_machine);
>  
> +    if (preconfig_requested) {
> +        qemu_init_displays();
> +    }
> +
>      /* do monitor/qmp handling at preconfig state if requested */
>      qemu_main_loop();
>  
>      qemu_init_board();
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


