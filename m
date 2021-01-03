Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6429A2E89E9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:48:58 +0100 (CET)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsVt-0002Qs-71
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsTm-0001Eb-QW
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:46:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:55406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsTk-0007q7-LZ
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:46:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1703C207AA
 for <qemu-devel@nongnu.org>; Sun,  3 Jan 2021 01:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609638401;
 bh=zDlR+/9aMNyAo9odnphMcC4dub/9KviTMkq6oIAdXIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f+eJ8hytLdR47E0svyDIsnPy6B+Y3B1y5CRLBe5511MXYgLUkwQL9hr4IQPg/lvHN
 kOnmhlVAX0u/2XLJUhsvRN0pfukozjSutf+lzNsSDKxXF+kcm/vt0Hlkd5qwazSA1o
 yWJtIGWHVk+onM+oC8kr9BOIZJCP8kSJq55ZAKxsw1e3s3YWlgjHQ8fe0MwP+rY6Zw
 WjJEXMCVb+3pYGlx2cNFfHEMoSJUD7N84uc+2WfcnTspmx3mOoJQqq/BBbBc6wb6jk
 mcN9WvOt42uJqPViZKKHUK7rtM8Djzi3iQ02QQlNiSln/FvVKf5MBpQ4GmR6bbTtgn
 x77VMubd5ECVA==
Received: by mail-il1-f180.google.com with SMTP id t9so22156984ilf.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 17:46:41 -0800 (PST)
X-Gm-Message-State: AOAM532GJlilyUNboIlzQF63snerX/pS//Po6vUdhE+SLiUZD1tZyc+e
 7f3NjrowSEGSgeg1akUENnJRngVO1SFWtCjwqzE=
X-Google-Smtp-Source: ABdhPJxG3vbMyFwAAX+2aL3VrYa0bUCt0PwKNf4sfcqtBBkVIP04gUxBp7hrYMvX22D0foxxcXVmxGgwmMzKabQU8Eg=
X-Received: by 2002:a92:2912:: with SMTP id l18mr64770319ilg.173.1609638400491; 
 Sat, 02 Jan 2021 17:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064507.30148-3-jiaxun.yang@flygoat.com>
 <6dda6b4b-5808-3e01-b5a8-8ab562a167a9@amsat.org>
 <b08929ca-d7f1-b6eb-2223-5ea56033a591@amsat.org>
In-Reply-To: <b08929ca-d7f1-b6eb-2223-5ea56033a591@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 3 Jan 2021 09:46:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4bNXdJ3Q2h78xBQA7Ov=_Jqu-=56MWmhy3G+z9Kvgc3A@mail.gmail.com>
Message-ID: <CAAhV-H4bNXdJ3Q2h78xBQA7Ov=_Jqu-=56MWmhy3G+z9Kvgc3A@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] target/mips/addr: Add translation helpers for KSEG1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Paul Burton <paulburton@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Sat, Jan 2, 2021 at 7:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 1/1/21 9:42 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 12/15/20 7:45 AM, Jiaxun Yang wrote:
> >> It's useful for bootloader to do IO opreations.
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  target/mips/addr.c | 10 ++++++++++
> >>  target/mips/cpu.h  |  2 ++
> >>  2 files changed, 12 insertions(+)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

