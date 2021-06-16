Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416E3A952D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 10:39:33 +0200 (CEST)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltR59-0001fR-KP
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 04:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltR3x-0000FZ-Ob
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltR3u-0007Lu-GP
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623832692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CWTgNVx9SHl2uMYi0iVrn2uJQY1zGDbbSpJBOvZiKFg=;
 b=X2jt6CmLaW3ZU5n69uGNtLNOaA9174ZZHyxR/6kNGE8cvnOnz+moeQyYQ0vlAtfScmSfsZ
 Z8ucC76x+Wz7lbE5HpsxipimxYabModFvEIZ90H8yVS9X2cdJPxp1r+5Ms8JZsIzFEshJ2
 JRED+Rvqe8AQ7h0i+j586dr4nPApXCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-L-lfp65yO8S5BwBqqOGUuQ-1; Wed, 16 Jun 2021 04:38:11 -0400
X-MC-Unique: L-lfp65yO8S5BwBqqOGUuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F69F801106
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:38:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB05F5D9E2;
 Wed, 16 Jun 2021 08:38:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4EFF2113865F; Wed, 16 Jun 2021 10:38:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/11] keyval: introduce keyval_merge
References: <20210610133538.608390-1-pbonzini@redhat.com>
 <20210610133538.608390-3-pbonzini@redhat.com>
Date: Wed, 16 Jun 2021 10:38:08 +0200
In-Reply-To: <20210610133538.608390-3-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 10 Jun 2021 15:35:29 +0200")
Message-ID: <87a6nqkxvz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
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
>  tests/unit/test-keyval.c | 56 ++++++++++++++++++++++++++++++++++++++++
>  util/keyval.c            | 47 +++++++++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+)
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
> index e20c07cf3e..254b51e98c 100644
> --- a/tests/unit/test-keyval.c
> +++ b/tests/unit/test-keyval.c
> @@ -747,6 +747,59 @@ static void test_keyval_visit_any(void)
>      visit_free(v);
>  }
>  
> +static void test_keyval_merge_success(void)
> +{
> +    QDict *old = keyval_parse("opt1=abc,opt2.sub1=def,opt2.sub2=ghi,opt3=xyz",
> +                              NULL, NULL, &error_abort);
> +    QDict *new = keyval_parse("opt1=ABC,opt2.sub2=GHI,opt2.sub3=JKL",
> +                              NULL, NULL, &error_abort);
> +    QDict *combined = keyval_parse("opt1=ABC,opt2.sub1=def,opt2.sub2=GHI,opt2.sub3=JKL,opt3=xyz",
> +                                   NULL, NULL, &error_abort);
> +    Error *err = NULL;
> +
> +    keyval_merge(old, new, &err);
> +    g_assert(!err);
> +    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(old)));
> +    qobject_unref(old);
> +    qobject_unref(new);
> +    qobject_unref(combined);
> +}
> +
> +static void test_keyval_merge_list(void)
> +{
> +    QDict *old = keyval_parse("opt1.0=abc,opt2.0=xyz",
> +                              NULL, NULL, &error_abort);
> +    QDict *new = keyval_parse("opt1.0=def",
> +                              NULL, NULL, &error_abort);
> +    QDict *combined = keyval_parse("opt1.0=abc,opt1.1=def,opt2.0=xyz",
> +                                   NULL, NULL, &error_abort);
> +    Error *err = NULL;
> +
> +    keyval_merge(old, new, &err);
> +    g_assert(!err);
> +    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(old)));
> +    qobject_unref(old);
> +    qobject_unref(new);
> +    qobject_unref(combined);
> +}

This is a success, too.  Suggest to name the two positive tests
_merge_dict() and _merge_list().

> +
> +static void test_keyval_merge_conflict(void)
> +{
> +    QDict *old = keyval_parse("opt2.sub1=def,opt2.sub2=ghi",
> +                              NULL, NULL, &error_abort);
> +    QDict *new = keyval_parse("opt2=ABC",
> +                              NULL, NULL, &error_abort);
> +    Error *err = NULL;
> +
> +    keyval_merge(new, old, &err);

Naming the variables @new and @old us confusing: you pass variable @new
to parameter @old, and @old to @new.

> +    error_free_or_abort(&err);
> +    keyval_merge(old, new, &err);
> +    error_free_or_abort(&err);

Reusing @new is slightly iffy, because keyval_merge() may change its
first argument.

> +
> +    qobject_unref(old);
> +    qobject_unref(new);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>      g_test_init(&argc, &argv, NULL);
> @@ -760,6 +813,9 @@ int main(int argc, char *argv[])
>      g_test_add_func("/keyval/visit/optional", test_keyval_visit_optional);
>      g_test_add_func("/keyval/visit/alternate", test_keyval_visit_alternate);
>      g_test_add_func("/keyval/visit/any", test_keyval_visit_any);
> +    g_test_add_func("/keyval/merge/success", test_keyval_merge_success);
> +    g_test_add_func("/keyval/merge/list", test_keyval_merge_list);
> +    g_test_add_func("/keyval/merge/conflict", test_keyval_merge_conflict);
>      g_test_run();
>      return 0;
>  }
> diff --git a/util/keyval.c b/util/keyval.c
> index be34928813..0797f36e1d 100644
> --- a/util/keyval.c
> +++ b/util/keyval.c
> @@ -310,6 +310,53 @@ static char *reassemble_key(GSList *key)
>      return g_string_free(s, FALSE);
>  }
>  
> +/* Merge two dictionaries.  */

