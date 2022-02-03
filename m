Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9E4A8E6D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:37:39 +0100 (CET)
Received: from localhost ([::1]:39860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFirK-000050-3M
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFiIx-0000H4-6g
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 15:02:08 -0500
Received: from [2a00:1450:4864:20::32b] (port=37498
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFiIq-00048X-Dg
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 15:02:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7964196wmj.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 12:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7qD3dYw6vZCaev09NDWPY79yTjyKgV1Q7j6/68djssI=;
 b=boFAX5NFrCpxMCV0FFLmlOP1q3TVkE3Zvelzgml2GtGP+FETbdrkBhySV417ZQG4k0
 S3wfJdWEPGHA0Pu6PvfTGS+gZ1kIIyOI8ARIxbUvg6JakysvDCEuVzVWsaJe+7ikcX4k
 qxQx49NKsMlVahrQusvT82eRWFQ7GYVcLDGVTGMNXZ8K3pZY36ixfmzPFZTN2Swy9MGK
 P3SLgEvVBrrSpHLtyNyOjKmRYB2OQJnij0WklfNzY8clMa6pJF7DWKbq3QwsI5w60JlU
 CeW3Lru9s0o07mM+ulbTpKiNUTbwXdLIbwVZDrt0L1Fbm4ryZ4gIKP07pxaO5Y75BEy6
 sKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7qD3dYw6vZCaev09NDWPY79yTjyKgV1Q7j6/68djssI=;
 b=MAjII6PM4gYzuqliziEQT0dIhYbs+cJ2UTmOgJme1R8fN5FFJW5Ex45lJltgmCK/fX
 YxMQI1+sIZHoRv9rxLtNwgeFjnI5CEeJGtvSKxge3sUiEO8nV+l1ZyZ7ZTnB5dKstkKh
 HcttNFZrJWWu9P9/EvKSy+YnEzFwnDZ2BfuTp4+bma7s4zu8iVunRsmh9N/ISPJPFpKM
 ii/MEbFrU6fQW54rrDl4KN2IV70ieIngDVZWn+wU5vfEg/X58HMfhmfTeMAVw7qopnry
 zgEaiAV49yEWws3ouDwZTdc+f3kae7QaVGU0qskzsHCGV2SZR/GD/PBC55Bva9xB033/
 eASQ==
X-Gm-Message-State: AOAM533jp/f/qEGquIwHFjs8Q+Qoy8Iq6mpxLz1dFWblfmKJHCf2FXXo
 udt7favuH0ADhY0oyEsUY6vteQ==
X-Google-Smtp-Source: ABdhPJz8mO7Erh7bS/lfEwSxHeixB4WWNrh2Fb0O4aEc600YrbpumeUX1UW3TIWhImPw19jN0RpDlg==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr11434853wmq.124.1643918516529; 
 Thu, 03 Feb 2022 12:01:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id az16sm7959496wmb.15.2022.02.03.12.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 12:01:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A50D51FFB7;
 Thu,  3 Feb 2022 20:01:52 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87leyrst2m.fsf@linaro.org>
 <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [RFC PATCH  0/4] improve coverage of vector backend
Date: Thu, 03 Feb 2022 20:00:27 +0000
In-reply-to: <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87h79fsor3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Sent: Thursday, February 3, 2022 12:26 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>
>> Cc: richard.henderson@linaro.org; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> stefanha@redhat.com; crosa@redhat.com
>> Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
>>=20
>> > Any chance the problem is in the test itself (e.g., some sort of
>> > undefined behavior or a 64-bit vs 32-bit difference)?
>>=20
>> It does have a 64 bit byteswap in - it's possible I broke it copying fro=
m the
>> upstream:
>>=20
>>   https://ccodearchive.net/info/crypto/sha512.html
>>=20
>> but it does pass on *all* the other architectures which is a mix of 32 a=
nd 64
>> bit code. I did have to hack the endian detection code though.
>> Does:
>>=20
>>   #if BYTE_ORDER =3D=3D BIG_ENDIAN
>>=20
>> work for your compiler?
>
> No, but this does
> #if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
>
> With that change in the source, the tests passes.  Will that work for
> other targets?

At least not hppa-linux-user. The joy of having no standard compile time
way to report byte order in the C standard despite most things needing
to know one way or another.

Richard,

Any ideas?

>
> Taylor


--=20
Alex Benn=C3=A9e

