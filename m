Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC73C8B45
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:49:08 +0200 (CEST)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jwR-0000Al-9u
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3jvO-0007so-Lr
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3jvM-0003tu-FO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626288478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dUX2ys11XZFTlrZav5k9i5SFjiZxihSTh9KfhNGgxmY=;
 b=EMG3042/UZcruY/bj93NA3xkgI0dL28uza8kbzDd0jtmbo+fHB8AdFJAXF8SGpLV4a3Ac+
 WV+6eD/dxGBejWiTnCUXMUzN1pKi5J5yWs1Y8ZSg8p4QG+Fsozdhc2MOXfWFwvKfQhV2wX
 7yZ3UQHtIH3GUEexzi4tOp9GK6ITHpY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-0FfYwTc7ObiRowVUPJHUZw-1; Wed, 14 Jul 2021 14:47:57 -0400
X-MC-Unique: 0FfYwTc7ObiRowVUPJHUZw-1
Received: by mail-wr1-f70.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so1989714wrs.15
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dUX2ys11XZFTlrZav5k9i5SFjiZxihSTh9KfhNGgxmY=;
 b=ulsvmJgTt6ilCs25ejed6yPYuX2qiwC4FOfJ+EndbzK1atr8hGHDkdypXwxOvUHS6k
 IT6DjmTGfK247XK0ACedCU2/As5Je1bm1CkmZS7gpnAbqhSk7bS5xGatC9q/II9xPJSv
 8wQNa1Z5TAY77AXRGIgY0fYtO7rTKSL1KpP97iuqpw0Vd7xn3mUEPAxPxxWASDjVbEb1
 fKywdRwA2g+FT4t4R2q76JdJMTxx3pnG5X7OgMGYDOxE17gMzuH3ukc1gZKCGeqh9hpi
 DBPKwiVtkDD1PIafGfTDzlooZsn7esBr7f/xEG/u4JoJkUIASgVqvckfeON9eKSdHsJC
 yfwQ==
X-Gm-Message-State: AOAM532lscQTCPL/gfPOXn/W4bIYZ+87zS4A3OUekWO+d3DV1z47/BEt
 5CCOFO/cIitRuyTBFOfvkC0dw1pnuzeqOxlRjbxbTv8bztS/EWQ0qFzcDJkCdiihVvnzwDXbi0/
 i177OHIDCpM4PaDM=
X-Received: by 2002:adf:f885:: with SMTP id u5mr14782498wrp.84.1626288475055; 
 Wed, 14 Jul 2021 11:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXEtK7+4w54586MKzTsmenCJaCuyD3vtqX3IIM8H8eKRNGc0ISe1U4w1Cc8K0h960BQxsKOQ==
X-Received: by 2002:adf:f885:: with SMTP id u5mr14782471wrp.84.1626288474782; 
 Wed, 14 Jul 2021 11:47:54 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r18sm3674956wrt.96.2021.07.14.11.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:47:54 -0700 (PDT)
Date: Wed, 14 Jul 2021 19:47:52 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PULL V2 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Message-ID: <YO8xWHrtParXqSip@work-vm>
References: <20210701091130.3022093-1-chen.zhang@intel.com>
 <20210701091130.3022093-4-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210701091130.3022093-4-chen.zhang@intel.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
>  hmp-commands.hx       | 26 +++++++++++++++++
>  include/monitor/hmp.h |  2 ++
>  monitor/hmp-cmds.c    | 67 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
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
> index 0942027208..b47a2e4850 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1638,6 +1638,73 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
>      hmp_handle_error(mon, err);
>  }
>  
> +IPFlowSpec *hmp_parse_IPFlowSpec(Monitor *mon, const QDict *qdict)
> +{
> +    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
> +    char *src, *dst;
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
> +            g_free(spec->source);
> +            g_free(src);
> +            goto err;

That leaks dst if dst is set.

> +        }
> +        g_free(src);
> +    }
> +
> +    if (dst) {
> +        spec->destination = g_new0(InetSocketAddressBase, 1);
> +
> +        if (inet_parse_base(spec->destination, dst, NULL)) {
> +            monitor_printf(mon, "Incorrect passthrough dst address\n");
> +            g_free(spec->destination);
> +            g_free(dst);

That leaks src, and spec->source

Perhaps the easiest thing would be:
  g_autofree *src = NULL;
  g_autofree *dst = NULL;

and then they'll get free'd up automatically.
Then in err:  you can do a g_free() of spec->source and
spec->destination and finally spec.

Dave

> +            goto err;
> +        }
> +        g_free(dst);
> +    }
> +
> +    return spec;
> +
> +err:
> +    g_free(spec);
> +    return NULL;
> +}
> +
> +void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict)
> +{
> +    IPFlowSpec *spec;
> +    Error *err = NULL;
> +
> +    spec = hmp_parse_IPFlowSpec(mon, qdict);
> +    if (spec) {
> +        qmp_passthrough_filter_add(spec, &err);
> +    }
> +
> +    hmp_handle_error(mon, err);
> +}
> +
> +void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict)
> +{
> +    IPFlowSpec *spec;
> +    Error *err = NULL;
> +
> +    spec = hmp_parse_IPFlowSpec(mon, qdict);
> +    if (spec) {
> +        qmp_passthrough_filter_del(spec, &err);
> +    }
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


