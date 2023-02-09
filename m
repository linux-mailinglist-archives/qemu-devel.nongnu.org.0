Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9669080E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 12:58:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5Yg-00072W-6Z; Thu, 09 Feb 2023 06:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5Yd-00071y-Lt
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5Yb-0007Kj-RU
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675943861;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1vZk0MwDflGxbOLsAqPN0JPsIUN/9jHnmAhYggVkjeQ=;
 b=N46ALWCePrwM4B5kW9t8nWhU/TTZJXXir3xX2AhmihxZ4s4pJxHcejJ3OL6xrp09OwyGzS
 7SL21vNukYLhIh29Re66RitrejRMugPvNL/aZO3VgAvVOpgEgMHa1mfS7pbXQO/t/Cfza5
 4gl2nnbhCu3/1+nH0v2myZlGT8QWEJo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-RJZDDfA7Mg-cV250lr5Qqg-1; Thu, 09 Feb 2023 06:57:37 -0500
X-MC-Unique: RJZDDfA7Mg-cV250lr5Qqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D697B85CCE2;
 Thu,  9 Feb 2023 11:57:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A568C16022;
 Thu,  9 Feb 2023 11:57:34 +0000 (UTC)
Date: Thu, 9 Feb 2023 11:57:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v3 1/6] migration: moved hmp_split_at_commma() helper
 func to qapi-util.c file
Message-ID: <Y+TfrIyM3XCpIf2a@redhat.com>
References: <20230209102754.81578-1-het.gala@nutanix.com>
 <20230209102754.81578-2-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230209102754.81578-2-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 09, 2023 at 10:27:49AM +0000, Het Gala wrote:
> renamed hmp_split_at_comma() --> str_split_at_comma()
> Shifted helper function to qapi-util.c file. Give external linkage, as
> this function will be handy in coming commit for migration.
> 
> Minor correction:
> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Why have these Reviewed-by tags been added to this patch and all
others in the series ?

In the v2 posting all I see are some comments from Eric, and he
didn't give a Reviewed-by approval. I don't see any feedback from
Markus or David on list for the v2 posting.

> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  include/monitor/hmp.h  |  1 -
>  include/qapi/util.h    |  1 +
>  monitor/hmp-cmds.c     | 19 -------------------
>  net/net-hmp-cmds.c     |  2 +-
>  qapi/qapi-util.c       | 19 +++++++++++++++++++
>  stats/stats-hmp-cmds.c |  2 +-
>  6 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 2220f14fc9..e80848fbd0 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -19,7 +19,6 @@
>  
>  bool hmp_handle_error(Monitor *mon, Error *err);
>  void hmp_help_cmd(Monitor *mon, const char *name);
> -strList *hmp_split_at_comma(const char *str);
>  
>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>  void hmp_info_version(Monitor *mon, const QDict *qdict);
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 81a2b13a33..6c8d8575e3 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -29,6 +29,7 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>                       Error **errp);
>  
>  int parse_qapi_name(const char *name, bool complete);
> +struct strList *str_split_at_comma(const char *str);
>  
>  /*
>   * For any GenericList @list, insert @element at the front.
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 34bd8c67d7..9665e6e0a5 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -39,25 +39,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>      return false;
>  }
>  
> -/*
> - * Split @str at comma.
> - * A null @str defaults to "".
> - */
> -strList *hmp_split_at_comma(const char *str)
> -{
> -    char **split = g_strsplit(str ?: "", ",", -1);
> -    strList *res = NULL;
> -    strList **tail = &res;
> -    int i;
> -
> -    for (i = 0; split[i]; i++) {
> -        QAPI_LIST_APPEND(tail, split[i]);
> -    }
> -
> -    g_free(split);
> -    return res;
> -}
> -
>  void hmp_info_name(Monitor *mon, const QDict *qdict)
>  {
>      NameInfo *info;
> diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
> index 41d326bf5f..a3c597a727 100644
> --- a/net/net-hmp-cmds.c
> +++ b/net/net-hmp-cmds.c
> @@ -72,7 +72,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>                                              migrate_announce_params());
>  
>      qapi_free_strList(params->interfaces);
> -    params->interfaces = hmp_split_at_comma(interfaces_str);
> +    params->interfaces = str_split_at_comma(interfaces_str);
>      params->has_interfaces = params->interfaces != NULL;
>      params->id = g_strdup(id);
>      qmp_announce_self(params, NULL);
> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> index 63596e11c5..e26b9d957b 100644
> --- a/qapi/qapi-util.c
> +++ b/qapi/qapi-util.c
> @@ -152,3 +152,22 @@ int parse_qapi_name(const char *str, bool complete)
>      }
>      return p - str;
>  }
> +
> +/*
> + * Split @str at comma.
> + * A null @str defaults to "".
> + */
> +strList *str_split_at_comma(const char *str)
> +{
> +    char **split = g_strsplit(str ? str : "", ",", -1);
> +    strList *res = NULL;
> +    strList **tail = &res;
> +    int i;
> +
> +    for (i = 0; split[i]; i++) {
> +        QAPI_LIST_APPEND(tail, split[i]);
> +    }
> +
> +    g_free(split);
> +    return res;
> +}
> diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
> index 531e35d128..cfee05a076 100644
> --- a/stats/stats-hmp-cmds.c
> +++ b/stats/stats-hmp-cmds.c
> @@ -174,7 +174,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
>              request->provider = provider_idx;
>              if (names && !g_str_equal(names, "*")) {
>                  request->has_names = true;
> -                request->names = hmp_split_at_comma(names);
> +                request->names = str_split_at_comma(names);
>              }
>              QAPI_LIST_PREPEND(request_list, request);
>          }
> -- 
> 2.22.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


