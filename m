Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1FF337CB5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:33:57 +0100 (CET)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQ8C-00033H-7y
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQ49-0001D0-T0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:29:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQ43-0004D2-VX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dTx6cb99qpUZFdqY/HSQb42uTkMWwC+T0Nh59ATZho=;
 b=GCjr+4CXCgoJBVX85QzhuSw59UmH7dciUAG8ueRuYCtE1NccrVp+vbdq+qAyGA4rpxolKb
 hB98xqE6b+vecCnUHwI4cJ8LdkGT0dm+trhRRoBLz+GW/fcG/gc4YRezo3dCJmT3Ppdz8M
 LE+d/cEQ2fkxbxX7FO+6pYdsy9VinVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-ZmCo2uhUN5G1uqfdgOo4Dg-1; Thu, 11 Mar 2021 13:29:33 -0500
X-MC-Unique: ZmCo2uhUN5G1uqfdgOo4Dg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68D55363A2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:29:32 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1486A102AE7E;
 Thu, 11 Mar 2021 18:29:32 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests: convert check-qom-proplist to keyval
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-2-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <25ebcba5-2f16-226b-54e0-b574b8717fb2@redhat.com>
Date: Thu, 11 Mar 2021 12:29:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311172459.990281-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 11:24 AM, Paolo Bonzini wrote:
> The command-line creation test is using QemuOpts.  Switch it to keyval,
> since the emulator has some special needs and thus the last user of
> user_creatable_add_opts will go away with the next patch.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/check-qom-proplist.c | 74 ++++++++++++++++++++++++++------------
>  1 file changed, 52 insertions(+), 22 deletions(-)
> 

>  static void test_dummy_createcmdl(void)
>  {
> -    QemuOpts *opts;
> +    QDict *qdict;
>      DummyObject *dobj;
>      Error *err = NULL;
> -    const char *params = TYPE_DUMMY \
> -                         ",id=dev0," \
> -                         "bv=yes,sv=Hiss hiss hiss,av=platypus";
> +    bool help;
> +    const char *params = "bv=yes,sv=Hiss hiss hiss,av=platypus";
>  
> +    /* Needed for user_creatable_del.  */
>      qemu_add_opts(&qemu_object_opts);
> -    opts = qemu_opts_parse(&qemu_object_opts, params, true, &err);
> +
> +    qdict = keyval_parse(params, "qom-type", &help, &err);
>      g_assert(err == NULL);
> -    g_assert(opts);
> +    g_assert(qdict);
> +    g_assert(!help);
>  
> -    dobj = DUMMY_OBJECT(user_creatable_add_opts(opts, &err));
> +    g_assert(test_create_obj(qdict, &err));

This performs a side-effect inside of g_assert().  Do we care?  On the
one hand, this is a testsuite (where disabling g_assert weakens the
test), on the other hand, even if we can guarantee g_assert is not
disabled in the testsuite, it lends itself to poor copy-and-paste
practice to other sites.  Better would be to assign to a bool outside
g_assert(), then assert the variable.

>      g_assert(err == NULL);
> +    qobject_unref(qdict);
> +
> +    dobj = DUMMY_OBJECT(object_resolve_path_component(object_get_objects_root(),
> +                                                      "dev0"));
>      g_assert(dobj);
>      g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
>      g_assert(dobj->bv == true);
>      g_assert(dobj->av == DUMMY_PLATYPUS);
>  
> +    qdict = keyval_parse(params, "qom-type", &help, &err);
> +    g_assert(!test_create_obj(qdict, &err));

And again.

> +    g_assert(err);
> +    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
> +             == OBJECT(dobj));
> +    qobject_unref(qdict);
> +    error_free(err);
> +    err = NULL;
> +
> +    qdict = keyval_parse(params, "qom-type", &help, &err);
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
> +    g_assert(test_create_obj(qdict, &err));

and again

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
> 

Otherwise, this looks like a sane thing to do.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


