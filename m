Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAC3CD13B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:54:26 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Pyj-0003ml-QL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Pxt-0002aJ-HO
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:53:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Pxq-0000VT-5S
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:53:33 -0400
Received: by mail-ed1-x531.google.com with SMTP id h2so23174884edt.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fH+mSR5SlFTgQxpxpL53jSI6somD6FfJOlz5UQDYqLg=;
 b=g9nxtds72qBupBztfvG08TKGdbZs+TdsruqWoe0vsV2jVh/Ao/PKru8YZ2moAxjDNF
 C3oNFMoRvDXlVVKbyrWbPsNEoNnaZMX2W2PLPCK8uf6uZs/dh8+MdBOloTPytLLJPkN5
 mC3rcBe5/ea3dYx3OQKa/gUxDJMCwPkWOmijluVsP6IYvvkctkOPufJa3lX2Rqjtz0cw
 ita0SHTD2D0rfTNja6QLho5zMABr5eRIG0p7iEp7QB36yYMU7E72W3aA8hfPfGsOdBOl
 6ngF/mu59DB+GE/vYd8hSU0JDLXsgMQ7JY9qUZKaC5gPtM/oVPNQpbKxWreKOMNyHRXF
 2nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fH+mSR5SlFTgQxpxpL53jSI6somD6FfJOlz5UQDYqLg=;
 b=VaHCCzcqOd8QaF1aTn9Wm47n7y1LNAS2a2afdqxBhyfZVJdObRgmNsL6T/+C0SEJ/u
 J+AtJx/fZQzlLKzwa79jqgDbeJG66a7nWJVnXmR7KLBPNsge2124omN4f0velkA3fus3
 8kcDsDyymUlnkSVPo0nYLdm3Xwr56PQAIAj9z1RyHAUbCQ4Lw8PZFo5UEltTblWOFn2J
 u/WGoX7yUh/y+OV5LWiZVLYOMOaE5PrJZASoLSIB2hJmf5892+n3gXY8AFUxUuQ5NmgE
 PNKq7am0O1tQB2x0v+X+zIQ1A1Ggh0OoBpxdwqul1QZ9Sm/ZhoFnLndkm/7c5gHNF/RQ
 LPcg==
X-Gm-Message-State: AOAM530DVsolGAMUDQmfehCrBOhuOZcD3fPpWBu20vUvLash6R2dkuKo
 DrTyFVq7nnVRjeFljkBUHLR6PCbX7NA+/Q5xUMTcwg==
X-Google-Smtp-Source: ABdhPJy173stAoiDzCqc+bWF10T+7QaOD2MAgfNppWp0r4r54ZwL+KXPtdRBrcHGDVtmR6E7EYw+9rgrDZL7tcu6BRU=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr33156517edt.100.1626688408343; 
 Mon, 19 Jul 2021 02:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-5-its@irrelevant.dk>
In-Reply-To: <20210714060125.994882-5-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 10:52:47 +0100
Message-ID: <CAFEAcA-nPSSH=New0AE6pqwq=R_e=d0VMsmv65grPZWhOj1zPg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/nvme: fix mmio read
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 07:01, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> The new PMR test unearthed a long-standing issue with MMIO reads on
> big-endian hosts.
>
> Fix this by unconditionally storing all controller registers in little
> endian.
>
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 300 ++++++++++++++++++++++++++++---------------------
>  1 file changed, 173 insertions(+), 127 deletions(-)

