Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43805F3CE1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 08:48:43 +0200 (CEST)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofbjO-0007Mq-7W
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 02:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ofbbO-0003aN-9i
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 02:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ofbb6-0007Mo-Lj
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 02:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664865604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6PEhVwsUdblHwK3rj087xFdWJz6Ber5xF9LonashWM=;
 b=b+Q/GGgWNrdx4MalOz9kkKGLTTIesud4If1cooqNlJdRb4eIdZIUsslPrrzBtuBrpkYMjO
 i+QwvBybAYF4oCdpl6MkqduzlpGd9+S2NZz1stoXTUlvNam/Vmg8E8V073EktekpE6bEyI
 dX1m9nxhtuNgOdmxMb5UGCuY+DhMqz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-PeQ0Dm9qOOSFsYJ04dglHg-1; Tue, 04 Oct 2022 02:40:01 -0400
X-MC-Unique: PeQ0Dm9qOOSFsYJ04dglHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D03EF862FE4;
 Tue,  4 Oct 2022 06:40:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9DDC2166B26;
 Tue,  4 Oct 2022 06:39:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BEF021E691D; Tue,  4 Oct 2022 08:39:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  BALATON Zoltan
 <balaton@eik.bme.hu>,  qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v2 06/13] mac_newworld: Simplify creation of Uninorth
 devices
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <4a039abeeddcc6c987065ca526c6fa0457784615.1664108862.git.balaton@eik.bme.hu>
 <fbb38c03-6092-78e2-c1af-e37f1674bad4@ilande.co.uk>
 <76294919-528e-4174-b8df-8e97c10c788a@amsat.org>
Date: Tue, 04 Oct 2022 08:39:57 +0200
In-Reply-To: <76294919-528e-4174-b8df-8e97c10c788a@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 3 Oct 2022 16:05:49
 +0200")
Message-ID: <87pmf8gkhu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Cc'ing CLI refactor team.
>
> On 29/9/22 09:39, Mark Cave-Ayland wrote:
>> On 25/09/2022 13:38, BALATON Zoltan wrote:
>>=20
>>> Avoid open coding sysbus_mmio_map() and map regions in ascending
>>> otder. Reorganise code a bit to avoid some casts.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>> =C2=A0 hw/ppc/mac_newworld.c | 42 +++++++++++++++++--------------------=
-----
>>> =C2=A0 1 file changed, 17 insertions(+), 25 deletions(-)
>
>> Same comment here re: sysbus. Also the patch seems correct here, but it =
is worth noting that the PCI bus initialisation is order sensitive: the=20
>> last bus created is the one that becomes the default PCI bus for -device=
, so changing this would break quite a few command lines...
>
> Eh, I was not aware of this API fragility. So when using -device without
> expliciting the 'bus' key, the default is the latest bus created... OK.

Yes, our external interface is in part defined implicitly by the order
in board code execution.  It goes deeper than just CLI, I'm afraid.

Omitting bus=3D is a convenience feature for users.  It's clearly useful.
But what's the default?  We walk the qdev tree rooted at the main system
bus looking for a bus of suitable bus type that is not full, or else of
suitable type that is full.  See qdev_find_recursive().  The tree walk
visits children in creation order.  Therefore, bus creation order is
ABI.

Related: bus names.

For user-created buses, the bus name depends on the owning device's qdev
ID (specified with id=3DID).  If it has none, the system picks a bus name;
more on that below.  Else, it is ID.N, where N counts from zero.  When a
device creates multiple buses of the same type, its bus creation order
is ABI.

For onboard devices, the bus name can be specified by board code.  If
board code elects not to, the system picks a name.

System-picked names are TYPE.N, where TYPE is the bus type name such as
"pci" or "isa", and N counts from zero separately for each type.  Again,
bus creation order is ABI.

This is qbus_init_internal().

Letting users omit qdev IDs is a convenience feature.

Letting developers delegate bus name picking to the system is also a
convenience feature.  Without it, we'd need bus name logic in board code
and not just qbus_init_internal().

I dislike implicit ABI definitions.

Rarely met a QEMU convenience feature that didn't bite us in the
posterior later (the sensitivity of my posterior may well cloud my
memory, though).


