Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7247536E4BA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 08:09:59 +0200 (CEST)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbzs6-0007KU-0T
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 02:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbzql-0006t3-7L
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 02:08:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbzqh-00061t-Py
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 02:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619676510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3MVecfm8eIsfldfiM30P/z+uNFuixYJ0XAfjlMTRa4=;
 b=Mc/WNSux7HrzsmKlDya97mbW+9pd09Eh6C0G3Jjii+k0MfkoL4L4uTvl+ZQCsEXn3/1gYb
 s84zE2uf8wnBuTdfX7IB1q0wyL2a2KeLLcTz2Fd1hSafP2cYcerwu62MYzl4l5znUOCuiy
 alGPlgXKuI1beahyeC6VT+lusUi508g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-H9JMysZDO-6l3fHH-QETWA-1; Thu, 29 Apr 2021 02:08:28 -0400
X-MC-Unique: H9JMysZDO-6l3fHH-QETWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A6F118982A3;
 Thu, 29 Apr 2021 06:08:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5058219714;
 Thu, 29 Apr 2021 06:08:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE4F5113525D; Thu, 29 Apr 2021 08:08:21 +0200 (CEST)
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
 <87mtti1oie.fsf@dusky.pond.sub.org>
 <YImsxg/G2u659nkI@stefanha-x1.localdomain>
Date: Thu, 29 Apr 2021 08:08:21 +0200
In-Reply-To: <YImsxg/G2u659nkI@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Wed, 28 Apr 2021 19:43:18 +0100")
Message-ID: <87h7jpipwq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Wed, Apr 28, 2021 at 04:18:17PM +0200, Markus Armbruster wrote:
>> Stefan Hajnoczi <stefanha@redhat.com> writes:

[...]

>> > The approach in this patch is okay but we should keep in mind it only
>> > solves piix3-ide. ISA provides a non-qdev backdoor API and there may be
>> > more instances of this type of bug.
>> >
>> > A qdev fix would address the root cause and make it possible to drop the
>> > backdoor API, but that's probably too much work for little benefit.
>> 
>> What do you mean by backdoor API?  Global @isabus?
>
> Yes. It's also strange that isa_get_irq(ISADevice *dev, unsigned isairq)
> accepts dev = NULL as a valid argument.

@isabus is static in hw/isa/isa-bus.c.  Uses:

* Limit isa_bus_new() to one ISA bus.  Arbitrary restriction; multiple
  ISA buses could work with suitable memory mapping and IRQ wiring.
  "Single ISA bus" assumptions could of course hide elsewhere in the
  code.

* Implied argument to isa_get_irq(), isa_register_ioport(),
  isa_register_portio_list(), isa_address_space(),
  isa_address_space_io().

  isa_get_irq() asserts that a non-null @dev is a child of @isabus.
  This means we don't actually need @isabus, except when @dev is null.
  I suspect two separate functions would be cleaner: one taking an
  ISABus * argument, and a wrapper taking an ISADevice * argument.

  isa_address_space() and isa_address_space_io() work the same, less the
  assertion.

  isa_register_ioport() and isa_register_portio_list() take a non-null
  @dev argument.  They don't actually need @isabus.

To eliminate global @isabus, we need to fix up the callers passing null
@dev.  Clean solution: plumb the ISABus returned by isa_bus_new() to the
call sites.  Where that's impractical, we can also get it from QOM, like
build_dsdt_microvm() does.


