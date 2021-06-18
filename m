Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DC3AC529
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 09:44:20 +0200 (CEST)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu9Ao-0005RM-Kn
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 03:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lu99i-0004GC-9H
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 03:43:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lu99e-0000jV-40
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 03:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624002184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FE8/A0icQ3rvn7VbJOF6+jIS4D0rz1rOzxFlGa2b0HU=;
 b=jMSj4r9LbdaK+t90RP1TytdE32NTHHpwC7dZA2IQtvxsnPE4TcL97+0httns5CDokfefjO
 yK5KInS/4K1sP/hyzsffCZHRoZpqReMN0BVFhXzkGV9PVzE0+yLpCFYe1JKwFuZaouKtKi
 hXYrQ09TVWn4JwTDirFIOLBxLplepWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-fSASEEKAPneXJjkB8sRepg-1; Fri, 18 Jun 2021 03:43:01 -0400
X-MC-Unique: fSASEEKAPneXJjkB8sRepg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BD6419200C1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:43:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2C360864;
 Fri, 18 Jun 2021 07:43:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B0A4D113865F; Fri, 18 Jun 2021 09:42:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 02/11] keyval: introduce keyval_merge
References: <20210617155308.928754-1-pbonzini@redhat.com>
 <20210617155308.928754-3-pbonzini@redhat.com>
Date: Fri, 18 Jun 2021 09:42:58 +0200
In-Reply-To: <20210617155308.928754-3-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 17 Jun 2021 17:52:59 +0200")
Message-ID: <87eeczwrct.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> This patch introduces a function that merges two keyval-produced
> (or keyval-like) QDicts.  It can be used to emulate the behavior of
> .merge_lists = true QemuOpts groups, merging -readconfig sections and
> command-line options in a single QDict, and also to implement -set.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/option.h    |  1 +
>  tests/unit/test-keyval.c | 58 ++++++++++++++++++++++++++++++++
>  util/keyval.c            | 71 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 130 insertions(+)
>
> diff --git a/include/qemu/option.h b/include/qemu/option.h
> index f73e0dc7d9..d89c66145a 100644
> --- a/include/qemu/option.h
> +++ b/include/qemu/option.h
> @@ -149,5 +149,6 @@ QemuOptsList *qemu_opts_append(QemuOptsList *dst, QemuOptsList *list);
>  
>  QDict *keyval_parse(const char *params, const char *implied_key,
>                      bool *help, Error **errp);
> +void keyval_merge(QDict *old, const QDict *new, Error **errp);
>  
>  #endif
> diff --git a/tests/unit/test-keyval.c b/tests/unit/test-keyval.c
> index e20c07cf3e..af0581ae6c 100644
> --- a/tests/unit/test-keyval.c
> +++ b/tests/unit/test-keyval.c
> @@ -747,6 +747,61 @@ static void test_keyval_visit_any(void)
>      visit_free(v);
>  }
>  
> +static void test_keyval_merge_dict(void)
> +{
> +    QDict *first = keyval_parse("opt1=abc,opt2.sub1=def,opt2.sub2=ghi,opt3=xyz",
> +                                NULL, NULL, &error_abort);
> +    QDict *second = keyval_parse("opt1=ABC,opt2.sub2=GHI,opt2.sub3=JKL",
> +                                 NULL, NULL, &error_abort);
> +    QDict *combined = keyval_parse("opt1=ABC,opt2.sub1=def,opt2.sub2=GHI,opt2.sub3=JKL,opt3=xyz",
> +                                   NULL, NULL, &error_abort);
> +    Error *err = NULL;
> +
> +    keyval_merge(first, second, &err);
> +    g_assert(!err);
> +    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(first)));
> +    qobject_unref(first);
> +    qobject_unref(second);
> +    qobject_unref(combined);
> +}
> +
> +static void test_keyval_merge_list(void)
> +{
> +    QDict *first = keyval_parse("opt1.0=abc,opt2.0=xyz",
> +                                NULL, NULL, &error_abort);
> +    QDict *second = keyval_parse("opt1.0=def",
> +                                 NULL, NULL, &error_abort);
> +    QDict *combined = keyval_parse("opt1.0=abc,opt1.1=def,opt2.0=xyz",
> +                                   NULL, NULL, &error_abort);
> +    Error *err = NULL;
> +
> +    keyval_merge(first, second, &err);
> +    g_assert(!err);
> +    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(first)));
> +    qobject_unref(first);
> +    qobject_unref(second);
> +    qobject_unref(combined);
> +}
> +
> +static void test_keyval_merge_conflict(void)
> +{
> +    QDict *first = keyval_parse("opt2=ABC",
> +                                NULL, NULL, &error_abort);
> +    QDict *second = keyval_parse("opt2.sub1=def,opt2.sub2=ghi",
> +                                 NULL, NULL, &error_abort);
> +    QDict *third = qdict_clone_shallow(first);
> +    Error *err = NULL;
> +
> +    keyval_merge(first, second, &err);
> +    error_free_or_abort(&err);
> +    keyval_merge(second, third, &err);
> +    error_free_or_abort(&err);
> +
> +    qobject_unref(first);
> +    qobject_unref(second);
> +    qobject_unref(third);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>      g_test_init(&argc, &argv, NULL);
> @@ -760,6 +815,9 @@ int main(int argc, char *argv[])
>      g_test_add_func("/keyval/visit/optional", test_keyval_visit_optional);
>      g_test_add_func("/keyval/visit/alternate", test_keyval_visit_alternate);
>      g_test_add_func("/keyval/visit/any", test_keyval_visit_any);
> +    g_test_add_func("/keyval/merge/dict", test_keyval_merge_dict);
> +    g_test_add_func("/keyval/merge/list", test_keyval_merge_list);
> +    g_test_add_func("/keyval/merge/conflict", test_keyval_merge_conflict);
>      g_test_run();
>      return 0;
>  }
> diff --git a/util/keyval.c b/util/keyval.c
> index be34928813..8006c5df20 100644
> --- a/util/keyval.c
> +++ b/util/keyval.c
> @@ -310,6 +310,77 @@ static char *reassemble_key(GSList *key)
>      return g_string_free(s, FALSE);
>  }
>  
> +/*
> + * Recursive worker for keyval_merge.  @str is the path that led to the
> + * current dictionary, to be used for error messages.  It is modified
> + * internally but restored before the function returns.
> + */

