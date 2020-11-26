Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4252C5A9E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:31:58 +0100 (CET)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiL7d-0000KA-7Z
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiL5a-000899-Tu
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiL5X-0005Ey-Vf
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606411786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFmvACxxkYNZp1EbOVzaLVslCf+VwexV6AmrQg1eR2Y=;
 b=BZ7bDD1TOxNlNizbYhJJl9N/c9uXlT5fcP0RXgEfATiFVD6PABrz3wKbebbFGx1TF/wECE
 kQN1QYqTHXyVq5hJx8HLqzrkD+QKghO6lXLLR2IuMKb4vpIqGZgSdLhRDeVLgrbUr2En5E
 GNc/zQdmPi9JH0c/TDpYFjCruvFjrjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-yp6F0PQHPt2q1dcKA5A6xw-1; Thu, 26 Nov 2020 12:29:44 -0500
X-MC-Unique: yp6F0PQHPt2q1dcKA5A6xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74781100C663
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 17:29:43 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 823EE10013C0;
 Thu, 26 Nov 2020 17:29:42 +0000 (UTC)
Date: Thu, 26 Nov 2020 18:29:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 14/36] vl: extract default devices to separate functions
Message-ID: <20201126182940.664004a9@redhat.com>
In-Reply-To: <20201123141435.2726558-15-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-15-pbonzini@redhat.com>
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

