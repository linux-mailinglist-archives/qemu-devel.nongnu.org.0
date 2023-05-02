Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8876F47F5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:07:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsXC-0001kF-VX; Tue, 02 May 2023 12:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptsX9-0001jW-Qw
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:07:20 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptsX8-0008Th-4b
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:07:19 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50b383222f7so5292524a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043636; x=1685635636;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rPdQXw/fq4j47T9RvnrT5HtF67OlhxtSoj8vnvwsf4U=;
 b=ZytMXUKiMkhBbWSBzzO8fL2RXS0hgY1QpN7unfu1p735kVxzJLII24/VUPiV+oFG6P
 uyyBug4WgOTISuBAVvc0DNvfaHpbsqggYez74e4X3ffuQIPdMvcv3WBJuABIv0agZ5P+
 h3TnkSIAOKsgXbbtOqRM0zrH93LfMbqUBksf+wFb7+7l/QV/3Tyj99RXml14ekFQzZYr
 NUuLsMJD49iUiHAJvevaQ7ewowDhocWNHGJbYIXILkJlBLDbsyDAOH8laDTSbKhtjOHi
 h6gZ02q6hLVeExS8KQg8/jigFciIg5dvU+Dz6HNJzr68b3ySe2802wppDhjfPirGbj07
 qatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043636; x=1685635636;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPdQXw/fq4j47T9RvnrT5HtF67OlhxtSoj8vnvwsf4U=;
 b=WzXL9H8BHikz4E9vgb48tLiLkvTo080TzdbQgGUnNwqNFQzT/rPQKXi55IIduf5BEO
 N0vHzwiQBRUSrHf5f/+G7sMZiOckrFnrE7g4eUBlxe81nujk+aZdrraoInGmkEQ9sQdS
 lwXY4C5jTtkHkGSbQFopx1R6GKydtnRMS5NfbvQpjM8uVaRSUBQEZi37Sx4zY5h9VbAD
 joLw8BLjKbiSiUtCfXYtZGhr/Tmfx5dgxwGsw5KW0cznnWjXe/sYQvmC1Mpp3D9OJbLN
 FT+HxzuzufM6tN005hoGuF9SxS+WZ00+ua8AmDY4T0d2JEKk5HfkdVGE/aEtyLrKqyB1
 2bow==
X-Gm-Message-State: AC+VfDzDQNm73+HqLU21Q3r6jY+cp+RPImorhT7kGHIww0MRpQlned+E
 KEDX/x65Ge4zteUplJL5ovHI+QPAyNlkdkZEXNpGKA==
X-Google-Smtp-Source: ACHHUZ7JzyMTWfF7fY2sU/0wP8hSU5gPNGrpjyc68+eWLV8NY46UVMkpEu5xqTN2NXY29ls3nbgj/FEpJkbhw0I6P58=
X-Received: by 2002:a05:6402:517a:b0:50b:c896:12eb with SMTP id
 d26-20020a056402517a00b0050bc89612ebmr4885194ede.31.1683043636081; Tue, 02
 May 2023 09:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de>
 <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
 <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
In-Reply-To: <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 17:07:05 +0100
Message-ID: <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Tue, 2 May 2023 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
> > >
> > > Hi,
> > >
> > > Some minor changes:
> > >
> > > - new patch to move a test under CONFIG_TCG (broken on master);
> > > - new patch to document the unsupported CPU test (Philippe);
> > > - changed the test skip message when no KVM or TCG are present (Igor).
> >
> > Applied to target-arm.next; thanks for your persistence in
> > working through the many versions of this patchset.
>
> Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
> because it enables a CI job that fails on our aarch64 runner
> (because it wants to run tests using KVM but that machine
> isn't configured to allow the runner to use KVM).

We fixed the runner config, but the CI still fails on that notcg
job because it is trying to run tests that explicitly use
'-accel tcg':
https://gitlab.com/qemu-project/qemu/-/jobs/4212850809#L3595

Something is weird here, because we built without TCG support
on an aarch64 host but we still got qemu-system-i386
and qemu-system-x86_64 binaries, which then don't work
and cause the tests to fail...

-- PMM

