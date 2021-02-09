Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC809315262
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:08:39 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ud5-0003x6-2u
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9Ua5-0001ns-4F
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:05:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9Ua2-0002bW-Nc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612883126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lEQ1xC/ZaqFTe1Hbb1J7/VO8wd2af7TchJuweJoFpA=;
 b=RsHh284g4Zaf7tAKuNvwI+vznIgnbiDUVkvVqmkxsEs5J25D6wGZZ14ov8ungdXFMUrqN9
 rtz8ro8veBMYMaNSG98KT8XH3xiM84FVEhMfQEHRzBtn3iRF0NwGUiWUhxhONBOUZm2y/4
 cgQvanV9WMG1A+sTwAQ/JevgFxAet1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-DAmjgHBwPaKk4uP5gxMrNQ-1; Tue, 09 Feb 2021 10:05:22 -0500
X-MC-Unique: DAmjgHBwPaKk4uP5gxMrNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 461EA192D787;
 Tue,  9 Feb 2021 15:05:21 +0000 (UTC)
Received: from localhost (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7FF4177C0;
 Tue,  9 Feb 2021 15:05:16 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:05:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v2 3/9] acpi/core: always set SCI_EN when SMM isn't
 supported
Message-ID: <20210209160514.0e015448@redhat.com>
In-Reply-To: <b21a1b211ad4dc99aaf5f19d803f96dfa88b3fb1.1612821109.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <b21a1b211ad4dc99aaf5f19d803f96dfa88b3fb1.1612821109.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Feb 2021 13:57:22 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> If SMM is not supported, ACPI fixed hardware doesn't support
> legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
> always set.
> The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).

does it break some specific software?

> ACPI spec 4.8.10.1 PM1 Event Grouping
> PM1 Eanble Registers
> > For ACPI-only platforms (where SCI_EN is always set)  
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
it changes guest ABI for old machine types but it seems to me that
it's harmless (in typical use-cases backward and forward migrated
guest should work fine).

The only thing that is broken is transitioning to legacy mode
when guest was started on old QEMU and then migrated to the new one
where disable op will be NOP and qemu always stays in ACPI mode
(so guest will hang while it waits for transition to happen).

Can you test this scenario with various guest OSes (old/new/MS Windows)
to check if it won't break them.

if we are to be conservative, we need to disable this compliance fix
on old machine types.

other than that patch looks good to me.

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
> index 5ff4e01c36..1a34d7f621 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -282,7 +282,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>      acpi_pm_tmr_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
>      acpi_pm1_evt_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
>      acpi_pm1_cnt_init(&pm->acpi_regs, &pm->io, pm->disable_s3, pm->disable_s4,
> -                      pm->s4_val);
> +                      pm->s4_val, !smm_enabled);
>  
>      acpi_gpe_init(&pm->acpi_regs, ICH9_PMIO_GPE0_LEN);
>      memory_region_init_io(&pm->io_gpe, OBJECT(lpc_pci), &ich9_gpe_ops, pm,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 669be5bbf6..0cddf91de5 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -496,7 +496,8 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
>  
>      acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
>      acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
> -    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val);
> +    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val,
> +                      !s->smm_enabled);
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


