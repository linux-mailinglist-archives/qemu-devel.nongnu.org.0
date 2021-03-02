Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA83295F1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 05:48:54 +0100 (CET)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGwxp-0005tR-Hp
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 23:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGwwN-0005C3-4W
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGwwI-0001uH-Mn
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614660435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJM5fnNcQr0k9Uhfvi/kQ6VhmXSlzsKzNkSxSmjY6I8=;
 b=X2spBzqe9zG5DIjDKl4BAr9Lb/LBOTtuq0rpmu4rEU99Bcc3l72FR2QLM45y+y7BWg4toT
 Y+JIeONusyj0lLv/BbhwBtPjxCu+hpJtFBauOaDbStQthyLemfSSm3U70UG0yKVkj0s1sc
 I+FQLtVMwcxb3WW55mA1JbiVVDRzwkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-aF88bLhPPWGZ5Q_k62QWCg-1; Mon, 01 Mar 2021 23:47:13 -0500
X-MC-Unique: aF88bLhPPWGZ5Q_k62QWCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4852B803F4A;
 Tue,  2 Mar 2021 04:47:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAB431002388;
 Tue,  2 Mar 2021 04:47:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 825F5113860F; Tue,  2 Mar 2021 05:47:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] docs: show how to spawn qemu-storage-daemon with fd
 passing
References: <20210301153159.35660-1-stefanha@redhat.com>
 <YD0LQ3fDG6t2VRG4@redhat.com>
 <5b86b310-8e3b-8bb6-365c-a73b0f2843be@redhat.com>
 <YD0RF+PJwLRv2ULo@redhat.com>
Date: Tue, 02 Mar 2021 05:47:05 +0100
In-Reply-To: <YD0RF+PJwLRv2ULo@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 1 Mar 2021 16:06:47 +0000")
Message-ID: <87o8g2cgc6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Mar 01, 2021 at 09:49:21AM -0600, Eric Blake wrote:
>> On 3/1/21 9:41 AM, Daniel P. Berrang=C3=A9 wrote:
>> > On Mon, Mar 01, 2021 at 03:31:59PM +0000, Stefan Hajnoczi wrote:
>> >> The QMP monitor, NBD server, and vhost-user-blk export all support fi=
le
>> >> descriptor passing. This is a useful technique because it allows the
>> >> parent process to spawn and wait for qemu-storage-daemon without busy
>> >> waiting, which may delay startup due to arbitrary sleep() calls.
>> >>
>> >> This Python example is inspired by the test case written for libnbd b=
y
>> >> Richard W.M. Jones <rjones@redhat.com>:
>> >> https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314ba75=
c1cbe07a04543
>> >>
>> >> Thanks to Daniel P. Berrang=C3=A9 <berrange@redhat.com> for suggestio=
ns on
>> >> how to get this working. Now let's document it!
>> >>
>>=20
>> >> +  sock_path =3D '/tmp/qmp-{}.sock'.format(os.getpid())
>> >=20
>> > Example code inevitably gets cut+paste into real world apps, and this
>> > example is a tmpfile CVE flaw. At least put it in $CWD instead.
>>=20
>> Except $CWD may be too long for a sock file name to be created.
>> Creating the sock in a securely-created subdirectory of /tmp is more
>> reliable.
>
> $XDG_RUNTIME_DIR then, which is /run/user/$UID, so safely per user on all
> modern OS.

Reach under your pillow and check the standard library:

    import tempfile

    with tempfile.TemporaryDirectory() as tmpdirname:
        print('created temporary directory', tmpdirname)

https://docs.python.org/3.6/library/tempfile.html#tempfile.TemporaryDirecto=
ry


