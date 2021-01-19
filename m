Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB702FBAC4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:13:00 +0100 (CET)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sgk-0008HG-M3
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1seG-0006V7-MX
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:10:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1seD-0000vu-9B
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611069018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OP4y+Hov+rqklC6MCtRNidT24dXAxw0UihFmRAbZ+Eg=;
 b=MMCe1CnPc17OJaMVedcNVkTZe90d+8aLQQqjOFwkMxLd6SqAsIyRIuGudGBSLC4s0bICXk
 CHBG+GoPtYVLV732NNUl2bYXd8Pd7kesSwDWyMox7BMLyeapXZBijHC4uIu/wb3LfW7W6x
 UIQQA2Jjco8chtD8XcfkyEzi6rXYD1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-HZYCaT5FN3C0BXGFJlrQJg-1; Tue, 19 Jan 2021 10:10:16 -0500
X-MC-Unique: HZYCaT5FN3C0BXGFJlrQJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 264AA1005513
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 15:10:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3647177F8;
 Tue, 19 Jan 2021 15:10:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 404A7113865F; Tue, 19 Jan 2021 16:10:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/25] qemu-option: move help handling to
 get_opt_name_value
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-3-pbonzini@redhat.com>
Date: Tue, 19 Jan 2021 16:10:12 +0100
In-Reply-To: <20210118163113.780171-3-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:50 -0500")
Message-ID: <87y2gpvu7f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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

