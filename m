Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8715936D980
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:23:17 +0200 (CEST)
Received: from localhost ([::1]:53638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl5w-00051B-JN
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbl1L-0008EA-Ll
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:18:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbl1I-000455-I1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619619506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+Nki2JJcMEWGOcH8eYxhc5SiXS4gA6g/cIVHGePdkk=;
 b=JzzfxGMkLGGKADaBn56Hd6813w0n6aELHwjTRt5U8c7i1GCEcddZMTxrUOCA27sHsfydPM
 x2EgXbhgSEhyu0G7wieHo4YEdSlqsIV6LWU9AOrtq+BqkunIqbQiiyQEBqMuUv/Q7cMrZg
 A8+MHkQWHkn7mF+Zdz4d7aGlOxYNmMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-0ZijcpD-OQ2BRP5cyj6bQA-1; Wed, 28 Apr 2021 10:18:24 -0400
X-MC-Unique: 0ZijcpD-OQ2BRP5cyj6bQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08878107ACED;
 Wed, 28 Apr 2021 14:18:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A0EB60C05;
 Wed, 28 Apr 2021 14:18:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 76B6A113525D; Wed, 28 Apr 2021 16:18:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
 <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
 <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
 <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
 <9714a87d-95f7-a6f0-4c35-a7e9d1aa1144@redhat.com>
 <YIkpXqg5/wV1QNZB@stefanha-x1.localdomain>
Date: Wed, 28 Apr 2021 16:18:17 +0200
In-Reply-To: <YIkpXqg5/wV1QNZB@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Wed, 28 Apr 2021 10:22:38 +0100")
Message-ID: <87mtti1oie.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Tue, Apr 27, 2021 at 02:02:27PM -0400, John Snow wrote:
>> On 4/27/21 1:54 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> > On 4/27/21 7:16 PM, John Snow wrote:
>> > > On 4/27/21 9:54 AM, Stefan Hajnoczi wrote:
>> > > > I suggest fixing this at the qdev level. Make piix3-ide have a
>> > > > sub-device that inherits from ISA_DEVICE so it can only be instant=
iated
>> > > > when there's an ISA bus.
>> > > >=20
>> > > > Stefan
>> > >=20
>> > > My qdev knowledge is shaky. Does this imply that you agree with the
>> > > direction of Thomas's patch, or do you just mean to disagree with Ph=
il
>> > > on his preferred course of action?
>> >=20
>> > My understanding is a disagreement to both, with a 3rd direction :)
>> >=20
>> > I agree with Stefan direction but I'm not sure (yet) that a sub-device
>> > is the best (long-term) solution. I guess there is a design issue with
>> > this device, and would like to understanding it first.
>> >=20
>> > IIUC Stefan says the piix3-ide is both a PCI and IDE device, but QOM
>> > only allow a single parent. Multiple QOM inheritance is resolved as
>> > interfaces, but PCI/IDE qdev aren't interfaces, rather abstract object=
s.
>> > So he suggests to embed an IDE device within the PCI piix3-ide device.
>> >=20
>> > My view is the PIIX is a chipset that share stuffs between components,
>> > and the IDE bus belongs to the chipset PCI root (or eventually the
>> > PCI-ISA bridge, function #0). The IDE function would use the IDE bus
>> > from its root parent as a linked property.
>> > My problem is currently this device is user-creatable as a Frankenstei=
n
>> > single PCI function, out of its chipset. I'm not sure yet this is a
>> > dead end or I could work something out.
>> >=20
>> > Regards,
>> >=20
>> > Phil.
>> >=20
>>=20
>> It sounds complicated. In the meantime, I think I am favor of taking
>> Thomas's patch because it merely adds some error routing to allow us to
>> avoid a crash. The core organizational issues of the IDE device(s) will
>> remain and can be solved later as needed.
>
> The approach in this patch is okay but we should keep in mind it only
> solves piix3-ide. ISA provides a non-qdev backdoor API and there may be
> more instances of this type of bug.
>
> A qdev fix would address the root cause and make it possible to drop the
> backdoor API, but that's probably too much work for little benefit.

What do you mean by backdoor API?  Global @isabus?


