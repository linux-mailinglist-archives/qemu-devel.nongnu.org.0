Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81467BF53
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 22:56:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnk1-0003QX-IW; Wed, 25 Jan 2023 16:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnjz-0003PA-H4
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:55:35 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnjx-0008Eo-De
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:55:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 776B261617;
 Wed, 25 Jan 2023 21:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DCDC433D2;
 Wed, 25 Jan 2023 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674683724;
 bh=11+YS4X+XuTHVoAhxZs3uahEcdGhI+UChCKBPLj63h4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=m5mxuaEzJVDELptAiXncQR0RH0C2faHVpX5k7miFSwLgvs3biZdfHBlU35eumllYF
 FW6mY55A6RrbaoGbSdPj6E++6hXcdYijji4makH5EfYqNkEIzmkE/GACWbBxErXrXY
 lEDB6sTPE/ocPi4xdxs6kG5yZfkXZNAHC+iccfvyznIIslDHkC3n+fTv9lEFRR5V+c
 Mhf5Su9OaKF2TQzF2rbBQlJQsSAwaftoS6cK4QYe9unsdNuACbEyMzCHS2COTftC26
 lapU0BfWtlrWDzScGz7ZIjgL5mfUpo76bo/trZ2pIbnXrmb59qfLXzYJH3FGqJjXUE
 FtyV5e9cVUXcw==
Date: Wed, 25 Jan 2023 13:55:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 stefano.stabellini@amd.com, alex.bennee@linaro.org, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [QEMU][PATCH v4 04/10] xen-hvm: reorganize xen-hvm and move
 common function to xen-hvm-common
In-Reply-To: <20230125085407.7144-5-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251329520.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-5-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This patch does following:
> 1. creates arch_handle_ioreq() and arch_xen_set_memory(). This is done in
>     preparation for moving most of xen-hvm code to an arch-neutral location,
>     move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
>     Also, move handle_vmport_ioreq to arch_handle_ioreq.
> 
> 2. Pure code movement: move common functions to hw/xen/xen-hvm-common.c
>     Extract common functionalities from hw/i386/xen/xen-hvm.c and move them to
>     hw/xen/xen-hvm-common.c. These common functions are useful for creating
>     an IOREQ server.
> 
>     xen_hvm_init_pc() contains the architecture independent code for creating
>     and mapping a IOREQ server, connecting memory and IO listeners, initializing
>     a xen bus and registering backends. Moved this common xen code to a new
>     function xen_register_ioreq() which can be used by both x86 and ARM machines.
> 
>     Following functions are moved to hw/xen/xen-hvm-common.c:
>         xen_vcpu_eport(), xen_vcpu_ioreq(), xen_ram_alloc(), xen_set_memory(),
>         xen_region_add(), xen_region_del(), xen_io_add(), xen_io_del(),
>         xen_device_realize(), xen_device_unrealize(),
>         cpu_get_ioreq_from_shared_memory(), cpu_get_ioreq(), do_inp(),
>         do_outp(), rw_phys_req_item(), read_phys_req_item(),
>         write_phys_req_item(), cpu_ioreq_pio(), cpu_ioreq_move(),
>         cpu_ioreq_config(), handle_ioreq(), handle_buffered_iopage(),
>         handle_buffered_io(), cpu_handle_ioreq(), xen_main_loop_prepare(),
>         xen_hvm_change_state_handler(), xen_exit_notifier(),
>         xen_map_ioreq_server(), destroy_hvm_domain() and
>         xen_shutdown_fatal_error()
> 
> 3. Removed static type from below functions:
>     1. xen_region_add()
>     2. xen_region_del()
>     3. xen_io_add()
>     4. xen_io_del()
>     5. xen_device_realize()
>     6. xen_device_unrealize()
>     7. xen_hvm_change_state_handler()
>     8. cpu_ioreq_pio()
>     9. xen_exit_notifier()
> 
> 4. Replace TARGET_PAGE_SIZE with XC_PAGE_SIZE to match the page side with Xen.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

One comment below

[...]

> +void xen_exit_notifier(Notifier *n, void *data)
> +{
> +    XenIOState *state = container_of(n, XenIOState, exit);
> +
> +    xen_destroy_ioreq_server(xen_domid, state->ioservid);

In the original code we had:

-    if (state->fres != NULL) {
-        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
-    }

Should we add it here?


I went through the manual process of comparing all the code additions
and deletions (not fun!) and everything checks out except for this.


> +    xenevtchn_close(state->xce_handle);
> +    xs_daemon_close(state->xenstore);
> +}

