Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4D2B81FC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:35:10 +0100 (CET)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQQH-0003PV-Qi
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfQOs-00028d-9o
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:33:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfQOl-00049U-OT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605717213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1A5LLA4xYZit+08Yx1Lq6zcQzXIlE5NCu8f1lzSXrk=;
 b=bWEAKHVX5gDF6REun82ZSu5W0wRU9s6vVCE4Pn1d0Eg/ingcuea9HXWbKDazW8PU09qG8a
 l7FdfGk/lGDu7X5BjrJpD2B0z8t3nmzG3IKhsjLawXFxU3eQaazXL0Id1RJA7HV0onljI9
 6L0btMd3nTJrcADL+ifoEf5awYrHSYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-FUnt6GaqMxi7hF3oWR2Nsg-1; Wed, 18 Nov 2020 11:33:31 -0500
X-MC-Unique: FUnt6GaqMxi7hF3oWR2Nsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B30E1016CE6
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 16:33:30 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A52F10016F4;
 Wed, 18 Nov 2020 16:33:29 +0000 (UTC)
Date: Wed, 18 Nov 2020 17:33:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 18/29] vl: separate qemu_create_late_backends
Message-ID: <20201118173327.57e3195f@redhat.com>
In-Reply-To: <20201027182144.3315885-19-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-19-pbonzini@redhat.com>
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

On Tue, 27 Oct 2020 14:21:33 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> "Late" backends are created after the machine.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 64 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 109036c089..0c390b979e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2755,11 +2755,41 @@ static void qemu_create_early_backends(void)
>   * The remainder of object creation happens after the
>   * creation of chardev, fsdev, net clients and device data types.
>   */
> -static bool object_create_delayed(const char *type, QemuOpts *opts)
> +static bool object_create_late(const char *type, QemuOpts *opts)
>  {
>      return !object_create_early(type, opts);
>  }
>  
> +static void qemu_create_late_backends(void)
> +{
> +    if (qtest_chrdev) {
> +        qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
> +    }
> +
> +    net_init_clients(&error_fatal);
> +
> +    qemu_opts_foreach(qemu_find_opts("object"),
> +                      user_creatable_add_opts_foreach,
> +                      object_create_late, &error_fatal);
> +
> +    if (tpm_init() < 0) {
> +        exit(1);
> +    }
> +
> +    qemu_opts_foreach(qemu_find_opts("mon"),
> +                      mon_init_func, NULL, &error_fatal);
> +
> +    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
> +        exit(1);
> +    if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
> +        exit(1);
> +    if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
> +        exit(1);
> +
> +    /* now chardevs have been created we may have semihosting to connect */
> +    qemu_semihosting_connect_chardevs();
> +    qemu_semihosting_console_init();
> +}
>  
>  static bool set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
>                                 MachineClass *mc)
> @@ -3385,7 +3415,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      ram_addr_t maxram_size;
>      uint64_t ram_slots = 0;
>      FILE *vmstate_dump_file = NULL;
> -    Error *err = NULL;
>      bool have_custom_ram_size;
>  
>      qemu_add_opts(&qemu_drive_opts);
> @@ -4402,10 +4431,6 @@ void qemu_init(int argc, char **argv, char **envp)
>       */
>      migration_object_init();
>  
> -    if (qtest_chrdev) {
> -        qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
> -    }
> -
>      opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
>      if (opts) {
>          boot_order = qemu_opt_get(opts, "order");
> @@ -4426,32 +4451,7 @@ void qemu_init(int argc, char **argv, char **envp)
>          boot_order = machine_class->default_boot_order;
>      }
>  
> -    if (net_init_clients(&err) < 0) {
> -        error_report_err(err);
> -        exit(1);
> -    }
> -
> -    qemu_opts_foreach(qemu_find_opts("object"),
> -                      user_creatable_add_opts_foreach,
> -                      object_create_delayed, &error_fatal);
> -
> -    if (tpm_init() < 0) {
> -        exit(1);
> -    }
> -
> -    qemu_opts_foreach(qemu_find_opts("mon"),
> -                      mon_init_func, NULL, &error_fatal);
> -
> -    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
> -        exit(1);
> -    if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
> -        exit(1);
> -    if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
> -        exit(1);
> -
> -    /* now chardevs have been created we may have semihosting to connect */
> -    qemu_semihosting_connect_chardevs();
> -    qemu_semihosting_console_init();
> +    qemu_create_late_backends();
>  
>      current_machine->boot_order = boot_order;
>  


