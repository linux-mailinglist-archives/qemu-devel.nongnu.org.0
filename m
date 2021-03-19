Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B053418A1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:42:35 +0100 (CET)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBeM-00031i-OQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNBck-0002Wb-Lw
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNBch-0006a2-MN
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P3JxzCaJ1RRMTzTWQ3FgoyQSFQEGYB2R0QppZ+j5hM0=;
 b=TPmeAqUKNQHcMef7iO4bv88ZDEDot3iSjjIodta6E9zSMfb+m+RX8Ox7uHDzx0UV358ArV
 Wunq01rZfciQJf5ZYxBzlmLNeFq9qceka6XOltRkNoKkJrpEIkDOxB0U6zrzYkW+fHT7l+
 kYBylFaa09SznRgIOKgRG5yHyvsWS7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-VamtDK_WNXee49Q77mVxVw-1; Fri, 19 Mar 2021 05:40:47 -0400
X-MC-Unique: VamtDK_WNXee49Q77mVxVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 828F3108BD06;
 Fri, 19 Mar 2021 09:40:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FA8B60CCB;
 Fri, 19 Mar 2021 09:40:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2EB811386A7; Fri, 19 Mar 2021 10:40:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Misleading configure failure GLIB_SIZEOF_SIZE_T
References: <87v99oiq13.fsf@dusky.pond.sub.org>
 <CAFEAcA8597jFxaNLdwEtM0Q9o6Wjx1JrGdeaePkkEDJz5-Y=ow@mail.gmail.com>
Date: Fri, 19 Mar 2021 10:40:44 +0100
In-Reply-To: <CAFEAcA8597jFxaNLdwEtM0Q9o6Wjx1JrGdeaePkkEDJz5-Y=ow@mail.gmail.com>
 (Peter Maydell's message of "Thu, 18 Mar 2021 13:32:36 +0000")
Message-ID: <87zgyzmqg3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 18 Mar 2021 at 12:53, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> I just ran into this failure:
>>
>>     $ ../configure --disable-tools --disable-system --static
>>
>>     ERROR: sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T.
>>            You probably need to set PKG_CONFIG_LIBDIR
>>            to point to the right pkg-config files for your
>>            build target
>
> The interesting question here is why the earlier configure check:
>
> write_c_skeleton;
> if compile_object ; then
>   : C compiler works ok
> else
>     error_exit "\"$cc\" either does not exist or does not work"
> fi
> if ! compile_prog ; then
>     error_exit "\"$cc\" cannot build an executable (is your linker broken?)"
> fi
>
> didn't fail. That is deliberately early in configure in an attempt
> to capture this kind of "the compiler can't link anything" case
> before we get into specific feature testing.

I've since installed the libraries...  uninstalling glibc-static for a
quick check...  Yep, dies in the GLIB_SIZEOF_SIZE_T test.  Let's have a
look at my config.log.  To more easily find the check you pointed out, I
stuck "exit 42" right behind it, and get:

    $ ./config.status 
    [Exit 42 ]
    $ echo $?
    42
    $ tail -n 4 config.log 

    funcs: do_compiler do_cc compile_prog main
    lines: 145 183 2017 0
    cc -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -m64
    $ cat config-temp/qemu-conf.c 
    int main(void) { return 0; }

Run the compiler by hand to confirm:

    $ cc -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -m64
    $ echo $?
    0

The test program doesn't actually need libc, so not having glibc-static
installed doesn't bother the linker.

If it used something from libc, then I'd expect the issue to merely
shift to the next library.  Remember, the failure I reported attempts to
link with -lgthread-2.0 -pthread -lglib-2.0 -pthread -lpcre -pthread.


