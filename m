Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE03B80EA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:41:01 +0200 (CEST)
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXeO-0003Mh-JT
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyXdO-0002gr-Rt
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:39:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyXdL-0006D9-Bm
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625049594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dq030jJGyD0tBNtXRJGBf7DAainV0VXIawQ9nKjlI7w=;
 b=M0icVcU6T46tBYUReiLm5hoAy2C8JpY5VnZEUn4G+M/tgEl6Tr9hHzmOI6vVSY+VqyUjYg
 UOTBg5ZS3UUErWKfkC+3kvMbyob83v1nx56dFNZfKddfoZe8bx5QsExfs4qMZwuCYjsPaI
 Pyv/SnQp1CcVDxwrX/vWQGa9l7rBPyI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-ROlaaXMlP_6a1uk7Tu9S_A-1; Wed, 30 Jun 2021 06:39:53 -0400
X-MC-Unique: ROlaaXMlP_6a1uk7Tu9S_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 n129-20020a1cbd870000b02901ed2c72a2aeso492967wmf.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dq030jJGyD0tBNtXRJGBf7DAainV0VXIawQ9nKjlI7w=;
 b=PnwMjQZ3pVmfRYcWoiofleT0skXvKewwYUgrNOQ8x4/fbDcw47291QljZWPsQYo7f+
 dh9c+WaRDtB6RxuPz5BKSy08OnncsEO6ChqswuLtZT8PG4cWW9z37ArPN539ElJkBdWC
 GuTj6pOUWcGNaPD1BJsByQyNjC42RjnLnPBFfhlPLOTrUqd6Tqcd/0+VvnXRMy9FcLiV
 1QdRef8W4QUjEEoXn8J+XVvnYS1ui+oq+flNuUbgvWdfxvC0EKsBk5fo8uUBC1UOg+QB
 2lecCk2M3UFEjrwiTK915lrwKOk5HMeb+YHEsTVqRxnldv1Qi/30IrlVR0pSBmVc4GEl
 sPJg==
X-Gm-Message-State: AOAM5320Vj5K3DHq9EkYygmb85NflwxmAFfyOwIVRyrbbeH3XILzduPV
 WDmjqvwQpqpSlMu8xbT4jNIc6kd7JG+Vn00JSsenppmHui3RC/4XfD/hPIdV9aq8MRIhX95KpG8
 fHXmaVAd4N6QPS1o=
X-Received: by 2002:a05:600c:3782:: with SMTP id
 o2mr8369591wmr.152.1625049590781; 
 Wed, 30 Jun 2021 03:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5r3AQhhRFqXOGCxMt7eGWWKicCclacSot4KFUZk+iZa73ybrFFHdD+o8cuLejxedeGiR8sQ==
X-Received: by 2002:a05:600c:3782:: with SMTP id
 o2mr8369566wmr.152.1625049590569; 
 Wed, 30 Jun 2021 03:39:50 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id u15sm5154076wmq.1.2021.06.30.03.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 03:39:49 -0700 (PDT)
Date: Wed, 30 Jun 2021 11:39:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PULL 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Message-ID: <YNxJ87c2ajCw1Oe4@work-vm>
References: <20210625031136.2775308-1-chen.zhang@intel.com>
 <20210625031136.2775308-4-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210625031136.2775308-4-chen.zhang@intel.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhang Chen (chen.zhang@intel.com) wrote:
