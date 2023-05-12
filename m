Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2171C70070B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:43:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxR9l-0006Na-9G; Fri, 12 May 2023 07:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxR9j-0006MH-1r
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:41:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxR9h-0006ga-5D
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:41:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso1492181066b.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683891707; x=1686483707;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPdxhncpdA+Cs9nKW55LIueGY421O1IzKmKeIEN1D68=;
 b=B54E/SzpioqAy+SaZKZ7nHGc9JhanoYi/NmSnKkM1PJYhorznhxRg/R8Jm6DrdU8bp
 27rF8BkGsJ9r5Z1g+JN+iYghBkkmCIEqQdR0PDJYVoTLoctUbT2hWhk/BlMUcnDg09GJ
 OQ+K/1hkzwgPKN/9Sna+QA/0qSsXh4kxQmsd3vt16GfcK4VnRcE9Fg0964aUb4ZOwMJP
 u75hofr08BV+MgY33gu+dIMNPKlntNWJ6SuqGZraoHFRwOUd0GppTvvhRzysr3dBoweG
 vREERfKUl1044VlHY+ytn2lHxp4oD8lOFPa1x9iLthqMypJWd4pQFbJEyjxubX0fcUTA
 TMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683891707; x=1686483707;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPdxhncpdA+Cs9nKW55LIueGY421O1IzKmKeIEN1D68=;
 b=gyV3p0SPXvM9AX77ZPQtVI56foZFFkicaKEa0utFKhYHsrQd2g0x1qw+dPaPAen5xA
 hVUwBOSMAfaqQR5bD1yjTCnlcpMMmkAfqjhXv63B+igc1ltHjJyNjDI2iSx1VP1SYuyq
 2ZSUx7wZAR/lbPo12HN6ofyixUKDvwgZ7RYDus5dFYvxxDvOaJDLsxBJ/aQV2bhYTeOF
 moV53eusDg9V83C0z7hkp4I9zjHuWI9RKUic7emjs6+CCmklc46pnvuJkPgtEkALPXe7
 dVUyrVVJWHx9mr5ttiLDKFqsgjV/y2iiIhVx8e3RHbzSdhgf78BFd5ypK83/KOykvmE9
 HoMQ==
X-Gm-Message-State: AC+VfDxSGyQ36qA6pjSptWjUGr69i8q4YjqHjtzOhSONsauNcBEeSk/Z
 g0C6Xd52po6uZjFhFIJnZ+w=
X-Google-Smtp-Source: ACHHUZ7pM9AwKK8bNdvT2P5gNzceT7y5E9mNBGR2nnohVSCTa/7UJG9PRG9odbvmrdQLrfdNxUnlKQ==
X-Received: by 2002:a17:907:7293:b0:969:dda1:38a4 with SMTP id
 dt19-20020a170907729300b00969dda138a4mr13652128ejc.38.1683891707122; 
 Fri, 12 May 2023 04:41:47 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-129-055.77.13.pool.telefonica.de.
 [77.13.129.55]) by smtp.gmail.com with ESMTPSA id
 n10-20020aa7db4a000000b005027d31615dsm3788662edt.62.2023.05.12.04.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 04:41:46 -0700 (PDT)
Date: Fri, 12 May 2023 11:41:33 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: quintela@redhat.com, Juan Quintela <quintela@redhat.com>, afaerber@suse.de
CC: ale@rev.ng, anjo@rev.ng, bazulay@redhat.com, bbauman@redhat.com,
 chao.p.peng@linux.intel.com, cjia@nvidia.com, cw@f00f.org,
 david.edmondson@oracle.com, dustin.kirkland@canonical.com, eblake@redhat.com, 
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, eric.auger@redhat.com,
 f4bug@amsat.org, Felipe Franciosi <felipe.franciosi@nutanix.com>,
 "iggy@theiggy.com" <iggy@kws1.com>, Warner Losh <wlosh@bsdimp.com>,
 jan.kiszka@web.de, jgg@nvidia.com, jidong.xiao@gmail.com,
 jjherne@linux.vnet.ibm.com, joao.m.martins@oracle.com,
 konrad.wilk@oracle.com, kvm@vger.kernel.org, mburton@qti.qualcomm.com,
 mdean@redhat.com, mimu@linux.vnet.ibm.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, richard.henderson@linaro.org,
 shameerali.kolothum.thodi@huawei.com, stefanha@gmail.com,
 wei.w.wang@intel.com, z.huo@139.com, zwu.kernel@gmail.com
