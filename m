Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F8456B8B9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:42:50 +0200 (CEST)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9mNi-0003Qw-Rt
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9mLz-0002VV-Gu
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9mLv-0008I0-S6
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657280454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOiZN9eN/jTn5kwCjT80/BDcKGBf4OJld2nWdo/vVaI=;
 b=eS6IzuTOM7Gx7TxqAmrvuw2y41PCg+8Vje2vfX+DXNW5Uk/L7oWR8Uxo+t+YDRyvHrRY5Z
 zTLbXNWjrebDREzhCKMg25FYSiPVXsa8vmUa0nuTXDAJ8mi+0kRJfrWNWYIA7lU8Kurxad
 sD4xL75NRVeP0wPhHX0ohOKjZf2846M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-e1JBm12nPuGmrgS0pdzQ3w-1; Fri, 08 Jul 2022 07:40:45 -0400
X-MC-Unique: e1JBm12nPuGmrgS0pdzQ3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 593BD18A64EA;
 Fri,  8 Jul 2022 11:40:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BDB92026D64;
 Fri,  8 Jul 2022 11:40:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19CB721E690D; Fri,  8 Jul 2022 13:40:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>,  qemu-devel@nongnu.org,  Hanna Reitz
 <hreitz@redhat.com>,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>
Subject: The case for array properties (was: [PULL 14/15] qdev: Base object
 creation on QDict rather than QemuOpts)
References: <20211015144640.198044-1-kwolf@redhat.com>
 <20211015144640.198044-15-kwolf@redhat.com>
 <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
 <87wnctzdl9.fsf@pond.sub.org>
 <CAFEAcA_cYpt_FU5mD+X+BSmQq9e6u1n+nm8EVfdrPeVN0o3Spw@mail.gmail.com>
Date: Fri, 08 Jul 2022 13:40:43 +0200
In-Reply-To: <CAFEAcA_cYpt_FU5mD+X+BSmQq9e6u1n+nm8EVfdrPeVN0o3Spw@mail.gmail.com>
 (Peter Maydell's message of "Thu, 7 Jul 2022 21:24:09 +0100")
Message-ID: <87y1x37ryc.fsf_-_@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Cc'ing QOM maintainers.

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 4 Jul 2022 at 05:50, Markus Armbruster <armbru@redhat.com> wrote:
>> My initial (knee-jerk) reaction to breaking array properties: Faster,
>> Pussycat! Kill! Kill!
>
> In an ideal world, what would you replace them with?

Let's first recapitulate their intended purpose.

commit 339659041f87a76f8b71ad3d12cadfc5f89b4bb3q
Author: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Date:   Tue Aug 19 23:55:52 2014 -0700

    qom: Add automatic arrayification to object_property_add()
=20=20=20=20
    If "[*]" is given as the last part of a QOM property name, treat that
    as an array property. The added property is given the first available
    name, replacing the * with a decimal number counting from 0.
=20=20=20=20
    First add with name "foo[*]" will be "foo[0]". Second "foo[1]" and so
    on.
=20=20=20=20
    Callers may inspect the ObjectProperty * return value to see what
    number the added property was given.
=20=20=20=20
    Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
    Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

This describes how they work, but sadly not why we want them.  For such
arcane lore, we need to consult a guru.  Possibly via the mailing list
archive.

Digression: when you add a feature, please, please, *please* explain why
you need it right in the commit message.  Such rationale is useful
information, tends to age well, and can be quite laborious to
reconstruct later.

Even though I'm sure we discussed the intended purpose(s) of array
properties before, a quick grep of my list archive comes up mostly
empty, so I'm falling back to (foggy) memory.  Please correct mistakes
and fill in omissions.

We occasionally have a need for an array of properties where the length
of the array is not fixed at compile time.  Say in code common to
several related devices, where some have two frobs, some four, and a
future one may have some other number.

We could define properties frob0, frob1, ... frobN for some fixed N.
Users have to set them like frob0=3D...,frob1=3D... and so forth.  We need
code to reject frobI=3D... for I exeeding the actual limit.

Array properties spare developers picking a fixed N, and users adding an
index to the property name.  Whether the latter is a good idea is
unclear.  We need code to reject usage exceeding the actual limit.

A secondary use is (was?) avoiding memory region name clashes in code we
don't want to touch.  Discussed in the review of my attempt to strangle
array properties in 2014:

    Message-ID: <87sihn9nji.fsf@blackfin.pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2014-11/msg02103.html