> @@ -5708,22 +5712,38 @@ static int nvme_start_ctrl(NvmeCtrl *n)
>
>  static void nvme_cmb_enable_regs(NvmeCtrl *n)
>  {
> -    NVME_CMBLOC_SET_CDPCILS(n->bar.cmbloc, 1);
> -    NVME_CMBLOC_SET_CDPMLS(n->bar.cmbloc, 1);
> -    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
> +    uint32_t cmbloc = 0, cmbsz = 0;
>
> -    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
> -    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
> -    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
> -    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
> +    NVME_CMBLOC_SET_CDPCILS(cmbloc, 1);
> +    NVME_CMBLOC_SET_CDPMLS(cmbloc, 1);
> +    NVME_CMBLOC_SET_BIR(cmbloc, NVME_CMB_BIR);
> +    stl_le_p(&n->bar.cmbloc, cmbloc);
> +
> +    NVME_CMBSZ_SET_SQS(cmbsz, 1);
> +    NVME_CMBSZ_SET_CQS(cmbsz, 0);
> +    NVME_CMBSZ_SET_LISTS(cmbsz, 1);
> +    NVME_CMBSZ_SET_RDS(cmbsz, 1);
> +    NVME_CMBSZ_SET_WDS(cmbsz, 1);
> +    NVME_CMBSZ_SET_SZU(cmbsz, 2); /* MBs */
> +    NVME_CMBSZ_SET_SZ(cmbsz, n->params.cmb_size_mb);
> +    stl_le_p(&n->bar.cmbsz, cmbsz);

This used to only set the listed fields and left the
rest of the registers untouched. Now it zeroes the other
fields in the registers. If this is an intentional change it
should be separate from this patch, I think.

> @@ -5747,9 +5767,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                             " when MSI-X is enabled");
>              /* should be ignored, fall through for now */
>          }
> -        n->bar.intms |= data & 0xffffffff;
> +        intms |= data & 0xffffffff;

intms is a uint32_t so the & here is unnecessary; you can just
say "intms |= data;".

> +        stl_le_p(&n->bar.intms, intms);
>          n->bar.intmc = n->bar.intms;
> -        trace_pci_nvme_mmio_intm_set(data & 0xffffffff, n->bar.intmc);
> +        trace_pci_nvme_mmio_intm_set(data & 0xffffffff, intms);
>          nvme_irq_check(n);
>          break;
>      case NVME_REG_INTMC:
> @@ -5759,44 +5780,55 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                             " when MSI-X is enabled");
>              /* should be ignored, fall through for now */
>          }
> -        n->bar.intms &= ~(data & 0xffffffff);
> +        intms &= ~(data & 0xffffffff);

Similarly here just "intms &= ~data;" is enough.

> +        stl_le_p(&n->bar.intms, intms);
>          n->bar.intmc = n->bar.intms;
> -        trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, n->bar.intmc);
> +        trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, intms);
>          nvme_irq_check(n);
>          break;

> @@ -5818,26 +5850,30 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          }
>          break;
>      case NVME_REG_AQA:
> -        n->bar.aqa = data & 0xffffffff;
> +        stl_le_p(&n->bar.aqa, data & 0xffffffff);

You don't need to mask here, stl_le_p() takes a uint32_t argument and
will only write 4 bytes.

>          trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
>          break;
>      case NVME_REG_ASQ:
> -        n->bar.asq = size == 8 ? data :
> -            (n->bar.asq & ~0xffffffffULL) | (data & 0xffffffff);
> +        asq = size == 8 ? data :
> +            (asq & ~0xffffffffULL) | (data & 0xffffffff);
> +        stq_le_p(&n->bar.asq, asq);

You could save doing the manual assembly of the 64-byte value and just write
the data you have:

           stn_le_p(&n->bar.asq, size, data);

>          trace_pci_nvme_mmio_asqaddr(data);
>          break;
>      case NVME_REG_ASQ + 4:
> -        n->bar.asq = (n->bar.asq & 0xffffffff) | (data << 32);
> -        trace_pci_nvme_mmio_asqaddr_hi(data, n->bar.asq);
> +        asq = (asq & 0xffffffff) | (data << 32);
> +        stq_le_p(&n->bar.asq, asq);
> +        trace_pci_nvme_mmio_asqaddr_hi(data, asq);

Similarly here
           stn_le_p(&n->bar.asq + 4, size, data);
           trace_pci_nvme_mmio_asqaddr_hi(data, ldq_le_p(&n->bar.asq));

