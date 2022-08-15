Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35BF5935CA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 20:42:11 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNf2Q-0006Je-TH
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 14:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oNez0-00040m-IT
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 14:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oNeyx-0002Hk-Mk
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 14:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660588714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZ9/6Ntm7D0Hzk0M34sRW9uFtEtdnPsUxg4HFmEsWFg=;
 b=K1USAInX3x9NwC9UpcN+OB0FG72OAcL5okVPUcf/qIgB8Lb5QK5+sBEy3cuqP00NDfCdhz
 mvouLWzF5mj4GqydnPbBcqCW6IpiJhbTKzUK9umfHkxFukr3TgqqxxDPCdpXtFBoy8+pyv
 UY20DZ43Dw7pYFAvpLsHZBhjvp1ngsA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-N12xsZS7Oj2TI1XokBj7fQ-1; Mon, 15 Aug 2022 14:38:32 -0400
X-MC-Unique: N12xsZS7Oj2TI1XokBj7fQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfaad0000000b002207af3c7b2so1442354wrc.14
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 11:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=WZ9/6Ntm7D0Hzk0M34sRW9uFtEtdnPsUxg4HFmEsWFg=;
 b=WKrSpBqgmmIGgFZd6dvR58yO16mT0RNt1MM/3iHzQUn4WwOeMQ4qbq+8VPu0nE3kro
 3SUToJjHhuTIvD2DSnxE5gZf4Ri5LE4u5x7phQNxgn46YaNNyIbhlhT4BKdzqaXiw5bu
 NrxWT0Q15zj/hEPP8J56tzG4UP+IaQPGs2Ca8DlBAKY/NYImgCPWGl57ywB3GrC73VEz
 9dJiSUj0KeJ0SfF6n/Js+OpVj23VujEyGjD3PNT1ex1J5ve+N8XMLsrZBx1bASf4l6Jz
 yXGsfcuYRDNWTz+fSwGg/ntlC2i7vj1NsbB6l50YhfbfegNr//JSHpDXGhEiysu34yjh
 h5/w==
X-Gm-Message-State: ACgBeo1HoHVvwkKNv1slMc0dxw/AZMulMEb2Px+HtNR8EMQgp74xEVXM
 6tXR8MB+9M12mkYhdLEcB8L7zxORPG899LhGAbpHs/B1YyqzAN9ju1fprTqebnaDf+KijlMaY4X
 RfhdTHHcCie8XwBI=
X-Received: by 2002:a5d:64e2:0:b0:220:7dc6:1353 with SMTP id
 g2-20020a5d64e2000000b002207dc61353mr9754620wri.411.1660588711572; 
 Mon, 15 Aug 2022 11:38:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7wQjYPqsVgctoqrxGh72IjHyAOvfcdbAuJCMIPzwwojG78/ebtHU50JCqseh2dbr2hv7PMsQ==
X-Received: by 2002:a5d:64e2:0:b0:220:7dc6:1353 with SMTP id
 g2-20020a5d64e2000000b002207dc61353mr9754614wri.411.1660588711337; 
 Mon, 15 Aug 2022 11:38:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b003a319bd3278sm10814726wmq.40.2022.08.15.11.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:38:30 -0700 (PDT)
Date: Mon, 15 Aug 2022 19:38:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au
Subject: Re: [PATCH for-7.2 v2 20/20] hmp, device_tree.c: add 'info fdt
 <property>' support
Message-ID: <YvqSpGchfWoQgqZd@work-vm>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-21-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-21-danielhb413@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Add a new optional 'propname' parameter to x-query-fdt to specify the
> property of a given node. If it's present, we'll proceed to find the
> node as usual but, instead of printing the node, we'll attempt to find
> the property and print it standalone.
> 
> After this change, if an user wants to print just the value of 'cpu' inside
> /cpu/cpu-map(...) from an ARM FDT, we can do it:
> 
> (qemu) info fdt /cpus/cpu-map/socket0/cluster0/core0 cpu
> /cpus/cpu-map/socket0/cluster0/core0/cpu = <0x8001>
> 
> Or the 'ibm,my-dma-window' from the v-scsi device inside the pSeries
> FDT:
> 
> (qemu) info fdt /vdevice/v-scsi@71000003 ibm,my-dma-window
> /vdevice/v-scsi@71000003/ibm,my-dma-window = <0x71000003 0x0 0x0 0x0 0x10000000>
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands-info.hx         |  9 +++++----
>  include/sysemu/device_tree.h |  2 ++
>  monitor/hmp-cmds.c           |  5 ++++-
>  monitor/qmp-cmds.c           |  8 +++++---
>  qapi/machine.json            |  4 +++-
>  softmmu/device_tree.c        | 29 ++++++++++++++++++++++++-----
>  6 files changed, 43 insertions(+), 14 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 743b48865d..17d6ee4d30 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -924,13 +924,14 @@ ERST
>  
>      {
>          .name       = "fdt",
> -        .args_type  = "nodepath:s",
> -        .params     = "nodepath",
> -        .help       = "show firmware device tree node given its path",
> +        .args_type  = "nodepath:s,propname:s?",
> +        .params     = "nodepath [propname]",
> +        .help       = "show firmware device tree node or property given its path",
>          .cmd        = hmp_info_fdt,
>      },

