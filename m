Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25612D031
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Dec 2019 14:18:26 +0100 (CET)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iluwC-0001n3-Oq
	for lists+qemu-devel@lfdr.de; Mon, 30 Dec 2019 08:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mprivozn@redhat.com>) id 1iluvS-0001NK-Rq
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 08:17:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mprivozn@redhat.com>) id 1iluvP-0005I2-TL
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 08:17:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50271
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mprivozn@redhat.com>) id 1iluvP-0005He-F8
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 08:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577711854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+7EGlM4R/qNptR4lHDQ7QcyBT5Kzp7XMdLxvzq1guQ=;
 b=cD9PTqZ0gcAwMSYL+PvDdLRoyBuzLCi7+6TacFESTbGY56TRmSrb1V2SBdP5OHomlWRJtw
 y7NZuLsvvaNwnyDef8srtjB8OQ/Ye7sBnECoeLHjBJEiPnoNYdGXrR2yvWgxLMjEbrJDsu
 4p2k6Zj8ydEz9F1pDXA47pwv5FM96CI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-bOAOdO2MMYGQIQwPWFqFOQ-1; Mon, 30 Dec 2019 08:17:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 992A718031C7
 for <qemu-devel@nongnu.org>; Mon, 30 Dec 2019 13:17:31 +0000 (UTC)
Received: from [10.40.204.31] (ovpn-204-31.brq.redhat.com [10.40.204.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10A01108132E;
 Mon, 30 Dec 2019 13:17:25 +0000 (UTC)
Subject: Re: [PATCH] x86: Check for machine state object class before
 typecasting it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <7cc91bab3191bfd7e071bdd3fdf7fe2a2991deb0.1577692822.git.mprivozn@redhat.com>
 <bda93e70-f737-4384-0422-3901767b6330@redhat.com>
 <e70937bd-15e9-aa75-d894-b32b43052b6a@redhat.com>
 <b718e77c-9b49-9c18-7b9b-55333ab0afe5@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <337056f8-4c8f-9a18-5f58-13dc459f6346@redhat.com>
Date: Mon, 30 Dec 2019 14:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b718e77c-9b49-9c18-7b9b-55333ab0afe5@redhat.com>
Content-Language: sk-SK
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: bOAOdO2MMYGQIQwPWFqFOQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/19 10:45 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 12/30/19 10:35 AM, Michal Pr=C3=ADvozn=C3=ADk wrote:
>> On 12/30/19 9:41 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 12/30/19 9:00 AM, Michal Privoznik wrote:
>>>> In v4.2.0-246-ged9e923c3c the SMM property was moved from PC
>>>
>>> Typo v4.2.0-246-ged9e923c3c -> ed9e923c3c.
>>
>> This depends on how you format the hash :-)
>> I've used 'git describe ed9e923c3c' because I find it more readable for
>> us humans (at least we see what version the commit was introduced in).
>> But I don't know what the praxis is in qemu.
>=20
> Hmm I never used it. Your explanation makes sense, but the tag confused
> me because I don't have it locally. However git (and gitk) seems clever
> enough to only use the useful part:

The v4.2.0 tag is in origin. I wonder how come you do not have it.

>=20
> $ git show randomcrap-ged9e923c3c
> commit ed9e923c3c9a2c50c4e82ba178b3fb1feba56867
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:=C2=A0=C2=A0 Thu Dec 12 17:28:01 2019 +0100
>=20
> =C2=A0=C2=A0=C2=A0 x86: move SMM property to X86MachineState
>=20
> FYI My output is different:
>=20
> $ git describe ed9e923c3c
> pull-target-arm-20191216-1-199-ged9e923c3c

You may want to use 'git describe --tags --match "v*" $commit'

But again, feel free to change it to whatever you/committer wants.

Michal


