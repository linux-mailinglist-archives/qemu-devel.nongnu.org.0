Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B73F31D28F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 23:24:44 +0100 (CET)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC8lu-0007uG-Rw
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 17:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lC8kI-0006WV-3P
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:23:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lC8kG-00028v-33
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613514178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMRQieqJ9NUXuCL7S94QwJvbrIO6Cx9KjRomMknXKw4=;
 b=NbPyMxWKX2dOwZMzchKcWYR8Ae9QpV9XwpWCbyfJ+swochLMpmhinndEGPfnxqi2+X4qkV
 FWMdsODPNF7Di33jExPnbOnyttickGGc7UboHdRgn0qbYJR/elcTrrAqAiDfy6UbaLWmcp
 RoJnMvlYWwIhtRLKuzyUhDJy1gBZG2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-wA1pzHnHP-OWJSGIy025nQ-1; Tue, 16 Feb 2021 17:22:55 -0500
X-MC-Unique: wA1pzHnHP-OWJSGIy025nQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11CF195D561;
 Tue, 16 Feb 2021 22:22:53 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D13719D6C;
 Tue, 16 Feb 2021 22:22:48 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:22:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v4 04/10] acpi/core: always set SCI_EN when SMM isn't
 supported
Message-ID: <20210216232247.0812188d@redhat.com>
In-Reply-To: <d26581b7e58de3bc36998df1f5b854171946ce9a.1613436967.git.isaku.yamahata@intel.com>
References: <cover.1613436967.git.isaku.yamahata@intel.com>
 <d26581b7e58de3bc36998df1f5b854171946ce9a.1613436967.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: isaku.yamahata@intel.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 17:04:09 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> If SMM is not supported, ACPI fixed hardware doesn't support
> legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
> always set.
> The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).
> 
> With the next patch (setting fadt.smi_cmd = 0 when smm isn't enabled),
> guest Linux tries to switch to ACPI mode, finds smi_cmd = 0, and then
> fails to initialize acpi subsystem. This patch proactively fixes it.
> 
> This patch changes guest ABI. To keep compatibility, use
> "x-smm-compat-5" introduced by earlier patch.
> If the property is true, disable new behavior.
> 
> ACPI spec 4.8.10.1 PM1 Event Grouping
> PM1 Eanble Registers
> > For ACPI-only platforms (where SCI_EN is always set)  
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/core.c         | 11 ++++++++++-
>  hw/acpi/ich9.c         |  2 +-
>  hw/acpi/piix4.c        |  3 ++-
>  hw/isa/vt82c686.c      |  2 +-
>  include/hw/acpi/acpi.h |  4 +++-
>  5 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 7170bff657..1e004d0078 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -579,6 +579,10 @@ void acpi_pm1_cnt_update(ACPIREGS *ar,
>                           bool sci_enable, bool sci_disable)
>  {
>      /* ACPI specs 3.0, 4.7.2.5 */
> +    if (ar->pm1.cnt.acpi_only) {
> +        return;
> +    }
> +
>      if (sci_enable) {
>          ar->pm1.cnt.cnt |= ACPI_BITMASK_SCI_ENABLE;
>      } else if (sci_disable) {
> @@ -608,11 +612,13 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
>  };
>  
>  void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
> -                       bool disable_s3, bool disable_s4, uint8_t s4_val)
> +                       bool disable_s3, bool disable_s4, uint8_t s4_val,
> +                       bool acpi_only)
>  {
>      FWCfgState *fw_cfg;
>  
>      ar->pm1.cnt.s4_val = s4_val;
> +    ar->pm1.cnt.acpi_only = acpi_only;
>      ar->wakeup.notify = acpi_notify_wakeup;
>      qemu_register_wakeup_notifier(&ar->wakeup);
>  
> @@ -638,6 +644,9 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
>  void acpi_pm1_cnt_reset(ACPIREGS *ar)
>  {
>      ar->pm1.cnt.cnt = 0;
> +    if (ar->pm1.cnt.acpi_only) {
> +        ar->pm1.cnt.cnt |= ACPI_BITMASK_SCI_ENABLE;
> +    }
>  }
>  
>  /* ACPI GPE */
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 5ff4e01c36..853447cf9d 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -282,7 +282,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>      acpi_pm_tmr_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
>      acpi_pm1_evt_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
>      acpi_pm1_cnt_init(&pm->acpi_regs, &pm->io, pm->disable_s3, pm->disable_s4,
> -                      pm->s4_val);
> +                      pm->s4_val, !pm->smm_compat && !smm_enabled);
>  
>      acpi_gpe_init(&pm->acpi_regs, ICH9_PMIO_GPE0_LEN);
>      memory_region_init_io(&pm->io_gpe, OBJECT(lpc_pci), &ich9_gpe_ops, pm,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 30dd9b2309..1efc0ded9f 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -497,7 +497,8 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
>  
>      acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
>      acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
> -    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val);
> +    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val,
> +                      !s->smm_compat && !s->smm_enabled);
>      acpi_gpe_init(&s->ar, GPE_LEN);
>  
>      s->powerdown_notifier.notify = piix4_pm_powerdown_req;
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index a6f5a0843d..071b64b497 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -240,7 +240,7 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>  
>      acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
>      acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
> -    acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
> +    acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
>  }
>  
>  static Property via_pm_properties[] = {
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index 22b0b65bb2..9e8a76f2e2 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -128,6 +128,7 @@ struct ACPIPM1CNT {
>      MemoryRegion io;
>      uint16_t cnt;
>      uint8_t s4_val;
> +    bool acpi_only;
>  };
>  
>  struct ACPIGPE {
> @@ -163,7 +164,8 @@ void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
>  
>  /* PM1a_CNT: piix and ich9 don't implement PM1b CNT. */
>  void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
> -                       bool disable_s3, bool disable_s4, uint8_t s4_val);
> +                       bool disable_s3, bool disable_s4, uint8_t s4_val,
> +                       bool acpi_only);
>  void acpi_pm1_cnt_update(ACPIREGS *ar,
>                           bool sci_enable, bool sci_disable);
>  void acpi_pm1_cnt_reset(ACPIREGS *ar);


