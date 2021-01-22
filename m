Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9773300522
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:19:30 +0100 (CET)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xHd-0005gC-Qa
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2xDA-0001SM-HP
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2xD8-0007pC-GY
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611324889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+5ESKtcSj58MZlRhn+TcXTkvqMUEqRyQliLawQaNTQ=;
 b=bCtQereNOAkRYkMUa9DN9ds+CmZ1PZTsW5VFJQthDRs6rhl98ncXV4cAlRrvMaVE62WCNP
 3b+KXLq0t+lQII0palVfqGNd5AcFrzUxjjXK/DNK0IPB4tnkGANzq5i0b1wytKLpQWgRvm
 eVhhLxZZH7IcNhG95WRH6Qi6HOE4DcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-0mNHxHVKP4alOCmM2z9bZw-1; Fri, 22 Jan 2021 09:14:47 -0500
X-MC-Unique: 0mNHxHVKP4alOCmM2z9bZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 102D8C73B9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:14:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC92274AC6;
 Fri, 22 Jan 2021 14:14:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 36E6A113865F; Fri, 22 Jan 2021 15:14:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 06/25] tests: convert check-qom-proplist to keyval
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-7-pbonzini@redhat.com>
Date: Fri, 22 Jan 2021 15:14:45 +0100
In-Reply-To: <20210118163113.780171-7-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:30:54 -0500")
Message-ID: <87y2gl2h4a.fsf@dusky.pond.sub.org>
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> The command-line creation test is using QemuOpts.  Switch it to keyval,
> since all the -object command line options will follow
> qemu-storage-daemon and do the same.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

$ gdb tests/check-qom-proplist
[...]
(gdb) r
[...]
# random seed: R02S802948119789b5481f33f9842e3b5d1b
1..9
# Start of qom tests
# Start of proplist tests
ok 1 /qom/proplist/createlist
ok 2 /qom/proplist/createv
Unexpected error in find_list() at ../util/qemu-config.c:24:
There is no option group 'object'

Thread 1 "check-qom-propl" received signal SIGABRT, Aborted.
0x00007ffff7b839e5 in raise () from /lib64/libc.so.6
Missing separate debuginfos, use: dnf debuginfo-install glib2-2.64.6-1.fc32.x86_64 pcre-8.44-2.fc32.x86_64
(gdb) bt
#0  0x00007ffff7b839e5 in raise () from /lib64/libc.so.6
#1  0x00007ffff7b6c895 in abort () from /lib64/libc.so.6
#2  0x000055555557fe08 in error_handle_fatal (
    errp=0x5555555aa300 <error_abort>, err=0x5555555b9580)
    at ../util/error.c:40
#3  0x000055555557ff38 in error_setv (errp=0x5555555aa300 <error_abort>, 
    src=0x5555555914f1 "../util/qemu-config.c", line=24, 
    func=0x555555591ad0 <__func__.5> "find_list", 
    err_class=ERROR_CLASS_GENERIC_ERROR, 
    fmt=0x5555555914d3 "There is no option group '%s'", ap=0x7fffffffd690, 
    suffix=0x0) at ../util/error.c:73
#4  0x0000555555580116 in error_setg_internal (
    errp=0x5555555aa300 <error_abort>, 
    src=0x5555555914f1 "../util/qemu-config.c", line=24, 
    func=0x555555591ad0 <__func__.5> "find_list", 
    fmt=0x5555555914d3 "There is no option group '%s'") at ../util/error.c:97
#5  0x000055555556fdb4 in find_list (lists=0x5555555aa060 <vm_config_groups>, 
    group=0x55555558e97a "object", errp=0x5555555aa300 <error_abort>)
    at ../util/qemu-config.c:24
#6  0x0000555555570426 in qemu_find_opts_err (group=0x55555558e97a "object", 
    errp=0x5555555aa300 <error_abort>) at ../util/qemu-config.c:275
#7  0x000055555555f8bd in user_creatable_del (id=0x55555558e233 "dev0", 
    errp=0x5555555aa300 <error_abort>) at ../qom/object_interfaces.c:312
#8  0x000055555555dc8e in test_dummy_createcmdl ()
    at ../tests/check-qom-proplist.c:439
#9  0x00007ffff7ef429e in g_test_run_suite_internal ()
   from /lib64/libglib-2.0.so.0
#10 0x00007ffff7ef409b in g_test_run_suite_internal ()
   from /lib64/libglib-2.0.so.0
#11 0x00007ffff7ef409b in g_test_run_suite_internal ()
   from /lib64/libglib-2.0.so.0
