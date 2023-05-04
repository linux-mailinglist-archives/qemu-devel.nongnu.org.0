Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E26F70F4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:34:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucq5-0003Mw-Qv; Thu, 04 May 2023 13:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubK5-0008UQ-55
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:56:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubK2-00080m-Ka
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683215790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QN8zHA79+6v89GkoW54UVytdiZxOmEkW673w+9Z2iOc=;
 b=QMH0688kCO2wMfTg3Tp3PbB6NyN3VD9JTcEsZcJCburwaX7IKkggKZdv/Tx17VyAjjTSkR
 O3hbFbFwWGTpNquigzwCdxXmd9QQX0TXAXJJ5+dzpIRNZpBHsoM9CYVdkarES7JtEihO5V
 qYkt1fG8jnA/ZN36ooUcNSBRC4MyCGw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-Stl-a_UPMHO00CiAO1WTHA-1; Thu, 04 May 2023 11:56:29 -0400
X-MC-Unique: Stl-a_UPMHO00CiAO1WTHA-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-63b6527a539so414502b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683215787; x=1685807787;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QN8zHA79+6v89GkoW54UVytdiZxOmEkW673w+9Z2iOc=;
 b=fr9lGCnNAPWAoC9maGAxofJawUzNR46fgsiSd7u7oM3b00swbUK5aPEfihpqU7cVju
 oEpfo58wzM3Dzk+dxRVAdfm2ME3/oPQhQu4fBHEpcFAJbkhRS8prYHmubogvw9B0IDfD
 1sl92W+qotI+uvozcFOhu80OgcsGq7OEA36F/0KvsXtaluRWSlrkG7oqm0EkUPncoVa+
 QbpihF9tXh6Ruz5sotAq8kR7uQPNvkNsbcmuE1quADhgMI8RqP2h7M6RqzlQCIwaBrrQ
 e+7glXZIn9FZiYZe19YaW2fCxhy8hoEDFSzXBXl82x4i1L4C0N1Eh+LGV12YU5m8TI53
 L3sA==
X-Gm-Message-State: AC+VfDxZs5xg/DPibeW6wCOcsX5dzpbIEmwWbMCJo4Vi57P3oJb8dPkC
 h2dlBT/0vc7SAbw7rUM8f2S/xKaEy7Ub6Gex6nab/wu++4wNeo3XXDdW7gTsSVUcz23ilKWIcyV
 NHowYa+J9BHLk4Qo=
X-Received: by 2002:a05:6a00:18a1:b0:643:87fd:1f9 with SMTP id
 x33-20020a056a0018a100b0064387fd01f9mr2548595pfh.2.1683215787564; 
 Thu, 04 May 2023 08:56:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6L5LgqD0k6Tj5s6XLXEfv0SI+odXlRvG8fesmLx0zDe690rfJH9bG0Wzz04nSRW813LNlPHA==
X-Received: by 2002:a05:6a00:18a1:b0:643:87fd:1f9 with SMTP id
 x33-20020a056a0018a100b0064387fd01f9mr2548575pfh.2.1683215787150; 
 Thu, 04 May 2023 08:56:27 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 q14-20020aa7842e000000b00640dbf177b8sm19329113pfn.37.2023.05.04.08.56.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 08:56:26 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <1873652a-6dac-2851-e09d-474ba9071731@redhat.com>
Date: Thu, 4 May 2023 21:26:22 +0530
Cc: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 alex.bennee@linaro.org, philmd@linaro.org, wainersm@redhat.com,
 bleal@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <45CAF08B-8A52-4D2D-A0BD-2FFDCE855589@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <ZFNmhT9Fosay1bee@redhat.com>
 <550DF0FD-701E-408D-924B-C33ABC0BFF10@redhat.com>
 <ZFN8YBO9MXM0qiKi@redhat.com>
 <1873652a-6dac-2851-e09d-474ba9071731@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On 04-May-2023, at 3:43 PM, Thomas Huth <thuth@redhat.com> wrote:
>=20
> On 04/05/2023 11.35, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, May 04, 2023 at 02:19:21PM +0530, Ani Sinha wrote:
>>>=20
>>>=20
>>>> On 04-May-2023, at 1:32 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>>=20
>>>> On Thu, May 04, 2023 at 08:35:53AM +0200, Thomas Huth wrote:
>>>>> On 03/05/2023 16.55, Ani Sinha wrote:
>>>>>> mformat and xorriso tools are needed by biosbits avocado tests. =
This patchset
>>>>>> adds those two tools in the docker container images.
>>>>>=20
>>>>> tests/qtest/cdrom-test.c already uses genisoimage to create ISO =
images, and
>>>>> the containers already have that tool installed. Could you maybe =
switch the
>>>>> biosbits test to use that tool? Or the other way round? ... at =
least having
>>>>> two tools to create ISO images in our containers sounds IMHO =
excessive.
>>>>=20
>>>> It looks like this series wasn't tested, because it doesn't even =
install
>>>> the alpine image:
>>>>=20
>>>> ERROR: unable to select packages:
>>>>  cdrkit-1.1.11-r3:
>>>>    conflicts: xorriso-1.5.4-r2[cmd:mkisofs=3D1.1.11-r3]
>>>>    satisfies: world[cdrkit]
>>>>  xorriso-1.5.4-r2:
>>>>    conflicts: cdrkit-1.1.11-r3[cmd:mkisofs=3D1.5.4-r2]
>>>>    satisfies: world[xorriso]
>>>>=20
>>>>=20
>>>> We definitely need to have either biosbits or cdrom-test.c changed =
to
>>>> use the same tool.
>>>=20
>>> Wait, it seems xorriso package also provides geninsoimage?
>>>=20
>>> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image =
manipulation tool
>>> Repo        : @System
>>> Matched from:
>>> Filename    : /usr/bin/genisoimage
>>>=20
>>> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image =
manipulation tool
>>> Repo        : rhel-9-for-x86_64-appstream-rpms
>>> Matched from:
>>> Filename    : /usr/bin/genisoimage
>>>=20
>>> $ rpm -ql  xorriso-1.5.4-4.el9.x86_64 | grep bin
>>> /usr/bin/cdrecord
>>> /usr/bin/genisoimage
>>> /usr/bin/mkisofs
>>> /usr/bin/osirrox
>>> /usr/bin/wodim
>>> /usr/bin/xorrecord
>>> /usr/bin/xorriso
>>> /usr/bin/xorriso-dd-target
>>> /usr/bin/xorrisofs
>> That is not the case in Fedora.  xorriso does not provide any
>> genisoimage binary, that's provided by a 'genisoimage' RPM
>> which was created from cdrkit src RPM.
>> Alpine likewise has no 'genisoimage' binary provided by
>> xorriso.
>> For even more fun, xorriso is now a sub-RPM of the libisoburn
>> source RPM
>> If we could make cdrom-test  use 'mkisofs' binary then we could
>> likely use the xorriso package on all platforms IIUC.
>=20
> I assume it shoul be pretty easy to replace it in crom-test.c ... =
genisofs is a successor of the old mkisofs, so the commandd line =
parameter should be very similar or even the same.

In my RHEL 9 box, funny that cdrom-test is actually using xorriso even =
today since genisoimage is eventually a symlink to xorriso and it works =
just fine :

$ QTEST_QEMU_BINARY=3D./qemu-system-x86_64 ./tests/qtest/cdrom-test
# random seed: R02S8027650089f37c7be48a579c1b3bdeaa
xorriso 1.5.4 : RockRidge filesystem manipulator, libburnia project.

xorriso 1.5.4
ISO 9660 Rock Ridge filesystem manipulator and CD/DVD/BD burn program
Copyright (C) 2019, Thomas Schmitt <scdbackup@gmx.net>, libburnia =
project.
xorriso version   :  1.5.4
Version timestamp :  2021.01.30.150001
Build timestamp   :  -none-given-
libisofs   in use :  1.5.4  (min. 1.5.4)
libburn    in use :  1.5.4  (min. 1.5.4)
libburn OS adapter:  internal GNU/Linux SG_IO adapter sg-linux
libisoburn in use :  1.5.4  (min. 1.5.4)
Provided under GNU GPL version 3 or later, due to libreadline license.
There is NO WARRANTY, to the extent permitted by law.
xorriso 1.5.4 : RockRidge filesystem manipulator, libburnia project.

> Ani, could you add a patch to your series to replace it there?

Just sent the updated patch. Yes replacing genisoimage with xorrisfs is =
good enough. Exact same arguments work just fine.=