Okay, but where's the result?  Clue: there's no return value, and one of
the dictionaries is const, so the other one must be updated in place.

Also, what's @str for?

> +static void keyval_do_merge(QDict *old, const QDict *new, GString *str, Error **errp)
> +{
> +    size_t save_len = str->len;
> +    const QDictEntry *ent;
> +    QObject *old_value;
> +
> +    for (ent = qdict_first(new); ent; ent = qdict_next(new, ent)) {
> +        old_value = qdict_get(old, ent->key);
> +        if (old_value) {

The two dicts share ent->key, ...

> +            if (qobject_type(old_value) != qobject_type(ent->value)) {
> +                error_setg(errp, "Parameter '%s%s' used inconsistently", str->str, ent->key);
> +                return;

... but the two values cannot be merged.  Hmm.  See case "overwrite"
below.

> +            } else if (qobject_type(ent->value) == QTYPE_QDICT) {
> +                /* Merge sub-dictionaries.  */
> +                g_string_append(str, ent->key);
> +                g_string_append_c(str, '.');
> +                keyval_do_merge(qobject_to(QDict, old_value),
> +                                qobject_to(QDict, ent->value),
> +                                str, errp);
> +                g_string_truncate(str, save_len);
> +                continue;

... and both values are dicts: merge them recursively.  Good.

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

... and both values are lists: concatenate.  Good.

> +            }

> +        }
> +

... and both values are the same other QType (QTYPE_QNULL, QTYPE_QNUM,
QTYPE_QSTRING, QTYPE_QBOOL): overwrite.

Why is overwrite restricted to same QType?  Is there no need for
overwriting say a string with a number?  Hmm, I guess it's okay, because
keyval_parse() only ever produces QTYPE_QSTRING scalars.  May be worth a
comment, preferably in a function contract.

See also the discussion at the end of this message.

> +        qobject_ref(ent->value);
> +        qdict_put_obj(old, ent->key, ent->value);
> +    }
> +}
> +

This function needs a contract.  It should spell out the purpose like
the commit message does, because it's rather peculiar.

With a contract in place, simply deleting the helper's function comment
would work for me.

> +void keyval_merge(QDict *old, const QDict *new, Error **errp)
> +{
> +    GString *str = g_string_new("");

Humor me: blank line between declarations and statements, please.

> +    keyval_do_merge(old, new, str, errp);
> +    g_string_free(str, TRUE);
> +}
> +
>  /*
>   * Listify @cur recursively.
>   * Replace QDicts whose keys are all valid list indexes by QLists.

Now let's go back to the stated purpose: emulate the behavior of
.merge_lists = true QemuOpts groups, merging -readconfig sections and
command-line options in a single QDict, and also to implement -set.

Easy as long as keys are all distinct.  Your code does what I'd expect
it to do.

Not so easy when we have multiple mentions of the same key.

QemuOpts fundamentally stores lists of (key, value) pairs.

Most users only ever look at the last such pair added.  This provides
"last one wins" semantics.

Example 1: repeated option key overwrites

    $ qemu-system-x86_64 -S -display none -monitor stdio -name guest=one,guest=two
    QEMU 6.0.50 monitor - type 'help' for more information
    (qemu) info name
    two

Example 2: even when spread over multiple merge_lists options

    $ qemu-system-x86_64 -S -display none -monitor stdio -name guest=one -name guest=two
    QEMU 6.0.50 monitor - type 'help' for more information
    (qemu) info name
    two

Example 3: -set overwrites

    $ qemu-system-x86_64 -S -display none -monitor stdio -device ide-cd,id=cd0,serial=one -set device.cd0.serial=two
    QEMU 6.0.50 monitor - type 'help' for more information
    (qemu) info qtree
    bus: main-system-bus
    [...]
              dev: ide-cd, id "cd0"
                [...]
                serial = "two"
                [...]

However, some users look at *all* pairs.  This provides "repeated keys
build up a list" semantics.

Example 4: repeated option key builds a list

    $ qemu-system-x86_64 -S -spice tls-port=12345,tls-channel=main,tls-channel=display

This fails for me because I don't have Spice set up (and know basically
nothing about it), but a working variation of it should configure *two*
channels, not one: the second tls-channel= does *not* overwrite the
first one, it configures another channel.

Since -spice is a merge_lists option, this should be the case for
multiple -spice, too.  Merging the two options with keyval_merge() would
not preserve that behavior, I'm afraid.

QemuOpts is... complicated.


