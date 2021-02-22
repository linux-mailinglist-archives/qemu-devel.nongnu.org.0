Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F333132194B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:48:29 +0100 (CET)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBZc-0000Wq-U5
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBXw-0006wA-57
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:46:44 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:36034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBXt-0005gZ-B1
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:46:43 -0500
Received: by mail-oi1-f179.google.com with SMTP id j1so2010044oiw.3
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m1H8c1uq3SjcIO6I1dxrQL9LWrv7THprqt6iTEVqT2g=;
 b=BeipaquLxBcg8puAg1DMMDXh3H1v9mNLaYfpz1qdWW58MZEdpeniyltUNpHG86IMc0
 Aul4Kga4KUd5OOsHLWllxOnFXBFh1APw0GEmbpmFQfXOpwOfNupo0Z+h0V0eP4q1YRyb
 Xo8oqkNFBOpFLq8GlF0NszInxneNWsoRrov9/GHg0mvcjAp1lp9SBrBDApAqtmcGq1Pj
 IFQTV48DLml5N2TxZVV4C8lZ6vKo1j0CR59efyaJvgy4vJiV3d0Iukq0G+dbLi3hBQoe
 aioXko4Sn6fk6dhgAj3RkZPRtwyFMQ6ufGrkY8DGgo7uVUA4uBo2tMfNxeNy8sSJaLff
 uZeA==
X-Gm-Message-State: AOAM5322FR9MKkrI4kp8hyjV2qVSLoBHtmsxlsx0V24spm46bi9EX2WU
 RQFwRwaQM37QliT2Lj3A2ZH+kpaR6Pezo3z3dXY=
X-Google-Smtp-Source: ABdhPJwQ07N3W+OQoOD1Ia/wH7PqP0uL4Du2Fs+D5y9bzhcrXas7m2O5mQVwv3BBMlMQPLy5a59Zsia/eDMeGMkrmZU=
X-Received: by 2002:a05:6808:486:: with SMTP id
 z6mr15785391oid.121.1614001600355; 
 Mon, 22 Feb 2021 05:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20210222133634.2235-1-cfontana@suse.de>
 <20210222133634.2235-12-cfontana@suse.de>
 <94f7b333-5718-cadc-1b0b-69b10500f722@amsat.org>
In-Reply-To: <94f7b333-5718-cadc-1b0b-69b10500f722@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 22 Feb 2021 14:46:28 +0100
Message-ID: <CAAdtpL7LTr7wk2nJNqifa3cwHoMFogdS-ygo+8B_Z7ucNa2vnQ@mail.gmail.com>
Subject: Re: [PATCH v21 11/17] i386: split misc helper into user and softmmu
 parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.179;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 2:44 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> "user" vs "system" in title?

(just wondering loudly if this is what Richard comment was pointing
at, not asking for a respin)

> On 2/22/21 2:36 PM, Claudio Fontana wrote:
> > Signed-off-by: Claudio Fontana <cfontana@suse.de>
> > ---
> >  target/i386/tcg/misc_helper.c         | 463 --------------------------
> >  target/i386/tcg/softmmu/misc_helper.c | 438 ++++++++++++++++++++++++
> >  target/i386/tcg/user/misc_helper.c    |  72 ++++
> >  target/i386/tcg/softmmu/meson.build   |   1 +
> >  target/i386/tcg/user/meson.build      |   1 +
> >  5 files changed, 512 insertions(+), 463 deletions(-)
> >  create mode 100644 target/i386/tcg/softmmu/misc_helper.c
> >  create mode 100644 target/i386/tcg/user/misc_helper.c

