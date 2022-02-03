Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F304A8BB1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:32:52 +0100 (CET)
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFguZ-0001Q5-JA
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:32:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFgqU-0006hE-Ab
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:28:38 -0500
Received: from [2a00:1450:4864:20::530] (port=38770
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFgqS-0005v7-Dj
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:28:37 -0500
Received: by mail-ed1-x530.google.com with SMTP id j23so7799732edp.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QM7ZRp3YWakgTXMAVF/xLXofAe797c/0Ok/H2lZFzW4=;
 b=vNU62xAoFskX1j/wR2BDRnU9UZr3Z/dWsqV1jfrVdZUsQqD6Vw9l8Vh6qL8hATiWg5
 NsFoBCxO7dCr3P99oSp+l7NUL2xajQBBzd3Nr1tftqaxsEVYiA+5XexRo04tA22q1Hza
 ycKUjJEqZY3b9Iw4GK3fJkA9DVtRWmC3DyQK276hEGTGfT8Z2cpkqcHHVeyAzx/IqkEy
 0yQql3Y9VqBiDLyD/Stf89/fWNzI9bETHgopYkehcbtUQjMBGBLeEwhs1yaf8R2GIjtc
 k3qb/zDBncyUjyNz+HrePFKWNqgrNaEZBsz4DzMQGd/qDHoNPnFIJrghqELLmCdDcK7S
 QCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QM7ZRp3YWakgTXMAVF/xLXofAe797c/0Ok/H2lZFzW4=;
 b=rhj5qydjuA1LH72jy9bi5wdT+9opmkog5MxQ7CK4DMQjwK6llIT8sk//jsAKf0IGle
 OnwQ0rMtTxXxuuF6aAqNVCeTFljjdjXN5Us/B0zuHxco6nsoGzzSZ8oDdotQ2PTJ18Vn
 Ye00VfDJkI7ABIHRfV/uSGmvLvC2eXYwKlEmN9r5DbtDTQPONizlEsUFm4qtMZuTgBkz
 gMHzM5Ay75lUX8EbBi0nC6b5YzlK6FpDTmr4timJfBmzyh8OJWVjgGx8A8DvyL+/0PeF
 6fPuYjjgz7+lzD2ymdfC8spZBzFpllDlHxcKP7Jgq3YA8OytwNXX707E+ctwYTRQMviA
 w3oA==
X-Gm-Message-State: AOAM533Yfg80QtTNsV+ACbB87xtTVm/H1eb5nxWmBDzY9F/bJzDimiCr
 OAs40uTpIbayYJ+tQpcrQWDmNA==
X-Google-Smtp-Source: ABdhPJxpcXY3L1QPOpqUQ8bNtLqrXpxbsWIeINDDt3myHOZvsjUmoPvU/dkVqn6uhBkvCwvC5xDpVg==
X-Received: by 2002:a05:6402:348b:: with SMTP id
 v11mr36264160edc.353.1643912914861; 
 Thu, 03 Feb 2022 10:28:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c5sm17052762ejz.88.2022.02.03.10.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 10:28:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64A8B1FFB7;
 Thu,  3 Feb 2022 18:28:33 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [RFC PATCH  0/4] improve coverage of vector backend
Date: Thu, 03 Feb 2022 18:26:08 +0000
In-reply-to: <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87leyrst2m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
>> Sent: Thursday, February 3, 2022 11:50 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>
>> Cc: richard.henderson@linaro.org; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> stefanha@redhat.com; crosa@redhat.com
>> Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
>>=20
>> Taylor Simpson <tsimpson@quicinc.com> writes:
>>=20
>> > Quick update - I ran the test on the hardware and have the same error
>> messages.
>> >
>> > So, it doesn't look like a QEMU problem.  I'll investigate if the
>> > problem is due to something in the toolchain.
>>=20
>> That reminds me what is the status of the binary toolchain. The last att=
empt
>> had some issues so we are still using the hand-built one upstream.
>
> No progress on that.  The team hasn't had the bandwidth to work on it.
>
> However, I'm less suspicious of the toolchain now. I built with a
> couple of different compiler options and a couple of different
> versions of the toolchain, including the C library that runs in
> production. In all cases, I see the same result.
>
> Any chance the problem is in the test itself (e.g., some sort of
> undefined behavior or a 64-bit vs 32-bit difference)?

It does have a 64 bit byteswap in - it's possible I broke it copying
from the upstream:

  https://ccodearchive.net/info/crypto/sha512.html

but it does pass on *all* the other architectures which is a mix of 32
and 64 bit code. I did have to hack the endian detection code though.
Does:

  #if BYTE_ORDER =3D=3D BIG_ENDIAN

work for your compiler?


>
> Thanks,
> Taylor


--=20
Alex Benn=C3=A9e

