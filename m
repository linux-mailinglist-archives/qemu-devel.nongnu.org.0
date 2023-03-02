Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B277A6A8182
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:49:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhQq-0002bF-1T; Thu, 02 Mar 2023 06:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXhQm-0002U5-U1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:49:05 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXhQk-0005l2-Lz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:49:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id j3so10504310wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qk2LK8/67bXJvgOd0J2YuXDemxjdCR5D1Mu3Pwswr08=;
 b=OE0BRz1p0cL7HNqH4DoEEK7xPA3+u+1LA+Cauih7Glp5wPjkMHCa4s7HzTqiEkyWJQ
 InQE91j03yV9hWXiwp5NcATDWYRN62KM2mgspMy4L6G7aNXz6bfVbCH3pdchUpuT0flm
 LOD2CUF+JXHxZ7cXe9fce5KbeEcTjTCVo6a1/kJQV6SVSLgi+FxeOCktxGs0YTyxMdU/
 558WK7YXe7N+9j3qqz3KovWn8EorHAG94+4vWQ07B7RRaxQ5qhG2N4wqUsXJAtUfcM5k
 1nKtpZtRsMy38NbHMHaJJNV8+bq2MQ8U+YFdGDMVUBSPvJT7rtYgNvdNpeLtmunpbho1
 Fr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qk2LK8/67bXJvgOd0J2YuXDemxjdCR5D1Mu3Pwswr08=;
 b=nLgJIWXDa/1uKMxO0nz5OaYFX7ANftk3kXYAetFSTiOiz2+cfPo/ugAB5zVWhSPlxp
 6DU9U1xYvyQ/gNMzaE2YHN43uPz88fw8Gc7y5jsYNSJN68Ef8pc4TOFIKXPLhcqN/xdI
 TPODYzyS2wdIEXTIXIz8woQSLruRs9hyCh9A4VXUZQNM1csjAr0lhkBl6zjHUUzx4+gm
 Y6YEiAgG2r/5W7e6OU/99VyRi6eRQmXZKEIGIMucVPbbmEF3ZzOCvEvVPybWhK5dt0Jj
 wCVM3KPQ5bPOm46p8G1pV5UdVsLcWGQ4sxnKQ/6RqO1LiJOXtTC1lMlP+tQgQDrF5UOH
 I5wg==
X-Gm-Message-State: AO0yUKX6wrvn44d4zZ7f5bCkqwc17sOdXexVjfxcilms4D9l2Nxw0Kjx
 cezDwqWky442piEXtWws1UkWBA==
X-Google-Smtp-Source: AK7set+sXjIPHrR4oXIua1OClSUuqrQg643fWaSuSplkYvaoJmW5OoGturmwrrv+r0+8ISpGUe52Sg==
X-Received: by 2002:a05:600c:16c9:b0:3df:ee64:4814 with SMTP id
 l9-20020a05600c16c900b003dfee644814mr7370522wmn.20.1677757739845; 
 Thu, 02 Mar 2023 03:48:59 -0800 (PST)
Received: from smtpclient.apple ([93.115.195.2])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003dc4480df80sm3084056wmq.34.2023.03.02.03.48.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:48:59 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
From: Feiran Zheng <fam.zheng@bytedance.com>
In-Reply-To: <9c14c247-0184-35e8-6399-b542e4e20129@redhat.com>
Date: Thu, 2 Mar 2023 11:48:48 +0000
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Fam Zheng <fam@euphon.net>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D936CC04-15BB-4F77-A2F6-919225EA06C1@bytedance.com>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
 <15DA845E-C50C-46BB-A241-164E5851E388@bytedance.com>
 <9c14c247-0184-35e8-6399-b542e4e20129@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=fam.zheng@bytedance.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> On 2 Mar 2023, at 11:39, David Hildenbrand <david@redhat.com> wrote:
>=20
> On 02.03.23 12:37, Feiran Zheng wrote:
>>> On 2 Mar 2023, at 11:31, David Hildenbrand <david@redhat.com> wrote:
>>>=20
>>> On 02.03.23 12:09, Fam Zheng wrote:
>>>> This adds a memset to clear the backing memory. This is useful in =
the
>>>> case of PMEM DAX to drop dirty data, if the backing memory is =
handed
>>>> over from a previous application or firmware which didn't clean up
>>>> before exiting.
>>>=20
>>> Why can't the VM manager do that instead? If you have a file that's =
certainly easily possible.
>> Hi David,
>> Technically yes, but I have a simple VM manager here which wants to =
avoid replicating the same mmap code, such as handling the flags =
depending on share=3Don|off,hugepages=3Don|off. All in all this approach =
requires the least additional code to achieve it.
>=20
> so ... we're supposed to maintain that code in QEMU instead to make =
your life easier ? :)
>=20
> Sorry, for this particular use case I don't see the big benefit of =
moving that code into QEMU.
>=20

I am posting because this does not only makes my life easier, supposedly =
it also make other developers life easier, because the file here can be =
a char file and there is no easy way to clear it (/dev/dax1.0) from =
command line if you want to invoke a QEMU command directly.

Maybe I=E2=80=99m missing a convenient command to clear a DAX char file?

Surely it doesn=E2=80=99t make a big difference either way and I am not =
worried of maintaining the code outside QEMU, but I just think this flag =
is a nice thing in QEMU anyway.



Fam

> --=20
> Thanks,
>=20
> David / dhildenb
>=20


