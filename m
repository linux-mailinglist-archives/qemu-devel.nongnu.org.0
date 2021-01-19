Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6AC2FB6CD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:18:02 +0100 (CET)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rpZ-0003Z4-9h
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1rXB-0007Id-MW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1rX9-0006Tp-E1
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611064738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jGJG968MSVQ4m1MJ4Pk8xr3Flap8wk2SZmkyyn5fu5c=;
 b=WJJobpnGS7ZSoZh8IIH4MHflJZKl9oxuiYrFlvSjHiRyySlOfAYUUAl5vEh8LEHHUf3f6a
 zEfNailo/O0HmRw2s4R7+A6CWxxl88TllNaGwtUZ3Wx8t4PXfdDdgPtkZeVwNWmVg7djrl
 2HlCysRYOmoCdS9TiyHItZ00scYERGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-pCzvygNSMRCrQlMArJkbHQ-1; Tue, 19 Jan 2021 08:58:56 -0500
X-MC-Unique: pCzvygNSMRCrQlMArJkbHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBED11015C88
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 13:58:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E8245D6D1;
 Tue, 19 Jan 2021 13:58:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D3B9A113865F; Tue, 19 Jan 2021 14:58:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/25] qemu-option: clean up id vs. list->merge_lists
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-2-pbonzini@redhat.com>
Date: Tue, 19 Jan 2021 14:58:53 +0100
In-Reply-To: <20210118163113.780171-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:49 -0500")
Message-ID: <87y2gpxc2q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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

> Looking at all merge-lists QemuOptsList

outside tests/

>                                          here is how they access their
> QemuOpts:
>
> reopen_opts in qemu-io-cmds.c ("qemu-img reopen -o")
> 	qemu_opts_find(&reopen_opts, NULL)
>
> empty_opts in qemu-io.c ("qemu-io open -o")
> 	qemu_opts_find(&empty_opts, NULL)
>
> qemu_rtc_opts ("-rtc")
> 	qemu_find_opts_singleton("rtc")
>
> qemu_machine_opts ("-M")
> 	qemu_find_opts_singleton("machine")

Gone since your commit 4988a4ea4d "vl: switch -M parsing to keyval".
Did it change behavior when multiple -M are given, with various id=?  I
didn't look at the patch back then, and I'm not going to look at it
now.  Feel free to ignore the question.

>
> qemu_boot_opts ("-boot")
> 	QTAILQ_FIRST(&qemu_find_opts("bootopts")->head)

That one's in hw/nvram/fw_cfg.c and hw/s390x/ipl.c.  However,
softmmu/vl.c uses

        qemu_opts_find(qemu_find_opts("boot-opts"), NULL);

If the user passes multiple -boot with different ID, we merge the ones
with same ID, and then vl.c gets the (merged) one without ID, but the
other two get the (merged) one that contains the first -boot.  All three
silently ignore the ones they don't get.  Awesomely weird.  I'd call it
a bug.

Test case:

    $ upstream-qemu -S -display none -boot strict=on,id=id -boot strict=off

vl.c uses strict=off, but fw_cfg.c uses strinct=on,id=id.

Outlawing "id" with .merge_lists like this patch does turns the cases
where the two methods yield different results into errors.  A bug fix of
sorts.  Should the commit message should cover it?

I believe we could use qemu_find_opts_singleton() in all three spots.
Not this patch's job.

> qemu_name_opts ("-name")
> 	qemu_opts_foreach->parse_name

Funny way to explain qemu_opts_foreach(qemu_name_opts, parse_name, ...)

> 	parse_name does not use id

We first use .merge-lists = true to merge all -name with the same ID,
then we iterate over all the merges.  Combined effect is "merge ignoring
ID".

> qemu_mem_opts ("-m")
> 	qemu_find_opts_singleton("memory")
>
> qemu_icount_opts ("-icount")
> 	qemu_opts_foreach->do_configuree_icount
> 	do_configure_icount->icount_configure
> 	icount_configure does not use id

Just like qemu_name_opts.  My comments apply, plus one:
s/do_configuree_icount/do_configure_icount/.

A recent addition is missing:

  qemu_action_opts ("-action")

