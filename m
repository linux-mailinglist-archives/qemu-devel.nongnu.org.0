Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9E5BEDB7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:27:26 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaitw-0002oz-Eg
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaeEA-0005sc-8B
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaeE6-0005ws-Rs
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663684073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1C9Lx8vSR5W6m/j/OtjG/R4BIh3lDwljPKbxcYe7u4=;
 b=EPqFYzRg68L/ddU5fQbt1Cv/Qs/JezEoqgVLfHJPLcQC6HctGX3LdLvBTNyOfe1cvkd720
 hhqtrWbxc7NBZgcAoGGnUPFs7d6Uw0uwcOqm5UGBMOj71St9vbz5tQQQnPqjw1PuO0ZD+/
 GnU0Nf8SKa44ptp96fBqKhgwzTiQPrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-ABtBEu82MiG_pWqayvXmdA-1; Tue, 20 Sep 2022 10:27:43 -0400
X-MC-Unique: ABtBEu82MiG_pWqayvXmdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A667885A583;
 Tue, 20 Sep 2022 14:27:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 503C51759F;
 Tue, 20 Sep 2022 14:27:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC61321E6900; Tue, 20 Sep 2022 16:27:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH] libvduse: Do not truncate terminating NUL character
 with strncpy()
References: <20220919192306.52729-1-f4bug@amsat.org>
 <87k05yxp7p.fsf@pond.sub.org>
 <CACycT3sqE+_JNv0k4we7TyLS-JJx_hGhRCfKpe1JMLgCw_x+PA@mail.gmail.com>
Date: Tue, 20 Sep 2022 16:27:39 +0200
In-Reply-To: <CACycT3sqE+_JNv0k4we7TyLS-JJx_hGhRCfKpe1JMLgCw_x+PA@mail.gmail.com>
 (Yongji Xie's message of "Tue, 20 Sep 2022 21:36:30 +0800")
Message-ID: <87mtauw278.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yongji Xie <xieyongji@bytedance.com> writes:

> On Tue, Sep 20, 2022 at 7:25 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>
>> > GCC 8 added a -Wstringop-truncation warning:
>> >
>> >   The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
>> >   bug 81117 is specifically intended to highlight likely unintended
>> >   uses of the strncpy function that truncate the terminating NUL
>> >   character from the source string.
>> >
>> > Here the next line indeed unconditionally zeroes the last byte, so
>> > we can call strncpy() on the buffer size less the last byte.
>>
>> Actually, the buffer is all zero to begin with, so we could do this even
>> without the next line's assignment.
>>
>
> Yes, I think we can remove the next line's assignment.
>
>> >                                                              This
>> > fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:
>> >
>> >   [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvdu=
se.c.o
>> >   FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
>> >   cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/lib=
vduse -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a=
.p/libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
>> >   In file included from /usr/include/string.h:495,
>> >                    from ../../subprojects/libvduse/libvduse.c:24:
>> >   In function =E2=80=98strncpy=E2=80=99,
>> >       inlined from =E2=80=98vduse_dev_create=E2=80=99 at ../../subproj=
ects/libvduse/libvduse.c:1312:5:
>> >   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:=
 =E2=80=98__builtin_strncpy=E2=80=99 specified bound 256 equals destination=
 size [-Werror=3Dstringop-truncation]
>> >     106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bo=
s (__dest));
>> >         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>> >   cc1: all warnings being treated as errors
>> >   ninja: build stopped: cannot make progress due to previous errors.
>> >
>> > Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> The subject feels a bit too alarming to me.  This patch suppresses a
>> warning, no less, no more.  Behavior doesn't change.  Perhaps
>>
>>     libvduse: Avoid warning about dangerous use of strncpy()
>>
>> > ---
>> > Cc: Xie Yongji <xieyongji@bytedance.com>
>> > Cc: Markus Armbruster <armbru@redhat.com>
>> > Cc: Kevin Wolf <kwolf@redhat.com>
>> >
>> > RFC: Any better idea? We can't use strpadcpy() because libvduse
>> > doesn't depend on QEMU.
>>
>> There's no need for padding: the destination calloc'ed.  So, pstrcpy()
>> would do, but it's just as unavailable.  Can we use GLib?  There's
>> g_strlcpy().
>>
>> Outside this patch's scope: is silent truncation what we want?
>>
>
> Actually silent truncation would not happen since we called
> vduse_name_is_invalid() before.
>
> static inline bool vduse_name_is_invalid(const char *name)
> {
>     return strlen(name) >=3D VDUSE_NAME_MAX || strstr(name, "..");
> }

Ah, so even strcpy() would be safe (but might trigger a compiler
warning).

Thanks!


