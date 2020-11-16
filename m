Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62B2B449F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:24:32 +0100 (CET)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeUf-0001DA-EQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1keeO8-000465-5f
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:17:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1keeO3-0005Jk-TD
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605532658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3KHuF4vKRIlOBhyZTsG1dX46hiWepI2HdEmTWaL8TU=;
 b=YDqqXME9gvBxO65eZlyjOEr3yk2t0GB6VBeAoHnFb7kAvOe4zCnEDadz4ldJJ5rOTiUuU4
 tpxCi9PfLCt3JW/UTQZ9W43nBk6om5c3fJtxyfG0RKRRI4uawD23kbRef62/kLuzXtu7Jb
 b7ZDs/hk71CgOAtdXB0nvv2sFdCbegQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-mgtqusWyObKTH2Ary4SOIQ-1; Mon, 16 Nov 2020 08:17:35 -0500
X-MC-Unique: mgtqusWyObKTH2Ary4SOIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6E7F1882FA0
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 13:17:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB6A1002388;
 Mon, 16 Nov 2020 13:17:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D49CB11358BA; Mon, 16 Nov 2020 14:17:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: introspect.py output representation (was: [PATCH v2 00/11] qapi:
 static typing conversion, pt2)
References: <20201026194251.11075-1-jsnow@redhat.com>
Date: Mon, 16 Nov 2020 14:17:32 +0100
In-Reply-To: <20201026194251.11075-1-jsnow@redhat.com> (John Snow's message of
 "Mon, 26 Oct 2020 15:42:40 -0400")
Message-ID: <87y2j1xwyb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Warning: losely related brain dump ahead.

introspect.py's purpose is providing query-qmp-schema with the data it
needs to built its response, which is a JSON object conforming to
['SchemaInfo'].

Stupidest solution that could possibly work: have this module generate a
C string holding the (JSON text) response.

Since a QMP command handler returns a QAPI object, not the response
string, this becomes:

     schema
        |
        |                                       qapi-gen.py
        v
    C string        --------------------------------------------------
        |
        |           qobject_from_json()
        v
     QObject                                    qmp_query_qmp_schema()
        |
        |           QObject input visitor
        v
  SchemaInfoList    --------------------------------------------------
        |
        |           QObject output visitor      generated wrapper
        v
     QObject        --------------------------------------------------
        |
        |           qobject_to_json()           QMP core
        v
    C string

Meh.  So many pointless conversions.

Shortcut: 'gen' false lets us cut out two:

     schema
        |
        |                                       qapi-gen.py
        v
    C string        --------------------------------------------------
        |
        |           qobject_from_json()         qmp_query_qmp_schema()
        v
     QObject        --------------------------------------------------
        |
        |           qobject_to_json()           QMP core
        v
    C string

Less work for handwritten qmp_query_qmp_schema(); it's now a one-liner.
This is the initial version (commit 39a1815816).

Commit 7d0f982bfb replaced the generated C string by a QLitObject:

     schema
        |
        |                                       qapi-gen.py
        v
     QLitObj        --------------------------------------------------
        |
        |           qobject_from_qlit()         qmp_query_qmp_schema()
        v
     QObject        --------------------------------------------------
        |
        |           qobject_to_json()           QMP core
        v
    C string

The commit message claims the QLitObj is "easier to deal with".  I doubt
it.  The conversion to QObject is a one-liner before and after.  Neither
form is hard to generate (example appended).

QLitObj takes more memory: ~360KiB, mostly .data (unnecessarily?),
wheras the C string is ~150KiB .text.  Of course, both are dwarved many
times over by QObject: 12.4MiB.  Gross.

However, to actually work with the introspection data in C, we'd want it
as SchemaInfoList.  I have a few uses for introspection data in mind,
and I definitely won't code them taking QObject input.

SchemaInfoList is one visitor away from QObject, so no big deal.

But what if we generated SchemaInfoList directly?  We'd have:

     schema
        |
        |                                       qapi-gen.py
        v
  SchemaInfoList    --------------------------------------------------
        |
        |           QObject output visitor      generated wrapper
        v
     QObject        --------------------------------------------------
        |
        |           qobject_to_json()           QMP core
        v
    C string