> Right now, help options are parsed normally and then checked
> specially in opt_validate, but only if coming from
> qemu_opts_parse_noisily.  has_help_option does the check on its own.
>
> opt_validate() has two callers: qemu_opt_set(), which passes null and is
> therefore unaffected, and opts_do_parse(), which is affected.
>
> opts_do_parse() is called by qemu_opts_do_parse(), which passes null and
> is therefore unaffected, and opts_parse().
>
> opts_parse() is called by qemu_opts_parse() and qemu_opts_set_defaults(),
> which pass null and are therefore unaffected, and
> qemu_opts_parse_noisily().
>
> Move the check from opt_validate to the parsing workhorse of QemuOpts,
> get_opt_name_value.  This will come in handy in the next patch, which
> will raise a warning for "-object memory-backend-ram,share" ("flag" option
> with no =on/=off part) but not for "-object memory-backend-ram,help".
>
> As a result:
>
> - opts_parse and opts_do_parse do not return an error anymore
>   when help is requested; qemu_opts_parse_noisily does not have
>   to work around that anymore.
>
> - various crazy ways to request help are not recognized anymore:
>   - "help=..."
>   - "nohelp" (sugar for "help=off")
>   - "?=..."
>   - "no?" (sugar for "?=off")
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-option.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index 91f4120ce1..5f27d4369d 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -496,8 +496,7 @@ static QemuOpt *opt_create(QemuOpts *opts, const char *name, char *value,
>      return opt;
>  }
>  
> -static bool opt_validate(QemuOpt *opt, bool *help_wanted,
> -                         Error **errp)
> +static bool opt_validate(QemuOpt *opt, Error **errp)
>  {
>      const QemuOptDesc *desc;
>      const QemuOptsList *list = opt->opts->list;
> @@ -505,9 +504,6 @@ static bool opt_validate(QemuOpt *opt, bool *help_wanted,
>      desc = find_desc_by_name(list->desc, opt->name);
>      if (!desc && !opts_accepts_any(list)) {
>          error_setg(errp, QERR_INVALID_PARAMETER, opt->name);
> -        if (help_wanted && is_help_option(opt->name)) {
> -            *help_wanted = true;
> -        }
>          return false;
>      }
>  
> @@ -524,7 +520,7 @@ bool qemu_opt_set(QemuOpts *opts, const char *name, const char *value,
>  {
>      QemuOpt *opt = opt_create(opts, name, g_strdup(value), false);
>  
> -    if (!opt_validate(opt, NULL, errp)) {
> +    if (!opt_validate(opt, errp)) {
>          qemu_opt_del(opt);
>          return false;
>      }
> @@ -760,10 +756,12 @@ void qemu_opts_print(QemuOpts *opts, const char *separator)
>  
>  static const char *get_opt_name_value(const char *params,
>                                        const char *firstname,
> +                                      bool *help_wanted,
>                                        char **name, char **value)
>  {
>      const char *p;
>      size_t len;
> +    bool is_help = false;
>  
>      len = strcspn(params, "=,");
>      if (params[len] != '=') {
> @@ -780,6 +778,7 @@ static const char *get_opt_name_value(const char *params,
>                  *value = g_strdup("off");
>              } else {
>                  *value = g_strdup("on");
> +                is_help = is_help_option(*name);
>              }
>          }
>      } else {
> @@ -791,6 +790,9 @@ static const char *get_opt_name_value(const char *params,
>      }
>  
>      assert(!*p || *p == ',');
> +    if (help_wanted && is_help) {
> +        *help_wanted = true;

Note [1] for later: we only ever set *help_wanted to true.

> +    }
>      if (*p == ',') {
>          p++;
>      }
> @@ -806,7 +808,12 @@ static bool opts_do_parse(QemuOpts *opts, const char *params,
>      QemuOpt *opt;
>  
>      for (p = params; *p;) {
> -        p = get_opt_name_value(p, firstname, &option, &value);
> +        p = get_opt_name_value(p, firstname, help_wanted, &option, &value);
> +        if (help_wanted && *help_wanted) {
> +            g_free(option);
> +            g_free(value);
> +            return false;
> +        }
>          firstname = NULL;
>  
>          if (!strcmp(option, "id")) {
> @@ -817,7 +824,7 @@ static bool opts_do_parse(QemuOpts *opts, const char *params,
>  
>          opt = opt_create(opts, option, value, prepend);
>          g_free(option);
> -        if (!opt_validate(opt, help_wanted, errp)) {
> +        if (!opt_validate(opt, errp)) {
>              qemu_opt_del(opt);
>              return false;
>          }
> @@ -832,7 +839,7 @@ static char *opts_parse_id(const char *params)
>      char *name, *value;
>  
>      for (p = params; *p;) {
> -        p = get_opt_name_value(p, NULL, &name, &value);
> +        p = get_opt_name_value(p, NULL, NULL, &name, &value);
>          if (!strcmp(name, "id")) {
>              g_free(name);
>              return value;
> @@ -848,11 +855,10 @@ bool has_help_option(const char *params)
>  {
>      const char *p;
>      char *name, *value;
> -    bool ret;
> +    bool ret = false;

This initializer is required due to [1].
>  
>      for (p = params; *p;) {
> -        p = get_opt_name_value(p, NULL, &name, &value);
> -        ret = is_help_option(name);
> +        p = get_opt_name_value(p, NULL, &ret, &name, &value);
>          g_free(name);
>          g_free(value);
>          if (ret) {

Works, but I'd prefer get_opt_name_value() to always set *help_wanted
when help_wanted isn't null.  Up to you.

> @@ -937,11 +943,13 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
>      QemuOpts *opts;
>      bool help_wanted = false;
>  
> -    opts = opts_parse(list, params, permit_abbrev, false, &help_wanted, &err);
> -    if (err) {
> +    opts = opts_parse(list, params, permit_abbrev, false,
> +                      opts_accepts_any(list) ? NULL : &help_wanted,
> +                      &err);
> +    if (!opts) {
> +        assert(!!err + !!help_wanted == 1);

Either err or help_wanted.  This is logical inequality.  I'd write it as

           assert(!err != !help_wanted);

or maybe as

           assert(!err ^ !help_wanted);

But your artistic license applies.

>          if (help_wanted) {
>              qemu_opts_print_help(list, true);
> -            error_free(err);
>          } else {
>              error_report_err(err);
>          }

Before the patch, we recognize help requests only if they aren't
captured by a (foolishly named) parameter name.

Afterwards, we recognize only sane help requests regardless of
parameters.  In other words:

  - various crazy ways to request help are not recognized anymore:
    - "help=..."
    - "nohelp" (sugar for "help=off")
    - "?=..."
    - "no?" (sugar for "?=off")

  - "help" is recognized as help request even if there is a (foolishly
    named) parameter "help".  No such parameters exist.

Let's add the last item to the commit message, too.

Preferably with the commit message amended:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