Again, just like qemu_name_opts; my comments apply, plus one aside: this
should not use QemuOpts at all.  Use of qmp_marshal_FOO() is an
anti-pattern.  Needs cleanup.  Not in this patch, and probably not even
in this series.

> qemu_smp_opts ("-smp")
> 	qemu_opts_find(qemu_find_opts("smp-opts"), NULL)

That's one access in vl.c.  There's another one that uses
qemu_find_opts_singleton().  Okay, I think.

> qemu_spice_opts ("-spice")
> 	QTAILQ_FIRST(&qemu_spice_opts.head)

There's also machine_opts in qemu-config.c, but that's only to make
query-command-line-options lie backward-compatibly.

> i.e. they don't need an id.  Sometimes its presence is ignored
> (e.g. when using qemu_opts_foreach), sometimes all the options
> with the id are skipped,

(when using qemu_find_opts_singleton() or qemu_opts_find(list, NULL))

>                          sometimes only the first option on the
> command line is considered.

(when using QTAILQ_FIRST)

> command line is considered.  With this patch we just forbid id
> on merge-lists QemuOptsLists; if the command line still works,
> it has the same semantics as before.

It can break working (if weird) command lines, such as ones relying on
"merge ignoring ID" behavior of -name, -icount, -action.  Okay.

> qemu_opts_create's fail_if_exists parameter is now unnecessary:
>
> - it is unused if id is NULL
>
> - opts_parse only passes false if reached from qemu_opts_set_defaults,
> in which case this patch enforces that id must be NULL
>
> - other callers that can pass a non-NULL id always set it to true
>
> Assert that it is true in the only case where "fail_if_exists" matters,
> i.e. "id && !lists->merge_lists".  This means that if an id is present,
> duplicates are always forbidden, which was already the status quo.

Hmm.

If ->merge_lists, id= is forbidden, and all (id-less) opts are merged
into one.

Else, if id= is specified, it must be unique, i.e. no prior opts with
the same id.

Else, we don't check for prior opts without id.

There's at most one opts with a certain id, but there could be any
number without id.  Is this what we want?

> Discounting the case that aborts as it's not user-controlled (it's
> "just" a matter of inspecting qemu_opts_create callers), the paths
> through qemu_opts_create can be summarized as:
>
> - merge_lists = true: singleton opts with NULL id; non-NULL id fails
>
> - merge_lists = false: always return new opts; non-NULL id fails if dup

This renders the qemu_opts_foreach() silly.  Cleanup is in order, not
necessarily in this patch.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-option.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index c88e159f18..91f4120ce1 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -619,7 +619,17 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
>  {
>      QemuOpts *opts = NULL;
>  
> -    if (id) {
> +    if (list->merge_lists) {
> +        if (id) {
> +            error_setg(errp, QERR_INVALID_PARAMETER, "id");
> +            return NULL;
> +        }
> +        opts = qemu_opts_find(list, NULL);
> +        if (opts) {
> +            return opts;
> +        }
> +    } else if (id) {
> +        assert(fail_if_exists);
>          if (!id_wellformed(id)) {
>              error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id",
>                         "an identifier");
> @@ -629,17 +639,8 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
>          }
>          opts = qemu_opts_find(list, id);
>          if (opts != NULL) {
> -            if (fail_if_exists && !list->merge_lists) {
> -                error_setg(errp, "Duplicate ID '%s' for %s", id, list->name);
> -                return NULL;
> -            } else {
> -                return opts;
> -            }
> -        }
> -    } else if (list->merge_lists) {
> -        opts = qemu_opts_find(list, NULL);
> -        if (opts) {
> -            return opts;
> +            error_setg(errp, "Duplicate ID '%s' for %s", id, list->name);
> +            return NULL;
>          }
>      }
>      opts = g_malloc0(sizeof(*opts));
> @@ -893,7 +894,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
>       * (if unlikely) future misuse:
>       */
>      assert(!defaults || list->merge_lists);
> -    opts = qemu_opts_create(list, id, !defaults, errp);
> +    opts = qemu_opts_create(list, id, !list->merge_lists, errp);
>      g_free(id);
>      if (opts == NULL) {
>          return NULL;

My dread of QemuOpts has been refreshed to its nominal level.


