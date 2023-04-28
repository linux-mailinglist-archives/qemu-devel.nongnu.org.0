Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C687E6F1CD7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:45:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRCo-0008Of-T0; Fri, 28 Apr 2023 12:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1psRCm-0008Mj-JO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:44:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1psRCk-0004Av-Kg
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:44:20 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so69380565e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682700256; x=1685292256;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OnAd3Ii23EoP2HHnQZe1vmsR2aWFAJb6NjcHM64Cd2g=;
 b=QrfY8wZPmIBCxKKh+4y4GLBZvkBF1VIUpl02jiqewAIx6rpxLF3pejcBZUJQrNXjfN
 sq9g0wgPxpswj1MCv6l3Q4g/fMgWrO7K1Dt8lsDqAPdwmqugY8Srv3kVWbLcJacOey/v
 EY6vbXCm82Qxolx/7a3E4e/l/CF9OwQShO1Z2mo257vf3kY0HPiOXmlVX/g92zODzEoB
 /984ylLslb3h/WqTxI29cRGeArHj8sa6dNZAeN0H922WyKSZFhekrjKS9QapfygcqZ1I
 fRGZgRn26mtylGaZAdMeGWdfOiNTQSX/KOJ7JXN/SpLw2h3c+Dky2HzhYWqSxV8D4Qfo
 rOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700256; x=1685292256;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OnAd3Ii23EoP2HHnQZe1vmsR2aWFAJb6NjcHM64Cd2g=;
 b=CyZMVb3iJOy1r/TM/Ny9I/wtNsSUjgyERg5INLTxEDU/6UeHuuQaGwiX3+g8C/ZOzE
 1efbzg3ptbpO2qs2JkdoftNlCnpDrYrBlSpp7LlxI1SPV53QbphK2thmoYwtAADwZO54
 kcfF53XYoSHb6AxteiqB4b1RpLUDB7Uu7WMjc+3GFzWjT7IXb416W2ECfQnnvRLG2PO/
 9Ch4bOTsRdzfyxy2unoBvuWScm6wEgEaY0K6TG5z+A8zRhZLWEJT1CeU/tHcLIMlX19F
 1Fs0049ORWRIm4G2cwj4bpNZa5rypF0rzLVNKDb8qepOYziYcf1h6kZnZVxXgRau8xNA
 OhHA==
X-Gm-Message-State: AC+VfDzGRHAEsPJMkBugBkjI5bVAJABGumFtJL0xlbbCtrWbHTQC0uEn
 H6FkXod/8lUdiUcjeadwBdRAZw==
X-Google-Smtp-Source: ACHHUZ4l9w0Q4fOfcH9HCYcfYjdRiZG4iuj5d3QpYY4D+tnA+Mf296FUOaqjAe2Da2BZCpPYNiFakQ==
X-Received: by 2002:a7b:c391:0:b0:3f1:9391:46c with SMTP id
 s17-20020a7bc391000000b003f19391046cmr4628407wmj.30.1682700255743; 
 Fri, 28 Apr 2023 09:44:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003ee74c25f12sm28651059wmq.35.2023.04.28.09.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:44:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A6821FFB7;
 Fri, 28 Apr 2023 17:44:14 +0100 (BST)
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
 <20230427154510.1791273-3-alex.bennee@linaro.org>
 <c5e8ab71-8840-b420-b6b2-cab1efb44ab3@redhat.com>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 richard.henderson@linaro.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>
Subject: Re: [PULL 02/18] tests/avocado: use the new snapshots for testing
Date: Fri, 28 Apr 2023 17:43:56 +0100
In-reply-to: <c5e8ab71-8840-b420-b6b2-cab1efb44ab3@redhat.com>
Message-ID: <87a5ysardt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Thomas Huth <thuth@redhat.com> writes:

> On 27/04/2023 17.44, Alex Benn=C3=A9e wrote:
>> The tuxboot images now have a stable snapshot URL so we can enable the
>> checksums and remove the avocado warnings. We will have to update as
>> old snapshots retire but that won't be too frequent.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20230424092249.58552-3-alex.bennee@linaro.org>
> ...
>> @@ -316,7 +387,12 @@ def test_ppc64(self):
>>           :avocado: tags=3Dextradev:driver=3Dspapr-vscsi
>>           :avocado: tags=3Droot:sda
>>           """
>> -        self.common_tuxrun(drive=3D"scsi-hd")
>> +        sums =3D { "rootfs.ext4.zst" :
>> +                 "1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c=
6c45b00bdff",
>> +                 "vmlinux" :
>> +                 "f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3=
e09b64ab728" }
>> +
>> +        self.common_tuxrun(csums=3Dsums, drive=3D"scsi-hd")
>>         def test_ppc64le(self):
>>           """
>> @@ -329,7 +405,12 @@ def test_ppc64le(self):
>>           :avocado: tags=3Dextradev:driver=3Dspapr-vscsi
>>           :avocado: tags=3Droot:sda
>>           """
>> -        self.common_tuxrun(drive=3D"scsi-hd")
>> +        sums =3D { "rootfs.ext4.zst" :
>> +                 "b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42=
cf81a0a3906",
>> +                 "vmlinux" :
>> +                 "979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c0=
0e293e80cf2" }
>> +
>> +        self.common_tuxrun(csums=3Dsums, drive=3D"scsi-hd")
>
>  Hi Alex,
>
> when I run the manual avocado-cfi-ppc64-s390x test on gitlab, the
> ppc64 and ppc64le tuxrun tests are now failing for me:
>
> https://gitlab.com/thuth/qemu/-/jobs/4196177779#L758
>
> Are they working for you?

Locally yes. I guess its time to spin up some VMs

>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

