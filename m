Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A03414A4E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:12:41 +0200 (CEST)
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT23E-0000OF-Bk
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT1y4-0002zs-4r
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT1y0-0000KC-C9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632316035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aDM7xOqS5HjF6fVHT1+JkA7AXGph9YObLe5E6VBatXs=;
 b=INdXEYE3tcFKxQWLa5TEBDRXP1ejH7hvyqCZcAtLhvGhO1kGgJEHVD0+ABUe61u+BmvUZK
 oLN4IUKEw0sLfxcmFrzaKwbRou/Wx+XdSq6mFzAgkOf/sxQqfWwi2RAvxWubLqBrV86qGp
 qZPIgeOU9yp0yl9BLlWbP3+7AvKCFBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-mMVwcUf8Ory4Xo0VrS8Q4A-1; Wed, 22 Sep 2021 09:07:14 -0400
X-MC-Unique: mMVwcUf8Ory4Xo0VrS8Q4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 059C784A5E7;
 Wed, 22 Sep 2021 13:07:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBF145DEB8;
 Wed, 22 Sep 2021 13:07:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 646F9113865F; Wed, 22 Sep 2021 15:07:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: ensuring a machine's buses have unique names
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
 <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
 <87mtoe4g40.fsf@dusky.pond.sub.org>
 <CAFEAcA_ExFiv3AurBAtTan10yuXRnsHMQS0yHa-vJpwB9u4HoA@mail.gmail.com>
 <71bb7b84-28a3-dd4b-d375-4b2494832655@eik.bme.hu>
 <87y27przt6.fsf@dusky.pond.sub.org>
 <79a46e17-ddae-eab8-9ff6-80c3a64d0cb@eik.bme.hu>
Date: Wed, 22 Sep 2021 15:07:11 +0200
In-Reply-To: <79a46e17-ddae-eab8-9ff6-80c3a64d0cb@eik.bme.hu> (BALATON
 Zoltan's message of "Wed, 22 Sep 2021 11:58:24 +0200 (CEST)")
Message-ID: <878rzokbcw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Wed, 22 Sep 2021, Markus Armbruster wrote:
>> BALATON Zoltan <balaton@eik.bme.hu> writes:
>>> To me it looks like device code can't really set a globally unique
>>> name on creating the bus without getting some help from upper
>>> levels. So maybe naming busses should be done by qdev (or whatever is
>>> handling this) instead of passing the name as an argument to
>>> qbus_create or only use that name as a unique component within the
>>> device and append it to a unique name for the device.
>>
>> Have you read the whole thread?  qdev does come up with a name when
>
> No I haven't. This just got my attention because I'm responsible for
> adding ati-vga.ddc and sm501.i2c and some ppc440 stuff so I was
> wondering what could I do better bur otherwise I did not check the
> whole thread so just ignore what I said if it's not useful in this
> context.

I wouldn't call it "not useful".

What you could do better in future code: pass a null bus name.  This is
not obvious.  As Peter noted "we created a family of easy-to-misuse
APIs".

[...]


