Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1313CCE70
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:22:56 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Nc7-0005ft-GS
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1m5Nap-0004n1-Nz
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:21:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:59929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1m5Nan-0004Zh-K6
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:21:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="198266415"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="198266415"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 00:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="493943626"
Received: from michael-optiplex-9020.sh.intel.com (HELO localhost)
 ([10.239.159.182])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2021 00:21:25 -0700
Date: Mon, 19 Jul 2021 15:35:16 +0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] qdev-properties: Add a new macro with bitmask
 check for uint64_t property
Message-ID: <20210719073516.GA23232@intel.com>
References: <1624156957-7223-1-git-send-email-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624156957-7223-1-git-send-email-weijiang.yang@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=weijiang.yang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "Yang, Weijiang" <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, maintainers,

Could you review this patch series kindly since the legacy LBR patches
have been merged in 5.12 kernel tree?

Thanks!

On Sun, Jun 20, 2021 at 10:42:36AM +0800, Yang, Weijiang wrote:
> The DEFINE_PROP_UINT64_CHECKMASK maro applies certain mask check agaist
> user-supplied property value, reject the value if it violates the bitmask.
> 
> Co-developed-by: Like Xu <like.xu@linux.intel.com>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> ---
>  hw/core/qdev-properties.c    | 19 +++++++++++++++++++
>  include/hw/qdev-properties.h | 12 ++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 50f40949f5..343a200784 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -428,6 +428,25 @@ const PropertyInfo qdev_prop_int64 = {
>      .set_default_value = qdev_propinfo_set_default_value_int,
>  };
>  
> +static void set_uint64_checkmask(Object *obj, Visitor *v, const char *name,
> +                      void *opaque, Error **errp)
> +{
> +    Property *prop = opaque;
> +    uint64_t *ptr = object_field_prop_ptr(obj, prop);
> +
> +    visit_type_uint64(v, name, ptr, errp);
> +    if (*ptr & ~prop->bitmask) {
> +        error_setg(errp, "Property value for '%s' violates bitmask '0x%lx'",
> +                   name, prop->bitmask);
> +    }
> +}
> +
> +const PropertyInfo qdev_prop_uint64_checkmask = {
> +    .name  = "uint64",
> +    .get   = get_uint64,
> +    .set   = set_uint64_checkmask,
> +};
> +
>  /* --- string --- */
>  
>  static void release_string(Object *obj, const char *name, void *opaque)
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 0ef97d60ce..075882e8c1 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -17,6 +17,7 @@ struct Property {
>      const PropertyInfo *info;
>      ptrdiff_t    offset;
>      uint8_t      bitnr;
> +    uint64_t     bitmask;
>      bool         set_default;
>      union {
>          int64_t i;
> @@ -53,6 +54,7 @@ extern const PropertyInfo qdev_prop_uint16;
>  extern const PropertyInfo qdev_prop_uint32;
>  extern const PropertyInfo qdev_prop_int32;
>  extern const PropertyInfo qdev_prop_uint64;
> +extern const PropertyInfo qdev_prop_uint64_checkmask;
>  extern const PropertyInfo qdev_prop_int64;
>  extern const PropertyInfo qdev_prop_size;
>  extern const PropertyInfo qdev_prop_string;
> @@ -102,6 +104,16 @@ extern const PropertyInfo qdev_prop_link;
>                  .set_default = true,                         \
>                  .defval.u    = (bool)_defval)
>  
> +/**
> + * The DEFINE_PROP_UINT64_CHECKMASK macro checks a user-supplied value
> + * against corresponding bitmask, rejects the value if it violates.
> + * The default value is set in instance_init().
> + */
> +#define DEFINE_PROP_UINT64_CHECKMASK(_name, _state, _field, _bitmask)   \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_uint64_checkmask, uint64_t, \
> +                .bitmask    = (_bitmask),                     \
> +                .set_default = false)
> +
>  #define PROP_ARRAY_LEN_PREFIX "len-"
>  
>  /**
> -- 
> 2.21.1

