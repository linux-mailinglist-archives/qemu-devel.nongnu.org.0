Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF56C4918
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewaz-0002Ut-SU; Wed, 22 Mar 2023 07:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peway-0002Uj-6t
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:25:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pewaw-0006Z3-AY
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:25:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o7so16654985wrg.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679484328;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCHdNv3gUXnbPxH/7AFihI8taoYrWrjPCG/TsWP+LIY=;
 b=mMcb/9ITjlojKWI4tk20bY7Ac+q29gcW0bfyThhYYwWYJtw0fXzPeGgrVab0c90MPh
 p3XWCyjWZfd6IPWsWceSP1EXqXlaIlS8aDv+hgKc4VeRoGQY3XK8mnyfkM4bjj/U7iN9
 8TZa0LlFWeT2bO2wvkx6tfK6/EVU12oElZpEgMwQd1VtK9BpJslC4oI03L5wiYuA7O2N
 mLQrtlJt7mNQfnmcTaZXvP7EKShdx8dLKZHoYjI/D8g5WBooBa3y/szxVfL1LssGR0zd
 NgnEijSLNjloG+NQG8yAnwLeYpLE4B/eeSxwiiA08QNRZt8xLnjMnbqjCnAf5RKpPBsB
 widQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679484328;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rCHdNv3gUXnbPxH/7AFihI8taoYrWrjPCG/TsWP+LIY=;
 b=ZqSRfhyDgg4hCbU9FXk/ljiQDIfJHt64f6SavySUFFLQBiWCD/Z9ld/siP9JtUsC8x
 Pbl+4Ej/NY2z1m/E5ICvAhmnKl6a6RzhZQWyUG6YH1iqLKeObS3z+Qp37/8ZgoRAtwKX
 QAYIwVZ66se1SOJg5kBHm2oq19KTYEvmDT5Lj+nPvVaPX3+DyaA5/PLpMilMola1pXW8
 RW/1rtuRJFjs5rwvNmfcpmuFdb75U+D5Lg/zqB1Jqr5Jub/IZw2O6y0mVBMECn1qrGO4
 5+CDw2Sz1gTGF8QNOYV5w63TMvNLtEDxR4QabJN+KWjXh4b1maB8IVL0Tjb3cj05dTlf
 Ox8Q==
X-Gm-Message-State: AO0yUKU2lPyJXwMZr6AUMpMwBkEKLAUrOfU9YGbRxS6HbydiriBIQt6c
 LplTDjSdd3q2Q2JQMyiUEEfY2g==
X-Google-Smtp-Source: AK7set/BAe2+Z3sUgPq6Exi9nvCDHMmwZSrpjbwZQLliEUlYjlq8HfAJsdukwSauabadhFSG8YtQdQ==
X-Received: by 2002:a5d:448a:0:b0:2ce:9fd8:8e6d with SMTP id
 j10-20020a5d448a000000b002ce9fd88e6dmr4614594wrq.8.1679484328200; 
 Wed, 22 Mar 2023 04:25:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056000100600b002c8ed82c56csm13643978wrx.116.2023.03.22.04.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 04:25:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E6891FFB7;
 Wed, 22 Mar 2023 11:25:27 +0000 (GMT)
References: <20230321181741.3748845-1-alex.bennee@linaro.org>
 <a06b7763-04fb-60d3-be81-65585ba5c058@daynix.com>
 <87wn395bqf.fsf@linaro.org>
 <3571bd36-e1e3-ebea-77a6-8042856dcab2@daynix.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: re-factor igb test to avoid timeouts
Date: Wed, 22 Mar 2023 11:22:38 +0000
In-reply-to: <3571bd36-e1e3-ebea-77a6-8042856dcab2@daynix.com>
Message-ID: <87jzz958pk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/03/22 19:04, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> On 2023/03/22 3:17, Alex Benn=C3=A9e wrote:
>>>> The core of the test was utilising "ethtool -t eth1 offline" to run
>>>> through a test sequence. For reasons unknown the test hangs under some
>>>> configurations of the build on centos8-stream. Fundamentally running
>>>> the old fedora-31 cloud-init is just too much for something that is
>>>> directed at testing one device. So we:
>>>>     - replace fedora with a custom kernel + buildroot rootfs
>>>>     - rename the test from IGB to NetDevEthtool
>>>>     - re-factor the common code, add (currently skipped) tests for oth=
er
>>>>        devices which support ethtool
>>>>     - remove the KVM limitation as its fast enough to run in KVM or TCG
>>>
>>> I tried this but it seems the rootfs is corrupted:
>>> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
>>> INFO: recovery required on readonly filesystem
>>> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
>>> write access will be enabled during recovery
>>> (snip)
>>> 2023-03-22 13:54:24,534 __init__         L0153 DEBUG| EXT4-fs (sda):
>>> I/O error while writing superblock
>>> 2023-03-22 13:54:24,535 __init__         L0153 DEBUG| EXT4-fs (sda):
>>> error loading journal
>>> 2023-03-22 13:54:24,542 __init__         L0153 DEBUG| VFS: Cannot open
>>> root device "sda" or unknown-block(8,0): error -5
>> That's weird. I'm not seeing it when running here. However I can
>> regenerate the whole thing and re-upload. Are there any other network
>> tools worth adding?
>
> Only ethtool is needed for testing Intel NICs.
>
>>=20
>>> I have a few more comments:
>>>
>>> - It may be possible to use microvm to trim it down further.
>> Does microvm have PCI now? Most of the saving comes down to having a
>> much lighter rootfs than the full cloud init of fedora. I think there is
>> only really a syslogd and a klogd running at the start.
>
> microvm supports PCIe. You can enable it by specifying e.g., -M
> microvm,pcie=3Don
>
>>=20
>>> - I'm worried that having a rootfs for a single test is too costly to
>>>    maintain. If you just want to avoid cloud-init, you can just
>>>   specify:
>>> init=3D/bin/sh
>> Not really too bad. Buildroot makes it pretty easy. The config can
>> be
>> found here:
>>    https://fileserver.linaro.org/s/Lk8z7kN3s3ds7kd
>
> Buildroot indeed automates everything to build rootfs, but it still
> takes lots of time to build because it needs to build everything. It
> also fetches sources from the origins of the packages if I understand
> it correctly, and I'm worried that may harm the reproducibility of the
> builds.
>
> These problems are not present with Fedora: you can add or replace a
> particular component with a package (in this case ethtool is added),
> and Fedora mirrors everything to build the binary.

It's certainly preferable to lean on the distros and their
infrastructure although:

  - Fedora is a poor choice given the support lifetime
  - The various "full-fat" distros we run avocado tests for seem to be
    very bloated (esp compared to my local Debian setup which boots very
    quickly)
  - It's hard to argue with the time saving and stability improvements,
    especially as we are limited on CI time these days

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