> Add hmp_passthrough_filter_add and hmp_passthrough_filter_del make user
> can maintain object network passthrough list in human monitor
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  hmp-commands.hx       | 26 +++++++++++++++
>  include/monitor/hmp.h |  2 ++
>  monitor/hmp-cmds.c    | 76 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8e45bce2cd..426a7d6cda 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1292,6 +1292,32 @@ SRST
>    Remove host network device.
>  ERST
>  
> +    {
> +        .name       = "passthrough_filter_add",
> +        .args_type  = "protocol:s?,object-name:s,src:s?,dst:s?",
> +        .params     = "[protocol] object-name [src] [dst]",
> +        .help       = "Add network passthrough rule to object passthrough list",
> +        .cmd        = hmp_passthrough_filter_add,
> +    },
> +
> +SRST
> +``passthrough_filter_add``
> +  Add network stream to object passthrough list.
> +ERST
> +
> +    {
> +        .name       = "passthrough_filter_del",
> +        .args_type  = "protocol:s?,object-name:s,src:s?,dst:s?",
> +        .params     = "[protocol] object-name [src] [dst]",
> +        .help       = "Delete network passthrough rule from object passthrough list",
> +        .cmd        = hmp_passthrough_filter_del,
> +    },
> +
> +SRST
> +``passthrough_filter_del``
> +  Delete network stream from object passthrough list.
> +ERST
> +
>      {
>          .name       = "object_add",
>          .args_type  = "object:S",
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 3baa1058e2..ba6987e552 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -77,6 +77,8 @@ void hmp_device_del(Monitor *mon, const QDict *qdict);
>  void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
>  void hmp_netdev_add(Monitor *mon, const QDict *qdict);
>  void hmp_netdev_del(Monitor *mon, const QDict *qdict);
> +void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict);
> +void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict);
>  void hmp_getfd(Monitor *mon, const QDict *qdict);
>  void hmp_closefd(Monitor *mon, const QDict *qdict);
>  void hmp_sendkey(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 0942027208..26ff316c93 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1638,6 +1638,82 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
>      hmp_handle_error(mon, err);
>  }
>  
> +void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict)
> +{
> +    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
> +    char *src, *dst;
> +    Error *err = NULL;
> +
> +    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
> +    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
> +    src = g_strdup(qdict_get_try_str(qdict, "src"));
> +    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
> +
> +    if (src) {
> +        spec->source = g_new0(InetSocketAddressBase, 1);
> +
> +        if (inet_parse_base(spec->source, src, NULL)) {
> +            monitor_printf(mon, "Incorrect passthrough src address\n");
> +            goto out;

Are you leaking spec->source ?

> +        }
> +    }
> +
> +    if (dst) {
> +        spec->destination = g_new0(InetSocketAddressBase, 1);
> +
> +        if (inet_parse_base(spec->destination, dst, NULL)) {
> +            monitor_printf(mon, "Incorrect passthrough dst address\n");
> +            goto out;
> +        }
> +    }
> +
> +    qmp_passthrough_filter_add(spec, &err);
> +
> +out:
> +    g_free(src);
> +    g_free(dst);
> +
> +    hmp_handle_error(mon, err);
> +}
> +
> +void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict)
> +{
> +    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
> +    char *src, *dst;
> +    Error *err = NULL;
> +
> +    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
> +    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
> +    src = g_strdup(qdict_get_try_str(qdict, "src"));
> +    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
> +
> +    if (src) {
> +        spec->source = g_new0(InetSocketAddressBase, 1);
> +
> +        if (inet_parse_base(spec->source, src, NULL)) {
> +            monitor_printf(mon, "Incorrect passthrough src address\n");
> +            goto out;
> +        }
> +    }
> +
> +    if (dst) {
> +        spec->destination = g_new0(InetSocketAddressBase, 1);
> +
> +        if (inet_parse_base(spec->destination, dst, NULL)) {
> +            monitor_printf(mon, "Incorrect passthrough dst address\n");
> +            goto out;
> +        }
> +    }

You could merge that into something like:

   IPFlowSpec *hmp_parse_IPFlowSpec(Monitor *mon, const QDict *qdict)

Dave

> +    qmp_passthrough_filter_del(spec, &err);
> +
> +out:
> +    g_free(src);
> +    g_free(dst);
> +
> +    hmp_handle_error(mon, err);
> +}
> +
>  void hmp_object_add(Monitor *mon, const QDict *qdict)
>  {
>      const char *options = qdict_get_str(qdict, "object");
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


