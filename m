Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A5D495F3D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 13:46:33 +0100 (CET)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAtJI-0002Ia-KC
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 07:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAt5F-0008Ru-CI
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:32:01 -0500
Received: from [2a00:1450:4864:20::536] (port=36831
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAt5D-000311-Q0
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:32:01 -0500
Received: by mail-ed1-x536.google.com with SMTP id l5so25408020edv.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rlrJyIUph5K8nGQ9T1Kx6ayq1XpqZ1lkmb62qPl+Ogc=;
 b=R4Ghodbvz9jz5S0r3gkrCG/mqH7q6aSLj9f/1FB3Pa9lh4M5Kfo9RfGnpeqeI9Smb1
 GlIl/fw0gvu7vLttlZdPOM8A/KAi2rjb6or2NqIYOhoV/FI88Fzoxg9DPFjA+I8LQ5sr
 gQoWPdmEkdDRHK/5q0bPjceORcB1nit2ToX2WEBZFxVTwLbUpei9vPetu+ewqeChD8b7
 tPpOXZhpLCh+kaUVJTGJTFIkLZyo3lqHiIysNy+7a8ZyGM9ZqCXYMPJd22cf3jWX8hG0
 UwudrUwd/vdHV20KNK9zjswZ5qF4A/76+0i8/iRmRykVcRHipBX1AsfjG6cYjcDWoKGQ
 8dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rlrJyIUph5K8nGQ9T1Kx6ayq1XpqZ1lkmb62qPl+Ogc=;
 b=EytCbvweDYXCofxofo0GhEpLgwf4yBofF8Ip/z3CSLykQoGBK0ge4daFduYlnjW09f
 S8HU3iH+7EgavmqI2H7RlMjfg3DfUFA4TyFLR60ot17DGCuQ2UelzXSUojJBFhYPaCCQ
 92t6Gpf8Ual/+ElkMGKNhQLl6klOmlE8BxeiAb1fo6NgOeATBCsTw7XzS+jVFbb/qvK4
 f9J9AU3LYRwnhzUVOev0sjfssP3UwrUICAytfHZwaw5l29rla+tUAIsr1dZmWD1qdoaw
 QrqIaVCYGssXaZJaQDGa4epGi+3m4r43XpcmOcgjcfm8sTOlurVgmYe6QBFsCWqnJWtT
 xmjw==
X-Gm-Message-State: AOAM53152ulLBhKiIMnMY/hT3H1TgD3KCmEETbX1Y6trwV1JPMsNA0li
 3VhkhchlqgdsO1SEHPKQJg97Sw==
X-Google-Smtp-Source: ABdhPJxE1uq6nC5IvCeiGvDxaO4VgxIhgZAouPxTdDrWhyhK9euw1VhiQvfyBj7YQZ4FujUZN8AyBA==
X-Received: by 2002:a05:6402:1347:: with SMTP id
 y7mr4050610edw.208.1642768318295; 
 Fri, 21 Jan 2022 04:31:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u9sm2001102ejo.119.2022.01.21.04.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 04:31:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72EA21FFB7;
 Fri, 21 Jan 2022 12:31:56 +0000 (GMT)
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: "make check-acceptance" takes way too long
Date: Fri, 21 Jan 2022 12:23:23 +0000
In-reply-to: <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
Message-ID: <875yqd6zib.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 21 Jan 2022 at 10:50, Markus Armbruster <armbru@redhat.com> wrote:
>> No objection, but it's no replacement for looking into why these tests
>> are so slow.
>>
>> The #1 reason for things being slow is not giving a damn :)
>
> See previous messages in the thread -- the test starts a
> full-fat guest OS including UEFI boot, and it takes forever to
> get to the login prompt because systemd is starting everything
> including the kitchen sink.

There has to be a half-way house between booting a kernel until it fails
to find a rootfs and running a full Ubuntu distro. Maybe just asking
systemd to reach "rescue.target" would be enough to show the disks are
up and userspace works.

Running the EFI firmware is probably useful coverage but I'm not sure
how one passes command line args to the guest in that approach? Do we
need to set a magic EFI variable?

>
> -- PMM


--=20
Alex Benn=C3=A9e