(and then you don't need 'asq' as a local variable in this function.)

>          break;
>      case NVME_REG_ACQ:
>          trace_pci_nvme_mmio_acqaddr(data);
> -        n->bar.acq = size == 8 ? data :
> -            (n->bar.acq & ~0xffffffffULL) | (data & 0xffffffff);
> +        acq = size == 8 ? data :
> +            (acq & ~0xffffffffULL) | (data & 0xffffffff);
> +        stq_le_p(&n->bar.acq, acq);
>          break;
>      case NVME_REG_ACQ + 4:
> -        n->bar.acq = (n->bar.acq & 0xffffffff) | (data << 32);
> -        trace_pci_nvme_mmio_acqaddr_hi(data, n->bar.acq);
> +        acq = (acq & 0xffffffff) | (data << 32);
> +        stq_le_p(&n->bar.acq, acq);
> +        trace_pci_nvme_mmio_acqaddr_hi(data, acq);
>          break;

Same remarks as for ASQ apply here for ACQ.

>      case NVME_REG_CMBLOC:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbloc_reserved,
> @@ -5849,12 +5885,13 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                         "invalid write to read only CMBSZ, ignored");
>          return;
>      case NVME_REG_CMBMSC:
> -        if (!NVME_CAP_CMBS(n->bar.cap)) {
> +        if (!NVME_CAP_CMBS(cap)) {
>              return;
>          }
>
> -        n->bar.cmbmsc = size == 8 ? data :
> -            (n->bar.cmbmsc & ~0xffffffff) | (data & 0xffffffff);
> +        cmbmsc = size == 8 ? data :
> +            (cmbmsc & ~0xffffffff) | (data & 0xffffffff);
> +        stq_le_p(&n->bar.cmbmsc, cmbmsc);
>          n->cmb.cmse = false;

and for CMBMSC

>
>          if (NVME_CMBMSC_CRE(data)) {
> @@ -5863,7 +5900,8 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>              if (NVME_CMBMSC_CMSE(data)) {
>                  hwaddr cba = NVME_CMBMSC_CBA(data) << CMBMSC_CBA_SHIFT;
>                  if (cba + int128_get64(n->cmb.mem.size) < cba) {
> -                    NVME_CMBSTS_SET_CBAI(n->bar.cmbsts, 1);
> +                    NVME_CMBSTS_SET_CBAI(cmbsts, 1);
> +                    stl_le_p(&n->bar.cmbsts, cmbsts);
>                      return;
>                  }
>
> @@ -5877,7 +5915,8 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>
>          return;
>      case NVME_REG_CMBMSC + 4:
> -        n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
> +        cmbmsc = (cmbmsc & 0xffffffff) | (data << 32);
> +        stq_le_p(&n->bar.cmbmsc, cmbmsc);

>          return;
>
>      case NVME_REG_PMRCAP:
> @@ -5885,19 +5924,20 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                         "invalid write to PMRCAP register, ignored");
>          return;
>      case NVME_REG_PMRCTL:
> -        if (!NVME_CAP_PMRS(n->bar.cap)) {
> +        if (!NVME_CAP_PMRS(cap)) {
>              return;
>          }
>
> -        n->bar.pmrctl = data;
> +        stl_le_p(&n->bar.pmrctl, data & 0xffffffff);

More unnecessary masking

>          if (NVME_PMRCTL_EN(data)) {
>              memory_region_set_enabled(&n->pmr.dev->mr, true);
> -            n->bar.pmrsts = 0;
> +            pmrsts = 0;
>          } else {
>              memory_region_set_enabled(&n->pmr.dev->mr, false);
> -            NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 1);
> +            NVME_PMRSTS_SET_NRDY(pmrsts, 1);
>              n->pmr.cmse = false;
>          }
> +        stl_le_p(&n->bar.pmrsts, pmrsts);
>          return;
>      case NVME_REG_PMRSTS:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
> @@ -5912,18 +5952,20 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                         "invalid write to PMRSWTP register, ignored");
>          return;
>      case NVME_REG_PMRMSCL:
> -        if (!NVME_CAP_PMRS(n->bar.cap)) {
> +        if (!NVME_CAP_PMRS(cap)) {
>              return;
>          }
>
> -        n->bar.pmrmscl = data & 0xffffffff;
> +        pmrmscl = data & 0xffffffff;

pmrmscl is a uint32_t so the mask is unneeded

> +        stl_le_p(&n->bar.pmrmscl, pmrmscl);
>          n->pmr.cmse = false;
>
> -        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
> -            hwaddr cba = n->bar.pmrmscu |
> -                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
> +        if (NVME_PMRMSCL_CMSE(data)) {
> +            hwaddr cba = pmrmscu |
> +                (NVME_PMRMSCL_CBA(pmrmscl) << PMRMSCL_CBA_SHIFT);
>              if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
> -                NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
> +                NVME_PMRSTS_SET_CBAI(pmrsts, 1);
> +                stl_le_p(&n->bar.pmrsts, pmrsts);
>                  return;
>              }
>
> @@ -5933,11 +5975,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>
>          return;
>      case NVME_REG_PMRMSCU:
> -        if (!NVME_CAP_PMRS(n->bar.cap)) {
> +        if (!NVME_CAP_PMRS(cap)) {
>              return;
>          }
>
> -        n->bar.pmrmscu = data & 0xffffffff;
> +        stl_le_p(&n->bar.pmrmscu, data & 0xffffffff);

Unneeded mask

>          return;
>      default:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,

> @@ -6265,14 +6306,17 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
>
>  static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
>  {
> -    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 1);
> -    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 1);
> -    NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
> -    /* Turn on bit 1 support */
> -    NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
> -    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 1);
> +    uint32_t pmrcap = 0;
>
> -    pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
> +    NVME_PMRCAP_SET_RDS(pmrcap, 1);
> +    NVME_PMRCAP_SET_WDS(pmrcap, 1);
> +    NVME_PMRCAP_SET_BIR(pmrcap, NVME_PMR_BIR);
> +    /* Turn on bit 1 support */
> +    NVME_PMRCAP_SET_PMRWBM(pmrcap, 0x02);
> +    NVME_PMRCAP_SET_CMSS(pmrcap, 1);
> +    stl_le_p(&n->bar.pmrcap, pmrcap);
> +
> +    pci_register_bar(pci_dev, NVME_PMR_BIR,
>                       PCI_BASE_ADDRESS_SPACE_MEMORY |
>                       PCI_BASE_ADDRESS_MEM_TYPE_64 |
>                       PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmr.dev->mr);

Again, this function is changing from "set these fields" to
"set these fields and zero the rest".

> @@ -6362,6 +6406,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>  {
>      NvmeIdCtrl *id = &n->id_ctrl;
>      uint8_t *pci_conf = pci_dev->config;
> +    uint64_t cap = 0;
>
>      id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
>      id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
> @@ -6440,17 +6485,18 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>          id->cmic |= NVME_CMIC_MULTI_CTRL;
>      }
>
> -    NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
> -    NVME_CAP_SET_CQR(n->bar.cap, 1);
> -    NVME_CAP_SET_TO(n->bar.cap, 0xf);
> -    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_NVM);
> -    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_CSI_SUPP);
> -    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
> -    NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
> -    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
> -    NVME_CAP_SET_PMRS(n->bar.cap, n->pmr.dev ? 1 : 0);
> +    NVME_CAP_SET_MQES(cap, 0x7ff);
> +    NVME_CAP_SET_CQR(cap, 1);
> +    NVME_CAP_SET_TO(cap, 0xf);
> +    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_NVM);
> +    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_CSI_SUPP);
> +    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_ADMIN_ONLY);
> +    NVME_CAP_SET_MPSMAX(cap, 4);
> +    NVME_CAP_SET_CMBS(cap, n->params.cmb_size_mb ? 1 : 0);
> +    NVME_CAP_SET_PMRS(cap, n->pmr.dev ? 1 : 0);
> +    stq_le_p(&n->bar.cap, cap);

Same here.

> -    n->bar.vs = NVME_SPEC_VER;
> +    stl_le_p(&n->bar.vs, NVME_SPEC_VER);
>      n->bar.intmc = n->bar.intms = 0;
>  }

thanks
-- PMM

