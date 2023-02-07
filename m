Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5513B68D741
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNUO-0001DT-Kn; Tue, 07 Feb 2023 07:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPNUN-0001D2-0y
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:54:23 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPNUL-00061N-Fs
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:54:22 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a5so7662871pfv.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 04:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I67R4pNssTVatlp+xdgpD4XJXE5KMr6pjSPT31x9GEQ=;
 b=VKIVxkCbgEdSz6vAoXKF2lV5iz0SI5XVRyI69q2Q7iHj9dHFR85KXBgwefIFPmmUrd
 eFT5QFce8GVIL+v8PsAmDznQ3T829yiSnG5TwJYuJDpawgMgDVEV+twNdg595bddPDj+
 WKKlZvZ+yW2tA3pGf8dI0GILRwR4On066VO3HT4HHHxel7L8g7/H60UiSLYjf/yv5JnW
 fyBMr6JGYzURAcALobDc+QcmUQhwRdXUh2g0J5nPZlph1z6eCfpHJgmvrevSzRB/bS8G
 Fb6chKZSUvzX5qp+eq/AzSCbJUvM/T4iCRCByEuuD2SCIKM7Ikyx/WuYx5HP1RZPIGwN
 h2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I67R4pNssTVatlp+xdgpD4XJXE5KMr6pjSPT31x9GEQ=;
 b=pc4PKseFmsq27RdFEbDXP3JgMRq9F0RWMb4ETO6uxUbjmYJx5uTB2J8bhZqde3QaOC
 vBD+TPuSo8llZHMnKyjAcIg8THZ5ZW6FOAmyUWzeWfPV3Pde6T7maRY78kGWAzhB3tNk
 4t11ZlU0CoCTKJRaY1xTO29bPmaEenE6smSdfmwYWjiOUNq3tSLExveHbytHEY/Tgglq
 0eI8IUCzmfEmGBVbvadKPLTsLAB7lzff4zqxXy7UFS8UAeFAj9o7yBqgEpjJCMHeMYPO
 nPmbMbKWGBHKUsrNbU6J1wSzGWUF5kg6pw6wOyZ5yznvRqlMksPzfqpU3auuQiQj2J1H
 6gsQ==
X-Gm-Message-State: AO0yUKXDzJMcbs5Ool4I6wTtzcmAmkIXv5fXPtpwMYkjR98muEAogrpV
 z9aIcvDUJIiIsEMajBUtDA9YTifKWaHFVjcJ9EEZfA==
X-Google-Smtp-Source: AK7set/vEMOzaHOzi+FdI8wYkyvMuoxW1MWk3R2fXcZnh6HJggaUHEnO9Gruk1j8XBfTIz/gMCQLrjEUQb8YlUqtLAo=
X-Received: by 2002:aa7:9a48:0:b0:58d:ce70:4683 with SMTP id
 x8-20020aa79a48000000b0058dce704683mr708391pfj.39.1675774459757; Tue, 07 Feb
 2023 04:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20230203171657.2867598-1-eric.auger@redhat.com>
 <CAFEAcA8qz8qsZNsrbbnmvVUgRazsxtGVm59enyU1rf2ZHjx+ow@mail.gmail.com>
 <e4eaad79-f545-9eab-5fa3-8e55a045a2ff@linaro.org>
In-Reply-To: <e4eaad79-f545-9eab-5fa3-8e55a045a2ff@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 12:54:08 +0000
Message-ID: <CAFEAcA8a_UMVfJvEo-Da=xOKguwgsArQD1VEt7PgTgy=GN_3mQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add raw_writes ops for register whose write
 induce TLB maintenance
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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

On Tue, 7 Feb 2023 at 12:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 3/2/23 19:04, Peter Maydell wrote:
> > Anything with type ARM_CP_NO_RAW shouldn't need a .raw_writefn, because
> > that type indication says that it's a bug if we ever call
> > read_raw_cp_reg() or write_raw_cp_reg() on it. (Specifically,
> > for KVM, we should never end up trying to do a raw read/write
> > for a state sync because write_list_to_cpustate() and
> > write_cpustate_to_list() skip NO_RAW cpregs.)
>
> Ah, this is the check added by commit 375421ccae ("target-arm: Add
> checks that cpreg raw accesses are handled"). So this patch shouldn't
> pass check-qtest, right?

That commit adds a check that if your register is *not* NO_RAW
then raw_read/raw_write will work[*] (ie it is const/has a fieldoffset/
has raw accessors/has normal accessors). It doesn't check that
if the register *is* NO_RAW it doesn't also specify unnecessary
accessor functions.

[*] at least in the sense of not crashing or accessing
offset 0 in the state structure -- it has no way of telling
the difference between "no raw accessors specified because
the plain ones will work fine" and "no raw accessors
specified, and this is a bug because the plain ones do
something that's not OK as a raw-access".

thanks
-- PMM

