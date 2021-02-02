Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB830BE88
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:47:22 +0100 (CET)
Received: from localhost ([::1]:59042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6v5S-0005wm-4Y
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6v2C-000561-2h
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:43:56 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6v29-0007Dr-RZ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:43:55 -0500
Received: by mail-ej1-x62e.google.com with SMTP id b9so10137163ejy.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HlH1FkmcvVfpm8/6eHFwHdvbNgQwPMbi7EYn8Pvmzj0=;
 b=hXYVlEYK7vf+hcHQCcNOpwxR3Uc82qgL1jrflbOiSUmgIohab/NohQJFPuruxHjsmC
 o3+kmmTZXeK98MuGF2sm2yOBMRc2n/vKdiXU7Whnpuly7/eSFGjj2GY//4qZBc8Fc0aG
 lbgZkggnzpdlL5czjwRYqKSV7uE1+1J5AImTuipWskFNgVeRRD3UOF3Hdp8+xaa28r1m
 ZlYRzl8xqjtWcPUDurEDmfPXH5gc51++s7w2J+G97KMFpE1ZzQCxzyO7ZD3DIi7Siw0M
 nZMuDkSKkMhpHUVYqFFotK9+8hLN4bFhs3baw8DcEPrhgTQiP0w+/PhjTaSvylAZ7N0T
 D6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=HlH1FkmcvVfpm8/6eHFwHdvbNgQwPMbi7EYn8Pvmzj0=;
 b=BMy7uN8ijdRq66vCI6EOuk7gMmtGgy2ZyUCN6c+XnNdzGHtolcwrytFvwxpCvQlDL9
 xIEkJ7EEZ0yUhN7Y9eThuOubh0gSAIrdcQ4g/78sjnfiih8jky6si8rXFsCvaANmRAV7
 jXV7wCyWkpkF1hVZXYM4MoT4346oc3Q1iQJdzFVpBqj3D0tpWCOz9qiDOjtFhcm6/4So
 6uPF7Osabsq5iyMWzBQOAtsP0Nevy2nS73lEusJQTR5KqPGjvnUBxVW+KUFFTb/C+LIx
 LBgVCzssxgK1fxivYRGj7BX2EMEXe3fZX11iIOdd/5yuBGurARmMchzkqSqOpz01Grt5
 Dmkg==
X-Gm-Message-State: AOAM531bBaNKgBZgIa5aYYJn5wVY9fnltB8AYeBGNXrKWQuTrf75d5xo
 hmJPc5d6kz+hNKE6lMSDPF+TgA==
X-Google-Smtp-Source: ABdhPJzhJLg2k2NhNocb4Rfo7nMLhDXksljS8VDPkxafnq5q+ne5k+L6eN71wyB3gNu6zjdOgWCHzw==
X-Received: by 2002:a17:906:b50:: with SMTP id
 v16mr2161292ejg.298.1612269831878; 
 Tue, 02 Feb 2021 04:43:51 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id o13sm9607811ejb.10.2021.02.02.04.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 04:43:51 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id a531ae6d;
 Tue, 2 Feb 2021 12:43:50 +0000 (UTC)
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
In-Reply-To: <20210202122342.GC4168502@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com> <cunv9balsck.fsf@dme.org>
 <20210202122342.GC4168502@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Tue, 02 Feb 2021 12:43:50 +0000
Message-ID: <cun5z3aljw9.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::62e;
 envelope-from=dme@dme.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-02-02 at 12:23:42 GMT, Daniel P. Berrang=C3=A9 wrote:

> On Tue, Feb 02, 2021 at 09:41:15AM +0000, David Edmondson wrote:
>> On Monday, 2021-02-01 at 15:36:03 GMT, Daniel P. Berrang=C3=A9 wrote:
>>=20
>> > It is useful to know which CPUs satisfy each x86-64 ABI
>> > compatibility level, when dealing with guest OS that require
>> > something newer than the baseline ABI.
>> >
>> > These ABI levels are defined in:
>> >
>> >   https://gitlab.com/x86-psABIs/x86-64-ABI/
>> >
>> > and supported by GCC, CLang, GLibC and more.
>> >
>> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > ---
>> >  MAINTAINERS                        |   2 +-
>> >  docs/system/cpu-models-x86-abi.csv | 121 +++++++++++++++++++++++++++++
>> >  docs/system/cpu-models-x86.rst.inc |  18 +++++
>> >  3 files changed, 140 insertions(+), 1 deletion(-)
>> >  create mode 100644 docs/system/cpu-models-x86-abi.csv
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index fbb228ef2b..bb8d60c458 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -344,7 +344,7 @@ F: tests/tcg/i386/
>> >  F: tests/tcg/x86_64/
>> >  F: hw/i386/
>> >  F: disas/i386.c
>> > -F: docs/system/cpu-models-x86.rst.inc
>> > +F: docs/system/cpu-models-x86*
>> >  T: git https://gitlab.com/ehabkost/qemu.git x86-next
>> >=20=20
>> >  Xtensa TCG CPUs
>> > diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-mode=
ls-x86-abi.csv
>> > new file mode 100644
>> > index 0000000000..4565e6a535
>> > --- /dev/null
>> > +++ b/docs/system/cpu-models-x86-abi.csv
>> > @@ -0,0 +1,121 @@
>> > +Model,baseline,v2,v3,v4
>> > +486,,,,
>> > +486-v1,,,,
>> > +Broadwell,=E2=9C=85,=E2=9C=85,=E2=9C=85,
>> > +Broadwell-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,
>> > +Broadwell-noTSX,=E2=9C=85,=E2=9C=85,=E2=9C=85,
>> > +Broadwell-noTSX-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,
>>=20
>> Would it be useful to add an explicit negative mark (=E2=9C=98) in the s=
lots
>> where the CPU does not satisfy the requirement? It makes reading the
>> table a little easier (my opinion, of course).
>
> I felt it was clearer to only show the positive case. Since the
> ABI levels are additive, you can count the ticks at a glance to see
> the ABI level achieved. Also this CSV file isn't really meant to
> be seen by users directly. It is just data input that gets rendered
> into an HTML table that looks like this:
>
>   https://berrange.gitlab.io/-/qemu/-/jobs/1001700036/artifacts/public/sy=
stem/target-i386.html#recommendations-for-kvm-cpu-model-configuration-on-x8=
6-hosts

Fine with me.

dme.
--=20
Another lonely day, no one here but me-o.