On Mon, 23 Nov 2020 09:14:13 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 216 +++++++++++++++++++++++++++------------------------
>  1 file changed, 114 insertions(+), 102 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 5d68cf828c..b6c62e1e4f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -125,7 +125,9 @@ static const char *boot_order;
>  static const char *boot_once;
>  static const char *incoming;
>  static const char *loadvm;
> +static int display_remote;
>  static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
> +static bool nographic = false;
>  enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
>  static int mem_prealloc; /* force preallocation of physical target memory */
>  int display_opengl;
> @@ -147,6 +149,7 @@ static int rtc_host_datetime_offset = -1; /* valid & used only with
>                                               RTC_BASE_DATETIME */
>  QEMUClockType rtc_clock;
>  int vga_interface_type = VGA_NONE;
> +static const char *vga_model = NULL;
>  static DisplayOptions dpy;
>  static int num_serial_hds;
>  static Chardev **serial_hds;
> @@ -2224,6 +2227,115 @@ static int foreach_device_config(int type, int (*func)(const char *cmdline))
>      return 0;
>  }
>  
> +static void qemu_disable_default_devices(void)
> +{
> +    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
> +
> +    qemu_opts_foreach(qemu_find_opts("device"),
> +                      default_driver_check, NULL, NULL);
> +    qemu_opts_foreach(qemu_find_opts("global"),
> +                      default_driver_check, NULL, NULL);
> +
> +    if (!vga_model && !default_vga) {
> +        vga_interface_type = VGA_DEVICE;
> +    }
> +    if (!has_defaults || machine_class->no_serial) {
> +        default_serial = 0;
> +    }
> +    if (!has_defaults || machine_class->no_parallel) {
> +        default_parallel = 0;
> +    }
> +    if (!has_defaults || machine_class->no_floppy) {
> +        default_floppy = 0;
> +    }
> +    if (!has_defaults || machine_class->no_cdrom) {
> +        default_cdrom = 0;
> +    }
> +    if (!has_defaults || machine_class->no_sdcard) {
> +        default_sdcard = 0;
> +    }
> +    if (!has_defaults) {
> +        default_monitor = 0;
> +        default_net = 0;
> +        default_vga = 0;
> +    }
> +}
> +
> +static void qemu_create_default_devices(void)
> +{
> +    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
> +
> +    if (is_daemonized()) {
> +        /* According to documentation and historically, -nographic redirects
> +         * serial port, parallel port and monitor to stdio, which does not work
> +         * with -daemonize.  We can redirect these to null instead, but since
> +         * -nographic is legacy, let's just error out.
> +         * We disallow -nographic only if all other ports are not redirected
> +         * explicitly, to not break existing legacy setups which uses
> +         * -nographic _and_ redirects all ports explicitly - this is valid
> +         * usage, -nographic is just a no-op in this case.
> +         */
> +        if (nographic
> +            && (default_parallel || default_serial || default_monitor)) {
> +            error_report("-nographic cannot be used with -daemonize");
> +            exit(1);
> +        }
> +    }
> +
> +    if (nographic) {
> +        if (default_parallel)
> +            add_device_config(DEV_PARALLEL, "null");
> +        if (default_serial && default_monitor) {
> +            add_device_config(DEV_SERIAL, "mon:stdio");
> +        } else {
> +            if (default_serial)
> +                add_device_config(DEV_SERIAL, "stdio");
> +            if (default_monitor)
> +                monitor_parse("stdio", "readline", false);
> +        }
> +    } else {
> +        if (default_serial)
> +            add_device_config(DEV_SERIAL, "vc:80Cx24C");
> +        if (default_parallel)
> +            add_device_config(DEV_PARALLEL, "vc:80Cx24C");
> +        if (default_monitor)
> +            monitor_parse("vc:80Cx24C", "readline", false);
> +    }
> +
> +    if (default_net) {
> +        QemuOptsList *net = qemu_find_opts("net");
> +        qemu_opts_parse(net, "nic", true, &error_abort);
> +#ifdef CONFIG_SLIRP
> +        qemu_opts_parse(net, "user", true, &error_abort);
> +#endif
> +    }
> +
> +#if defined(CONFIG_VNC)
> +    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
> +        display_remote++;
> +    }
> +#endif
> +    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
> +        if (!qemu_display_find_default(&dpy)) {
> +            dpy.type = DISPLAY_TYPE_NONE;
> +#if defined(CONFIG_VNC)
> +            vnc_parse("localhost:0,to=99,id=default", &error_abort);
> +#endif
> +        }
> +    }
> +    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
> +        dpy.type = DISPLAY_TYPE_NONE;
> +    }
> +
> +    /* If no default VGA is requested, the default is "none".  */
> +    if (default_vga) {
> +        vga_model = get_default_vga_model(machine_class);
> +    }
> +    if (vga_model) {
> +        select_vgahw(machine_class, vga_model);
> +    }
> +}
> +
>  static int serial_parse(const char *devname)
>  {
>      int index = num_serial_hds;
> @@ -3209,10 +3321,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      int optind;
>      const char *optarg;
>      MachineClass *machine_class;
> -    const char *vga_model = NULL;
>      bool userconfig = true;
> -    bool nographic = false;
> -    int display_remote = 0;
>      ram_addr_t maxram_size;
>      uint64_t ram_slots = 0;
>      FILE *vmstate_dump_file = NULL;
> @@ -4188,97 +4297,8 @@ void qemu_init(int argc, char **argv, char **envp)
>                                 machine_class->default_machine_opts, 0);
>      }
>  
> -    qemu_opts_foreach(qemu_find_opts("device"),
> -                      default_driver_check, NULL, NULL);
> -    qemu_opts_foreach(qemu_find_opts("global"),
> -                      default_driver_check, NULL, NULL);
> -
> -    if (!vga_model && !default_vga) {
> -        vga_interface_type = VGA_DEVICE;
> -    }
> -    if (!has_defaults || machine_class->no_serial) {
> -        default_serial = 0;
> -    }
> -    if (!has_defaults || machine_class->no_parallel) {
> -        default_parallel = 0;
> -    }
> -    if (!has_defaults || machine_class->no_floppy) {
> -        default_floppy = 0;
> -    }
> -    if (!has_defaults || machine_class->no_cdrom) {
> -        default_cdrom = 0;
> -    }
> -    if (!has_defaults || machine_class->no_sdcard) {
> -        default_sdcard = 0;
> -    }
> -    if (!has_defaults) {
> -        default_monitor = 0;
> -        default_net = 0;
> -        default_vga = 0;
> -    }
> -
> -    if (is_daemonized()) {
> -        /* According to documentation and historically, -nographic redirects
> -         * serial port, parallel port and monitor to stdio, which does not work
> -         * with -daemonize.  We can redirect these to null instead, but since
> -         * -nographic is legacy, let's just error out.
> -         * We disallow -nographic only if all other ports are not redirected
> -         * explicitly, to not break existing legacy setups which uses
> -         * -nographic _and_ redirects all ports explicitly - this is valid
> -         * usage, -nographic is just a no-op in this case.
> -         */
> -        if (nographic
> -            && (default_parallel || default_serial || default_monitor)) {
> -            error_report("-nographic cannot be used with -daemonize");
> -            exit(1);
> -        }
> -    }
> -
> -    if (nographic) {
> -        if (default_parallel)
> -            add_device_config(DEV_PARALLEL, "null");
> -        if (default_serial && default_monitor) {
> -            add_device_config(DEV_SERIAL, "mon:stdio");
> -        } else {
> -            if (default_serial)
> -                add_device_config(DEV_SERIAL, "stdio");
> -            if (default_monitor)
> -                monitor_parse("stdio", "readline", false);
> -        }
> -    } else {
> -        if (default_serial)
> -            add_device_config(DEV_SERIAL, "vc:80Cx24C");
> -        if (default_parallel)
> -            add_device_config(DEV_PARALLEL, "vc:80Cx24C");
> -        if (default_monitor)
> -            monitor_parse("vc:80Cx24C", "readline", false);
> -    }
> -
> -    if (default_net) {
> -        QemuOptsList *net = qemu_find_opts("net");
> -        qemu_opts_parse(net, "nic", true, &error_abort);
> -#ifdef CONFIG_SLIRP
> -        qemu_opts_parse(net, "user", true, &error_abort);
> -#endif
> -    }
> -
> -#if defined(CONFIG_VNC)
> -    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
> -        display_remote++;
> -    }
> -#endif
> -    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
> -        if (!qemu_display_find_default(&dpy)) {
> -            dpy.type = DISPLAY_TYPE_NONE;
> -#if defined(CONFIG_VNC)
> -            vnc_parse("localhost:0,to=99,id=default", &error_abort);
> -#endif
> -        }
> -    }
> -    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
> -        dpy.type = DISPLAY_TYPE_NONE;
> -    }
> -
> +    qemu_disable_default_devices();
> +    qemu_create_default_devices();
>      if ((alt_grab || ctrl_grab) && dpy.type != DISPLAY_TYPE_SDL) {
>          error_report("-alt-grab and -ctrl-grab are only valid "
>                       "for SDL, ignoring option");
> @@ -4417,14 +4437,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_semihosting_connect_chardevs();
>      qemu_semihosting_console_init();
>  
> -    /* If no default VGA is requested, the default is "none".  */
> -    if (default_vga) {
> -        vga_model = get_default_vga_model(machine_class);
> -    }
> -    if (vga_model) {
> -        select_vgahw(machine_class, vga_model);
> -    }
> -
>      /* This checkpoint is required by replay to separate prior clock
>         reading from the other reads, because timer polling functions query
>         clock values from the log. */


