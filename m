Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F12110C1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 18:34:09 +0200 (CEST)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqfgW-0005Bc-21
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 12:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqff7-00040r-ST; Wed, 01 Jul 2020 12:32:42 -0400
Received: from charlie.dont.surf ([128.199.63.193]:50046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqff5-0002Dy-1x; Wed, 01 Jul 2020 12:32:41 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 34B6EBF64B;
 Wed,  1 Jul 2020 16:32:36 +0000 (UTC)
Date: Wed, 1 Jul 2020 18:32:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v2 15/18] hw/block/nvme: Support Zone Descriptor Extensions
Message-ID: <20200701163232.wt42opdib4pk3hlf@apples.localdomain>
References: <20200617213415.22417-1-dmitry.fomichev@wdc.com>
 <20200617213415.22417-16-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200617213415.22417-16-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 12:11:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsky@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 18 06:34, Dmitry Fomichev wrote:
> Zone Descriptor Extension is a label that can be assigned to a zone.
> It can be set to an Empty zone and it stays assigned until the zone
> is reset.
> 
> This commit adds a new optional property, "zone_descr_ext_size", to
> the driver. Its value must be a multiple of 64 bytes. If this value
> is non-zero, it becomes possible to assign extensions of that size
> to any Empty zones. The default value for this property is 0,
> therefore setting extensions is disabled by default.
> 
> Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
>  hw/block/nvme.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++---
>  hw/block/nvme.h |  8 ++++++
>  2 files changed, 80 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index b9135a6b1f..eb41081627 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1360,6 +1360,26 @@ static bool nvme_cond_offline_all(uint8_t state)
>      return state == NVME_ZONE_STATE_READ_ONLY;
>  }
>  
> +static uint16_t nvme_set_zd_ext(NvmeCtrl *n, NvmeNamespace *ns,
> +    NvmeZone *zone, uint8_t state)
> +{
> +    uint16_t status;
> +
> +    if (state == NVME_ZONE_STATE_EMPTY) {
> +        nvme_auto_transition_zone(n, ns, false, true);
> +        status = nvme_aor_check(n, ns, 1, 0);
> +        if (status != NVME_SUCCESS) {
> +            return status;
> +        }
> +        nvme_aor_inc_active(n, ns);
> +        zone->d.za |= NVME_ZA_ZD_EXT_VALID;
> +        nvme_assign_zone_state(n, ns, zone, NVME_ZONE_STATE_CLOSED);
> +        return NVME_SUCCESS;
> +    }
> +
> +    return NVME_ZONE_INVAL_TRANSITION;
> +}
> +
>  static uint16_t name_do_zone_op(NvmeCtrl *n, NvmeNamespace *ns,
>      NvmeZone *zone, uint8_t state, bool all,
>      uint16_t (*op_hndlr)(NvmeCtrl *, NvmeNamespace *, NvmeZone *,
> @@ -1388,13 +1408,16 @@ static uint16_t name_do_zone_op(NvmeCtrl *n, NvmeNamespace *ns,
>  static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeNamespace *ns,
>      NvmeCmd *cmd, NvmeRequest *req)
>  {
> +    NvmeRwCmd *rw;
>      uint32_t dw13 = le32_to_cpu(cmd->cdw13);
> +    uint64_t prp1, prp2;
>      uint64_t slba = 0;
>      uint64_t zone_idx = 0;
>      uint16_t status;
>      uint8_t action, state;
>      bool all;
>      NvmeZone *zone;
> +    uint8_t *zd_ext;
>  
>      action = dw13 & 0xff;
>      all = dw13 & 0x100;
> @@ -1449,7 +1472,25 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeNamespace *ns,
>  
>      case NVME_ZONE_ACTION_SET_ZD_EXT:
>          trace_pci_nvme_set_descriptor_extension(slba, zone_idx);
> -        return NVME_INVALID_FIELD | NVME_DNR;
> +        if (all || !n->params.zd_extension_size) {
> +            return NVME_INVALID_FIELD | NVME_DNR;
> +        }
> +        zd_ext = nvme_get_zd_extension(n, ns, zone_idx);
> +        rw = (NvmeRwCmd *)cmd;
> +        prp1 = le64_to_cpu(rw->prp1);
> +        prp2 = le64_to_cpu(rw->prp2);
> +        status = nvme_dma_write_prp(n, zd_ext, n->params.zd_extension_size,
> +                                    prp1, prp2);
> +        if (status) {
> +            trace_pci_nvme_err_zd_extension_map_error(zone_idx);
> +            return status;
> +        }
> +
> +        status = nvme_set_zd_ext(n, ns, zone, state);
> +        if (status == NVME_SUCCESS) {
> +            trace_pci_nvme_zd_extension_set(zone_idx);
> +            return status;
> +        }
>          break;
>  
>      default:
> @@ -1528,7 +1569,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeNamespace *ns,
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
>  
> -    if (zra == NVME_ZONE_REPORT_EXTENDED) {
> +    if (zra == NVME_ZONE_REPORT_EXTENDED && !n->params.zd_extension_size) {
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
>  
> @@ -1540,6 +1581,9 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeNamespace *ns,
>      partial = (dw13 >> 16) & 0x01;
>  
>      zone_entry_sz = sizeof(NvmeZoneDescr);
> +    if (zra == NVME_ZONE_REPORT_EXTENDED) {
> +        zone_entry_sz += n->params.zd_extension_size;
> +    }
>  
>      max_zones = (len - sizeof(NvmeZoneReportHeader)) / zone_entry_sz;
>      buf = g_malloc0(len);
> @@ -1571,6 +1615,14 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeNamespace *ns,
>              z->wp = cpu_to_le64(~0ULL);
>          }
>  
> +        if (zra == NVME_ZONE_REPORT_EXTENDED) {
> +            if (zs->d.za & NVME_ZA_ZD_EXT_VALID) {
> +                memcpy(buf_p, nvme_get_zd_extension(n, ns, zone_index),
> +                       n->params.zd_extension_size);
> +            }
> +            buf_p += n->params.zd_extension_size;
> +        }
> +
>          zone_index++;
>      }
>  
> @@ -2337,7 +2389,7 @@ static uint16_t nvme_handle_changed_zone_log(NvmeCtrl *n, NvmeCmd *cmd,
>              continue;
>          }
>          num_aen_zones++;
> -        if (zone->d.za) {
> +        if (zone->d.za & ~NVME_ZA_ZD_EXT_VALID) {
>              trace_pci_nvme_reporting_changed_zone(zone->d.zslba, zone->d.za);
>              *zid_ptr++ = cpu_to_le64(zone->d.zslba);
>              nids++;
> @@ -2936,6 +2988,7 @@ static int nvme_init_zone_meta(NvmeCtrl *n, NvmeNamespace *ns,
>      ns->imp_open_zones = g_malloc0(sizeof(NvmeZoneList));
>      ns->closed_zones = g_malloc0(sizeof(NvmeZoneList));
>      ns->full_zones = g_malloc0(sizeof(NvmeZoneList));
> +    ns->zd_extensions = g_malloc0(n->params.zd_extension_size * n->num_zones);
>      zone = ns->zone_array;
>  
>      nvme_init_zone_list(ns->exp_open_zones);
> @@ -3010,6 +3063,17 @@ static void nvme_zoned_init_ctrl(NvmeCtrl *n, Error **errp)
>      if (n->params.max_active_zones > nz) {
>          n->params.max_active_zones = nz;
>      }
> +    if (n->params.zd_extension_size) {
> +        if (n->params.zd_extension_size & 0x3f) {
> +            error_setg(errp,
> +                "zone descriptor extension size must be a multiple of 64B");
> +            return;
> +        }
> +        if ((n->params.zd_extension_size >> 6) > 0xff) {
> +            error_setg(errp, "zone descriptor extension size is too large");
> +            return;
> +        }
> +    }
>  
>      if (n->params.zone_async_events) {
>          n->ae_cfg |= NVME_AEN_CFG_ZONE_DESCR_CHNGD_NOTICES;
> @@ -3040,7 +3104,8 @@ static int nvme_zoned_init_ns(NvmeCtrl *n, NvmeNamespace *ns, int lba_index,
>      ns->id_ns_zoned->ozcs = n->params.cross_zone_read ? 0x01 : 0x00;
>  
>      ns->id_ns_zoned->lbafe[lba_index].zsze = cpu_to_le64(n->params.zone_size);
> -    ns->id_ns_zoned->lbafe[lba_index].zdes = 0;
> +    ns->id_ns_zoned->lbafe[lba_index].zdes =
> +        n->params.zd_extension_size >> 6; /* Units of 64B */
>  
>      if (n->params.fill_pattern == 0) {
>          ns->id_ns.dlfeat = 0x01;
> @@ -3063,6 +3128,7 @@ static void nvme_zoned_clear(NvmeCtrl *n)
>          g_free(ns->imp_open_zones);
>          g_free(ns->closed_zones);
>          g_free(ns->full_zones);
> +        g_free(ns->zd_extensions);
>      }
>  }
>  
> @@ -3396,6 +3462,8 @@ static Property nvme_props[] = {
>      DEFINE_PROP_UINT64("zone_size", NvmeCtrl, params.zone_size, 512),
>      DEFINE_PROP_UINT64("zone_capacity", NvmeCtrl, params.zone_capacity, 512),
>      DEFINE_PROP_UINT32("zone_append_max_size", NvmeCtrl, params.zamds_bs, 0),
> +    DEFINE_PROP_UINT32("zone_descr_ext_size", NvmeCtrl,
> +                       params.zd_extension_size, 0),
>      DEFINE_PROP_INT32("max_active", NvmeCtrl, params.max_active_zones, 0),
>      DEFINE_PROP_INT32("max_open", NvmeCtrl, params.max_open_zones, 0),
>      DEFINE_PROP_UINT64("reset_rcmnd_delay", NvmeCtrl, params.rzr_delay_usec, 0),
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index e63f7736d7..4251295917 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -24,6 +24,7 @@ typedef struct NvmeParams {
>      uint64_t    zone_capacity;
>      int32_t     max_active_zones;
>      int32_t     max_open_zones;
> +    uint32_t    zd_extension_size;
>      uint64_t    rzr_delay_usec;
>      uint64_t    rrl_usec;
>      uint64_t    fzr_delay_usec;
> @@ -123,6 +124,7 @@ typedef struct NvmeNamespace {
>      NvmeZoneList    *imp_open_zones;
>      NvmeZoneList    *closed_zones;
>      NvmeZoneList    *full_zones;
> +    uint8_t         *zd_extensions;
>      int32_t         nr_open_zones;
>      int32_t         nr_active_zones;
>      bool            aen_pending;
> @@ -221,6 +223,12 @@ static inline bool nvme_wp_is_valid(NvmeZone *zone)
>             st != NVME_ZONE_STATE_OFFLINE;
>  }
>  
> +static inline uint8_t *nvme_get_zd_extension(NvmeCtrl *n,
> +    NvmeNamespace *ns, uint32_t zone_idx)
> +{
> +    return &ns->zd_extensions[zone_idx * n->params.zd_extension_size];
> +}
> +
>  /*
>   * Initialize a zone list head.
>   */
> -- 
> 2.21.0
> 
> 

