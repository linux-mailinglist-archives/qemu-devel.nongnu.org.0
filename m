Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A643B58ABBE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:42:46 +0200 (CEST)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxbB-00031t-M1
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJxZO-0000Dt-Mr
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJxZL-00052O-QO
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659706851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WLZm5nSDdc1CO8NbO47x4MIRaxR5c9zccw7HwOcZ4Bk=;
 b=ZknvXYNsvdEwmTMSDttRCNkpOLlIP/8r0vqxKM3vo2z2rFGxu3DBsSJKxHGyt7pbTf2C7k
 w6jwgLFEIU8wVqwPNi9LNjUJWxgxslbICneD3MlUiPTtkJUBCHeXRjjtgDonOTLasf+kWF
 zKF3bc383YkIOJL5tI8kFnjp/+Df/vI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-VlN3tpHXNWe2vE7KO72MWg-1; Fri, 05 Aug 2022 09:40:42 -0400
X-MC-Unique: VlN3tpHXNWe2vE7KO72MWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2538D811E76
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 13:40:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC1B1C27D95;
 Fri,  5 Aug 2022 13:40:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE90B21E6930; Fri,  5 Aug 2022 15:40:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.1] vl: fix [memory] section with -readconfig
References: <20220805100635.493961-1-pbonzini@redhat.com>
Date: Fri, 05 Aug 2022 15:40:40 +0200
In-Reply-To: <20220805100635.493961-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 5 Aug 2022 12:06:35 +0200")
Message-ID: <875yj66c6f.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> The -M memory.* options do not have magic applied to them than the -m
> option, namely no "M" (for mebibytes) is tacked at the end of a
> suffixless value for "-M memory.size".

This sentence is confusing.  Do you mean "like the -m option"?

> This magic is performed by parse_memory_options, and we have to
> do it for both "-m" and the [memory] section of a config file.
> Storing [memory] sections directly to machine_opts_dict changed
> the meaning of
>
>     [memory]
>       size = "1024"
>
> in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
> 8KiB silently).  To avoid this, the [memory] section has to be
> changed back to QemuOpts (combining [memory] and "-m" will work fine
> thanks to .merge_lists being true).
>
> Change parse_memory_options() so that, similar to the older function
> set_memory_options(), it operates after command line parsing is done;
> and also call it where set_memory_options() used to be.
>
> Note, the parsing code uses exit(1) instead of exit(EXIT_FAILURE) to
> match neighboring code.

Thanks for that.

> Reported-by: Markus Armbruster <armbru@redhat.com>
> Fixes: ce9d03fb3f ("machine: add mem compound property", 2022-05-12)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index aabd82e09a..3c23f266e9 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1947,17 +1947,20 @@ static void qemu_resolve_machine_memdev(void)
>      }
>  }
>  
> -static void parse_memory_options(const char *arg)
> +static void parse_memory_options(void)
>  {
> -    QemuOpts *opts;
> +    QemuOpts *opts = qemu_find_opts_singleton("memory");
>      QDict *dict, *prop;
>      const char *mem_str;
> +    Location loc;
>  
> -    opts = qemu_opts_parse_noisily(qemu_find_opts("memory"), arg, true);
>      if (!opts) {
> -        exit(EXIT_FAILURE);
> +        return;
>      }

qemu_find_opts_singleton() never returns null.  Drop the null check,
please.

> +    loc_push_none(&loc);
> +    qemu_opts_loc_restore(opts);
> +
>      prop = qdict_new();
>  
>      if (qemu_opt_get_size(opts, "size", 0) != 0) {

This treats "size=0" like absent size.  Before commit ce9d03fb3f, we
instead checked

       mem_str = qemu_opt_get(opts, "size");
       if (mem_str) {

Makes more sense, doesn't it?

Also, with the new check above, the check below...

           mem_str = qemu_opt_get(opts, "size");
           if (!*mem_str) {
               error_report("missing 'size' option value");
               exit(EXIT_FAILURE);
           }

... looks dead.  We get there only when qemu_opt_get_size() returns
non-zero, which implies a non-blank string.

           /* Fix up legacy suffix-less format */
           if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
               g_autofree char *mib_str = g_strdup_printf("%sM", mem_str);
               qdict_put_str(prop, "size", mib_str);
           } else {
               qdict_put_str(prop, "size", mem_str);
           }
       }

       if (qemu_opt_get(opts, "maxmem")) {
           qdict_put_str(prop, "max-size", qemu_opt_get(opts, "maxmem"));
       }
       if (qemu_opt_get(opts, "slots")) {
           qdict_put_str(prop, "slots", qemu_opt_get(opts, "slots"));
       }

       dict = qdict_new();
> @@ -1987,6 +1990,7 @@ static void parse_memory_options(const char *arg)
>      qdict_put(dict, "memory", prop);
>      keyval_merge(machine_opts_dict, dict, &error_fatal);
>      qobject_unref(dict);
> +    loc_pop(&loc);
>  }
>  
>  static void qemu_create_machine(QDict *qdict)

Commit ce9d03fb3f changed this function's purpose and renamed it from
set_memory_options() to parse_memory_options().

This commit is a partial revert.  It doesn't revert the change of name.
Intentional?

> @@ -2053,8 +2057,7 @@ static bool is_qemuopts_group(const char *group)
>      if (g_str_equal(group, "object") ||
>          g_str_equal(group, "machine") ||
>          g_str_equal(group, "smp-opts") ||
> -        g_str_equal(group, "boot-opts") ||
> -        g_str_equal(group, "memory")) {
> +        g_str_equal(group, "boot-opts")) {
>          return false;
>      }
>      return true;
> @@ -2078,8 +2081,6 @@ static void qemu_record_config_group(const char *group, QDict *dict,
>          machine_merge_property("smp", dict, &error_fatal);
>      } else if (g_str_equal(group, "boot-opts")) {
>          machine_merge_property("boot", dict, &error_fatal);
> -    } else if (g_str_equal(group, "memory")) {
> -        machine_merge_property("memory", dict, &error_fatal);
>      } else {
>          abort();
>      }
> @@ -2882,7 +2883,10 @@ void qemu_init(int argc, char **argv, char **envp)
>                  exit(0);
>                  break;
>              case QEMU_OPTION_m:
> -                parse_memory_options(optarg);
> +                opts = qemu_opts_parse_noisily(qemu_find_opts("memory"), optarg, true);
> +                if (opts == NULL) {
> +                    exit(1);
> +                }
>                  break;
>  #ifdef CONFIG_TPM
>              case QEMU_OPTION_tpmdev:

The previous three hunks revert commit ce9d03fb3f's switch from QemuOpts
to qemu_record_config_group().  Makes sense.

> @@ -3515,6 +3519,9 @@ void qemu_init(int argc, char **argv, char **envp)
>  
>      configure_rtc(qemu_find_opts_singleton("rtc"));
>  
> +    /* Transfer QemuOpts options into machine options */
> +    parse_memory_options();
> +
>      qemu_create_machine(machine_opts_dict);
>  
>      suspend_mux_open();

We used to call set_memory_options() early in qemu_create_machine().
Calling it here now should work, too.  Pointing out to make sure it's
not an accident.


