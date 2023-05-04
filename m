Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13E6F682A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:17:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puV5R-0005fc-A8; Thu, 04 May 2023 05:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puV5O-0005f9-PS
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puV5L-0006aD-Dk
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683191830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRZvrLOX2JF/w4J5ekmZGWA3HZv7JvvjxUu0iJSg3FM=;
 b=VQRBSStiw1qcNmG1gTHFrj2Zzdo+3U+vjBXOJB+UDM+hmKG5srRempylw+aP+49Ki43fR5
 hA9nRUDVgA7V7fE0jt5zpU9HHMCrvI8Ww/IYfN9W9kTmrS2d5ZwKo9yg+hYZZmjXYAVpyw
 Zvl5ArjAaMh8yP6w5viLBDfv/zUtk7o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-3l-eONlbPNSE6hMbLHbfiw-1; Thu, 04 May 2023 05:17:08 -0400
X-MC-Unique: 3l-eONlbPNSE6hMbLHbfiw-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6434e3d1975so164664b3a.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683191827; x=1685783827;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRZvrLOX2JF/w4J5ekmZGWA3HZv7JvvjxUu0iJSg3FM=;
 b=UZ3Ou0zqc+MmymXQfhOQaMb20pZ5k/1TMTm9djFCbMA1rLGGicNwJ2IoDijNi0JB1k
 GfXGbR+so9FOo8hBtRZnSodSIA02jMpbDlxi1EsIFH3rCwgLeyuNRHmPUpuybCiYv9o7
 cFg+51wVyefncGqg1JtASXfFDu0i8nYtqqte2eP71ABqQO0JyU6Tdd0t6jIxKkJ4ZtNs
 SAeDqfZYqeCIsJHKHCtafn7hv/9V2u7O24w35vquOIT9ehKNiVP3Ith4rotUqq3Xo+S2
 Q6HmScT1ky3xXdeoy4K3UiDF6RDp7FLTii6l/zKau/ODBgob1QbnNcxlffOKHouZ6V78
 tJBw==
X-Gm-Message-State: AC+VfDzsYbUIqpFm6fh5wnI3E9Rh6lPCGgm4WyftLccsgLF3cApqc9jI
 1RTBGQFn+Lb+I64mwcLCvmgUrAvo2o+/MWch3yzgw+iSjD6A9nrDCYNFDruB7qSejM0zZPYvpbD
 KZCj+1In/Ov5gnLI=
X-Received: by 2002:a05:6a00:2e06:b0:62d:8376:3712 with SMTP id
 fc6-20020a056a002e0600b0062d83763712mr1690586pfb.28.1683191827621; 
 Thu, 04 May 2023 02:17:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HwRsV7fLsNjhGfoEa4MX9uatXC7c73jgwJlYoKq5hH0fEh27c0CqRu4DKyUFKpcf3uPbZkg==
X-Received: by 2002:a05:6a00:2e06:b0:62d:8376:3712 with SMTP id
 fc6-20020a056a002e0600b0062d83763712mr1690571pfb.28.1683191827311; 
 Thu, 04 May 2023 02:17:07 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a624e0f000000b0063f534f0937sm20014661pfb.46.2023.05.04.02.17.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 02:17:06 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <550DF0FD-701E-408D-924B-C33ABC0BFF10@redhat.com>
Date: Thu, 4 May 2023 14:47:02 +0530
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org, philmd@linaro.org,
 wainersm@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B15500B5-EAE7-4229-B49B-9B9F75B9DB17@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <ZFNmhT9Fosay1bee@redhat.com>
 <550DF0FD-701E-408D-924B-C33ABC0BFF10@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
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



> On 04-May-2023, at 2:19 PM, Ani Sinha <anisinha@redhat.com> wrote:
>=20
>=20
>=20
>> On 04-May-2023, at 1:32 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>=20
>> On Thu, May 04, 2023 at 08:35:53AM +0200, Thomas Huth wrote:
>>> On 03/05/2023 16.55, Ani Sinha wrote:
>>>> mformat and xorriso tools are needed by biosbits avocado tests. =
This patchset
>>>> adds those two tools in the docker container images.
>>>=20
>>> tests/qtest/cdrom-test.c already uses genisoimage to create ISO =
images, and
>>> the containers already have that tool installed. Could you maybe =
switch the
>>> biosbits test to use that tool? Or the other way round? ... at least =
having
>>> two tools to create ISO images in our containers sounds IMHO =
excessive.
>>=20
>> It looks like this series wasn't tested, because it doesn't even =
install
>> the alpine image:
>>=20
>> ERROR: unable to select packages:
>> cdrkit-1.1.11-r3:
>>   conflicts: xorriso-1.5.4-r2[cmd:mkisofs=3D1.1.11-r3]
>>   satisfies: world[cdrkit]
>> xorriso-1.5.4-r2:
>>   conflicts: cdrkit-1.1.11-r3[cmd:mkisofs=3D1.5.4-r2]
>>   satisfies: world[xorriso]
>>=20
>>=20
>> We definitely need to have either biosbits or cdrom-test.c changed to
>> use the same tool.
>=20
> Wait, it seems xorriso package also provides geninsoimage?
>=20
> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image =
manipulation tool
> Repo        : @System
> Matched from:
> Filename    : /usr/bin/genisoimage
>=20
> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image =
manipulation tool
> Repo        : rhel-9-for-x86_64-appstream-rpms
> Matched from:
> Filename    : /usr/bin/genisoimage
>=20
> $ rpm -ql  xorriso-1.5.4-4.el9.x86_64 | grep bin
> /usr/bin/cdrecord
> /usr/bin/genisoimage
> /usr/bin/mkisofs
> /usr/bin/osirrox
> /usr/bin/wodim
> /usr/bin/xorrecord
> /usr/bin/xorriso
> /usr/bin/xorriso-dd-target
> /usr/bin/xorrisofs
>=20

Ah

$ file /usr/bin/genisoimage
/usr/bin/genisoimage: symbolic link to =
/etc/alternatives/mkisofs-genisoimage
$ vi /etc/alternatives/mkisofs-genisoimage
$ file /etc/alternatives/mkisofs-genisoimage
/etc/alternatives/mkisofs-genisoimage: symbolic link to =
/usr/bin/xorrisofs


But the one provided by cdrkit is actually a elf binary in its own =
right. So if we replace genisoimage with xorriso, we need to check that =
the iso file for cdrom-test in a way that does not break it.


