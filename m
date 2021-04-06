Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9DD355A15
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:14:56 +0200 (CEST)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpHz-0006Zk-E8
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTpGM-000696-MX
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:13:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTpGK-0007DZ-Py
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:13:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f12so9054272wro.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QMvHol9UqJslHN8eWL8VM+2lsZE4ZCi9/2PPkhX4h+8=;
 b=H7Zuuw+IlrisbETawQJVoAv0Desd54GzqvkFaXH6ZwPLYmrAA7RtEt87gjWW3wPAro
 kHKs+VF0RkkuLa/8n3SvdKQ+lwME7lCf3lYGsU4gx6JK3CwG8fTnfmcsnRhsRekSIpNL
 xM3JCqSl0PDql1V0haS7EVHImzbFdrD/TJttyVrUmT1nWMnW+oZbbe3SLNsXTyi23ld/
 oBxgJ9sbQ1tHHebQSYXRW3cBmNZJgagMl0ibxnFZS3MWCNHGbw746G9XY8ezaIdQm055
 H2IUc11RMDyHAf0tzmxsJ95iDMopuWln/A0kCjZ/rQhzhiIbDAQs/G6mqy7k+jn2z/ib
 zaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QMvHol9UqJslHN8eWL8VM+2lsZE4ZCi9/2PPkhX4h+8=;
 b=DqEmqCRhZam2lsu2nKFVi9lKLMfsa3+eCZDndtS+PwuxEdYMausIjltfQYLE6IO0iF
 ZCBui8XWnHMWFedBTqP01AXsUOAb7AVu1R6YTixK7CcodfMGYhQr60rePUva4ZNsLAKs
 iA6eZXkz2+xxsU+Qhg1UhsHDLOZyf3MOrroJZqiDvt6eG0cqs5p1ip3+jtBmb8lAaazR
 IFspCF0OEgPxaz7wmJSCs9vzOK+DoGlR7SIu65VxWMz/MJJHxYGqIvGhBvbBTl2N892K
 dQ/H0uDwFStnS8biKnAlpoSvVrDWKsB1nzwVlYYEgVfYbPnOPKpR9HweFicOnyL1OOey
 qklA==
X-Gm-Message-State: AOAM533QZjMuT0PZ9JkzrLyAj0f575enZuAt19CsUQNCCXKuoLZ2ktKu
 O+ix7qsRDqDjpcDMiUNy0M8N1g==
X-Google-Smtp-Source: ABdhPJxCRrGBsk0mN7MfO4x7bWcuodzONcw1+JZEAE6QI5t0DWwFXYX1ltlW2oKSCbAf+sCqCQoMMQ==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr17105817wrw.3.1617729190046;
 Tue, 06 Apr 2021 10:13:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n6sm4189009wmd.27.2021.04.06.10.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:13:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B4D581FF7E;
 Tue,  6 Apr 2021 18:13:07 +0100 (BST)
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org>
 <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
Date: Tue, 06 Apr 2021 18:12:21 +0100
In-reply-to: <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
Message-ID: <87ft03wd3w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 3/31/21 5:45 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> The current 'virt_kvm' test is restricted to GICv2, but can also
>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>>> tested on some hardware.
>>>
>>> Noticed while running:
>>>
>>>  $ avocado --show=3Dapp run -t machine:virt tests/acceptance/
>>>  ...
>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: E=
RROR: Unexpected empty reply from server (1.82 s)
>>>
>>> The job.log content is:
>>>
>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-k=
ernel GICv2 emulation\n'
>>>
>>> With this patch:
>>>
>>>  $ avocado --show=3Dapp run -t device:gicv3 tests/acceptance/
>>>  (1/1)
>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>>  PASS (55.10 s)
>>=20
>> On the new aarch64 machine which is GICv3 I get the following:
>>=20
>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm=
_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
>>=20
>> which it shouldn't have run. However:
>>=20
>>   ./tests/venv/bin/avocado --show=3Dapp run -t device:gic3 tests/accepta=
nce/
>>   Test Suite could not be create. No test references provided nor any ot=
her arguments resolved into tests
>>=20
>> Is this something that has regressed or am I doing it wrong?
>
> Typo in the tag: "device:gic3" -> "device:gicv3"

Doh!

But what about:

/tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAarch64=
.test_virt_kvm_gicv2
JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-396696d/jo=
b.log
 (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2:=
 ERROR: Unexpected empty reply from server (0.65 s)
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB TIME   : 0.96 s

why doesn't that skip?

--=20
Alex Benn=C3=A9e

