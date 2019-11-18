Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FDA100364
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 12:02:36 +0100 (CET)
Received: from localhost ([::1]:60575 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWenj-0001f8-9p
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 06:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iWeiE-0005uT-7u
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:56:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iWeiD-0006cl-2d
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:56:54 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43377
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iWeiC-0006cC-Vh
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574074611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmY3kfgf2l0GRL1Y8XTArTj4/ehty1sXljpIc6RpM04=;
 b=Qz58sPNaEe9t2AZJHX3zEcxaCYD6ztW+i9pIEH760xP6/6qw833snEIDn1sN3s0/Dg8K8w
 5YiiSB32NYn5S7Rgas5TNl0Vci1kF3heO/GM9GTzIro2rtGco//oaU4HCGwqAiEEpusrB8
 5x1LeJoGjR1seZHKox1z9W96Zl2NkbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-lDuSTbWxPZ6O-FNhHL0_pg-1; Mon, 18 Nov 2019 05:56:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32743107ACC5;
 Mon, 18 Nov 2019 10:56:47 +0000 (UTC)
Received: from [10.36.118.85] (unknown [10.36.118.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE8828DC8;
 Mon, 18 Nov 2019 10:56:44 +0000 (UTC)
Subject: Re: [PATCH v1 0/2] s390x/cpumodel: Introduce "best" model variants
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191108110714.7475-1-david@redhat.com>
 <CAFEAcA-mD3-Zg2JunGpMqbcaT1qboCenhqEFytZD0FmFcL2i9Q@mail.gmail.com>
 <5dd613c0-6d9e-b943-b64d-7ba1791cbefe@redhat.com>
 <CAFEAcA-4r53vM-K24WYr1OFSOufhZ7hDHeZBhnywyaJ0gpMO1g@mail.gmail.com>
 <20191108191057.GZ3812@habkost.net>
 <CAFEAcA_No5oAFtULbAOrPDeQE18HHgc0agXbs4m2AGZ+gK_ReQ@mail.gmail.com>
 <66c64c6d-b7c0-2cb1-2b29-4fdd9b369714@redhat.com>
 <CAFEAcA-Q7H9sZjN-PcMMDHQU41yN1RdXhNY5KqMh7E6xh0yjgA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <3aa1d025-20a3-e813-2fe6-35518efedf2f@redhat.com>
Date: Mon, 18 Nov 2019 11:56:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Q7H9sZjN-PcMMDHQU41yN1RdXhNY5KqMh7E6xh0yjgA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: lDuSTbWxPZ6O-FNhHL0_pg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Michael Mueller <mimu@linux.ibm.com>,
 Jiri Denemark <jdenemar@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.19 11:53, Peter Maydell wrote:
> On Mon, 18 Nov 2019 at 10:47, David Hildenbrand <david@redhat.com> wrote:
>> My personal opinion: "max" really means "all features". If we want an
>> automatic way to specify something you requested ("give me something
>> that's going to work") we either have to change the definition of the
>> max model for alla rchitectures or introduce something that really
>> matches the "no -cpu specified" - e.g., "best".
>=20
> I don't strongly object to 'max' including deprecated features,
> but I do definitely object to 'max' including by default any
> experimental (x- prefix) features. Those should never be
> enabled (whatever the '-cpu foo' name) unless the user has
> specifically opted into them: that's the point of the x- prefix.
> We need to be able to tell from the command line whether it's
> got any non-standard weirdness enabled.

I'll let Eduardo respond to that, as we don't really have experimental=20
features on s390x, especially under KVM ("host" corresponds to "max").

>=20
> thanks
> -- PMM
>=20


--=20

Thanks,

David / dhildenb


