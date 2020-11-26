Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656FF2C5A45
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:12:16 +0100 (CET)
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiKoZ-0004FW-GT
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiKn7-0003lv-Uq
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:10:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiKn6-0002VN-87
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606410642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeNPa7c+1xjVWyHS6XXqYmI0UfhnIFQDMQSJsh8ma9A=;
 b=R1d9BONG4w/DyeSwxEVj6jraZoy3EzGnNxGQIexIPVp27ZsGrZ9IR3gwW7THGqnX48GAx1
 RRl5yQjSsXZ/qqpi0lV7Xh5xQ89it6H0R8i6ZnElDtnnjSZzbnADGR6e5lCbEpZFHpVVyd
 ZpBbjH+dJVXqs/tli39IMUIsYxSaO+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Xby-yBl9MpmYtBsQOqeKew-1; Thu, 26 Nov 2020 12:10:40 -0500
X-MC-Unique: Xby-yBl9MpmYtBsQOqeKew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EF8F185E497
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 17:10:39 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91D010016F4;
 Thu, 26 Nov 2020 17:10:38 +0000 (UTC)
Date: Thu, 26 Nov 2020 18:10:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 13/36] vl: move semihosting command line fallback to
 qemu_init_board
Message-ID: <20201126181036.3ff5d605@redhat.com>
In-Reply-To: <20201123141435.2726558-14-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-14-pbonzini@redhat.com>
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

On Mon, 23 Nov 2020 09:14:12 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Move more sane parts of the huge qemu_init function out of it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ab08a0290c..5d68cf828c 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3070,6 +3070,11 @@ static void qemu_init_board(void)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
>  
> +    if (semihosting_enabled() && !semihosting_get_argc() && current_machine->kernel_filename) {
> +        /* fall back to the -kernel/-append */
> +        semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
> +    }

it doesn't seem to depend on anything that warrants calling it this late.

>      if (machine_class->default_ram_id && current_machine->ram_size &&
>          numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
>          create_default_memdev(current_machine, mem_path);
> @@ -4385,13 +4390,6 @@ void qemu_init(int argc, char **argv, char **envp)
>          boot_order = machine_class->default_boot_order;
>      }
>  
> -    if (semihosting_enabled() && !semihosting_get_argc()) {
> -        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
> -        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
> -        /* fall back to the -kernel/-append */
> -        semihosting_arg_fallback(kernel_filename, kernel_cmdline);
> -    }

Can we move this hunk as is to somewhere around qemu_maybe_daemonize() time?


>      if (net_init_clients(&err) < 0) {
>          error_report_err(err);
>          exit(1);


