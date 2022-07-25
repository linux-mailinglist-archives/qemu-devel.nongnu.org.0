Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E9157FF49
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:50:17 +0200 (CEST)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxXM-0007zt-CW
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oFxC7-0003AD-Bb
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oFxC4-0007BO-KX
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658752094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9YeHWakmxTqgqRYshBg8UhblmgseY1X8HLYOrCQcZA=;
 b=a6poG/3umD9tc3PFidFJT6YGe/pzRdHmjvmGXFjLYD5Vhtcjj7Prf2jYuFPwx+0dUyFvEt
 uF0jkrfHS71LcfM13cMpFhSR57ij3Iv8IGmmgwpbRjtWnBCrBAx/pA6RdBD7qzdIkOeSkQ
 gbwgRz+tQDrmYIcwaEN0WB8xV0FBDU8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-c8UH8xF1OwCDPGCmNkdUuA-1; Mon, 25 Jul 2022 08:28:04 -0400
X-MC-Unique: c8UH8xF1OwCDPGCmNkdUuA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v67-20020a1cac46000000b003a2be9fa09cso6117176wme.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 05:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f9YeHWakmxTqgqRYshBg8UhblmgseY1X8HLYOrCQcZA=;
 b=SpLTybzGNjYFhQUMBsK16jRNEQndENSpP/xxTAUWixwZVe+yIm+OG/U+uzRxptf2Ov
 RIKrqLKG2a1gR/rPxd1V/SiDn/ZjV+lWn6SYSdmo/HCUgQuyaanxB/Qo9nPJWgyoZW3O
 GOtlM7JXTuXFcl90hXZhEsEA/DMaw3TF6XuQBhvsqgOPF3VgEZJWmnm7f8L8VCguthxK
 71DXutM03XUKNCDwJf+C+lWpTC2+y6KmvgCWnJ8W4v21cWIrekKwrAoSF7psrcJNqt9u
 tOrNqnrDo/EQKtnDBbc2uu33Mi/yQiDKhxGYsnO8ATab771i2KU+T//Yfe4f2RaOCVjz
 X1Mw==
X-Gm-Message-State: AJIora8LAnEPE/CDvcEqYVK75IzSoQ2fiqVhnnEjfAn5C7NARNkSrpu5
 i9Y/DHpJs+TZ6Br3eAY+WOjED0brETzdha4befXXPLg/KMMcjpCqblblMd7Q4MEmvbmVVU8vKtn
 EcgZpshrHSWPUlIQ=
X-Received: by 2002:adf:eb50:0:b0:21e:3d13:3a91 with SMTP id
 u16-20020adfeb50000000b0021e3d133a91mr7324986wrn.484.1658752083551; 
 Mon, 25 Jul 2022 05:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sW7dnoAPhtAmKSzTholxTJaZ8I6K2C8ACCIHzpHXi+Quo+3u/wotrCnp/zvTFxw4fwZ1GoDA==
X-Received: by 2002:adf:eb50:0:b0:21e:3d13:3a91 with SMTP id
 u16-20020adfeb50000000b0021e3d133a91mr7324969wrn.484.1658752083249; 
 Mon, 25 Jul 2022 05:28:03 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003a046549a85sm19461203wmq.37.2022.07.25.05.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:28:02 -0700 (PDT)
Date: Mon, 25 Jul 2022 13:28:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-7.2 10/10] hmp, device_tree.c: add 'info fdt
 <property>' support
Message-ID: <Yt6MULSaLESDs0Qt@work-vm>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <20220722200007.1602174-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722200007.1602174-11-danielhb413@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel Henrique Barboza (danielhb413@gmail.com) wrote:
> 'info fdt' is only able to print full nodes so far. It would be good to
> be able to also print single properties, since ometimes we just want
> to verify a single value from the FDT.
> 
> libfdt does not have support to find a property given its full path, but
> it does have a way to return a fdt_property given a prop name and its
> subnode.
> 
> This is how we're going to support it:
> 
> - given the same fullpath parameter, assume it's a node. If we have a
> match with an existing node, print it. If not, assume it's a property;
> 
> - in fdt_find_property() we're going to split 'fullpath' into node and
> property. Unfortunately we can't use g_path_get_basename() to helps us
> because, although the device tree path format is similar to Linux, it'll
> not work when trying to run QEMU under Windows where the path format is
> different;
> 
> - after spliiting into node + property, try to find the node in the FDT.
> If we have a match, use fdt_get_property() to retrieve fdt_property.
> Return it if found;
> 
> - using the fdt_print_property() created previously, print the property.

Would it be easier to make 'info fdt' have an optional 2nd parameter
(hmp can do optionals) which if present is the property name, then these
would become:

