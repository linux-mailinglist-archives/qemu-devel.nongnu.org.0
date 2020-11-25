Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482332C3C6F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 10:43:22 +0100 (CET)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrKb-00037n-CN
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 04:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khrJm-0002hD-AQ
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:42:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khrJk-0002BN-LK
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:42:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 10so1394171wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 01:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=y+MtFoJg0gvw9jW725s3+sNL+iBXKAEIJ4ml4n0qclk=;
 b=jnnnp5xyYWXGcWJ8bLW0TTFt2KfFbXKhKx10JE9MV1JIEbOpkU4Q6yiyZgVioNYg73
 M8m6DT5VVZTaFjrZ9/u1K5FzHK0wclSJS/5NOlkD0Z6VkunNICRclFPnB2DzJuwHKm4w
 MtKv2HcZfFzszL2kvHPbg/GVlkVbnUCOpgk3zY4QEzYVBzyiWwTdP9NzlsKrX2Bdytf/
 nVIbgzzctC4btL/MhRAPE0/WQRW8kfpqSYubkTM01FPjTEIIdXya/hG/JuGSPFA/sqqN
 FfsDWn3OAOC9OEx5w7tOjMoWqndrCdcH9f5minbEQWVCIqswaZEaUKVsFGuH7d+fxfNd
 PP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=y+MtFoJg0gvw9jW725s3+sNL+iBXKAEIJ4ml4n0qclk=;
 b=guhwVa3u9diCTAe+uZDjxja4LK5Mkv8Pbp0Um+LNC5F7qxtUhsmGlwE5IraD/Kfs9q
 nYvP/eFMfZ2GBJRRyO+QnwEIqnKTtJzZLp73hoNyfTBIr9UxzN1o71LB7JTvBlBoxxP2
 UwEKglgv02b+Jee4dBnCKGbKheSSI/6y0fVB5Jtmj/nHM7AwMDI1YSgUgkrTlfx5kJMu
 GYDr+0PgyRxBe6CSlJFPHlEStxncPFbWDZXbmv3L02YikBTzR1Us3FD5mfE8F9vOS1yE
 X+NR3dBlzQNl/ZQlp7ZOD2XWyG9G/CozQANJHf9xWk0vuADKDKYBc194emJogiipVXT8
 Ke4w==
X-Gm-Message-State: AOAM531rgahkGAflFRURO7TT2XAEiQA4zi0BzyAg/iDeNPB+D4ulNA0k
 vRICDXSeCgsPlP1QnnKhSLe9Ig==
X-Google-Smtp-Source: ABdhPJxa2KpsnzTD0EixPG2UPrO/4wjzfGRyiVqsPB8aJY8cmkkt/XGPAq4TO4xYJL5Y0NCil6ZpUA==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr1486823wmj.23.1606297346920; 
 Wed, 25 Nov 2020 01:42:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 134sm4113119wmb.17.2020.11.25.01.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 01:42:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 677691FF7E;
 Wed, 25 Nov 2020 09:42:24 +0000 (GMT)
References: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
 <48353514-8dde-0f4b-193d-fa71737d7c80@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: help with a build-user and build-user-plugin failure
In-reply-to: <48353514-8dde-0f4b-193d-fa71737d7c80@amsat.org>
Date: Wed, 25 Nov 2020 09:42:24 +0000
Message-ID: <871rghixhb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 11/24/20 12:04 PM, Claudio Fontana wrote:
>> Hi Alex,
>>=20
>> I am seeing build failures with build-user and build-user-plugin:
>>=20
>> https://gitlab.com/hw-claudio/qemu/-/pipelines/220245998
>>=20
>> and I am trying to start investigating.
>>=20
>> How do I reproduce this locally?
>>=20
>> I am trying to run locally the check-tcg rule, but I cannot get it to wo=
rk.
>> I managed to work around the problem of static libraries (disabled them),
>>=20
>> but then I get:
>>=20
>>   BUILD   TCG tests for x86_64-linux-user
>>   BUILD   x86_64-linux-user guest-tests with cc
>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld:=
 /tmp/ccgqtAM9.o: in function `test_fops':
>> /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:759: undefined referen=
ce to `fmod'
>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld:=
 /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:760: undefined reference=
 to `sqrt'
>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld:=
 /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:761: undefined reference=
 to `sin'
>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld:=
 /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:762: undefined reference=
 to `cos'
>>=20
>> Have you seen it before?
>> Any suggestions? I'm on OpenSUSE Leap 15 SP2.
>
> Related to 3fc1aad3864 ("configure: remove unnecessary libm test")
> + tcg tests still not ported to Meson?

Hmm so we certainly need libm for the testcase but I guess this is
failing with a local cross compiler rather than docker? I'm not sure the
global feature test should be relevant for testcases.

--=20
Alex Benn=C3=A9e

