Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB17400A02
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 08:27:58 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMP9g-0003zD-TS
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 02:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMP8K-0002Mt-9S
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 02:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMP8E-0000d6-L4
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 02:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630736785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFtXcKj6NLvC8J8MjxdxGldTm+tu2Gsm79OBAzahgvs=;
 b=IHPEiMNqXpHiI5VZe/coUDB5E/m1/KJYsZe29wtU4BAHl8mvQd6ja/Rr2sYX56aJK6bZyX
 uqkew+cQtHSZMFHHkmK79XZD2oOwVTX1qdXnxIIdY+bW857tIV4uGzvOa2X3mCr2kCbQia
 /kZQ2MHLcIrD/KgaKzkHe1kqTHNF1OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-OCpn8PjENJSMK2jRSd-KhQ-1; Sat, 04 Sep 2021 02:26:22 -0400
X-MC-Unique: OCpn8PjENJSMK2jRSd-KhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F6AF512B;
 Sat,  4 Sep 2021 06:26:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 834B519D9D;
 Sat,  4 Sep 2021 06:26:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9EE041138606; Sat,  4 Sep 2021 08:26:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH] net: Add "info neighbors" command
References: <20210902212015.1303865-1-dje@google.com>
 <875yvi2sh2.fsf@dusky.pond.sub.org>
 <CADPb22TrHzujCONPAqdTcOYWNw2YtdKn+vPnitL7eU2hJJNDNg@mail.gmail.com>
Date: Sat, 04 Sep 2021 08:26:11 +0200
In-Reply-To: <CADPb22TrHzujCONPAqdTcOYWNw2YtdKn+vPnitL7eU2hJJNDNg@mail.gmail.com>
 (Doug Evans's message of "Fri, 3 Sep 2021 09:53:02 -0700")
Message-ID: <87lf4crh4s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doug Evans <dje@google.com> writes:

> On Fri, Sep 3, 2021 at 6:08 AM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
>> Doug Evans <dje@google.com> writes:
>>
>> > This command dumps the ARP and NDP tables maintained within slirp.
>> > One use-case for it is showing the guest's IPv6 address(es).
>> >
>> > Signed-off-by: Doug Evans <dje@google.com>
>> > ---
>> >  hmp-commands-info.hx               | 15 +++++++
>> >  include/net/slirp.h                |  1 +
>> >  net/slirp.c                        | 15 +++++++
>> >  tests/acceptance/info_neighbors.py | 69 +++++++++++++++++++++++++++++=
+
>> >  4 files changed, 100 insertions(+)
>> >  create mode 100644 tests/acceptance/info_neighbors.py
>>
>> Standard request for new HMP commands without corresponding QMP
>> commands: please state in the commit message why the QMP command is not
>> worthwhile.
>>
>> HMP commands without a QMP equivalent are okay if their functionality
>> makes no sense in QMP, or is of use only for human users.
>>
>> Example for "makes no sense in QMP": setting the current CPU, because a
>> QMP monitor doesn't have a current CPU.
>>
>> Examples for "is of use only for human users": HMP command "help", the
>> integrated pocket calculator.
>>
>> Debugging commands are kind of borderline.  Debugging is commonly a
>> human activity, where HMP is just fine.  However, humans create tools to
>> assist with their activities, and then QMP is useful.  While I wouldn't
>> encourage HMP-only for the debugging use case, I wouldn't veto it.
>>
>
>
> Mostly I was following what I saw for "info usernet".
> I don't see a difference between "info neighbors" and "info usernet" so I
> went with that.
> Both draw their data from libslirp.

I see.

> I'm happy to add QMP support if necessary.
> Note that there is code that parses "info usernet" output, e.g.,
> get_info_usernet_hostfwd_port for python.

Demonstrates "is of use only for human users" is wrong.

> Presumably we don't want to print text in slirp only to parse it in qemu,
> right?

Yes, we'd prefer not to parse.

As long as libslirp can only give us text, we need to parse it
somewhere.

We can parse it right in QEMU, or punt the job to whatever uses QEMU.
The latter can get away with parsing just the part they need.  But we
may end up with multiple parsers.


> That'll change the qemu/slirp interface.
> OTOH, to what extent does libslirp want to export a more formal API for
> this, vs just text?

This is a question for Samuel or Marc-Andr=C3=A9.

If the answer is "no", then HMP only (so we don't have to parse in QEMU)
is fair, I think.  The commit message should explain this.


