Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7C495CF3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:39:03 +0100 (CET)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqNq-00038S-Sk
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:39:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAn8g-0004tE-Fj
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAn8Y-0006rQ-92
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642745460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9+bcAex20pXBNy0ofJ4k6L54tcvmrJ3K+8otHANaW0=;
 b=WhFSaZFkYs+wPQRHLxZvPbhmrJ0LplVW+417STxuu/ikqKNNKC/hS6MmDquu/CMpWpYdHw
 EIkWloi8AEIGhBFkfUzGvyvYcgcSMc9fxSXk2PfPGBhQCAuRf66KJbuOMVuwiBWx1YHCQE
 BHeGIOcW1cQ47m8xdAC1usum1I2flvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-IbG7zFkKOjezVrj0htUM6g-1; Fri, 21 Jan 2022 01:10:59 -0500
X-MC-Unique: IbG7zFkKOjezVrj0htUM6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092C81006AA8;
 Fri, 21 Jan 2022 06:10:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B625F55F53;
 Fri, 21 Jan 2022 06:10:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F94E113303B; Fri, 21 Jan 2022 07:10:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
 <YehIosxuXCqsGBSW@redhat.com> <87ee5275ya.fsf@dusky.pond.sub.org>
 <ffaf9aee-56e9-c332-09ad-158a3e28758b@redhat.com>
Date: Fri, 21 Jan 2022 07:10:56 +0100
In-Reply-To: <ffaf9aee-56e9-c332-09ad-158a3e28758b@redhat.com> (Hanna Reitz's
 message of "Thu, 20 Jan 2022 17:31:22 +0100")
Message-ID: <87pmol62kv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hanna Reitz <hreitz@redhat.com> writes:

> On 20.01.22 17:00, Markus Armbruster wrote:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>
>>> Am 19.01.2022 um 14:44 hat Hanna Reitz geschrieben:
>>>> On 19.01.22 13:58, Markus Armbruster wrote:
>>>>> Hanna Reitz <hreitz@redhat.com> writes:
>>>>>
>>>>>> We want to add a --daemonize argument to QSD's command line.
>>>>> Why?
>>>> OK, s/we/I/.=C2=A0 I find it useful, because without such an option, I=
 need to
>>>> have whoever invokes QSD loop until the PID file exists, before I can =
be
>>>> sure that all exports are set up.=C2=A0 I make use of it in the test c=
ases added
>>>> in patch 3.
>>>>
>>>> I suppose this could be worked around with a special character device,=
 like
>>>> so:
>>>>
>>>> ```
>>>> ncat --listen -U /tmp/qsd-done.sock </dev/null &
>>>> ncat_pid=3D$!
>>>>
>>>> qemu-storage-daemon \
>>>>  =C2=A0=C2=A0=C2=A0 ... \
>>>>  =C2=A0=C2=A0=C2=A0 --chardev socket,id=3Dsignal_done,path=3D/tmp/qsd-=
done.sock \
>>>>  =C2=A0=C2=A0=C2=A0 --monitor signal_done \
>>>>  =C2=A0=C2=A0=C2=A0 --pidfile /tmp/qsd.pid &
>>>>
>>>> wait $ncat_pid
>>>> ```
>>>>
>>>> But having to use an extra tool for this is unergonomic.=C2=A0 I mean,=
 if there=E2=80=99s
>>>> no other way...
>>
>> I know duplicating this into every program that could server as a daemon
>> is the Unix tradition.  Doesn't make it good.  Systemd[*] has tried to
>> make it superfluous.
>
> Well.=C2=A0 I have absolutely nothing against systemd.=C2=A0 Still, I wil=
l not
> use it in an iotest, that=E2=80=99s for sure.

My point isn't "use systemd in iotests".  It's "consider doing it like
systemd", i.e. do the daemonization work in a utility program.  For what
it's worth, Linux has daemonize(1).

[...]

>> Care to put a brief version of the rationale for --daemonize and for
>> forking early in the commit message?
>
> Well, my rationale for adding the feature doesn=E2=80=99t really extend b=
eyond
> =E2=80=9CI want it, I find it useful, and so I assume others will, too=E2=
=80=9D.

Don't pretend to be obtuse, it's not credible :)  You mentioned iotests,
which makes me guess your rationale is "I want this for iotests, and
there may well be other uses."

> I don=E2=80=99t really like putting =E2=80=9Cqemu-nbd has it=E2=80=9D the=
re, because... it was
> again me who implemented it for qemu-nbd.=C2=A0 Because I found it useful=
.=C2=A0=20
> But I can of course do that, if it counts as a reason.

Useful *what for*, and we have rationale.

> I can certainly (and understand the need to, and will) elaborate on
> the =E2=80=9CThis will require forking the process before we do any compl=
ex=20
> initialization steps=E2=80=9D part.

Thanks!


