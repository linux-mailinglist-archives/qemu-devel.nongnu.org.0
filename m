Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9726C5A6A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf79R-0007T5-BW; Wed, 22 Mar 2023 18:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf79P-0007Sw-FX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:41:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf79N-0008UE-HV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:41:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id cy23so79094627edb.12
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679524904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+0Crfwyw7bTf/SUABDr4/eJQQpu6OooQaXkYMEDCXNQ=;
 b=t/3RIvtVWC6E0HkFay/w9MBPq9YuIXE8vjvFrZZu93Eqjh+pxetWHbOtftCd6HmVp0
 CqdpvxrWoZspst1NlBRrsqANiIOHdkgoQeLIa1FPc5Y831DRliawwRBacsSUewxKHaFO
 oiA0GcXLfBorf+3fjBGUK5ULmVPM08MEGCtpkwIOxwFcOoOmgnJ+5DYobGeWtXJBq42F
 13bXKLwD1qdZuNRbfng5Dw97actZMF3cImNFhdKLpgluVvM7xJBgMtEyr+dys2db1iYr
 q5yGDX1ml9IeJg3cl8lHXPIewNXlNsWnFO/VZTFPqIk0O0LOETq4KDCDid9/a2IW4uRk
 8eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+0Crfwyw7bTf/SUABDr4/eJQQpu6OooQaXkYMEDCXNQ=;
 b=8AR9WeULAXiH7pYUVRt8Iiwh2+0JJyxgMvOM0y10GcgvKbmm7EyKTHtnj/44NkMzIk
 MXnBF+gFZ1MSrPn53B+WGqm/Hm1EPWkUfhebKiZVO62LCJD64hYiOeNI7YuK+DXP5KRp
 gkAdQ/KEkqni1dsqu1RplvWWJaLXuMDeFhJl012+gsOIuyyZVDAdgvoP6j/mXOB7ZsoO
 aG++j0LxXphaAN2HnXHZyaGxBWRYgme1SYjUivxxRek6QlvTjxTvcZrwdVLZf3RkikSS
 FnSK44ESDbHijC0z8I7tMmoJVy0ClcZkgg/pkoe0Jx4lWMpusJ2AYZOLTQZbzPJ7b+pU
 YGfg==
X-Gm-Message-State: AO0yUKXUDlZ+s6cHHDBrohDmjct7e4Ud95DjdT5pWxhxzbyA8b3xQeS+
 Yyo7dFEoLRhV5ofpZOU/G+Evrw1lhCg4kK+ETqAawtUxz/10SVel
X-Google-Smtp-Source: AK7set8FKiHkUTGfZjdOwS82GCPKF/kABnpFmiGftktyu35PmCV6lQVNqL4kRLX0QX5sfQb4g8+BahKgP3V/2Yhj4RE=
X-Received: by 2002:a17:906:5584:b0:92f:cbfe:1635 with SMTP id
 y4-20020a170906558400b0092fcbfe1635mr4043624ejp.6.1679523043622; Wed, 22 Mar
 2023 15:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230322163303.4115917-1-alex.bennee@linaro.org>
 <CAFEAcA8ipWKpv09pyQWNQBiUhd2JYM=sn4qv2YBen-pN3beU0Q@mail.gmail.com>
 <87355w5u55.fsf@linaro.org>
In-Reply-To: <87355w5u55.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Mar 2023 22:10:32 +0000
Message-ID: <CAFEAcA_zP2Wi0-iTK1S43ZkYQ4TSFtvDyihDa+yiddaXb7s=-g@mail.gmail.com>
Subject: Re: [PULL v2 for 8.0 00/35] various fixes (testing, plugins, gitdm)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Wed, 22 Mar 2023 at 21:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 22 Mar 2023 at 16:33, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> The following changes since commit c283ff89d11ff123efc9af49128ef58511f=
73012:
> >>
> >>   Update version for v8.0.0-rc1 release (2023-03-21 17:15:43 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-220323-1
> >>
> >> for you to fetch changes up to e35b9a2e81ccce86db6f1417b1d73bb97d7cbc1=
7:
> >>
> >>   qtests: avoid printing comments before g_test_init() (2023-03-22
> >>   15:08:26 +0000)
> >>
> >> Note you will need to remove the old openbsd disk image to trigger a
> >> rebuild that avoids the issues with -ENOSPC. My pipeline can be seen
> >> here:
> >>
> >>   https://gitlab.com/stsquad/qemu/-/pipelines/814624909
> >>
> >> ----------------------------------------------------------------
> >> Misc fixes for 8.0 (testing, plugins, gitdm)
> >>
> >>   - update Alpine image used for testing images
> >>   - include libslirp in custom runner build env
> >>   - update gitlab-runner recipe for CentOS
> >>   - update docker calls for better caching behaviour
> >>   - document some plugin callbacks
> >>   - don't use tags to define drives for lkft baseline tests
> >>   - fix missing clear of plugin_mem_cbs
> >>   - fix iotests to report individual results
> >>   - update the gitdm metadata for contributors
> >>   - avoid printing comments before g_test_init()
> >>   - probe for multiprocess support before running avocado test
> >>   - refactor igb.py into netdev-ethtool.py avocado test
> >>   - rebuild openbsd to have more space space for iotests
> >
> > I saw this on ppc64. I suspect it of being a pre-existing
> > intermittent -- I'm retrying it.
>
> On what platform is that?

ppc64be Linux (it's one of the gcc compile farm machines).
It was indeed intermittent, in that it didn't happen on retry. So:

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

