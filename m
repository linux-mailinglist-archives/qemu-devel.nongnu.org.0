Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A91F65FEFC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 11:32:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDk0n-0007p0-Ij; Fri, 06 Jan 2023 05:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDk0b-0007n6-LW
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:31:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDk0Y-000653-FK
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:31:32 -0500
Received: by mail-wr1-x42c.google.com with SMTP id co23so885377wrb.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukjFuYGLypMbFnu3O+Zy6cf93BJoXgWJ4E8UvbPjj+w=;
 b=uHZRFP9MceZxwUKuSSoGNeXiKmfJTAAiLuG16aGYwgJ42v8/nIj0VZC8VJvnApytX8
 iOT7OWpePhpvV6gFZOPeHpSMfdSjdwc65pfVVVZEac13rHYecIZZcsj4UfomT20pyvEx
 SR91UspPYKXUNrhh69azcyqcAI6Gj0+x2tVek8S1Gl3eym8P/HRt+BnOjmhv/kGHOCtn
 2IpiQLo7RZhFpq/rexR/yy35XItSxYPjdHFNzS5vi/Dr4SBGEb5B6b9jBXtXUnzrzRlx
 Mfj+0Xf2M0N4uGWznL2KIBj9KAco1Nw4C9dvof7dCLO3iLetkkotpxcvNQ5KQk0aUA4i
 FKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ukjFuYGLypMbFnu3O+Zy6cf93BJoXgWJ4E8UvbPjj+w=;
 b=Ea7fGEOzrf42OhV3QdIhuNUJpfgPlsJSQO9vPDwJI6eB99Js294zUZwKKiX1hcC7EC
 qzV1oYNiHRLSIImNmTcT1YLNF8B5PHwUX7ijS9KYNjMKQVSudCHpqN77MBwyjbT4L5ic
 adLL6ja4g5fJsROuEzX5mNuuaYQGxj2OrqEDKBryaux/41ibb6PAdkDwkogGFtabCgqG
 pWK5LYsOHLwDzA7djnCLpYd7TH7CjJUl6TrVpB34iy427BrmmudAiO+fobuTco+W697y
 sddmaQJCpGiQZrcOl2faCgvnkskuVre7gvn8qjdyRiNKkC62gTHGIskqYIZy5RXw5Ype
 ZJdA==
X-Gm-Message-State: AFqh2kpmF+mRFR6hMltujxAaACzCJL4fTca29dJ2hUleufA5/lo9BiGb
 Bank5ywwlF0zTRSJiu4vyKIFcw==
X-Google-Smtp-Source: AMrXdXuyyl/zaOZulxtJ56kQaiL7+YD0XG5M53l+A58pV7NoT6pxuqT1Ae1dKNwOufK0tD9N+9KjaQ==
X-Received: by 2002:adf:ce0e:0:b0:27c:dcd7:1c97 with SMTP id
 p14-20020adfce0e000000b0027cdcd71c97mr25366572wrn.40.1673001088272; 
 Fri, 06 Jan 2023 02:31:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a5d4ec1000000b002882600e8a0sm797688wrv.12.2023.01.06.02.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 02:31:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 49ED81FFB7;
 Fri,  6 Jan 2023 10:31:27 +0000 (GMT)
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org> <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
 <871qpwc6i6.fsf@linaro.org>
 <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
 <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
 <Y4Ztn91bFssBdbmR@strawberry.localdomain> <Y56kG439aHBbKVLK@cota-l14>
 <Y6DFXNbHGu7boW6/@strawberry.localdomain>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: Emilio Cota <cota@braap.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: Plugin Memory Callback Debugging
Date: Fri, 06 Jan 2023 10:30:41 +0000
In-reply-to: <Y6DFXNbHGu7boW6/@strawberry.localdomain>
Message-ID: <87ilhkosxs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Emilio,
>
> On Dec 18 00:24, Emilio Cota wrote:
>> On Tue, Nov 29, 2022 at 15:37:51 -0500, Aaron Lindsay wrote:
>> (snip)
>> > > Does this hint that there are cases where reset cpu->plugin_mem_cbs =
to NULL is
>> > > getting optimized away, but not the code to set it in the first plac=
e?
>> >=20
>> > Is there anyone who could help take a look at this from the code gen
>> > perspective?
>>=20
>> Thanks for the report. Just adding assertions was enough to uncover
>> several bugs. I did not reproduce the use-after-free, but by calling
>> reset from a callback it's easy to see how it can occur.
>>=20
>> I have fixes in https://github.com/cota/qemu/tree/plugins
>>=20
>> Can you please give those a try?
>>=20
>> BTW I created an issue on gitlab to track this
>>   https://gitlab.com/qemu-project/qemu/-/issues/1381
>
> Thanks so much for digging into this!
>
> I rebased your plugins branch on top of v7.2.0 and tested with several
> scenarios which reliably triggered the bug for me. None of them
> reproduced the original problem (or hit other bugs!) with your fixes.

Emilio,

Are you going to be able to post the patches soon? I'd like to get the
fixes in as early in the cycle as possible.

Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

