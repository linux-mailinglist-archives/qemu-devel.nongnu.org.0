Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3F66DD7B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkzW-0004gY-TP; Tue, 17 Jan 2023 07:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHkzK-0004gG-34
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:22:50 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHkzI-0006Q0-Dq
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:22:49 -0500
Received: by mail-pf1-x42f.google.com with SMTP id i65so19836905pfc.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 04:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dfU/j6PvyOp/zah6I227CdCijiRd/Yr5KpZ0Z4mmsE=;
 b=NiFsvT34c4HWSG5jxcxvV3aV6TThlOn2jertxDxHrwMeQnSP8errbvL3Di5R7BkorS
 DM8VKTqXe2HRJWNoZFQ/XYZoT/cXnSM4Kf3xuqe+jOxZ2ACgg/Yjd/TZkJS8ZtKku7Z7
 xQ2ghdoB0cXG7plGz2ANTQeU3oAwiigs7ke4D1xzrcBh9vv/Uv/sMqmbP8z9q1Wwno3R
 bulv5VMuXtz3pWa7bGa//prULT7HAhqQRcPfD2yqX4DkaxRv7FzcJZ1dwr/Umzc4/Ko3
 yUUszf3Ws6F5RH0S0vLYa969OavU9KlrMRZ1q3Xj1dh+lxm30wy8iHpO6bVZGgK1WU6g
 MCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+dfU/j6PvyOp/zah6I227CdCijiRd/Yr5KpZ0Z4mmsE=;
 b=ccG7Lq7+6WzLT9C9mgUauneSZbhOsgqxCL7aJfKGtM9sW8FBpk4GS7rYlcIbjnSSj2
 mJ1c6r8C5IcFWvAaeGcgVU5GLiDtb10QtS3858h+X87F63tukv+lGblHDTfdJtGN79xZ
 qCDs9TxtFmdpzABK3cdgDwDp+G8geHN5mwKqZQPMQ3Lx8A70dzH4ZgSbjPsbGBrtVzGx
 BNtlg/xBxVLbJ9LcyLdHtzlGSY9B63xN+a0G+8Lsz3Hr7GNBlBgnWfpl0IduGms7X402
 HM5+h4L3L83uZs4MKG0W+LncTJppK/Nb8XTPADE2ciarqGrJdYZ7rbNb/GwUKEAERW79
 PCMA==
X-Gm-Message-State: AFqh2kqYNuTIXkpeKvMsvo1BFi/KNXzXxA+2+4WkSGMcefvlCoSz4IkW
 mExSNxJk4BoZzzkl2vWIJ2zn7/BveI6Xjo2YRBBVoQ==
X-Google-Smtp-Source: AMrXdXurUZAVxSaJ87uUhcVHZVApUTNlZ3gnUPGd+jg5hV1HpHYUot0c8pHEtRxBTZnyrTJ/Ur41yi3eveXvMGlNM84=
X-Received: by 2002:a05:6a00:2b1:b0:582:a212:d922 with SMTP id
 q17-20020a056a0002b100b00582a212d922mr244742pfs.3.1673958166497; Tue, 17 Jan
 2023 04:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
 <Y8Z8CJoFyxB9uHqU@redhat.com>
 <CAFEAcA_hMpFL=Pn8hSc1BDJO3n4e5kq2dSmyWTNBfs2gRa8mjA@mail.gmail.com>
 <Y8aOVxklkrvriPQc@redhat.com>
In-Reply-To: <Y8aOVxklkrvriPQc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 12:22:35 +0000
Message-ID: <CAFEAcA9n8XSSJRAjGdnNRaZdOjAUCDFQy5NstdEYH642mNCEjA@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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

On Tue, 17 Jan 2023 at 12:02, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Jan 17, 2023 at 11:16:32AM +0000, Peter Maydell wrote:
> > On Tue, 17 Jan 2023 at 10:44, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > Something random that looks like bad text data
> > >
> > > =E2=96=B6 166/619 /ptimer/oneshot policy=3Dno_immediate_=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD...snip....=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD
> >
> > I don't understand this one. The string comes from
> > tests/unit/ptimer-test.c:add_ptimer_tests() but that
> > code creates the test string using g_strlcat() and
> > g_strdup_printf(), so I don't see how it could end
> > up being junk, especially not at that point in
> > the string. I guess it's possible something else in
> > the test is managing to corrupt the g_test test name
> > strings?
>
> Actually it looks like something else spewing =EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD
> a to stderr, and this getting intermixed with stdout from the
> test suite.  The test case name isn't corrupt, as I see the
> remaining "reload,..." bit that jouins with 'policy=3Dno_immediate_"
>
> Wonder what's responsible for this garbage on stderr...

Mmm.

Also I notice that we could save some output if we can
fix whatever it is that's producing out-of-spec TAP
format and causing this to be printed for every test:

Unknown TAP version. The first line MUST be `TAP version <int>`.
Assuming version 12.

-- PMM

