Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC4E3A4CF8
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 07:29:30 +0200 (CEST)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrwD2-0002H6-KK
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 01:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrwCB-0001XQ-4p
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 01:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrwC6-0006X7-0s
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 01:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623475708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NGfgbpW9gTUfw8uUFytWJMLdTvOfHtkgWz4cfMs62KE=;
 b=eISVqXyOjG9OGHVzCxvqilvmbnqeD+tWTwcqyR7rT+cnULi86CI4GptLiCKM3+g4gihCWx
 X4BQIKuhyDjffYpeoTCcV5hdU7h2pSMe9YRhoVZ2t2XpdJnLNAZNfUcb31zdGVzxBkrO5u
 gdHB5a7mNmRaXC7js2xmzqFMs0fPU3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-UNr-NxDbNm2gZyLsrC_HWw-1; Sat, 12 Jun 2021 01:28:25 -0400
X-MC-Unique: UNr-NxDbNm2gZyLsrC_HWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8C401850605;
 Sat, 12 Jun 2021 05:28:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5465919C44;
 Sat, 12 Jun 2021 05:28:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF432113865F; Sat, 12 Jun 2021 07:28:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [RFC PATCH 4/5] qmp: Added qemu-ebpf-rss-path command.
References: <20210609100457.142570-1-andrew@daynix.com>
 <20210609100457.142570-5-andrew@daynix.com>
Date: Sat, 12 Jun 2021 07:28:19 +0200
In-Reply-To: <20210609100457.142570-5-andrew@daynix.com> (Andrew Melnychenko's
 message of "Wed, 9 Jun 2021 13:04:56 +0300")
Message-ID: <87fsxnejnw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, yan@daynix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Melnychenko <andrew@daynix.com> writes:

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
> +
> +static char *find_helper(const char *name)
> +{
> +    char qemu_exec[PATH_MAX];
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
> +    if (access(helper, F_OK) == 0) {
> +        return helper;
> +    }
> +    g_free(helper);
> +
> +    return NULL;
> +}

This returns the helper in the same directory as the running executable,
or as a fallback the helper in CONFIG_QEMU_HELPERDIR.

Checking F_OK (existence) instea of X_OK is odd.

It uses /proc/self/exe to find the running executable's directory.  This
is specific to Linux[*].  You get different behavior on Linux vs. other
systems.

CONFIG_QEMU_HELPERDIR is $prefix/libexec/.

If $prefix is /usr, then qemu-system-FOO is normally installed in
/usr/bin/, and the helper in /usr/libexec/.  We look for the helper in
the wrong place first, and the right one only when it isn't in the wrong
place.  Feels overcomplicated and fragile.

Consider the following scenario:

* The system has a binary package's /usr/bin/qemu-system-x86_64 and
  /usr/libexec/qemu-ebpf-rss-helper installed

* Alice builds her own QEMU with prefix /usr (and no intention to
  install), resulting in bld/qemu-system-x86_64, bld/qemu-ebpf-rss-path,
  and a symlink bld/x86_64-softmmu/qemu-system-x86_64.

Now:

* If Alice runs bld/qemu-system-x86_64, and the host is Linux,
  find_helper() returns bld/qemu-ebpf-rss-path.  Good.

* If the host isn't Linux, it returns /usr/libexec/qemu-ebpf-rss-helper.
  Not good.

* If Alice runs bld/x86_64-softmmu/qemu-system-x86_64, it also returns
  /usr/libexec/qemu-ebpf-rss-helper.  Not good.

> +
> +HelperPathList *qmp_query_helper_paths(Error **errp)
> +{
> +    HelperPathList *ret = NULL;
> +    const char *helpers_list[] = {
> +#ifdef CONFIG_EBPF
> +        "qemu-ebpf-rss-helper",
> +#endif
> +        NULL
> +    };
> +    const char **helper_iter = helpers_list;
> +
> +    for (; *helper_iter != NULL; ++helper_iter) {
> +        char *path = find_helper(*helper_iter);
> +        if (path) {
> +            HelperPath *helper = g_new0(HelperPath, 1);
> +            helper->name = g_strdup(*helper_iter);
> +            helper->path = path;
> +
> +            QAPI_LIST_PREPEND(ret, helper);
> +        }
> +    }
> +
> +    return ret;
> +}
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

The name query-helper-paths is generic, the documented purpose "Query
specific eBPF RSS helper" is specific.

qemu-ebpf-rss-helper isn't necessarily the only helper that needs to be
in sync with QEMU.

I doubt a query command is a good way to help with using the right one.
qemu-system-FOO doesn't really know where the right one is.  Only the
person or program that put them where they are does.

If we want to ensure the right helper runs, we should use a build
identifier compiled into the programs, like we do for modules.

For modules, the program loading a module checks the module's build
identifier matches its own.

For programs talking to each other, the peers together check their build
identifiers match.

For programs where that isn't practical, the management application can
check.

This should be a lot more reliable.

Helpers QEMU code runs itself should be run as
CONFIG_QEMU_HELPERDIR/HELPER, with a suitable user override.  This is
how qemu-bridge-helper works.

Helpers some other program runs are that other program's problem.
They'll probably work the same: built-in default that can be overridden
with configuration.


[*] For detailed advice, see
https://stackoverflow.com/questions/1023306/finding-current-executables-path-without-proc-self-exe


