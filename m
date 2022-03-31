Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF814ED96E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:13:37 +0200 (CEST)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtgG-0003hv-Ab
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:13:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtcZ-0002Qb-Kn
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtcV-0002vA-W8
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648728583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJnHXcm73B4ulbl3G+ONw2HxgnRYRaFK43riYylMqCw=;
 b=fpzPoKM10HxEsLCzmX4qo3/I0eOG2sY7Wrw8AprGgDS1t652ZIM7Oybwfi0quj5rNO1gvP
 NvRnr2eZueGEcPxwE5xMAvfWXct1XV1/JCP5P6/G6raDHTkx2G6fVCeLgoeeglv2l43lOl
 ZqSyfu/8vY5PkSAmCzfpVtBwYC2cvtM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-tlolmtVEPBq6f7RQdCA7YA-1; Thu, 31 Mar 2022 08:09:41 -0400
X-MC-Unique: tlolmtVEPBq6f7RQdCA7YA-1
Received: by mail-ed1-f71.google.com with SMTP id
 c31-20020a509fa2000000b004190d43d28fso14692021edf.9
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 05:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJnHXcm73B4ulbl3G+ONw2HxgnRYRaFK43riYylMqCw=;
 b=anQnRXkejumtAIwKekDVWcDPUF79sLX1U3Sp4MtntmGgTiiVfz4ttnUBfXUU2BycK3
 T8fiGyJrFMQrffwdR92LpnfvV5/uQPNl75cXW2G7/voL1tOHGCt/0lXhfpj1NRnTJ+iz
 lxEPFdBXRg20thih1V1MQFI+j/f4LGx6RK5Zt9/+byCA8poCFTRzGMZilNh4OG1m6wL8
 7UpJXLUfFNR0fybgVRi1GXc/XW/rMs6kVtaKtibi7U6/sbqSVy7Hh2TZk6dX8nkgh8nR
 QBvgAkhB1pCEMBTn1CmYG/zrvOAvO/Oa1F7Fp0VLk/++Tra9mn2smPL6jf2djoeVtjDX
 jspw==
X-Gm-Message-State: AOAM530r7kb9NvY/6VgEHyx1akTr0WdHpXNte6D7oaOorZZJA32oeTiF
 nzvXVatlQIzBeeX4xk6mX9Otd/jGf5wmznEtBcy7NHK1jrLQe3MV1VTLF+r1Slbpgi7mZ7RWc7T
 vjA5Eibo5P1vMR0E=
X-Received: by 2002:a05:6402:26c7:b0:41b:7aef:bdf6 with SMTP id
 x7-20020a05640226c700b0041b7aefbdf6mr3197343edd.210.1648728580271; 
 Thu, 31 Mar 2022 05:09:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9Ep0BWKTLNKvH0yHNIkoBqSgijZ7gBnyczyBhobhAHqs3Y3l14/BThaIO7tuo82Hh6mFIQQ==
X-Received: by 2002:a05:6402:26c7:b0:41b:7aef:bdf6 with SMTP id
 x7-20020a05640226c700b0041b7aefbdf6mr3197325edd.210.1648728579935; 
 Thu, 31 Mar 2022 05:09:39 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a170906b11900b006e08588afedsm8724834ejy.132.2022.03.31.05.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 05:09:39 -0700 (PDT)
Date: Thu, 31 Mar 2022 14:09:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 2/2] NVDIMM: Init vNVDIMM's LSA index block if it hasn't
 been
Message-ID: <20220331140938.6297e2b1@redhat.com>
In-Reply-To: <1648537663-126032-3-git-send-email-robert.hu@linux.intel.com>
References: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
 <1648537663-126032-3-git-send-email-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 15:07:43 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Since v2.7, QEMU has supported the emulation of NVDIMM's labels.
> With -device nvdimm,...,lsa-size=, the vNVDIMM to guest has this
> capability. But if the emulated LSA area isn't initialized, guest Kernel
> can't enumerate it correctly.
> 
> This patch is to initialize/format the vNVDIMM's LSA, if it has been
> designated the Label capability. The index block format will be v1.1
> initially, in order to obtain maximum compatibility. VM user can later
> `ndctl init-label` to make it v1.2 if necessary. [1]

