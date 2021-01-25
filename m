Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC4302530
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:55:43 +0100 (CET)
Received: from localhost ([::1]:44020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41PC-0001ft-Ot
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l41NY-0000oB-HA
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l41NW-0004Qa-NR
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611579237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DWaMQAHxBwtVykCfeLh06XaLYW8hq5zv2AcK2OUmbq0=;
 b=BK2HVi0IWRK5yXojPPj8WoivCTEIUJG+otYqsF5NtlXoylVNI5fUxdt7UgKEK+u5U9SVaF
 i5qD775qRDxVlL5A/IIBai5b1RuPgOFYyBzZgTr/KKGo+BEMQD0AaIP5Tij7y9YiSHTgJo
 wwMa0iWKEi6bdqwVBMFq30oK9J/PyA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-YFpCGuQ-Px26Y4LAOqBD8g-1; Mon, 25 Jan 2021 07:53:56 -0500
X-MC-Unique: YFpCGuQ-Px26Y4LAOqBD8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C97315723
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 12:53:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15F135D72F;
 Mon, 25 Jan 2021 12:53:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B4CC113865F; Mon, 25 Jan 2021 13:53:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 11/25] remove -writeconfig
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-12-pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 13:53:53 +0100
In-Reply-To: <20210118163113.780171-12-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:59 -0500")
Message-ID: <87y2ghfa8u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Like -set and -readconfig, it would not really be too hard to
> extend -writeconfig to parsing mechanisms other than QemuOpts.
> However, the uses of -writeconfig are substantially more
> limited, as it is generally easier to write the configuration
> by hand in the first place.  In addition, -writeconfig does
> not even try to detect cases where it prints incorrect
> syntax (for example if values have a quote in them, since
> qemu_config_parse does not support any kind of escaping.
> Just remove it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I love the "and how give me a config file for all that" idea, but I
agree our -writeconfig is flawed.  I hope we can bring it back in more
useful shape.

No deprecation grace period?

> ---
>  include/qemu/config-file.h |  1 -
>  qemu-options.hx            | 13 ++----------
>  softmmu/vl.c               | 19 -----------------
>  util/qemu-config.c         | 42 --------------------------------------
>  4 files changed, 2 insertions(+), 73 deletions(-)
>
> diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
> index 29226107bd..7d26fe3816 100644
> --- a/include/qemu/config-file.h
> +++ b/include/qemu/config-file.h
> @@ -10,7 +10,6 @@ void qemu_add_opts(QemuOptsList *list);
>  void qemu_add_drive_opts(QemuOptsList *list);
>  int qemu_global_option(const char *str);
>  
> -void qemu_config_write(FILE *fp);
>  int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname);
>  
>  int qemu_read_config_file(const char *filename);
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 62791f56d8..7480b6a03f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4301,23 +4301,14 @@ SRST
>  ERST
>  
>  DEF("readconfig", HAS_ARG, QEMU_OPTION_readconfig,
> -    "-readconfig <file>\n", QEMU_ARCH_ALL)
> +    "-readconfig <file>\n"
> +    "                read config file\n", QEMU_ARCH_ALL)

Sure this belongs?

>  SRST
>  ``-readconfig file``
>      Read device configuration from file. This approach is useful when
>      you want to spawn QEMU process with many command line options but
>      you don't want to exceed the command line character limit.
>  ERST
> -DEF("writeconfig", HAS_ARG, QEMU_OPTION_writeconfig,
> -    "-writeconfig <file>\n"
> -    "                read/write config file\n", QEMU_ARCH_ALL)
> -SRST
> -``-writeconfig file``
> -    Write device configuration to file. The file can be either filename
> -    to save command line and device configuration into file or dash
> -    ``-``) character to print the output to stdout. This can be later
> -    used as input file for ``-readconfig`` option.
> -ERST
>  
>  DEF("no-user-config", 0, QEMU_OPTION_nouserconfig,
>      "-no-user-config\n"
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 7ddf405d76..d34307bf11 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3337,25 +3337,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  display_remote++;
>                  break;
> -            case QEMU_OPTION_writeconfig:
> -                {
> -                    FILE *fp;
> -                    if (strcmp(optarg, "-") == 0) {
> -                        fp = stdout;
> -                    } else {
> -                        fp = fopen(optarg, "w");
> -                        if (fp == NULL) {
> -                            error_report("open %s: %s", optarg,
> -                                         strerror(errno));
> -                            exit(1);
> -                        }
> -                    }
> -                    qemu_config_write(fp);
> -                    if (fp != stdout) {
> -                        fclose(fp);
> -                    }
> -                    break;
> -                }
>              case QEMU_OPTION_qtest:
>                  qtest_chrdev = optarg;
>                  break;
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index e2a700b284..a4a1324c68 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -307,48 +307,6 @@ void qemu_add_opts(QemuOptsList *list)
>      abort();
>  }
>  
> -struct ConfigWriteData {
> -    QemuOptsList *list;
> -    FILE *fp;
> -};
> -
> -static int config_write_opt(void *opaque, const char *name, const char *value,
> -                            Error **errp)
> -{
> -    struct ConfigWriteData *data = opaque;
> -
> -    fprintf(data->fp, "  %s = \"%s\"\n", name, value);
> -    return 0;
> -}
> -
> -static int config_write_opts(void *opaque, QemuOpts *opts, Error **errp)
> -{
> -    struct ConfigWriteData *data = opaque;
> -    const char *id = qemu_opts_id(opts);
> -
> -    if (id) {
> -        fprintf(data->fp, "[%s \"%s\"]\n", data->list->name, id);
> -    } else {
> -        fprintf(data->fp, "[%s]\n", data->list->name);
> -    }
> -    qemu_opt_foreach(opts, config_write_opt, data, NULL);
> -    fprintf(data->fp, "\n");
> -    return 0;
> -}
> -
> -void qemu_config_write(FILE *fp)
> -{
> -    struct ConfigWriteData data = { .fp = fp };
> -    QemuOptsList **lists = vm_config_groups;
> -    int i;
> -
> -    fprintf(fp, "# qemu config file\n\n");
> -    for (i = 0; lists[i] != NULL; i++) {
> -        data.list = lists[i];
> -        qemu_opts_foreach(data.list, config_write_opts, &data, NULL);
> -    }
> -}
> -
>  /* Returns number of config groups on success, -errno on error */
>  int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
>  {


