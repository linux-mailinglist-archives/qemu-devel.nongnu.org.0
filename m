Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB168A979
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 11:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOFhp-0005VI-9R; Sat, 04 Feb 2023 05:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOFhl-0005Ux-Gq
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 05:23:33 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOFhh-0001x1-Rq
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 05:23:31 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 ge21-20020a17090b0e1500b002308aac5b5eso1230000pjb.4
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 02:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RFfdtFBHfsd/Y6IdeDifNBoNZqAB16sgpN261Sxedxc=;
 b=ejuzJeSnszALgtSRkh8qmatPzMZDbl1mraf3t/UokNTMd80FY9FvjLYJBHNGRbvHNY
 DoO3u4Ghv/Fnwcwc4r67eoMI/y+zUBCYYlCVyPxJ86xeu77la5buAxfHPfIO5myiyhXS
 EYGcdjuig0gcEeHpQYMa44v4P2LNVbdtCQRDsPt0/b+ZAe3nFe43O7Ws1DLc8+WIRuOo
 8/0ItaSBZ4SniplPEkcKy2e2sHJ0gvV0a4bvUUUVS/Gtp+ye2j9HNPJRuO98S9KVDSz5
 O141xGnoda+BIERLe+htRRvh3UzCrjxeNbKyo6lTdozsUj5XsqfR3bM4E549oxKOeY0k
 X3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RFfdtFBHfsd/Y6IdeDifNBoNZqAB16sgpN261Sxedxc=;
 b=KfMk0cQFxIFTfDShVSEOKTgiy2OmI2vNIzUHsD3XwJKfk2x8GAAs9QN3TGkUlARUSA
 HjbaZxGjJjP7X+zkqPexjfdOKv9UP36VGkFtZ15gZw7RcShyMiezf4vWmfrPha7SzCw3
 J9IsCwVgV2eliiimsCKTo9v8RrjIz48mq/ov7P+eOjOBd5oY3TGpGFuvpoXfRuwdxBmJ
 r0l9A34CCnGzge0k3y6BIjDXdA+wkdy/WNK+gEUqmHFWqPbMW8zOBPUu+wXEaRMg+OSQ
 0gG/eMx+lS/O/gghIzAcB311i71dvQWUUBqR00L4XFam6THW/roQEmopBu6zcjpPVPHn
 8AJA==
X-Gm-Message-State: AO0yUKUQc8hLXZL+osBGo/DUavWUcBBc+TxPQXmdlt+7VzqlwR3kjqwt
 jGNkBdxeBixF6Ou1rNiZ4O7BegRFZGK8Z596uszOjg==
X-Google-Smtp-Source: AK7set9y8mG7lNerOPFRaIizpZMUbdk/hGVNskWFGQPzXlK/MrUTeRKY11hu5uJNe9n645KohLnxOPgBvfTMtJXjC2A=
X-Received: by 2002:a17:903:1c8:b0:196:3b96:6a1a with SMTP id
 e8-20020a17090301c800b001963b966a1amr3195539plh.28.1675506208407; Sat, 04 Feb
 2023 02:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
 <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
 <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
 <87sffme9jj.fsf@secure.mitica>
In-Reply-To: <87sffme9jj.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Feb 2023 10:23:17 +0000
Message-ID: <CAFEAcA9azj-v-=dXPjqzX4kdUaeOpArQZUxWU_R5sOm7vwSrrA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
To: quintela@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, hreitz@redhat.com, 
 dgilbert@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Fri, 3 Feb 2023 at 21:14, Juan Quintela <quintela@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > The migration tests have been flaky for a while now,
> > including setups where host and guest page sizes are the same.
> > (For instance, my x86 macos box pretty reliably sees failures
> > when the machine is under load.)
>
> I *thought* that we had fixed all of those.
>
> But it is difficult for me to know because:
> - I only happens when one runs "make check"
> - running ./migration-test have never failed to me
> - When it fails (and it has been a while since it has failed to me)
>   it is impossible to me to detect what is going on, and as said, I have
>   never been able to reproduce running only migration-test.

Yes. If we could improve the logging in the test so that when
an intermittent failure does happen the test prints better
clues about what happened, I think that would help a lot.

https://lore.kernel.org/qemu-devel/CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com/
is the thread from late December about the macos failures.

-- PMM