Can user initialize/format LSA from guest using ndctl/some other tool?


> [1] https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf,
> Initial Label Storage Area Configuration:
> "for Label Storage Areas of 128KB and 256KB, the corresponding Index
> Block size is 256 or 512 bytes."

Quick search in above spec says such text doesn't exists.

above needs grep-able reference + chapter "x.x name" so one could easily
find it. 


> In driver and ndctl code, they refer to these 2 cases as v1.1 and v1.2.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Liu, Jingqi <jingqi.liu@intel.com>
> ---
> Note: most functions in this patch are ported from ndctl and nvdimm driver
> code.
> ---
>  hw/mem/nvdimm.c         | 359 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/mem/nvdimm.h | 104 ++++++++++++
>  2 files changed, 463 insertions(+)
> 
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 72cd3041ef..cae7f280d2 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -25,6 +25,9 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "qemu/pmem.h"
> +#include "qemu/cutils.h"
> +#include "qemu/bswap.h"
> +#include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "hw/mem/nvdimm.h"
> @@ -178,6 +181,348 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
>      return nvdimm->nvdimm_mr;
>  }
>  
> +static const char NSINDEX_SIGNATURE[] = "NAMESPACE_INDEX\0";
> +
> +static unsigned inc_seq(unsigned seq)
> +{
> +    static const unsigned next[] = { 0, 2, 3, 1 };
> +
> +    return next[seq & 3];
> +}
> +
> +static u32 best_seq(u32 a, u32 b)
> +{
> +    a &= NSINDEX_SEQ_MASK;
> +    b &= NSINDEX_SEQ_MASK;
> +
> +    if (a == 0 || a == b) {
> +        return b;
> +    } else if (b == 0) {
> +        return a;
> +    } else if (inc_seq(a) == b) {
> +        return b;
> +    } else {
> +        return a;
> +    }
> +}
> +
> +static size_t __sizeof_namespace_index(u32 nslot)
> +{
> +    return ALIGN(sizeof(struct namespace_index) + DIV_ROUND_UP(nslot, 8),
> +            NSINDEX_ALIGN);
> +}
> +
> +static unsigned sizeof_namespace_label(struct NVDIMMDevice *nvdimm)
> +{
> +    if (nvdimm->label_size == 0) {
> +        warn_report("NVDIMM label size is 0, default it to 128.");
> +        nvdimm->label_size = 128;
> +    }
> +    return nvdimm->label_size;
> +}
> +
> +static int __nvdimm_num_label_slots(struct NVDIMMDevice *nvdimm,
> +                                            size_t index_size)
> +{
> +    return (nvdimm->lsa_size - index_size * 2) /
> +        sizeof_namespace_label(nvdimm);
> +}
> +
> +static int nvdimm_num_label_slots(struct NVDIMMDevice *nvdimm)
> +{
> +    u32 tmp_nslot, n;
> +
> +    tmp_nslot = nvdimm->lsa_size / nvdimm->label_size;
> +    n = __sizeof_namespace_index(tmp_nslot) / NSINDEX_ALIGN;
> +
> +    return __nvdimm_num_label_slots(nvdimm, NSINDEX_ALIGN * n);
> +}
> +
> +static unsigned int sizeof_namespace_index(struct NVDIMMDevice *nvdimm)
> +{
> +    u32 nslot, space, size;
> +
> +    /*
> +     * Per UEFI 2.7, the minimum size of the Label Storage Area is
> +     * large enough to hold 2 index blocks and 2 labels.  The
> +     * minimum index block size is 256 bytes, and the minimum label
> +     * size is 256 bytes.
> +     */
> +    nslot = nvdimm_num_label_slots(nvdimm);
> +    space = nvdimm->lsa_size - nslot * sizeof_namespace_label(nvdimm);
> +    size = __sizeof_namespace_index(nslot) * 2;
> +    if (size <= space && nslot >= 2) {
> +        return size / 2;
> +    }
> +
> +    error_report("label area (%ld) too small to host (%d byte) labels",
> +            nvdimm->lsa_size, sizeof_namespace_label(nvdimm));
> +    return 0;
> +}
> +
> +static struct namespace_index *to_namespace_index(struct NVDIMMDevice *nvdimm,
> +       int i)
> +{
> +    if (i < 0) {
> +        return NULL;
> +    }
> +
> +    return nvdimm->label_data + sizeof_namespace_index(nvdimm) * i;
> +}
> +
> +/* Validate NVDIMM index blocks. Generally refer to driver and ndctl code */
> +static int __nvdimm_label_validate(struct NVDIMMDevice *nvdimm)
> +{
> +    /*
> +     * On media label format consists of two index blocks followed
> +     * by an array of labels.  None of these structures are ever
> +     * updated in place.  A sequence number tracks the current
> +     * active index and the next one to write, while labels are
> +     * written to free slots.
> +     *
> +     *     +------------+
> +     *     |            |
> +     *     |  nsindex0  |
> +     *     |            |
> +     *     +------------+
> +     *     |            |
> +     *     |  nsindex1  |
> +     *     |            |
> +     *     +------------+
> +     *     |   label0   |
> +     *     +------------+
> +     *     |   label1   |
> +     *     +------------+
> +     *     |            |
> +     *      ....nslot...
> +     *     |            |
> +     *     +------------+
> +     *     |   labelN   |
> +     *     +------------+
> +     */
> +    struct namespace_index *nsindex[] = {
> +        to_namespace_index(nvdimm, 0),
> +        to_namespace_index(nvdimm, 1),
> +    };
> +    const int num_index = ARRAY_SIZE(nsindex);
> +    bool valid[2] = { 0 };
> +    int i, num_valid = 0;
> +    u32 seq;
> +
> +    for (i = 0; i < num_index; i++) {
> +        u32 nslot;
> +        u8 sig[NSINDEX_SIG_LEN];
> +        u64 sum_save, sum, size;
> +        unsigned int version, labelsize;
> +
> +        memcpy(sig, nsindex[i]->sig, NSINDEX_SIG_LEN);
> +        if (memcmp(sig, NSINDEX_SIGNATURE, NSINDEX_SIG_LEN) != 0) {
> +            nvdimm_debug("nsindex%d signature invalid\n", i);
> +            continue;
> +        }
> +
> +        /* label sizes larger than 128 arrived with v1.2 */
> +        version = le16_to_cpu(nsindex[i]->major) * 100
> +            + le16_to_cpu(nsindex[i]->minor);
> +        if (version >= 102) {
> +            labelsize = 1 << (7 + nsindex[i]->labelsize);
> +        } else {
> +            labelsize = 128;
> +        }
> +
> +        if (labelsize != sizeof_namespace_label(nvdimm)) {
> +            nvdimm_debug("nsindex%d labelsize %d invalid\n",
> +                    i, nsindex[i]->labelsize);
> +            continue;
> +        }
> +
> +        sum_save = le64_to_cpu(nsindex[i]->checksum);
> +        nsindex[i]->checksum = cpu_to_le64(0);
> +        sum = fletcher64(nsindex[i], sizeof_namespace_index(nvdimm), 1);
> +        nsindex[i]->checksum = cpu_to_le64(sum_save);
> +        if (sum != sum_save) {
> +            nvdimm_debug("nsindex%d checksum invalid\n", i);
> +            continue;
> +        }
> +
> +        seq = le32_to_cpu(nsindex[i]->seq);
> +        if ((seq & NSINDEX_SEQ_MASK) == 0) {
> +            nvdimm_debug("nsindex%d sequence: 0x%x invalid\n", i, seq);
> +            continue;
> +        }
> +
> +        /* sanity check the index against expected values */
> +        if (le64_to_cpu(nsindex[i]->myoff) !=
> +            i * sizeof_namespace_index(nvdimm)) {
> +            nvdimm_debug("nsindex%d myoff: 0x%llx invalid\n",
> +                         i, (unsigned long long)
> +                         le64_to_cpu(nsindex[i]->myoff));
> +            continue;
> +        }
> +        if (le64_to_cpu(nsindex[i]->otheroff)
> +            != (!i) * sizeof_namespace_index(nvdimm)) {
> +            nvdimm_debug("nsindex%d otheroff: 0x%llx invalid\n",
> +                         i, (unsigned long long)
> +                         le64_to_cpu(nsindex[i]->otheroff));
> +            continue;
> +        }
> +
> +        size = le64_to_cpu(nsindex[i]->mysize);
> +        if (size > sizeof_namespace_index(nvdimm) ||
> +            size < sizeof(struct namespace_index)) {
> +            nvdimm_debug("nsindex%d mysize: 0x%zx invalid\n", i, size);
> +            continue;
> +        }
> +
> +        nslot = le32_to_cpu(nsindex[i]->nslot);
> +        if (nslot * sizeof_namespace_label(nvdimm) +
> +            2 * sizeof_namespace_index(nvdimm) > nvdimm->lsa_size) {
> +            nvdimm_debug("nsindex%d nslot: %u invalid, config_size: 0x%zx\n",
> +                         i, nslot, nvdimm->lsa_size);
> +            continue;
> +        }
> +        valid[i] = true;
> +        num_valid++;
> +    }
> +
> +    switch (num_valid) {
> +    case 0:
> +        break;
> +    case 1:
> +        for (i = 0; i < num_index; i++)
> +            if (valid[i]) {
> +                return i;
> +            }
> +        /* can't have num_valid > 0 but valid[] = { false, false } */
> +        error_report("unexpected index-block parse error");
> +        break;
> +    default:
> +        /* pick the best index... */
> +        seq = best_seq(le32_to_cpu(nsindex[0]->seq),
> +                       le32_to_cpu(nsindex[1]->seq));
> +        if (seq == (le32_to_cpu(nsindex[1]->seq) & NSINDEX_SEQ_MASK)) {
> +            return 1;
> +        } else {
> +            return 0;
> +        }
> +        break;
> +    }
> +
> +    return -1;
> +}
> +
> +static int nvdimm_label_validate(struct NVDIMMDevice *nvdimm)
> +{
> +    int label_size[] = { 128, 256 };
> +    int i, rc;
> +
> +    for (i = 0; i < ARRAY_SIZE(label_size); i++) {
> +        nvdimm->label_size = label_size[i];
> +        rc = __nvdimm_label_validate(nvdimm);
> +        if (rc >= 0) {
> +            return rc;
> +        }
> +    }
> +
> +    return -1;
> +}
> +
> +static int label_next_nsindex(int index)
> +{
> +    if (index < 0) {
> +        return -1;
> +    }
> +
> +    return (index + 1) % 2;
> +}
> +
> +static void *label_base(struct NVDIMMDevice *nvdimm)
> +{
> +    void *base = to_namespace_index(nvdimm, 0);
> +
> +    return base + 2 * sizeof_namespace_index(nvdimm);
> +}
> +
> +static int write_label_index(struct NVDIMMDevice *nvdimm,
> +        enum ndctl_namespace_version ver, unsigned index, unsigned seq)
> +{
> +    struct namespace_index *nsindex;
> +    unsigned long offset;
> +    u64 checksum;
> +    u32 nslot;
> +
> +    /*
> +     * We may have initialized ndd to whatever labelsize is
> +     * currently on the dimm during label_validate(), so we reset it
> +     * to the desired version here.
> +     */
> +    switch (ver) {
> +    case NDCTL_NS_VERSION_1_1:
> +        nvdimm->label_size = 128;
> +        break;
> +    case NDCTL_NS_VERSION_1_2:
> +        nvdimm->label_size = 256;
> +        break;
> +    default:
> +        return -1;
> +    }
> +
> +    nsindex = to_namespace_index(nvdimm, index);
> +    nslot = nvdimm_num_label_slots(nvdimm);
> +
> +    memcpy(nsindex->sig, NSINDEX_SIGNATURE, NSINDEX_SIG_LEN);
> +    memset(nsindex->flags, 0, 3);
> +    nsindex->labelsize = sizeof_namespace_label(nvdimm) >> 8;
> +    nsindex->seq = cpu_to_le32(seq);
> +    offset = (unsigned long) nsindex
> +        - (unsigned long) to_namespace_index(nvdimm, 0);
> +    nsindex->myoff = cpu_to_le64(offset);
> +    nsindex->mysize = cpu_to_le64(sizeof_namespace_index(nvdimm));
> +    offset = (unsigned long) to_namespace_index(nvdimm,
> +            label_next_nsindex(index))
> +        - (unsigned long) to_namespace_index(nvdimm, 0);
> +    nsindex->otheroff = cpu_to_le64(offset);
> +    offset = (unsigned long) label_base(nvdimm)
> +        - (unsigned long) to_namespace_index(nvdimm, 0);
> +    nsindex->labeloff = cpu_to_le64(offset);
> +    nsindex->nslot = cpu_to_le32(nslot);
> +    nsindex->major = cpu_to_le16(1);
> +    if (sizeof_namespace_label(nvdimm) < 256) {
> +        nsindex->minor = cpu_to_le16(1);
> +    } else {
> +        nsindex->minor = cpu_to_le16(2);
> +    }
> +    nsindex->checksum = cpu_to_le64(0);
> +    /* init label bitmap */
> +    memset(nsindex->free, 0xff, ALIGN(nslot, BITS_PER_LONG) / 8);
> +    checksum = fletcher64(nsindex, sizeof_namespace_index(nvdimm), 1);
> +    nsindex->checksum = cpu_to_le64(checksum);
> +
> +    return 0;
> +}
> +
> +static int nvdimm_init_label(struct NVDIMMDevice *nvdimm)
> +{
> +    int i;
> +
> +    for (i = 0; i < 2; i++) {
> +        int rc;
> +
> +        /* To have most compatibility, we init index block with v1.1 */
> +        rc = write_label_index(nvdimm, NDCTL_NS_VERSION_1_1, i, 3 - i);
> +
> +        if (rc < 0) {
> +            error_report("init No.%d index block failed", i);
> +            return rc;
> +        } else {
> +            nvdimm_debug("%s: dump No.%d index block\n", __func__, i);
> +            dump_index_block(to_namespace_index(nvdimm, i));
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static void nvdimm_realize(PCDIMMDevice *dimm, Error **errp)
>  {
>      NVDIMMDevice *nvdimm = NVDIMM(dimm);
> @@ -187,6 +532,20 @@ static void nvdimm_realize(PCDIMMDevice *dimm, Error **errp)
>          nvdimm_prepare_memory_region(nvdimm, errp);
>      }
>  
> +    /* When LSA is designaged, validate it. */
> +    if (nvdimm->lsa_size != 0) {
> +        if (buffer_is_zero(nvdimm->label_data, nvdimm->lsa_size) ||
> +            nvdimm_label_validate(nvdimm) < 0) {
> +            int rc;
> +
> +            info_report("NVDIMM LSA is invalid, needs to be initialized");
> +            rc = nvdimm_init_label(nvdimm);
> +            if (rc < 0) {
> +                error_report("NVDIMM lsa init failed, rc = %d", rc);
> +            }
> +        }
> +    }
> +
>      if (ndc->realize) {
>          ndc->realize(nvdimm, errp);
>      }
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index 8e6a40dc7b..bc1af9248e 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -48,14 +48,76 @@
>  #define TYPE_NVDIMM      "nvdimm"
>  OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
>  
> +typedef uint32_t u32;
> +typedef uint64_t u64;
> +typedef uint8_t u8;
> +typedef uint32_t u32;
> +
> +#define ALIGN(x, y)  (((x) + (y) - 1) & ~((y) - 1))
> +
>  #define NVDIMM_LSA_SIZE_PROP   "lsa-size"
>  #define NVDIMM_UUID_PROP       "uuid"
>  #define NVDIMM_UNARMED_PROP    "unarmed"
>  
> +enum ndctl_namespace_version {
> +    NDCTL_NS_VERSION_1_1,
> +    NDCTL_NS_VERSION_1_2,
> +};
> +
> +enum {
> +    NSINDEX_SIG_LEN = 16,
> +    NSINDEX_ALIGN = 256,
> +    NSINDEX_SEQ_MASK = 0x3,
> +    NSLABEL_UUID_LEN = 16,
> +    NSLABEL_NAME_LEN = 64,
> +};
> +
> +/**
> + * struct namespace_index - label set superblock
> + * @sig: NAMESPACE_INDEX\0
> + * @flags: placeholder
> + * @labelsize: log2 size (v1 labels 128 bytes v2 labels 256 bytes)
> + * @seq: sequence number for this index
> + * @myoff: offset of this index in label area
> + * @mysize: size of this index struct
> + * @otheroff: offset of other index
> + * @labeloff: offset of first label slot
> + * @nslot: total number of label slots
> + * @major: label area major version
> + * @minor: label area minor version
> + * @checksum: fletcher64 of all fields
> + * @free: bitmap, nlabel bits
> + *
> + * The size of free[] is rounded up so the total struct size is a
> + * multiple of NSINDEX_ALIGN bytes.  Any bits this allocates beyond
> + * nlabel bits must be zero.
> + */
> +struct namespace_index {
> +    uint8_t sig[NSINDEX_SIG_LEN];
> +    uint8_t flags[3];
> +    uint8_t labelsize;
> +    uint32_t seq;
> +    uint64_t myoff;
> +    uint64_t mysize;
> +    uint64_t otheroff;
> +    uint64_t labeloff;
> +    uint32_t nslot;
> +    uint16_t major;
> +    uint16_t minor;
> +    uint64_t checksum;
> +    uint8_t free[0];
> +};
> +
>  struct NVDIMMDevice {
>      /* private */
>      PCDIMMDevice parent_obj;
>  
> +    /*
> +     * Label's size in LSA. Determined by Label version. 128 for v1.1, 256
> +     * for v1.2
> +     */
> +    unsigned int label_size;
> +
>      /* public */
>  
>      /*
> @@ -150,6 +212,48 @@ struct NVDIMMState {
>  };
>  typedef struct NVDIMMState NVDIMMState;
>  
> +#if (NVDIMM_DEBUG == 1)
> +static inline void dump_index_block(struct namespace_index *nsindex)
> +{
> +    printf("sig %s\n", nsindex->sig);
> +    printf("flags 0x%x 0x%x 0x%x\n", nsindex->flags[0],
> +           nsindex->flags[1], nsindex->flags[2]);
> +    printf("labelsize %d\n", nsindex->labelsize);
> +    printf("seq 0x%0x\n", nsindex->seq);
> +    printf("myoff 0x%"PRIx64"\n", nsindex->myoff);
> +    printf("mysize 0x%"PRIx64"\n", nsindex->mysize);
> +    printf("otheroff 0x%"PRIx64"\n", nsindex->otheroff);
> +    printf("labeloff 0x%"PRIx64"\n", nsindex->labeloff);
> +    printf("nslot %d\n", nsindex->nslot);
> +    printf("major %d\n", nsindex->major);
> +    printf("minor %d\n", nsindex->minor);
> +    printf("checksum 0x%"PRIx64"\n", nsindex->checksum);
> +    printf("-------------------------------\n");
> +}
> +#else
> +static inline void dump_index_block(struct namespace_index *nsindex)
> +{
> +}
> +#endif
> +
> +/*
> + * Note, fletcher64() is copied from drivers/nvdimm/label.c in the Linux kernel
> + */
> +static inline u64 fletcher64(void *addr, size_t len, bool le)
> +{
> +    u32 *buf = addr;
> +    u32 lo32 = 0;
> +    u64 hi32 = 0;
> +    size_t i;
> +
> +    for (i = 0; i < len / sizeof(u32); i++) {
> +        lo32 += le ? le32_to_cpu((u32) buf[i]) : buf[i];
> +        hi32 += lo32;
> +    }
> +
> +    return hi32 << 32 | lo32;
> +}
> +
>  void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>                              struct AcpiGenericAddress dsm_io,
>                              FWCfgState *fw_cfg, Object *owner);


