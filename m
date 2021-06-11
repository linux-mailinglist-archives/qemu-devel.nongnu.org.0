Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE203A43E6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:17:12 +0200 (CEST)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhyB-0007Fa-Iw
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrhx9-0006Yr-SN
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrhx5-00047f-R5
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623420961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aFnW2z8p5bvYOVefMOJ63v9C/MvXp71LxIaREM6eukQ=;
 b=jRSrbbW0OYawSdje9MqfSqV1zj+YwqZ9eOUJG4UXukclebpqkhoE4Tok9ZizmcJdCxLuDd
 BeUqoYYGtaBGU2YdJqGrurd8LN2jO+Huhg5YxZ515d3HqmHCNwJOsCs+1apgKQ/NRZ0ic2
 cCSWkoQ4B/Pfe8bimjfkPo3jxfU/NC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-B_aD1VxIMee6vz8yZXxgYQ-1; Fri, 11 Jun 2021 10:16:00 -0400
X-MC-Unique: B_aD1VxIMee6vz8yZXxgYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D60701084F4B;
 Fri, 11 Jun 2021 14:15:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4E8D5D723;
 Fri, 11 Jun 2021 14:15:54 +0000 (UTC)
Date: Fri, 11 Jun 2021 09:15:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [RFC PATCH 4/5] qmp: Added qemu-ebpf-rss-path command.
Message-ID: <20210611141552.ezkybuvewffln4dz@redhat.com>
References: <20210609100457.142570-1-andrew@daynix.com>
 <20210609100457.142570-5-andrew@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20210609100457.142570-5-andrew@daynix.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: berrange@redhat.com, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, yuri.benditovich@daynix.com,
 yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 01:04:56PM +0300, Andrew Melnychenko wrote:
> New qmp command to query ebpf helper.
> It's crucial that qemu and helper are in sync and in touch.
> Technically helper should pass eBPF fds that qemu may accept.
> And different qemu's builds may have different eBPF programs and helpers.
> Qemu returns helper that should "fit" to virtio-net.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  monitor/qmp-cmds.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/misc.json     | 29 +++++++++++++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index f7d64a6457..5dd2a58ea2 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -351,3 +351,81 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
>          abort();
>      }
>  }
> +
> +#ifdef CONFIG_LINUX
> +
> +static const char *get_dirname(char *path)
> +{
> +    char *sep;
> +
> +    sep = strrchr(path, '/');
> +    if (sep == path) {
> +        return "/";
> +    } else if (sep) {
> +        *sep = 0;
> +        return path;
> +    }
> +    return ".";
> +}

Seems like this function is duplicating what glib should already be
able to do.

> +
> +static char *find_helper(const char *name)
> +{
> +    char qemu_exec[PATH_MAX];

Stack-allocating a PATH_MAX array for readlink() is poor practice.
Better is to use g_file_read_link().

> +    const char *qemu_dir = NULL;
> +    char *helper = NULL;
> +
> +    if (name == NULL) {
> +        return NULL;
> +    }
> +
> +    if (readlink("/proc/self/exe", qemu_exec, PATH_MAX) > 0) {
> +        qemu_dir = get_dirname(qemu_exec);
> +
> +        helper = g_strdup_printf("%s/%s", qemu_dir, name);
> +        if (access(helper, F_OK) == 0) {
> +            return helper;
> +        }
> +        g_free(helper);
> +    }
> +
> +    helper = g_strdup_printf("%s/%s", CONFIG_QEMU_HELPERDIR, name);

Could we use a compile-time determination of where we were (supposed)
to be installed, and therefore where our helper should be installed,
rather than the dynamic /proc/self/exe munging?

> +    if (access(helper, F_OK) == 0) {
> +        return helper;
> +    }
> +    g_free(helper);
> +
> +    return NULL;
> +}
> +
> +HelperPathList *qmp_query_helper_paths(Error **errp)
> +{
> +    HelperPathList *ret = NULL;
> +    const char *helpers_list[] = {
> +#ifdef CONFIG_EBPF
> +        "qemu-ebpf-rss-helper",
> +#endif

So the intent is that we can make this list larger if we write other
helper binaries.  But this code is in an overall #ifdef CONFIG_LINUX,
which means it won't work on other platforms.

> +#else
> +
> +HelperPathList *qmp_query_helper_paths(Error **errp)
> +{
> +    return NULL;
> +}
> +
> +#endif
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 156f98203e..023bd2120d 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -519,3 +519,32 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @HelperPath:
> +#
> +# Name of the helper and binary location.
> +##

Missing a 'Since: 6.1' line.

> +{ 'struct': 'HelperPath',
> +  'data': {'name': 'str', 'path': 'str'} }
> +
> +##
> +# @query-helper-paths:
> +#
> +# Query specific eBPF RSS helper for current qemu binary.
> +#
> +# Returns: list of object that contains name and path for helper.
> +#
> +# Example:
> +#
> +# -> { "execute": "query-helper-paths" }
> +# <- { "return": [
> +#        {
> +#          "name": "qemu-ebpf-rss-helper",
> +#          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
> +#        }
> +#      ]
> +#    }
> +#
> +##
> +{ 'command': 'query-helper-paths', 'returns': ['HelperPath'] }

Missing an 'if':... to designate that this command is only useful on
Linux.  Or you can make it work on other platforms with my suggestions
above about better utilizing glib functionality at runtime or even
just relying on compile-time use of the configured install locations.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


