Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0776389433
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:55:29 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPTk-0002mX-Q5
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljPB1-00052X-6q
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljPAy-0007JH-PW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621442164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1so9+6WQRgYf9iNKNQsh81wNe0sMDI06/SnCA9MaB7w=;
 b=UkcEMyPZBcJ+VKpVzXrJiCm5crv9Z5LimAyvkb18Vw/GAOaYUyFs+vS/xQs9dlF+ZdUvhB
 rdGlrBhQ8+RxD/4T8Zcz2Ef4bHbsfmBMfiXC9aCclr75+vuNminHa4hE3L3D2AnsYngHHf
 MfZH9xvmZtZRWxhy87DpRjRRB+bR26o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-iDGdF1vgOsCfDMDV59-Qkg-1; Wed, 19 May 2021 12:35:56 -0400
X-MC-Unique: iDGdF1vgOsCfDMDV59-Qkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A515C107ACE3;
 Wed, 19 May 2021 16:35:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0B0D60C04;
 Wed, 19 May 2021 16:35:54 +0000 (UTC)
Date: Wed, 19 May 2021 18:35:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] vl: plumb keyval-based options into -readconfig
Message-ID: <YKU+afy/1ya5Cm2k@merkur.fritz.box>
References: <20210518154014.2999326-1-pbonzini@redhat.com>
 <20210518154059.3002446-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518154059.3002446-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Let -readconfig support parsing configuration file groups into QDict in
> addition to the previous behavior of recording them into QemuOpts.
> This will be used to add back support for objects in -readconfig.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/block/qdict.h    |  2 -
>  include/qapi/qmp/qdict.h |  3 ++
>  softmmu/vl.c             | 82 ++++++++++++++++++++++++++++------------
>  3 files changed, 61 insertions(+), 26 deletions(-)
> 
> diff --git a/include/block/qdict.h b/include/block/qdict.h
> index d8cb502d7d..ced2acfb92 100644
> --- a/include/block/qdict.h
> +++ b/include/block/qdict.h
> @@ -20,8 +20,6 @@ void qdict_join(QDict *dest, QDict *src, bool overwrite);
>  void qdict_extract_subqdict(QDict *src, QDict **dst, const char *start);
>  void qdict_array_split(QDict *src, QList **dst);
>  int qdict_array_entries(QDict *src, const char *subqdict);
> -QObject *qdict_crumple(const QDict *src, Error **errp);
> -void qdict_flatten(QDict *qdict);
>  
>  typedef struct QDictRenames {
>      const char *from;
> diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
> index 9934539c1b..d5b5430e21 100644
> --- a/include/qapi/qmp/qdict.h
> +++ b/include/qapi/qmp/qdict.h
> @@ -64,4 +64,7 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key);
>  
>  QDict *qdict_clone_shallow(const QDict *src);
>  
> +QObject *qdict_crumple(const QDict *src, Error **errp);
> +void qdict_flatten(QDict *qdict);
> +
>  #endif /* QDICT_H */
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 594de0864c..90e491cc0c 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -121,6 +121,7 @@
>  #include "qapi/qapi-commands-misc.h"
>  #include "qapi/qapi-visit-qom.h"
>  #include "qapi/qapi-commands-ui.h"
> +#include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/iothread.h"
>  #include "qemu/guest-random.h"
> @@ -2115,13 +2116,52 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
>      return 0;
>  }
>  
> +/*
> + * Return whether configuration group @group is stored in QemuOpts, or
> + * recorded as one or more QDicts by qemu_record_config_group.
> + */
> +static bool is_qemuopts_group(const char *group)
> +{
> +    return true;
> +}
> +
> +static void qemu_record_config_group(const char *group, QDict *dict, bool from_json, Error **errp)

This is a bit more than 80 characters.

> +{
> +    abort();
> +}
> +
> +/*
> + * Parse non-QemuOpts config file groups, pass the rest to
> + * qemu_config_do_parse.
> + */
> +static void qemu_parse_config_group(const char *group, QDict *qdict,
> +                                    void *opaque, Error **errp)
> +{
> +    QObject *crumpled;
> +    if (is_qemuopts_group(group)) {
> +        qemu_config_do_parse(group, qdict, opaque, errp);
> +        return;
> +    }
> +
> +    crumpled = qdict_crumple(qdict, errp);
> +    if (!crumpled) {
> +        return;
> +    }
> +    if (qobject_type(crumpled) != QTYPE_QDICT) {
> +        assert(qobject_type(crumpled) == QTYPE_QLIST);
> +        error_setg(errp, "Lists cannot be at top level of a configuration section");

This line is too long, too.

> +        return;
> +    }
> +    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
> +}
> +
>  static void qemu_read_default_config_file(Error **errp)
>  {
>      ERRP_GUARD();
>      int ret;
>      g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
>  
> -    ret = qemu_read_config_file(file, qemu_config_do_parse, errp);
> +    ret = qemu_read_config_file(file, qemu_parse_config_group, errp);
>      if (ret < 0) {
>          if (ret == -ENOENT) {
>              error_free(*errp);
> @@ -2130,9 +2170,8 @@ static void qemu_read_default_config_file(Error **errp)
>      }
>  }
>  
> -static int qemu_set_option(const char *str)
> +static void qemu_set_option(const char *str, Error **errp)
>  {
> -    Error *local_err = NULL;
>      char group[64], id[64], arg[64];
>      QemuOptsList *list;
>      QemuOpts *opts;
> @@ -2140,27 +2179,23 @@ static int qemu_set_option(const char *str)
>  
>      rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
>      if (rc < 3 || str[offset] != '=') {
> -        error_report("can't parse: \"%s\"", str);
> -        return -1;
> -    }
> -
> -    list = qemu_find_opts(group);
> -    if (list == NULL) {
> -        return -1;
> -    }
> -
> -    opts = qemu_opts_find(list, id);
> -    if (!opts) {
> -        error_report("there is no %s \"%s\" defined",
> -                     list->name, id);
> -        return -1;
> +        error_setg(errp, "can't parse: \"%s\"", str);
> +        return;
>      }
>  
> -    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
> -        error_report_err(local_err);
> -        return -1;
> +    if (!is_qemuopts_group(group)) {
> +        error_setg(errp, "-set is not supported with %s", group);
> +    } else {
> +        list = qemu_find_opts_err(group, errp);
> +        if (list) {

I think testing for error (like before) is more obvious than testing for
success.  Future patches extending the function could easily miss that
we didn't return in an error case and errp is already set.

With the long lines fixed, and with or without changing this one:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


