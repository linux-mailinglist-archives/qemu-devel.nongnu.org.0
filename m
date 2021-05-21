Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E738C0F7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:47:40 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzsh-0003ND-Bn
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzr1-0002bm-GH
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzqy-00036X-Fw
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621583151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KFPkjc9lWGkF9z30NYu1sPGJFkcB+o+oYRUHVeh9h+Q=;
 b=HgW2BdEiJfNnjoMB3rmu1krNT4iLwALpplsf0PL4FvR/Jb2U9drpDr20941PTdsP7k6ZS2
 qnR++t9CCIjQiXagFIpJCyQNrMmXWfkVcVPzJ87SCzkJYrWe3JT7j+DcmErYt1fFZh27t8
 Kq6lqqBLV+T7gjSjrwUjDZ35E3xtq+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-ea8yVrBAOkiCv8ufIoMSHA-1; Fri, 21 May 2021 03:45:49 -0400
X-MC-Unique: ea8yVrBAOkiCv8ufIoMSHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3798107ACC7;
 Fri, 21 May 2021 07:45:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3C3360C4A;
 Fri, 21 May 2021 07:45:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40629113865F; Fri, 21 May 2021 09:45:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Subject: Re: [PATCH v3 1/2] qdev-properties: Add a new macro to validate
 bitmask for setter
References: <20210508055259.128025-1-like.xu@linux.intel.com>
Date: Fri, 21 May 2021 09:45:47 +0200
In-Reply-To: <20210508055259.128025-1-like.xu@linux.intel.com> (Like Xu's
 message of "Sat, 8 May 2021 13:52:58 +0800")
Message-ID: <874kewpm1g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 weijiang.yang@intel.com, wei.w.wang@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like Xu <like.xu@linux.intel.com> writes:

> The new generic DEFINE_PROP_BITMASK_UINT64 could be used to ensure
> that a user-provided property value complies with its bitmask rule
> and the default value is recommended to be set in instance_init().
>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  hw/core/qdev-properties.c    | 19 +++++++++++++++++++
>  include/hw/qdev-properties.h | 12 ++++++++++++
>  include/qapi/qmp/qerror.h    |  3 +++
>  3 files changed, 34 insertions(+)
>
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 50f40949f5..3784d3b30d 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -428,6 +428,25 @@ const PropertyInfo qdev_prop_int64 = {
>      .set_default_value = qdev_propinfo_set_default_value_int,
>  };
>  
> +static void set_bitmask_uint64(Object *obj, Visitor *v, const char *name,
> +                      void *opaque, Error **errp)
> +{
> +    Property *prop = opaque;
> +    uint64_t *ptr = object_field_prop_ptr(obj, prop);
> +
> +    visit_type_uint64(v, name, ptr, errp);
> +
> +    if (*ptr & ~prop->bitmask) {
> +        error_setg(errp, QERR_INVALID_BITMASK_VALUE, name, prop->bitmask);
> +    }
> +}
> +
> +const PropertyInfo qdev_prop_bitmask_uint64 = {
> +    .name  = "int64",
> +    .get   = get_uint64,
> +    .set   = set_bitmask_uint64,
> +};
> +
>  /* --- string --- */
>  
>  static void release_string(Object *obj, const char *name, void *opaque)
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 0ef97d60ce..42f0112e14 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -17,6 +17,7 @@ struct Property {
>      const PropertyInfo *info;
>      ptrdiff_t    offset;
>      uint8_t      bitnr;
> +    uint64_t     bitmask;

The new member is used just for BITMASK properties.  Similar to how
.bitnr is used just for BIT properties, .link_type is just for LINK
properties, and the .arrayFOO are just for ARRAY properties.  I don't
like that, to be frank, but I'm not the maintainer.

>      bool         set_default;
>      union {
>          int64_t i;
> @@ -53,6 +54,7 @@ extern const PropertyInfo qdev_prop_uint16;
>  extern const PropertyInfo qdev_prop_uint32;
>  extern const PropertyInfo qdev_prop_int32;
>  extern const PropertyInfo qdev_prop_uint64;
> +extern const PropertyInfo qdev_prop_bitmask_uint64;
>  extern const PropertyInfo qdev_prop_int64;
>  extern const PropertyInfo qdev_prop_size;
>  extern const PropertyInfo qdev_prop_string;
> @@ -102,6 +104,16 @@ extern const PropertyInfo qdev_prop_link;
>                  .set_default = true,                         \
>                  .defval.u    = (bool)_defval)
>  
> +/**
> + * The DEFINE_PROP_BITMASK_UINT64 could be used to ensure that
> + * a user-provided value complies with certain bitmask rule and
> + * the default value is recommended to be set in instance_init().
> + */
> +#define DEFINE_PROP_BITMASK_UINT64(_name, _state, _field, _bitmask)   \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_bitmask_uint64, uint64_t, \
> +                .bitmask    = (_bitmask),                     \
> +                .set_default = false)
> +
>  #define PROP_ARRAY_LEN_PREFIX "len-"
>  
>  /**
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 596fce0c54..aab7902760 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -68,4 +68,7 @@
>  #define QERR_UNSUPPORTED \
>      "this feature or command is not currently supported"
>  
> +#define QERR_INVALID_BITMASK_VALUE \
> +    "the requested value for '%s' violates its bitmask '0x%lx'"
> +
>  #endif /* QERROR_H */

Note the comment further up:

   /*
    * These macros will go away, please don't use in new code, and do not
    * add new ones!
    */

Please put the error message string into set_bitmask_uint64()'s
error_setg() call instead.


