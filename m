Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D406F67FC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:08:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUwk-0001r5-Kw; Thu, 04 May 2023 05:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puUwh-0001qW-IU
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puUwf-0001G9-Ue
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683191292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CsFQM9BYZaWFpLYfhZ48IDcxK9IFvFan4vDYhKBwdE=;
 b=H9d/fedkznUmy89s/qFf3/bShRnj5scL+YDkWEv8yYAwDQVX+Rs9UX6jCH6ah9v1f4L3VD
 Q39aVO/dtyQIeFGrvIByjfDG2uYxq2Jf3zZo++bePefZx034877UFALY0DfrVAPCe8p6mq
 GGGIpFLx+1ixHZh5iDcXESSvUz1g3nE=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-JAfWUnIqNQOjIyafBn_SMA-1; Thu, 04 May 2023 05:08:11 -0400
X-MC-Unique: JAfWUnIqNQOjIyafBn_SMA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-63b679e4c09so171255b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683191290; x=1685783290;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CsFQM9BYZaWFpLYfhZ48IDcxK9IFvFan4vDYhKBwdE=;
 b=l8a2zZCFa/4k8qv8gK+Xfpvrwg6WR1/qQ7VLknFFaLB4doXy21rGEaIS2YNCeAn1AT
 cKFpfc58tibzzyV7T8XpywkgULGMvdTVKAwgy5BPTJY8Ys+E0AjpyLRvztrUimqHcyGR
 BwnDHwMzWQ+9TOVuIVK0CMdP4xLlua5f3LGSqc3QZXOV+aP5UES13goNV44qyLCNh71+
 PUresvF5UgSZSlXCjSijIq1l2SZA5iiHUaEkm5MNvBzUIRQQFUXPn2iv8ftPEhI3266G
 bSWlEdMaJuczn1whxGGb03pMnJDdhi4HLIygm7lN/+r/60zpSsp/n5AIfy/1PDhdGfGo
 745w==
X-Gm-Message-State: AC+VfDzBn4E+XChZkp1Rjwa+v4jn7EjQ0rihPNb5AVKrE9DGJT+RQk+S
 14MaHusrY50p/2mbLecEYX2QleAoB3axC760WKTou3LInPIwHfgwTHKUEgi7PA0XQ6zznrTjvQp
 /av+NGYjqJcYwAp4=
X-Received: by 2002:a05:6a00:2285:b0:63b:8a00:4580 with SMTP id
 f5-20020a056a00228500b0063b8a004580mr2347329pfe.0.1683191290671; 
 Thu, 04 May 2023 02:08:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6p626a+3rq3jSeH2J9OZLLyCtm1xQfeJbiuW0WYAoZYvQ/umqVW0Wky+vBmjxncywA1iTcrA==
X-Received: by 2002:a05:6a00:2285:b0:63b:8a00:4580 with SMTP id
 f5-20020a056a00228500b0063b8a004580mr2347310pfe.0.1683191290388; 
 Thu, 04 May 2023 02:08:10 -0700 (PDT)
Received: from smtpclient.apple ([115.96.136.25])
 by smtp.gmail.com with ESMTPSA id
 c37-20020a634e25000000b00528513c6bbcsm15807704pgb.28.2023.05.04.02.08.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 May 2023 02:08:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <ZFNzrXnLAVO37LgX@redhat.com>
Date: Thu, 4 May 2023 14:38:05 +0530
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 wainersm@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B1797E23-F291-4DB8-A584-8580E5DA612B@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <602A585B-01D1-4140-899F-F7E3A5045E47@redhat.com>
 <ZFNzrXnLAVO37LgX@redhat.com>
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



> On 04-May-2023, at 2:28 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Thu, May 04, 2023 at 12:40:12PM +0530, Ani Sinha wrote:
>>=20
>>=20
>>> On 04-May-2023, at 12:05 PM, Thomas Huth <thuth@redhat.com> wrote:
>>>=20
>>> On 03/05/2023 16.55, Ani Sinha wrote:
>>>> mformat and xorriso tools are needed by biosbits avocado tests. =
This patchset
>>>> adds those two tools in the docker container images.
>>>=20
>>> tests/qtest/cdrom-test.c already uses genisoimage to create ISO =
images, and the containers already have that tool installed. Could you =
maybe switch the biosbits test to use that tool? Or the other way round? =
... at least having two tools to create ISO images in our containers =
sounds IMHO excessive.
>>=20
>> The dependency comes from the use of grub-mkrescue in the avocado
>> test in order to generate the iso with the bios bits enabled grub
>> and boot off with it. Grub-mkrescue is a bash script that uses
>> mformat and xorriso.
>=20
> Where does grub-mkrescue come from ?  IIUC, we don't have a dep
> on the grub package in our dockerfiles.

Bios bits runs from grub and builds grub utilities as a part of the =
build process which the test uses. That being said, mkrescue is just a =
bash script that uses those two utilities - mformat and xorriso from the =
docker environment. It also has some dependencies on the grub binaries =
generated as a part of the build process.=