#12 0x00007ffff7ef478a in g_test_run_suite () from /lib64/libglib-2.0.so.0
#13 0x00007ffff7ef47a5 in g_test_run () from /lib64/libglib-2.0.so.0
#14 0x000055555555e98c in main (argc=1, argv=0x7fffffffdcf8)
    at ../tests/check-qom-proplist.c:655

> ---
>  tests/check-qom-proplist.c | 58 +++++++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 20 deletions(-)
>
> diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
> index 1b76581980..8dba26fb3c 100644
> --- a/tests/check-qom-proplist.c
> +++ b/tests/check-qom-proplist.c
> @@ -21,6 +21,8 @@
>  #include "qemu/osdep.h"
>  
>  #include "qapi/error.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qobject.h"
>  #include "qom/object.h"

I expected this one to go.

>  #include "qemu/module.h"
>  #include "qemu/option.h"
> @@ -400,42 +402,58 @@ static void test_dummy_createlist(void)
>  
>  static void test_dummy_createcmdl(void)
>  {
> -    QemuOpts *opts;
> +    QDict *qdict;
>      DummyObject *dobj;
>      Error *err = NULL;
> +    bool help;
>      const char *params = TYPE_DUMMY \
>                           ",id=dev0," \
>                           "bv=yes,sv=Hiss hiss hiss,av=platypus";
>  
> -    qemu_add_opts(&qemu_object_opts);
> -    opts = qemu_opts_parse(&qemu_object_opts, params, true, &err);
> +    qdict = keyval_parse(params, "qom-type", &help, &err);

Removes the only use of qemu_object_opts.  You should remove
qemu_object_opts, too.

>      g_assert(err == NULL);
> -    g_assert(opts);
> +    g_assert(qdict);
> +    g_assert(!help);
>  
> -    dobj = DUMMY_OBJECT(user_creatable_add_opts(opts, &err));
> +    g_assert(user_creatable_add_dict(qdict, true, &err));
>      g_assert(err == NULL);
> +    qobject_unref(qdict);
> +
> +    dobj = DUMMY_OBJECT(object_resolve_path_component(object_get_objects_root(),
> +                                                      "dev0"));

Why does user_creatable_add_opts() return the object on success, null on
failure, but user_creatable_add_dict() only a rather less useful bool?

>      g_assert(dobj);
>      g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
>      g_assert(dobj->bv == true);
>      g_assert(dobj->av == DUMMY_PLATYPUS);
>  
> +    qdict = keyval_parse(params, "qom-type", &help, &err);

Why parse again?

> +    g_assert(!user_creatable_add_dict(qdict, true, &err));
> +    g_assert(err);

Use error_free_or_abort(&err) instead, and ...

> +    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
> +             == OBJECT(dobj));
> +    qobject_unref(qdict);

... drop the next two lines:

> +    error_free(err);
> +    err = NULL;
> +
> +    qdict = keyval_parse(params, "qom-type", &help, &err);

And again?

>      user_creatable_del("dev0", &error_abort);
> +    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
> +             == NULL);
>  
> -    object_unref(OBJECT(dobj));
> -
> -    /*
> -     * cmdline-parsing via qemu_opts_parse() results in a QemuOpts entry
> -     * corresponding to the Object's ID to be added to the QemuOptsList
> -     * for objects. To avoid having this entry conflict with future
> -     * Objects using the same ID (which can happen in cases where
> -     * qemu_opts_parse() is used to parse the object params, such as
> -     * with hmp_object_add() at the time of this comment), we need to
> -     * check for this in user_creatable_del() and remove the QemuOpts if
> -     * it is present.
> -     *
> -     * The below check ensures this works as expected.
> -     */
> -    g_assert_null(qemu_opts_find(&qemu_object_opts, "dev0"));
> +    g_assert(user_creatable_add_dict(qdict, true, &err));

Am I confused, or are you going from two to three creates?  Should this
be in a separate patch?

> +    g_assert(err == NULL);
> +    qobject_unref(qdict);
> +
> +    dobj = DUMMY_OBJECT(object_resolve_path_component(object_get_objects_root(),
> +                                                      "dev0"));
> +    g_assert(dobj);
> +    g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
> +    g_assert(dobj->bv == true);
> +    g_assert(dobj->av == DUMMY_PLATYPUS);
> +    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
> +             == OBJECT(dobj));
> +
> +    object_unparent(OBJECT(dobj));
>  }
>  
>  static void test_dummy_badenum(void)


