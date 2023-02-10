Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E3692B25
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:28:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcoF-00058X-BZ; Fri, 10 Feb 2023 18:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQcoD-00058D-GM; Fri, 10 Feb 2023 18:28:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQcoB-0006k4-Cq; Fri, 10 Feb 2023 18:28:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C07C9B82554;
 Fri, 10 Feb 2023 23:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3ACC433EF;
 Fri, 10 Feb 2023 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676071675;
 bh=Y/eWYE1eQNJcUQc3hqpKZ3UVZm2vTYENq36azC8YBZE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=T8GBIEYF0NdmvAivcXXzcuzJTzhOLPHSuCzczQwROQ0rGGfzTACZaqsO5G/7p9thA
 UR+B0eSsuTUQh+ugz2pgNZrAB3aRE4JphK0yQCIMBTCp8KG3uwLFT9oxDTBGxmxSpx
 HmHX3g/VUgBmBqZlayK8Kg+K2byWzM9g2HAr05o1XN85yC/KQMtCaMPBsx5KT1y9ZJ
 cm4poAs3fy3dlLOAnfBXB4eb8bwQATYGBDkMpIA5jOtOK23jRt3NQWvAKvY2OaISxI
 PmawuZZ1s73sE6ThTXLnWNTMpapYHh1chXWpz4+J2LJ/xYaV6fU3g91OY561THBsga
 NsdMFX5BuUcFA==
Date: Fri, 10 Feb 2023 15:27:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Chuck Zmudzinski <brchuckz@aol.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org, 
 qemu-stable@nongnu.org
Subject: Re: [PATCH] xen/pt: fix igd passthrough for pc machine with xen
 accelerator
In-Reply-To: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
Message-ID: <alpine.DEB.2.22.394.2302101527250.4661@ubuntu-linux-20-04-desktop>
References: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz.ref@aol.com>
 <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
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

On Tue, 7 Feb 2023, Chuck Zmudzinski wrote:
> Commit 998250e97661 ("xen, gfx passthrough: register host bridge specific
> to passthrough") uses the igd-passthrough-i440FX pci host device with
> the xenfv machine type and igd-passthru=on, but using it for the pc
> machine type, xen accelerator, and igd-passtru=on was omitted from that
> commit.
> 
> The igd-passthru-i440FX pci host device is also needed for guests
> configured with the pc machine type, the xen accelerator, and
> igd-passthru=on. Specifically, tests show that not using the igd-specific
> pci host device with the Intel igd passed through to the guest results
> in slower startup performance and reduced resolution of the display
> during startup. This patch fixes this issue.
> 
> To simplify the logic that is needed to support both the --enable-xen
> and the --disable-xen configure options, introduce the boolean symbol
> pc_xen_igd_gfx_pt_enabled() whose value is set appropriately in the
> sysemu/xen.h header file as the test to determine whether or not
> to use the igd-passthrough-i440FX pci host device instead of the
> normal i440FX pci host device.
> 
> Fixes: 998250e97661 ("xen, gfx passthrough: register host bridge specific to passthrough")
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

I think this is OK

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> This patch is intended to replace or complement a recently proposed
> patch that modifies slot_reserved_mask for the xenfv machine with
> igd-passthru=on in order to fix the problem of Qemu not reserving slot 2
> for the Intel IGD for the xenfv machine type. This patch provides a
> simple way to improve Qemu support for the Intel IGD with the xen
> accelerator without needing to change how slot_reserved_mask functions.
> 
> For reference, the latest version of the patch to fix the xenfv machine
> using slot_reserved_mask is at:
> 
> https://lore.kernel.org/qemu-devel/b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz@aol.com/
> 
> Reason for introducing the new boolean pc_xen_igd_gfx_pt_enabled():
> 
> It is also possible to use xen_igd_gfx_pt_enabled() directly to check
> if the igd-passthru-i440FX pci host device is needed in this patch,
> but in that case it would be necessary to implement it in
> accel/stubs/xen-stub.c like this:
> 
> bool xen_igd_gfx_pt_enabled(void)
> {
>     return false;
> }
> 
> to cover the case when Qemu is configured with --disable-xen. I thought
> it was simpler to introduce the same boolean prefixed with pc_ and
> set it to 0 when --disable-xen is the configure option, and that explains
> why the proposed patch introduces pc_xen_igd_gfx_pt_enabled() instead of
> using xen_igd_gfx_pt_enabled() directly.
> 
> Another reason to use pc_xen_igd_gfx_pt_enabled() is to distinguish it
> from xen_igd_gfx_pt_enabled() in hw/i386/pc_piix.c, because the use of
> xen_igd_gfx_pt_enabled() is guarded by CONFIG_XEN but this patch needs
> to place the boolean in a position that is not guarded by CONFIG_XEN.
> This approach will simplify any future effort to move the code in
> pc_piix.c that is not guarded by CONFIG_XEN to a xen-specific file.
> 
>  hw/i386/pc_piix.c    | 2 ++
>  include/sysemu/xen.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index df64dd8dcc..fd5b9ae1eb 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -433,6 +433,8 @@ static void pc_xen_hvm_init(MachineState *machine)
>              compat(machine); \
>          } \
>          pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, \
> +                 pc_xen_igd_gfx_pt_enabled() ? \
> +                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : \
>                   TYPE_I440FX_PCI_DEVICE); \
>      } \
>      DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> index 0ca25697e4..99ae41e619 100644
> --- a/include/sysemu/xen.h
> +++ b/include/sysemu/xen.h
> @@ -23,6 +23,7 @@
>  extern bool xen_allowed;
>  
>  #define xen_enabled()           (xen_allowed)
> +#define pc_xen_igd_gfx_pt_enabled()    xen_igd_gfx_pt_enabled()
>  
>  #ifndef CONFIG_USER_ONLY
>  void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
> @@ -33,6 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
>  #else /* !CONFIG_XEN_IS_POSSIBLE */
>  
>  #define xen_enabled() 0
> +#define pc_xen_igd_gfx_pt_enabled() 0
>  #ifndef CONFIG_USER_ONLY
>  static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>  {
> -- 
> 2.39.1
> 

