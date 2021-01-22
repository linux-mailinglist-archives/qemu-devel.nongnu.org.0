Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA8300542
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:25:19 +0100 (CET)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xNG-0001qQ-DM
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2xKV-0007tX-IW
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2xKS-0002xl-E7
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611325340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FFU7TXKI5nHkdhydv0n3oLgGrWv2Sn77wOFkFrwXh7A=;
 b=DRmhg2FnE1FQ8iY05or8BuSu/5AsEHFHCd2Y7FLGf31rWm3iCRSTR1EvuCqLMmd+EbqPpl
 mgUSd+VxOwloyWDkO38oXLPB6ikAXxODc5wEOM/g/atCKOv/urNWR0n/lsubrE8XDa+qLs
 dMC+eHJKKDISnayRZOqkr4Z+iHBwqvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-g-0RHJU8O8-yv8J5zJ4NXQ-1; Fri, 22 Jan 2021 09:22:18 -0500
X-MC-Unique: g-0RHJU8O8-yv8J5zJ4NXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 991C4107ACE3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:22:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 684605C224;
 Fri, 22 Jan 2021 14:22:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4C7D113865F; Fri, 22 Jan 2021 15:22:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 07/25] keyval: introduce keyval_parse_into
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-8-pbonzini@redhat.com>
Date: Fri, 22 Jan 2021 15:22:15 +0100
In-Reply-To: <20210118163113.780171-8-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:55 -0500")
Message-ID: <87o8hh2grs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Allow parsing multiple keyval sequences into the same dictionary.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I trust later patches will make the need for this obvious.

I guess we could use qdict_join() instead.  Observation, not objection.

> ---
>  include/qemu/option.h |  2 ++
>  util/keyval.c         | 39 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/include/qemu/option.h b/include/qemu/option.h
> index f73e0dc7d9..092e291c37 100644
> --- a/include/qemu/option.h
> +++ b/include/qemu/option.h
> @@ -147,6 +147,8 @@ void qemu_opts_print_help(QemuOptsList *list, bool print_caption);
>  void qemu_opts_free(QemuOptsList *list);
>  QemuOptsList *qemu_opts_append(QemuOptsList *dst, QemuOptsList *list);
>  
> +QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
> +                         bool *p_help, Error **errp);
>  QDict *keyval_parse(const char *params, const char *implied_key,
>                      bool *help, Error **errp);
>  
> diff --git a/util/keyval.c b/util/keyval.c
> index e7f708cd1e..1d4ca12129 100644
> --- a/util/keyval.c
> +++ b/util/keyval.c
> @@ -436,13 +436,12 @@ static QObject *keyval_listify(QDict *cur, GSList *key_of_cur, Error **errp)
>   * If @p_help is not NULL, store whether help is requested there.
>   * If @p_help is NULL and help is requested, fail.
>   *
> - * On success, return a dictionary of the parsed keys and values.
> + * On success, return @dict, now filled with the parsed keys and values.
>   * On failure, store an error through @errp and return NULL.

May @dict be modified then?

>   */
> -QDict *keyval_parse(const char *params, const char *implied_key,
> -                    bool *p_help, Error **errp)
> +QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
> +                         bool *p_help, Error **errp)
>  {
> -    QDict *qdict = qdict_new();
>      QObject *listified;
>      g_autofree char *dup;
>      char *s;
> @@ -452,7 +451,6 @@ QDict *keyval_parse(const char *params, const char *implied_key,
>      while (*s) {
>          s = keyval_parse_one(qdict, s, implied_key, &help, errp);
>          if (!s) {
> -            qobject_unref(qdict);
>              return NULL;
>          }
>          implied_key = NULL;
> @@ -462,15 +460,42 @@ QDict *keyval_parse(const char *params, const char *implied_key,
>          *p_help = help;
>      } else if (help) {
>          error_setg(errp, "Help is not available for this option");
> -        qobject_unref(qdict);
>          return NULL;
>      }
>  
>      listified = keyval_listify(qdict, NULL, errp);
>      if (!listified) {
> -        qobject_unref(qdict);
>          return NULL;
>      }
>      assert(listified == QOBJECT(qdict));
>      return qdict;
>  }
> +
> +/*
> + * Parse @params in QEMU's traditional KEY=VALUE,... syntax.
> + *
> + * If @implied_key, the first KEY= can be omitted.  @implied_key is
> + * implied then, and VALUE can't be empty or contain ',' or '='.
> + *
> + * A parameter "help" or "?" without a value isn't added to the
> + * resulting dictionary, but instead is interpreted as help request.
> + * All other options are parsed and returned normally so that context
> + * specific help can be printed.
> + *
> + * If @p_help is not NULL, store whether help is requested there.
> + * If @p_help is NULL and help is requested, fail.
> + *
> + * On success, return a dictionary of the parsed keys and values.
> + * On failure, store an error through @errp and return NULL.
> + */
> +QDict *keyval_parse(const char *params, const char *implied_key,
> +                    bool *p_help, Error **errp)
> +{
> +    QDict *qdict = qdict_new();
> +    QDict *ret = keyval_parse_into(qdict, params, implied_key, p_help, errp);
> +
> +    if (!ret) {
> +        qobject_unref(qdict);
> +    }
> +    return ret;
> +}


