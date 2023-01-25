Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE867BF83
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 23:02:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnq4-0006SF-4m; Wed, 25 Jan 2023 17:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnpx-0006S0-JY
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:01:45 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnpv-0001Um-2R
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:01:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3546E616C2;
 Wed, 25 Jan 2023 22:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BA5C433D2;
 Wed, 25 Jan 2023 22:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674684100;
 bh=Z8Z+kV8zvQPaDPI2dAWyQXmqy22O8fHjplm46zAzBBY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OYQzzHlz6UEq1bihNNY79A4KseLIpdDOw/8yuhwDfoTgoIXbNoc3QyW7p2oBAb1+M
 qRudygQYHXR53MBv6o1G3v+dvCtawgUbMWEnpdmbxPMrb1zw4ZupEF/ccb/tVFxsEw
 4NHjdO9XomyyAI2mvFE5B0vBB+M5+p2vVgDAebSG6QZlSbv3dvvNDLE53BkxlopI+0
 5fJpAn5wHvkHRPAnoX3Y1baotdFFzGL8rpmtAcwLn1TJZ+eX0Xh1Md+RbDyDMUiIMh
 oBrh+OlWxWJzlciHoZkcpV4qWGl2K6Q5/SpnuooGPhp6Bjxg1Byax5dYcHY+USt+Xo
 em3rWPl+NqwIg==
Date: Wed, 25 Jan 2023 14:01:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 stefano.stabellini@amd.com, alex.bennee@linaro.org, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [QEMU][PATCH v4 06/10] hw/xen/xen-hvm-common: skip ioreq creation
 on ioreq registration failure
In-Reply-To: <20230125085407.7144-7-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251400500.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-7-vikram.garhwal@amd.com>
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
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails continue
> to the PV backends initialization.
> 
> Also, moved the IOREQ registration and mapping subroutine to new function
> xen_do_ioreq_register().
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

as per my previous reply, even though I am listed as co-author, for
tracking that I did review this version of the patch:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index e748d8d423..94dbbe97ed 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -777,25 +777,12 @@ err:
>      exit(1);
>  }
>  
> -void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> -                        MemoryListener xen_memory_listener)
> +static void xen_do_ioreq_register(XenIOState *state,
> +                                           unsigned int max_cpus,
> +                                           MemoryListener xen_memory_listener)
>  {
>      int i, rc;
>  
> -    state->xce_handle = xenevtchn_open(NULL, 0);
> -    if (state->xce_handle == NULL) {
> -        perror("xen: event channel open");
> -        goto err;
> -    }
> -
> -    state->xenstore = xs_daemon_open();
> -    if (state->xenstore == NULL) {
> -        perror("xen: xenstore open");
> -        goto err;
> -    }
> -
> -    xen_create_ioreq_server(xen_domid, &state->ioservid);
> -
>      state->exit.notify = xen_exit_notifier;
>      qemu_add_exit_notifier(&state->exit);
>  
> @@ -859,12 +846,44 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
>      QLIST_INIT(&state->dev_list);
>      device_listener_register(&state->device_listener);
>  
> +    return;
> +
> +err:
> +    error_report("xen hardware virtual machine initialisation failed");
> +    exit(1);
> +}
> +
> +void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> +                        MemoryListener xen_memory_listener)
> +{
> +    int rc;
> +
> +    state->xce_handle = xenevtchn_open(NULL, 0);
> +    if (state->xce_handle == NULL) {
> +        perror("xen: event channel open");
> +        goto err;
> +    }
> +
> +    state->xenstore = xs_daemon_open();
> +    if (state->xenstore == NULL) {
> +        perror("xen: xenstore open");
> +        goto err;
> +    }
> +
> +    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
> +    if (!rc) {
> +        xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
> +    } else {
> +        warn_report("xen: failed to create ioreq server");
> +    }
> +
>      xen_bus_init();
>  
>      xen_register_backend(state);
>  
>      return;
> +
>  err:
> -    error_report("xen hardware virtual machine initialisation failed");
> +    error_report("xen hardware virtual machine backend registration failed");
>      exit(1);
>  }
> -- 
> 2.17.0
> 
> 

