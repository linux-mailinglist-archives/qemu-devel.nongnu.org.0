Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA667BF9A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 23:08:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnvR-0008DC-BH; Wed, 25 Jan 2023 17:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnvP-0008D0-De
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:07:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnvN-0002Sa-DV
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:07:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 838B6B81BE0;
 Wed, 25 Jan 2023 22:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2822EC433EF;
 Wed, 25 Jan 2023 22:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674684438;
 bh=+67Nm9MEXf9tqfA8JJgsd8crv/UF0jOLjrPwb+n11Ac=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gX2egELc5SZdxp4rDaGX8Ol0GPtMmRl5zkdC1lek8jGKXzo/WlEzz9dOGDyWBeJ2J
 rvugQsULNsrMQEGoTG6CSA9jeJvlk3tTuWmv/8uwxcsVMSni6aw/lKjv2nKJ+/XuSX
 dleZRbL7JhfPuuac7yck8DtnBFs5vizHGSzcJAFG3bWlwL70YOU2nunxYUdqIajnjt
 D5lKT90yWlBrWrnO+qGTuy02g4NMasnmKlOJNfVz+e8bzPTkfmJe64r8vv1kPalDJ8
 CeW1u8F74Se5eLiZtJAAutrsU/RAiG9GI3JwVYQFaiEeeedTDY3wdzzQ+Kwavkg3bj
 Nv8JVqzFZirfQ==
Date: Wed, 25 Jan 2023 14:07:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 stefano.stabellini@amd.com, alex.bennee@linaro.org, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [QEMU][PATCH v4 07/10] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
In-Reply-To: <20230125085407.7144-8-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251406170.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-8-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=145.40.68.75; envelope-from=sstabellini@kernel.org;
 helo=ams.source.kernel.org
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
> Replace g_malloc with g_new and perror with error_setg_errno.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/xen/xen-hvm-common.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 94dbbe97ed..01c8ec1956 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -34,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>      trace_xen_ram_alloc(ram_addr, size);
>  
>      nr_pfn = size >> TARGET_PAGE_BITS;
> -    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
> +    pfn_list = g_new(xen_pfn_t, nr_pfn);
>  
>      for (i = 0; i < nr_pfn; i++) {
>          pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
> @@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
>              return;
>          }
>          if (errno != ENOTTY /* old Xen */) {
> -            perror("xendevicemodel_shutdown failed");
> +            error_report("xendevicemodel_shutdown failed with error %d", errno);

You can use strerror(errno), here and below.

Either way:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



>          }
>          /* well, try the old thing then */
>      }
> @@ -797,7 +797,7 @@ static void xen_do_ioreq_register(XenIOState *state,
>      }
>  
>      /* Note: cpus is empty at this point in init */
> -    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
> +    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
>  
>      rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
>      if (rc < 0) {
> @@ -806,7 +806,7 @@ static void xen_do_ioreq_register(XenIOState *state,
>          goto err;
>      }
>  
> -    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
> +    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
>  
>      /* FIXME: how about if we overflow the page here? */
>      for (i = 0; i < max_cpus; i++) {
> @@ -860,13 +860,13 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
>  
>      state->xce_handle = xenevtchn_open(NULL, 0);
>      if (state->xce_handle == NULL) {
> -        perror("xen: event channel open");
> +        error_report("xen: event channel open failed with error %d", errno);
>          goto err;
>      }
>  
>      state->xenstore = xs_daemon_open();
>      if (state->xenstore == NULL) {
> -        perror("xen: xenstore open");
> +        error_report("xen: xenstore open failed with error %d", errno);
>          goto err;
>      }
>  
> -- 
> 2.17.0
> 
> 