Subject: Re: QEMU developers fortnightly call for agenda for 2023-05-16
In-Reply-To: <871qjm3su8.fsf@secure.mitica>
References: <calendar-f9e06ce0-8972-4775-9a3d-7269ec566398@google.com>
 <871qjm3su8.fsf@secure.mitica>
Message-ID: <452B32A5-8C9E-4A61-B14B-C8AB47D0A3ED@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 12=2E Mai 2023 07:35:27 UTC schrieb Juan Quintela <quintela@redhat=2Eco=
m>:
>juan=2Equintela@gmail=2Ecom wrote:
>> Hi If you are interested in any topic, please let me know=2E Later, Jua=
n=2E
>
>Hi folks
>
>So far what we have in the agenda is:
>
>questions from Mark:
>- Update on single binary?
>- What=E2=80=99s the status on the =E2=80=9Cicount=E2=80=9D plugin ?
>- Also I could do with some help on a specific issue on KVM/HVF memory ha=
ndling
>
>From me:
>- Small update on what is going on with all the migration changes
>
>Later, Juan=2E
>
>
>> QEMU developers fortnightly conference call
>> Tuesday 2023-05-16 =E2=8B=85 15:00 =E2=80=93 16:00
>> Central European Time - Madrid
>>
>> Location
>> https://meet=2Ejit=2Esi/kvmcallmeeting=09

Hi Juan,

Would it be possible to offer a public calendar entry -- perhaps in =2Eics=
 format -- with above information? Which can be conveniently subscribed to =
via a smartphone app? Which gets updated regularly under the same link? Whi=
ch doesn't (needlessly, anyway) require authentcation?=20

Thanks,
Bernhard

>> https://www=2Egoogle=2Ecom/url?q=3Dhttps%3A%2F%2Fmeet=2Ejit=2Esi%2Fkvmc=
allmeeting&sa=3DD&ust=3D1684065960000000&usg=3DAOvVaw14RNXU52XvArxijoKSmVbR
>>
>>
>>
>> If you need call details, please contact me: quintela@redhat=2Ecom
>>
>> Guests
>> Philippe Mathieu-Daud=C3=A9
>> Joao Martins
>> quintela@redhat=2Ecom
>> Meirav Dean
>> Felipe Franciosi
>> afaerber@suse=2Ede
>> bazulay@redhat=2Ecom
>> bbauman@redhat=2Ecom
>> cw@f00f=2Eorg
>> dustin=2Ekirkland@canonical=2Ecom
>> eblake@redhat=2Ecom
>> edgar=2Eiglesias@gmail=2Ecom
>> eric=2Eauger@redhat=2Ecom
>> iggy@theiggy=2Ecom
>> jan=2Ekiszka@web=2Ede
>> jidong=2Exiao@gmail=2Ecom
>> jjherne@linux=2Evnet=2Eibm=2Ecom
>> mimu@linux=2Evnet=2Eibm=2Ecom
>> Peter Maydell
>> richard=2Ehenderson@linaro=2Eorg
>> stefanha@gmail=2Ecom
>> Warner Losh
>> z=2Ehuo@139=2Ecom
>> zwu=2Ekernel@gmail=2Ecom
>> Jason Gunthorpe
>> Neo Jia
>> David Edmondson
>> Elena Ufimtseva
>> Konrad Wilk
>> ale@rev=2Eng
>> anjo@rev=2Eng
>> Shameerali Kolothum Thodi
>> Wang, Wei W
>> Chao Peng
>> kvm-devel
>> qemu-devel@nongnu=2Eorg
>> mburton@qti=2Equalcomm=2Ecom
>
>

