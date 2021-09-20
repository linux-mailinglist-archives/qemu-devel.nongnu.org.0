Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA54110B5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:12:53 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEQ0-00086r-V4
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSEKk-0001kP-B7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:07:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSEKh-0001xq-0v
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632125242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtO5Cc7nMvVdMccZIAGhQ9tg+nuOaYMqqS8eg/50JGc=;
 b=X5A7vlyw1eb2Lx0wXg5wlmsX/U7+WV4NFUzZ+sYgWlkpnv1C5eFMAFs/bQTO7KjhfTOuoA
 mMTRkQXxdOpBhVdTvreV/Vk64Syhw8iUN5qO3yIr1QUuVMXzy0O6+QTyCc6Fgy1944vsvS
 VjIMwExBxcJDTuejxZlNO+qB0GpyDaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-9frtBPIEM16PHfPmyugZ6g-1; Mon, 20 Sep 2021 04:07:21 -0400
X-MC-Unique: 9frtBPIEM16PHfPmyugZ6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C74E1084685;
 Mon, 20 Sep 2021 08:07:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C1165D9DC;
 Mon, 20 Sep 2021 08:06:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0300E113865F; Mon, 20 Sep 2021 10:06:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 05/53] docs/devel: document expectations for HMP
 commands in the future
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-6-berrange@redhat.com>
Date: Mon, 20 Sep 2021 10:06:35 +0200
In-Reply-To: <20210914142042.1655100-6-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 14 Sep 2021 15:19:54
 +0100")
Message-ID: <87pmt33c38.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> We no longer wish to have commands implemented in HMP only. All commands
> should start with a QMP implementation and the HMP merely be a shim
> around this. To reduce the burden of implementing QMP commands where
> there is low expectation of machine usage, requirements for QAPI
> modelling are relaxed provided the command is under the "x-" name
> prefix.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing=
-monitor-commands.rst
> index 4cf51ab557..983130a793 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -11,6 +11,16 @@ For an in-depth introduction to the QAPI framework, pl=
ease refer to
>  docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
>  start with docs/interop/qmp-intro.txt.
> =20
> +Historically QEMU has permitted new monitor commands to be implemented i=
n HMP
> +only, QMP only, or both, depending on whether they needed to be accessib=
le to
> +human operators, machines, or both. When both QMP and HMP are implemente=
d it
> +is expected the HMP implementation is a shim around the QMP implementati=
on.
> +Going forward, the expectation is that new commands are implemented in Q=
MP
> +only, or both QMP and HMP. No further commands are to be added to HMP on=
ly.
> +The long term goal is that all HMP commands will be implemented in terms=
 of
> +their QMP equivalent, enabling internals of QEMU to be fully isolated fr=
om

This feels a bit too tight.  Most HMP commands are going to wrap around
their equivalent QMP command.  However, high-level HMP commands built
from low-level QMP building blocks remain permissble.

> +the HMP implementation. Refer to the later topic on modelling data in QA=
PI

Suggest to use the exact section name for easy searching, or even
better, make it a link.

> +for further guidance on commands that would have traditionally been HMP =
only.
> =20
>  Overview
>  --------

Discussing history is quite valuable in commit messages, but less so in
a "how to do stuff" document.  Consider cutting this down some.  What
about:

    New commands may be implemented in QMP only.  New HMP commands should b=
e
    implemented on top of QMP.  The typical HMP command wraps around an
    equivalent QMP command, but HMP convenience commands built from QMP
    building blocks are also fine.  The long term goal is to make all
    existing HMP commands conform to this, to fully isolate HMP from the
    internals of QEMU.


