Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8DE38919C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:42:22 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNOt-0007Vt-Dz
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljNNM-0006in-IB
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljNNF-0006l9-KU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621435235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7mZZNiKJ6gEEI2VRrVE1bj8ItNYUOohFg+SpArgkExQ=;
 b=bMz+oTzSNmmyLDqYrRVZEnGooI/SRxJEflZGvT1sFGIkS3qCVyrfs3HkWq+OsrMafBXc7q
 cbQ4BB9GMpF/C9eLWaJLhNil2TqWhRlLjPDIYhYXid94FpIiNx3OQh0iT7oQi+YGMP4TPa
 TuELOT+gJN5HDeuE93nAP70zPPuC+QA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-TY0V4bZCP-ezzSbHlQ4SeQ-1; Wed, 19 May 2021 10:40:33 -0400
X-MC-Unique: TY0V4bZCP-ezzSbHlQ4SeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0656A106BB24;
 Wed, 19 May 2021 14:40:33 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E26495D6D5;
 Wed, 19 May 2021 14:40:31 +0000 (UTC)
Date: Wed, 19 May 2021 16:40:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] qemu-config: parse configuration files to a QDict
Message-ID: <YKUjXnThNZk6YfTZ@merkur.fritz.box>
References: <20210518154014.2999326-1-pbonzini@redhat.com>
 <20210518154059.3002446-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518154059.3002446-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.05.2021 um 17:40 hat Paolo Bonzini geschrieben:
> Change the parser to put the values into a QDict and pass them
> to a callback.  qemu_config_parse's QemuOpts creation is
> itself turned into a callback function.
> 
> This is useful for -readconfig to support keyval-based options;
> getting a QDict from the parser removes a roundtrip from
> QDict to QemuOpts and then back to QDict.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 34974c4b47..7bca153c6c 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -351,19 +351,19 @@ void qemu_config_write(FILE *fp)
>  }
>  
>  /* Returns number of config groups on success, -errno on error */
> -int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
> +static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
> +                               const char *fname, Error **errp)
>  {
> -    char line[1024], group[64], id[64], arg[64], value[1024];
> +    char line[1024], prev_group[64], group[64], arg[64], value[1024];
>      Location loc;
> -    QemuOptsList *list = NULL;
>      Error *local_err = NULL;
> -    QemuOpts *opts = NULL;
> +    QDict *qdict = NULL;
>      int res = -EINVAL, lno = 0;
>      int count = 0;
>  
>      loc_push_none(&loc);
>      while (fgets(line, sizeof(line), fp) != NULL) {
> -        loc_set_file(fname, ++lno);
> +        ++lno;
>          if (line[0] == '\n') {
>              /* skip empty lines */
>              continue;
> @@ -372,39 +372,39 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error *
>              /* comment */
>              continue;
>          }
> -        if (sscanf(line, "[%63s \"%63[^\"]\"]", group, id) == 2) {
> -            /* group with id */
> -            list = find_list(lists, group, &local_err);
> -            if (local_err) {
> -                error_propagate(errp, local_err);
> -                goto out;
> +        if (line[0] == '[') {
> +            QDict *prev = qdict;
> +            if (sscanf(line, "[%63s \"%63[^\"]\"]", group, value) == 2) {
> +                qdict = qdict_new();
> +                qdict_put_str(qdict, "id", value);
> +                count++;
> +            } else if (sscanf(line, "[%63[^]]]", group) == 1) {
> +                qdict = qdict_new();
> +                count++;
>              }
> -            opts = qemu_opts_create(list, id, 1, NULL);
> -            count++;
> -            continue;
> -        }
> -        if (sscanf(line, "[%63[^]]]", group) == 1) {
> -            /* group without id */
> -            list = find_list(lists, group, &local_err);
> -            if (local_err) {
> -                error_propagate(errp, local_err);
> -                goto out;
> +            if (qdict != prev) {
> +                if (prev) {
> +                    cb(prev_group, prev, opaque, &local_err);
> +                    qobject_unref(prev);
> +                    if (local_err) {
> +                        error_propagate(errp, local_err);
> +                        goto out;
> +                    }
> +                }
> +                strcpy(prev_group, group);
> +                continue;
>              }
> -            opts = qemu_opts_create(list, NULL, 0, &error_abort);
> -            count++;
> -            continue;
>          }
> +        loc_set_file(fname, lno);

Error reporting is going to suffer quite a bit from this delayed
parsing, reporting the last line of a group for most cases now.

I think it's acceptable for an option that we want to get rid of in the
long term anyway, but worth noting.

>          value[0] = '\0';
>          if (sscanf(line, " %63s = \"%1023[^\"]\"", arg, value) == 2 ||
>              sscanf(line, " %63s = \"\"", arg) == 1) {
>              /* arg = value */
> -            if (opts == NULL) {
> +            if (qdict == NULL) {
>                  error_setg(errp, "no group defined");
>                  goto out;
>              }
> -            if (!qemu_opt_set(opts, arg, value, errp)) {
> -                goto out;
> -            }
> +            qdict_put_str(qdict, arg, value);
>              continue;
>          }
>          error_setg(errp, "parse error");
> @@ -418,10 +418,41 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error *
>      res = count;
>  out:
>      loc_pop(&loc);
> +    if (qdict) {
> +        cb(group, qdict, opaque, errp);
> +        qobject_unref(qdict);
> +    }
>      return res;
>  }
>  
> -int qemu_read_config_file(const char *filename, Error **errp)
> +void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
> +{
> +    QemuOptsList **lists = opaque;
> +    const char *id = qdict_get_try_str(qdict, "id");
> +    QemuOptsList *list;
> +    QemuOpts *opts;
> +
> +    list = find_list(lists, group, errp);
> +    if (!list) {
> +        return;
> +    }
> +
> +    opts = qemu_opts_create(list, id, 1, errp);
> +    if (!opts) {
> +        return;
> +    }
> +    if (id) {
> +        qdict_del(qdict, "id");
> +    }
> +    qemu_opts_absorb_qdict(opts, qdict, errp);

Shouldn't we check that qdict is empty now and return an error if there
are any options that the QemuOptsList doesn't accept?

Kevin