> After this change, if an user wants to print just the value of 'cpu' inside
> /cpu/cpu-map(...) from an ARM FDT, we can do it:
> 
> (qemu) info fdt /cpus/cpu-map/socket0/cluster0/core0/cpu

info fdt /cpus/cpu-map/socket0/cluster0/core0 cpu

> /cpus/cpu-map/socket0/cluster0/core0/cpu = <0x8001>
> (qemu)
> 
> Or the 'ibm,my-dma-window' from the v-scsi device inside the pSeries
> FDT:
> 
> (qemu) info fdt /vdevice/v-scsi@71000003/ibm,my-dma-window

info fdt /vdevice/v-scsi@71000003 ibm,my-dma-window

it seems more explicit, and seems easier to implement.

Dave

> /vdevice/v-scsi@71000003/ibm,my-dma-window = <0x71000003 0x0 0x0 0x0 0x10000000>
> (qemu)
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands-info.hx  |  2 +-
>  softmmu/device_tree.c | 79 ++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 76 insertions(+), 5 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index abf277be7d..8891c2918a 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -913,7 +913,7 @@ ERST
>          .name       = "fdt",
>          .args_type  = "fullpath:s",
>          .params     = "fullpath",
> -        .help       = "show firmware device tree node given its full path",
> +        .help       = "show firmware device tree node or property given its full path",
>          .cmd        = hmp_info_fdt,
>      },
>  
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index e41894fbef..f6eb060acc 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -774,9 +774,74 @@ static void fdt_print_node(int node, int depth, const char *fullpath)
>      qemu_printf("%*s}\n", padding, "");
>  }
>  
> +static const struct fdt_property *fdt_find_property(const char *fullpath,
> +                                                    int *prop_size,
> +                                                    Error **errp)
> +{
> +    const struct fdt_property *prop = NULL;
> +    void *fdt = current_machine->fdt;
> +    g_autoptr(GString) nodename = NULL;
> +    const char *propname = NULL;
> +    int path_len = strlen(fullpath);
> +    int node = 0; /* default to root node '/' */
> +    int i, idx = -1;
> +
> +    /*
> +     * We'll assume that we're dealing with a property. libfdt
> +     * does not have an API to find a property given the full
> +     * path, but it does have an API to find a property inside
> +     * a node.
> +     */
> +    nodename = g_string_new("");
> +
> +    for (i = path_len - 1; i >= 0; i--) {
> +        if (fullpath[i] == '/') {
> +            idx = i;
> +            break;
> +        }
> +    }
> +
> +    if (idx == -1) {
> +        error_setg(errp, "FDT paths must contain at least one '/' character");
> +        return NULL;
> +    }
> +
> +    if (idx == path_len - 1) {
> +        error_setg(errp, "FDT paths can't end with a '/' character");
> +        return NULL;
> +    }
> +
> +    propname = &fullpath[idx + 1];
> +
> +    if (idx != 0) {
> +        g_string_append_len(nodename, fullpath, idx);
> +
> +        node = fdt_path_offset(fdt, nodename->str);
> +        if (node < 0) {
> +            error_setg(errp, "node '%s' of property '%s' not found in FDT",
> +                       nodename->str, propname);
> +            return NULL;
> +        }
> +    } else {
> +        /* idx = 0 means that it's a property of the root node */
> +        g_string_append(nodename, "/");
> +    }
> +
> +    prop = fdt_get_property(fdt, node, propname, prop_size);
> +    if (!prop) {
> +        error_setg(errp, "property '%s' not found in node '%s' in FDT",
> +                   propname, nodename->str);
> +        return NULL;
> +    }
> +
> +    return prop;
> +}
> +
>  void fdt_info(const char *fullpath, Error **errp)
>  {
> -    int node;
> +    const struct fdt_property *prop = NULL;
> +    Error *local_err = NULL;
> +    int node, prop_size;
>  
>      if (!current_machine->fdt) {
>          error_setg(errp, "Unable to find the machine FDT");
> @@ -784,10 +849,16 @@ void fdt_info(const char *fullpath, Error **errp)
>      }
>  
>      node = fdt_path_offset(current_machine->fdt, fullpath);
> -    if (node < 0) {
> -        error_setg(errp, "node '%s' not found in FDT", fullpath);
> +    if (node >= 0) {
> +        fdt_print_node(node, 0, fullpath);
> +        return;
> +    }
> +
> +    prop = fdt_find_property(fullpath, &prop_size, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
>          return;
>      }
>  
> -    fdt_print_node(node, 0, fullpath);
> +    fdt_print_property(fullpath, prop->data, prop_size, 0);
>  }
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