Yeh that seems easier to me; from HMP:


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  SRST
>    ``info fdt``
> -    Show a firmware device tree node given its path. Requires libfdt.
> +    Show a firmware device tree node or property given its path.
> +    Requires libfdt.
>  ERST
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 057d13e397..551a02dee2 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -140,6 +140,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>  void qemu_fdt_dumpdtb(void *fdt, int size);
>  void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>  HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> +                                          bool has_propname,
> +                                          const char *propname,
>                                            Error **errp);
>  
>  /**
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index accde90380..df8493adc5 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2488,8 +2488,11 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>  void hmp_info_fdt(Monitor *mon, const QDict *qdict)
>  {
>      const char *nodepath = qdict_get_str(qdict, "nodepath");
> +    const char *propname = qdict_get_try_str(qdict, "propname");
>      Error *err = NULL;
> -    g_autoptr(HumanReadableText) info = qmp_x_query_fdt(nodepath, &err);
> +    g_autoptr(HumanReadableText) info = NULL;
> +
> +    info = qmp_x_query_fdt(nodepath, propname != NULL, propname, &err);
>  
>      if (hmp_handle_error(mon, err)) {
>          return;
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index db2c6aa7da..ca2a96cdf7 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -604,9 +604,10 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>      return qemu_fdt_qmp_dumpdtb(filename, errp);
>  }
>  
> -HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
> +                                   const char *propname, Error **errp)
>  {
> -    return qemu_fdt_qmp_query_fdt(nodepath, errp);
> +    return qemu_fdt_qmp_query_fdt(nodepath, has_propname, propname, errp);
>  }
>  #else
>  void qmp_dumpdtb(const char *filename, Error **errp)
> @@ -614,7 +615,8 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>      error_setg(errp, "dumpdtb requires libfdt");
>  }
>  
> -HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
> +                                   const char *propname, Error **errp)
>  {
>      error_setg(errp, "this command requires libfdt");
>  
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 96cff541ca..c15ce60f46 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1688,6 +1688,7 @@
>  # Query for FDT element (node or property). Requires 'libfdt'.
>  #
>  # @nodepath: the path of the FDT node to be retrieved
> +# @propname: name of the property inside the node
>  #
>  # Features:
>  # @unstable: This command is meant for debugging.
> @@ -1697,6 +1698,7 @@
>  # Since: 7.2
>  ##
>  { 'command': 'x-query-fdt',
> -  'data': { 'nodepath': 'str' },
> +  'data': { 'nodepath': 'str',
> +            '*propname': 'str' },
>    'returns': 'HumanReadableText',
>    'features': [ 'unstable' ]  }
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 902a7f680b..be7b7e297e 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -785,23 +785,42 @@ static void fdt_format_node(GString *buf, int node, int depth,
>      g_string_append_printf(buf, "%*s}\n", padding, "");
>  }
>  
> -HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> +                                          bool has_propname,
> +                                          const char *propname,
> +                                          Error **errp)
>  {
>      g_autoptr(GString) buf = g_string_new("");
> -    int node;
> +    const struct fdt_property *prop = NULL;
> +    void *fdt = current_machine->fdt;
> +    int node, prop_size;
>  
> -    if (!current_machine->fdt) {
> +    if (!fdt) {
>          error_setg(errp, "Unable to find the machine FDT");
>          return NULL;
>      }
>  
> -    node = fdt_path_offset(current_machine->fdt, nodepath);
> +    node = fdt_path_offset(fdt, nodepath);
>      if (node < 0) {
>          error_setg(errp, "node '%s' not found in FDT", nodepath);
>          return NULL;
>      }
>  
> -    fdt_format_node(buf, node, 0, nodepath);
> +    if (!has_propname) {
> +        fdt_format_node(buf, node, 0, nodepath);
> +    } else {
> +        g_autofree char *proppath = g_strdup_printf("%s/%s", nodepath,
> +                                                    propname);
> +
> +        prop = fdt_get_property(fdt, node, propname, &prop_size);
> +        if (!prop) {
> +            error_setg(errp, "property '%s' not found in node '%s' in FDT",
> +                       propname, nodepath);
> +            return NULL;
> +        }
> +
> +        fdt_format_property(buf, proppath, prop->data, prop_size, 0);
> +    }
>  
>      return human_readable_text_from_str(buf);
>  }
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


