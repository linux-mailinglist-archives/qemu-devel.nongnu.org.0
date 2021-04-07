Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB6357482
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:44:55 +0200 (CEST)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUDAd-0002iY-0G
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUD88-0001gD-Nx
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:42:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUD84-0002G2-CF
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:42:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f6so12952788wrv.12
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZEQnT3/F6NZXU1d/5mQRG9KZUC7kVJdRW1oP7E3bCwY=;
 b=HQy7z2GwddnGPkw6PnrfkWo3vWjKpkVrE15KbNn/ZaiFiN8ws2kx0L+8NSi3X/yDlM
 4IuVYdLdXcS6Pn33AqEl8yerUhi6GyM1OgIpfq8DuJRGW8fhxb1JFPm1mqT0e2sE7C4j
 Rtkm4AtNQR/3Ug8PyarH3sxWxcOPGx3oZ7v8sAULOIoQ3XLfnpYhaBmEfw3q6SNBgoY8
 jsbbNzOgz/hCvesiK/udB7auXIjX06d3ugVFsmFb3Fgzs1kNYZh/D0q4rEUNnZHai+3+
 tE0f5COLOiX2ffuOWP1JqnDyAjPbasWvGCPrRSVvyu7Exh4BZAUXSPLvKlm1ssvoKcXb
 L8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZEQnT3/F6NZXU1d/5mQRG9KZUC7kVJdRW1oP7E3bCwY=;
 b=aC2aT3nPkA/WobQqBor4rMrdmwGNkowB0vxA2JhJpFJg/A6+r+k5muf4LIWiu8/cJ3
 PK3d6mpha+YctpW57lmqDjcL9cR0gNC3rtvxHg9+LbMAGzpFfJElMqPe9ZdHgRuSR82U
 +arAc25p3ZjtYLIbv9gK6Babio+8XonjitX2b4Jv3dAGOMj3W7iyjKgQ/XcYKPYeqVgr
 etfk81N42gxgI1FC+td6ESVqPg0d0xl/8kRxlCDJ13EdouaI5rb8Vhz+uaYx/1C+UAUq
 2VxdKZGnbAjrrA8EIA7iwNfoQHNWm8OGEZfFgWa4FZICcaxtO/HZcisRD+gwt42PoFRn
 mm0Q==
X-Gm-Message-State: AOAM531qA55HgcQwibsK5WWHWeQ6R2X0+wXcZCjewD6Di5OH0uJAsPdS
 b6w+v3/CJlHT/IJ8ZmAkyY/oWQ==
X-Google-Smtp-Source: ABdhPJymmGQ5CUy4bc6t9cB/sssl/4ZbnFnQSXiCUx1oBIZ8+7oT57ZiN1/xTody11jYLZ6MTTQObA==
X-Received: by 2002:adf:f60c:: with SMTP id t12mr6096048wrp.38.1617820932644; 
 Wed, 07 Apr 2021 11:42:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n17sm16946226wrs.84.2021.04.07.11.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 11:42:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 377191FF7E;
 Wed,  7 Apr 2021 19:42:11 +0100 (BST)
References: <20210406150041.28753-1-alex.bennee@linaro.org>
 <CAFEAcA9c24M3NA8LzbDEUU==Y51LwRH5nR9bopiFNwQTwoE7cg@mail.gmail.com>
 <87czv6uhtr.fsf@linaro.org>
 <CAFEAcA_6AEcUkpZY3d602OXybnH1iVM+8pQuktUWkScd02W4Kw@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/11] rc2 fixes (check-tcg, gitlab, gdbstub)
Date: Wed, 07 Apr 2021 19:41:32 +0100
In-reply-to: <CAFEAcA_6AEcUkpZY3d602OXybnH1iVM+8pQuktUWkScd02W4Kw@mail.gmail.com>
Message-ID: <87a6qauebg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 7 Apr 2021 at 18:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 6 Apr 2021 at 16:00, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >>
>> >> The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6be4=
43c138:
>> >>
>> >>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-=
pull-request' into staging (2021-04-05 22:15:38 +0100)
>> >>
>> >> are available in the Git repository at:
>> >>
>> >>   https://github.com/stsquad/qemu.git tags/pull-6.0-rc2-fixes-060421-1
>> >>
>> >> for you to fetch changes up to a2e5bbf0c407a572d9b687adaecf9995f66b4c=
d9:
>> >>
>> >>   gitlab-ci.yml: Test the dtrace backend in one of the jobs (2021-04-=
06 15:04:50 +0100)
>> >>
>> >> ----------------------------------------------------------------
>> >> Testing updates:
>> >>
>> >>   - fix x86_64 cross compilers
>> >>   - don't use registry for non-x86 containers
>> >>   - add valid host types for given cross compile containers
>> >>   - clean up i386 code16 test with explicit -no-pie
>> >>   - relax sha1.py gdbstub test
>> >>   - add more gdbstub documentation
>> >>   - remove annoying warning on gitlab
>> >>   - test dtrace backend in gitlab
>> >>
>> >> ----------------------------------------------------------------
>> >
>> > The merge for this failed in gitlab CI with a weird state:
>> >
>> > https://gitlab.com/qemu-project/qemu/-/pipelines/282228325
>> >
>> >  * marked "failed"
>> >  * but has a "cancel" button
>> >  * has no "retry" button
>> >  * has an "error" tag whose hover-over text reads "Pipeline job activi=
ty
>> >    limit exceeded!"
>> >
>> > Not being sure whether this is gitlab CI being flaky again or a problem
>> > with something in the pullreq, I've not applied it for rc2; we can
>> > figure out what happened and maybe try again for rc3.
>>
>> I think it's GitLab going nuts because:
>>
>>   https://gitlab.com/stsquad/qemu/-/pipelines/282304522 is all green
>>   https://gitlab.com/stsquad/qemu/-/pipelines/282619235 is a dumpster fi=
re
>>
>> And they are both the same commit (pull-6.0-rc2-fixes-070421-2)
>
> Should I retry a merge of this pullreq (which is -1), or are you going to
> submit a new one ?

I think either is good, the -2 tag was simply a re-base and has at least
one clean run before everything went weird.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

