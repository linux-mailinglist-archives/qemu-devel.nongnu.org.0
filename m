Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A322C34765B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:41:41 +0100 (CET)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP0xI-00068M-Oa
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP0vY-0005aV-8a
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP0vW-0005My-Hr
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616582389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bl0uh4aqhF0JgNmaCMGs8jZ+5G66n3DOTy9WB0g7Zw=;
 b=JrTrX2yl6OU/4B/x96UtO0X6ugHrs7o8SRD072xe87+E/TDQrcyCazBMCwgmKi34Jj1vVp
 HIsuniZfoqnryatV9xm1MvVt9HsImnG/ja+sf4MeW30tO6B+zIhHypAewj9Lo0IkDe/m9u
 QE19pjQqYydpv0WpkiEI8ofXNtdqqm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-6229DDhmNHeVTII98Hvoag-1; Wed, 24 Mar 2021 06:39:47 -0400
X-MC-Unique: 6229DDhmNHeVTII98Hvoag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4B581620;
 Wed, 24 Mar 2021 10:39:46 +0000 (UTC)
Received: from work-vm (ovpn-115-64.ams2.redhat.com [10.36.115.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 528BD19714;
 Wed, 24 Mar 2021 10:39:44 +0000 (UTC)
Date: Wed, 24 Mar 2021 10:39:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V4 4/7] hmp-commands: Add new HMP command for COLO
 passthrough
Message-ID: <YFsW7ZTXx/lAcVWW@work-vm>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-5-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210319035508.113741-5-chen.zhang@intel.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhang Chen (chen.zhang@intel.com) wrote:
> Add hmp_colo_passthrough_add and hmp_colo_passthrough_del make user
> can maintain COLO network passthrough list in human monitor.
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  hmp-commands.hx       | 26 ++++++++++++++++++++++++++
>  include/monitor/hmp.h |  2 ++
>  monitor/hmp-cmds.c    | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index d4001f9c5d..b67a5a04cb 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1335,6 +1335,32 @@ SRST
>    Remove host network device.
>  ERST
>  
> +    {
> +        .name       = "colo_passthrough_add",
> +        .args_type  = "protocol:s,id:s?,src_ip:s?,dst_ip:s?,src_port:i?,dst_port:i?",
> +        .params     = "protocol [id] [src_ip] [dst_ip] [src_port] [dst_port]",

That ordering is a bit unnatural; it's normal to keep ip and port
together;  maybe this would be better as:

   protocol:s,id:s,src:s?,dst:s?

then pass src and dst through inet_parse to get your hostname and port ?

Dave

> +        .help       = "Add network stream to colo passthrough list",
> +        .cmd        = hmp_colo_passthrough_add,
> +    },
> +
> +SRST
> +``colo_passthrough_add``
> +  Add network stream to colo passthrough list.
> +ERST
> +
> +    {
> +        .name       = "colo_passthrough_del",
> +        .args_type  = "protocol:s,id:s?,src_ip:s?,dst_ip:s?,src_port:i?,dst_port:i?",
> +        .params     = "protocol [id] [src_ip] [dst_ip] [src_port] [dst_port]",
> +        .help       = "Delete network stream from colo passthrough list",
> +        .cmd        = hmp_colo_passthrough_del,
> +    },
> +
> +SRST
> +``colo_passthrough_del``
> +  Delete network stream from colo passthrough list.
> +ERST
> +
>      {
>          .name       = "object_add",
>          .args_type  = "object:O",
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index ed2913fd18..3c4943b09f 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -81,6 +81,8 @@ void hmp_device_del(Monitor *mon, const QDict *qdict);
>  void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
>  void hmp_netdev_add(Monitor *mon, const QDict *qdict);
>  void hmp_netdev_del(Monitor *mon, const QDict *qdict);
> +void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict);
> +void hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict);
>  void hmp_getfd(Monitor *mon, const QDict *qdict);
>  void hmp_closefd(Monitor *mon, const QDict *qdict);
>  void hmp_sendkey(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 3c88a4faef..b57e3430ab 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1668,6 +1668,40 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
>      hmp_handle_error(mon, err);
>  }
>  
> +void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict)
> +{
> +    const char *prot = qdict_get_str(qdict, "protocol");
> +    L4_Connection *l4_conn = g_new0(L4_Connection, 1);
> +    Error *err = NULL;
> +
> +    l4_conn->id = g_strdup(qdict_get_try_str(qdict, "id"));
> +    l4_conn->protocol = qapi_enum_parse(&IP_PROTOCOL_lookup, prot, -1, &err);
> +    l4_conn->src_ip = g_strdup(qdict_get_try_str(qdict, "src_ip"));
> +    l4_conn->dst_ip = g_strdup(qdict_get_try_str(qdict, "dst_ip"));
> +    l4_conn->src_port = qdict_get_try_int(qdict, "src_port", 0);
> +    l4_conn->dst_port = qdict_get_try_int(qdict, "dst_port", 0);
> +
> +    qmp_colo_passthrough_add(l4_conn, &err);
> +    hmp_handle_error(mon, err);
> +}
> +
> +void hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict)
> +{
> +    const char *prot = qdict_get_str(qdict, "protocol");
> +    L4_Connection *l4_conn = g_new0(L4_Connection, 1);
> +    Error *err = NULL;
> +
> +    l4_conn->id = g_strdup(qdict_get_try_str(qdict, "id"));
> +    l4_conn->protocol = qapi_enum_parse(&IP_PROTOCOL_lookup, prot, -1, &err);
> +    l4_conn->src_ip = g_strdup(qdict_get_try_str(qdict, "src_ip"));
> +    l4_conn->dst_ip = g_strdup(qdict_get_try_str(qdict, "dst_ip"));
> +    l4_conn->src_port = qdict_get_try_int(qdict, "src_port", 0);
> +    l4_conn->dst_port = qdict_get_try_int(qdict, "dst_port", 0);
> +
> +    qmp_colo_passthrough_del(l4_conn, &err);
> +    hmp_handle_error(mon, err);
> +}
> +
>  void hmp_object_add(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


