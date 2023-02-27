Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1076A4580
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:02:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWf0Y-0001c2-Hs; Mon, 27 Feb 2023 10:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWf0G-0001Zr-My
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:01:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWf0B-0003kp-Dy
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:01:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so4023168wmq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 07:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdAJkRecFKsSYP5Ew4FPrPZbv9AZ4HDi441Gc4VlooI=;
 b=dBzjjvRp0zI615Axykcb6lJ48SRSnbhAEDzkrKTVNNCoWoD4vjenudtidKBKP9IjN7
 ST0zFu2l9SwZnrU8PWHt3dlLz5aQFCB2EOVn6JCIE4U0DdWKO+RiNrkq+qB7ANSbJ1mj
 XOvbyjFtJqKbB4gNmL0FYag2YSm+Scx9LaXoqMlfZ8EhQ8cQHec+3mUOaGVsyDjCVTnY
 nR+sLCSzSOfBDqW3Hm27vVpVB9/jCKE+NlfCzVU0qAb7gYI9cr9XE/rc4/qCM6smcxjj
 JHub+XN0qCaGOGkfn4vTRtyKY/w3mppr3fa8RIgaVkC4oE+6QkcVBM6Rndq9jh1UN8WH
 1eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cdAJkRecFKsSYP5Ew4FPrPZbv9AZ4HDi441Gc4VlooI=;
 b=qof7b6aeIl0BmjGZdgQB2RdCz3Un+bLWLMkx0iEuGnQiHlXTH4W/GcobRt1Qp2aiU4
 Oq/WbATsVGaZh7jIyWWjtNOzDIfGUqIO6/P2KPW6kNUiseYLV6N6C8Fq/WFCIVr8PGkb
 3xLzV/71fbShMg3/FVD29uja9sz3u4M86V3Qtvb+D4u+jStbkNR62LUGS6XZJeRcyd/m
 ghoAl9m6Lq1tmQLRWpx/L30TyWb6g31BvglbIW4u+mAR1qB43NrjQ+j1ndAZlXCeRXda
 6DNypVKYBTge1cZ+JahGoP2uhNY1p5hn1Sd65zmL0cSfE6QaFFb3QiMJ85hwlgOYYmd3
 GVLw==
X-Gm-Message-State: AO0yUKUgw/HkKS0tpp61sp4B9lDzFZe+VvruvwDYKcES66RNr5Ks6rlj
 wLOld80GNjvkp1MchpTfVpm12g==
X-Google-Smtp-Source: AK7set8ZJWeL8hGtX870aHQUBdJXm9UeyPFfdHp3EVveGfWEcd7AMs/mpOZ9FP7JdvGPyyUFqb4Kfw==
X-Received: by 2002:a05:600c:90a:b0:3eb:2b88:7838 with SMTP id
 m10-20020a05600c090a00b003eb2b887838mr7628070wmp.14.1677510077825; 
 Mon, 27 Feb 2023 07:01:17 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a05600c2f1700b003eae73ee4a1sm9379866wmn.17.2023.02.27.07.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 07:01:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F41701FFB7;
 Mon, 27 Feb 2023 15:01:16 +0000 (GMT)
References: <20230223155720.310593-1-alex.bennee@linaro.org>
 <CAFEAcA_Up9_180Xb+_2ybuVPfknP7=WTmTAGcZEk5_iP0YH5rw@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
Date: Mon, 27 Feb 2023 14:59:41 +0000
In-reply-to: <CAFEAcA_Up9_180Xb+_2ybuVPfknP7=WTmTAGcZEk5_iP0YH5rw@mail.gmail.com>
Message-ID: <87sfergnk3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 23 Feb 2023 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce6=
9b8:
>>
>>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu
>> into staging (2023-02-21 11:28:31 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223-1
>>
>> for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7eda2c:
>>
>>   cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +0000)
>>
>> ----------------------------------------------------------------
>> testing updates:
>>
>>   - ensure socat available for tests
>>   - skip socat tests for MacOS
>>   - properly clean up fifos after use
>>   - make fp-test less chatty
>>   - store test artefacts on Cirrus
>>   - control custom runners with QEMU_CI knobs
>>   - disable benchmark runs under tsan build
>>   - update ubuntu 2004 to 2204
>>   - skip nios2 kernel replay test
>>   - add tuxrun baselines to avocado
>>   - binary build of tricore tools
>>   - export test results on cross builds
>>   - improve windows builds
>
> This hangs when I try to merge it, and eventually times out:
>
> Switched to branch 'master'
> Your branch is up-to-date with 'origin/master'.
> Already up-to-date.
> Switched to branch 'staging'
> fetching from remote https://gitlab.com/stsquad/qemu.git
> tags/pull-testing-next-230223-1
> remote: Enumerating objects: 108, done.
> remote: Counting objects: 100% (108/108), done.
> remote: Compressing objects: 100% (50/50), done.
> remote: Total 108 (delta 59), reused 93 (delta 57), pack-reused 0
> Receiving objects: 100% (108/108), 100.58 KiB | 7.74 MiB/s, done.
> Resolving deltas: 100% (59/59), completed with 23 local objects.
> From https://gitlab.com/stsquad/qemu
>  * tag                       pull-testing-next-230223-1 -> FETCH_HEAD
> Fetching submodule tests/fp/berkeley-testfloat-3
>
> fatal: unable to connect to github.com:
> github.com[0: 140.82.121.3]: errno=3DConnection timed out
>
>
> I don't understand why anything is trying to fetch from github
> in the first place: the URL for the testfloat-3 submodule
> is a gitlab one..

I think the underlying config needs updating:

  .git/modules/tests/fp/berkeley-testfloat-3/config

I'm surprised the git config for submodules doesn't carry the metadata.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

