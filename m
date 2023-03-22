Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D0C6C4ECF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:01:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezxb-0007Tv-G2; Wed, 22 Mar 2023 11:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pezxW-0007Te-9b
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:01:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pezxU-00047H-9c
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:01:01 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso11691858wmq.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497257;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TamI1UbgLjn+i5zCZII4YwxDZF3NqtA/i2wtR8c6vjU=;
 b=fPZyYzkAfCHWLPjdUIJ2lB0PI0s+BF7cy9QqsRGL02WXtQDzjesXOPXanHJAR5lWLQ
 uo4NbP8muYQUHhubFpZ2lgY+9ApuqBHX7Ac2MxkOKOJQaPQmzwmCKKFsCJsQ2XGXLjhc
 WYQtnR0OQSY0fSU2n6O+cjbmROCm+zIkndPDnKluBSrJJeMgFH7EGrjvGQjn7AMhAcs/
 dtLE4bERV3P85ZidORHawvRwf6GNW6a4Mhf1nrpLxSrBsnJzlqFZc0JrCDeu6GLieWQD
 XJBCqiaCOoNZ31ryeIPO3N1tVPLA6CnC9vbWr/7Zh2kfZlK5O6GTMlppPXzD+Fhf1yEl
 5GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497257;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TamI1UbgLjn+i5zCZII4YwxDZF3NqtA/i2wtR8c6vjU=;
 b=lCZA4M84f60nSfeGDEXJmYB/BuVLC7CkHAr2MvBofa5plPvC9kdMBRUlqSGpG2HqfQ
 innU9QKh6+0osfco3xNzMzBdWfr9GVaPSjrmXn8VBs/M3wdUwUSAfSo+9FmPKMauHXGG
 otVW8IUqaQUrpZ758heKOOC7p3f6qdJ0oAfKhwCknT0/MUtKK+XOJIWk9i6/Uku7g7Jq
 yyNiyYReCFqf9xv3DZwSmb6oW/PaE8MbUA/NNXLCNKFNVQm6OZAQo2GfXTnrcj55yhLa
 MhMPQWg3IVg88b5/pwkSCCeR0x0u1s2LMYWpqm4SEMgpuG2353jIkxYCiIMf6sRR/cFu
 eYrA==
X-Gm-Message-State: AO0yUKW3DFewH4tQYu7hBYT/AT0kb+CAVRHa5Lk7UVUoPsdD6Xjd1cYz
 ihMjTVk47HFsS2KdqFkPIdBHDw==
X-Google-Smtp-Source: AK7set/bOKUpbYhXxs1zGKmcnDOrVXb8zWAp3DqtSVBgmf2fM4eLbkk2ob58i4E5ZqChOBwFHSzbLw==
X-Received: by 2002:a7b:c048:0:b0:3ed:a86c:3fff with SMTP id
 u8-20020a7bc048000000b003eda86c3fffmr5758753wmc.31.1679497256797; 
 Wed, 22 Mar 2023 08:00:56 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d4f89000000b002cfe466e894sm14072184wru.38.2023.03.22.08.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:00:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16C781FFB7;
 Wed, 22 Mar 2023 15:00:56 +0000 (GMT)
References: <20230321181741.3748845-1-alex.bennee@linaro.org>
 <a06b7763-04fb-60d3-be81-65585ba5c058@daynix.com>
 <87wn395bqf.fsf@linaro.org>
 <3571bd36-e1e3-ebea-77a6-8042856dcab2@daynix.com>
 <87jzz958pk.fsf@linaro.org>
 <3bd3dd15-3b81-f198-f701-e679d6a99234@daynix.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: re-factor igb test to avoid timeouts
Date: Wed, 22 Mar 2023 14:56:04 +0000
In-reply-to: <3bd3dd15-3b81-f198-f701-e679d6a99234@daynix.com>
Message-ID: <87fs9w6dav.fsf@linaro.org>
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

<snip>
>>    - The various "full-fat" distros we run avocado tests for seem to be
>>      very bloated (esp compared to my local Debian setup which boots very
>>      quickly) >    - It's hard to argue with the time saving and stabili=
ty improvements,
>>      especially as we are limited on CI time these days
>>=20
>
> You don't have to perform the normal userspace initialization the
> distribution comes with for this workload. We can just add something
> like the following to the kernel command line:
> init=3D/bin/sh -- -c "rpm -i /path/to/ethtool.rpm && ethtool -t eth1 offl=
ine"
>
> This is very similar to what Docker containers do. In Docker, you do
> not run daemons like systemd but directly run the application or use
> very small init.
>
> The reason why I didn't write the tests in this way is because the
> current testing infrastructure does not have a means to provide a file
> to the guest. I think adding such functionality is much simpler than
> introducing Buildroot.

I don't really have time to add a new feature to avocado to get this PR
dealt with (the original reason I was looking at this test was trying to
figure out why it was stalling on the centos-8-stream custom runner).

I've sent out a v2 which incorporates your other feedback and speeds the
test up some more with the direct call from init. I'll include this
version in the re-roll of the testing PR. We can always look at
reverting it to using fedora after v8.0 is out. In the meantime its just
one more random test binary I'm serving amongst the many I already
support.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