At ~480KiB, SchemaInfoList is less compact than QLitObj (let alone the C
string).  It should go entirely into .text, though.

I don't think generating SchemaInfoList would be particularly hard.
Just work.  Bigger fish to fry, I guess.  But getting the idea out can't
hurt.



Example: BlockdevOptionsFile

    { 'struct': 'BlockdevOptionsFile',
      'data': { 'filename': 'str',
                '*pr-manager': 'str',
                '*locking': 'OnOffAuto',
                '*aio': 'BlockdevAioOptions',
                '*drop-cache': {'type': 'bool',
                                'if': 'defined(CONFIG_LINUX)'},
                '*x-check-cache-dropped': 'bool' },
      'features': [ { 'name': 'dynamic-auto-read-only',
                      'if': 'defined(CONFIG_POSIX)' } ] }

Generated QLitObj:

        /* "267" = BlockdevOptionsFile */
        QLIT_QDICT(((QLitDictEntry[]) {
            { "features", QLIT_QLIST(((QLitObject[]) {
    #if defined(CONFIG_POSIX)
                QLIT_QSTR("dynamic-auto-read-only"),
    #endif /* defined(CONFIG_POSIX) */
                {}
            })), },
            { "members", QLIT_QLIST(((QLitObject[]) {
                QLIT_QDICT(((QLitDictEntry[]) {
                    { "name", QLIT_QSTR("filename"), },
                    { "type", QLIT_QSTR("str"), },
                    {}
                })),
                QLIT_QDICT(((QLitDictEntry[]) {
                    { "default", QLIT_QNULL, },
                    { "name", QLIT_QSTR("pr-manager"), },
                    { "type", QLIT_QSTR("str"), },
                    {}
                })),
                QLIT_QDICT(((QLitDictEntry[]) {
                    { "default", QLIT_QNULL, },
                    { "name", QLIT_QSTR("locking"), },
                    { "type", QLIT_QSTR("412"), },
                    {}
                })),
                QLIT_QDICT(((QLitDictEntry[]) {
                    { "default", QLIT_QNULL, },
                    { "name", QLIT_QSTR("aio"), },
                    { "type", QLIT_QSTR("413"), },
                    {}
                })),
    #if defined(CONFIG_LINUX)
                QLIT_QDICT(((QLitDictEntry[]) {
                    { "default", QLIT_QNULL, },
                    { "name", QLIT_QSTR("drop-cache"), },
                    { "type", QLIT_QSTR("bool"), },
                    {}
                })),
    #endif /* defined(CONFIG_LINUX) */
                QLIT_QDICT(((QLitDictEntry[]) {
                    { "default", QLIT_QNULL, },
                    { "name", QLIT_QSTR("x-check-cache-dropped"), },
                    { "type", QLIT_QSTR("bool"), },
                    {}
                })),
                {}
            })), },
            { "meta-type", QLIT_QSTR("object"), },
            { "name", QLIT_QSTR("267"), },
            {}
        })),

Generated C string would look like this:

        "{\"features\": ["
    #if defined(CONFIG_POSIX)
        "\"dynamic-auto-read-only\""
    #endif /* defined(CONFIG_POSIX) */
        "], "
        "\"members\": ["
        "{\"name\": \"filename\", \"type\": \"str\"}, "
        "{\"name\": \"pr-manager\", \"default\": null, \"type\": \"str\"}, "
        "{\"name\": \"locking\", \"default\": null, \"type\": \"412\"}, "
        "{\"name\": \"aio\", \"default\": null, \"type\": \"413\"}, "
    #if defined(CONFIG_LINUX)
        "{\"name\": \"drop-cache\", \"default\": null, \"type\": \"bool\"}, "
    #endif /* defined(CONFIG_LINUX) */
        "{\"name\": \"x-check-cache-dropped\", \"default\": null, \"type\": \"bool\"}"
        "], "
        "\"meta-type\": \"object\", "
        "\"name\": \"267\""
        "}"