Slight reformatting to better blend in with other comments in this file:

   /*
    * Recursive worker for keyval_merge
    * @str is the path that led to the current dictionary, to be used for
    * error messages.  It is modified internally but restored before the
    * function returns.
    */

> +static void keyval_do_merge(QDict *dest, const QDict *merged, GString *str, Error **errp)
> +{
> +    size_t save_len = str->len;
> +    const QDictEntry *ent;
> +    QObject *old_value;
> +
> +    for (ent = qdict_first(merged); ent; ent = qdict_next(merged, ent)) {
> +        old_value = qdict_get(dest, ent->key);
> +        if (old_value) {
> +            if (qobject_type(old_value) != qobject_type(ent->value)) {
> +                error_setg(errp, "Parameter '%s%s' used inconsistently", str->str, ent->key);

Long line, break after the string literal.

> +                return;
> +            } else if (qobject_type(ent->value) == QTYPE_QDICT) {
> +                /* Merge sub-dictionaries.  */
> +                g_string_append(str, ent->key);
> +                g_string_append_c(str, '.');
> +                keyval_do_merge(qobject_to(QDict, old_value),
> +                                qobject_to(QDict, ent->value),
> +                                str, errp);
> +                g_string_truncate(str, save_len);
> +                continue;
> +            } else if (qobject_type(ent->value) == QTYPE_QLIST) {
> +                /* Append to old list.  */
> +                QList *old = qobject_to(QList, old_value);
> +                QList *new = qobject_to(QList, ent->value);
> +                const QListEntry *item;
> +                QLIST_FOREACH_ENTRY(new, item) {
> +                    qobject_ref(item->value);
> +                    qlist_append_obj(old, item->value);
> +                }
> +                continue;
> +            } else {
> +                assert(qobject_type(ent->value) == QTYPE_QSTRING);
> +            }
> +        }
> +
> +        qobject_ref(ent->value);
> +        qdict_put_obj(dest, ent->key, ent->value);
> +    }
> +}
> +
> +/* Merge the @merged dictionary into @dest.  The dictionaries are expected to be
> + * returned by the keyval parser, and therefore the only expected scalar type
> + * is the * string.  In case the same path is present in both @dest and @merged,
> + * the semantics are as follows:
> + *
> + * - lists are concatenated
> + *
> + * - dictionaries are merged recursively
> + *
> + * - for scalar values, @merged wins
> + *
> + * In case an error is reported, @dest may already have been modified.
> + *
> + * This function can be used to implement semantics analogous to QemuOpts's
> + * .merge_lists = true case, or to implement -set for options backed by QDicts.
> + */

Contents is already lovely.  Now let's tidy up the formatting:

   /*
    * Merge the @merged dictionary into @dest.
    *
    * The dictionaries are expected to be returned by the keyval parser,
    * and therefore the only expected scalar type is the * string.  In
    * case the same path is present in both @dest and @merged, the
    * semantics are as follows:
    *
    * - lists are concatenated
    *
    * - dictionaries are merged recursively
    *
    * - for scalar values, @merged wins
    *
    * In case an error is reported, @dest may already have been modified.
    *
    * This function can be used to implement semantics analogous to
    * QemuOpts's .merge_lists = true case, or to implement -set for
    * options backed by QDicts.
    */

Let's mention where this fails to be analogous.  Perhaps:

    * Note: while QemuOpts is commonly used so that repeated keys
    * overwrite ("last one wins"), it can also be used so that repeated
    * keys build up a list.  keyval_merge() can be analogous to the
    * former usage, but not the latter.

> +void keyval_merge(QDict *dest, const QDict *merged, Error **errp)
> +{
> +    GString *str;
> +
> +    str = g_string_new("");
> +    keyval_do_merge(dest, merged, str, errp);
> +    g_string_free(str, TRUE);
> +}
> +
>  /*
>   * Listify @cur recursively.
>   * Replace QDicts whose keys are all valid list indexes by QLists.

Since I'm asking only for minor improvements:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


