Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD6188979
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:52:14 +0100 (CET)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEVp-0003fc-Mp
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEEDB-0001Bs-GB
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEEDA-0001L8-3W
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:32:57 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:57197)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEED9-0001FQ-VU
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584459175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/kBTxEepHWsounPX+s+ejrhBVpoFxCF4VBxYFXN6Sc=;
 b=BGbx55kdB/Mc6XRJMGlCgDuJajpBN90k5nAuPBJy3NSkJ2tzsKiyfhW/m3wzO8nrcxOTtY
 7g7E05hBb8tmzdXb9adHvmGCNQGFLL0Y3MD8rUzRVJNY5XwVbs1orMq+mtk2OV0lm4uraZ
 cpPnjQU726ka9qITJTPvhgEsEbMg9v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-C0y3wOMQOXaqFey4AuAjYg-1; Tue, 17 Mar 2020 11:32:53 -0400
X-MC-Unique: C0y3wOMQOXaqFey4AuAjYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28A6E13F6;
 Tue, 17 Mar 2020 15:32:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C174C7E32B;
 Tue, 17 Mar 2020 15:32:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CDEE1138404; Tue, 17 Mar 2020 16:32:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v4 00/34] Configurable policy for handling deprecated
 interfaces
References: <20200317115459.31821-1-armbru@redhat.com>
 <CAJ+F1CLfvaLeTEj60PW6srwynA=N5ZCXxTM3ZORMFR_fkjkXiQ@mail.gmail.com>
Date: Tue, 17 Mar 2020 16:32:45 +0100
In-Reply-To: <CAJ+F1CLfvaLeTEj60PW6srwynA=N5ZCXxTM3ZORMFR_fkjkXiQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 17 Mar 2020
 14:10:22 +0100")
Message-ID: <87h7yn6lpe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>, "Daniel P .
 Berrange" <berrange@redhat.com>, libvir-list@redhat.com,
 QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Tue, Mar 17, 2020 at 12:55 PM Markus Armbruster <armbru@redhat.com> wr=
ote:
>>
>> This series extends QMP introspection to cover deprecation.
>> Additionally, new option -compat lets you configure what to do when
>> deprecated interfaces get used.  This is intended for testing users of
>> the management interfaces.  It is experimental.
>>
>> -compat deprecated-input=3D<in-policy> configures what to do when
>> deprecated input is received.  Available policies:
>>
>> * accept: Accept deprecated commands and arguments (default)
>> * reject: Reject them
>> * crash: Crash
>>
>> -compat deprecated-output=3D<out-policy> configures what to do when
>> deprecated output is sent.  Available output policies:
>>
>> * accept: Emit deprecated command results and events (default)
>> * hide: Suppress them
>>
>> For now, -compat covers only deprecated syntactic aspects of QMP.  We
>> may want to extend it to cover semantic aspects, CLI, and experimental
>> features.
>
> I suggest to use a qmp- prefix for qmp-related policies.

The interface is general.

The implemented infrastructure is QAPI-only.

Its application is QMP-only.

If our CLI was QAPIfied, I'd certainly apply it there, too.  I intend to
resume exploring CLI QAPIfication "real soon now".

Not covering CLI now is a bit like not covering semantic aspects of QMP.

Imagine the thing covered CLI.  Would we want to have separate -compat
deprecated-qmp-input, deprecated-cli-input?  I doubt it.  I think we
want a single policy for all host interfaces.

Imagine it covered deprecated semantic aspects of QMP.  Would we want to
have a separate flag for that?  Again, I doubt it.

For what it's worth, the interface is documented as experimental.


