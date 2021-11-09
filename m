Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8DE44B193
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:54:51 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUOY-0004gs-Sn
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:54:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkULc-00015x-TI
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:51:50 -0500
Received: from [2607:f8b0:4864:20::d30] (port=45698
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkULa-0002eM-Qf
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:51:48 -0500
Received: by mail-io1-xd30.google.com with SMTP id v23so8736643iom.12
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dZkzOOKI0xsDTWTUQJeJa3RWbWj+4NmjbkxcdTfpufg=;
 b=NH0CdCFLolgMYKiHZycQl/52mRUIrq1xEWwC7aj+HxziRA8cXMLfQqe80TaVByh9UE
 l8GGPvuvzZ4WxQuoOV9kiCoHLixZ3+lah7aHvPSsNC8kbaFzW1iGR5g9LOVtD4jCQSf3
 0Yc9ShfeHqCC9I/Ci97KbF9LS2mDhBlzlJvTp7Ie08HGXOMA8lpjQ5euZR866YWa+FED
 Oqsk4BbxfOmrQTVqR9YuxojYLvb9QOFCJq4n4shT8u/AIaMBgRW+nP5RkLEMd5nFjmGW
 H7XOrvBIOIUyCxACvWHIjEdUlqoU4/yNZHZdYWGeduZs/ZAEamK4w7b+EC5vTPhmzhow
 idkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=dZkzOOKI0xsDTWTUQJeJa3RWbWj+4NmjbkxcdTfpufg=;
 b=TxRpSBWcBahMpp6ec+Al6WIsLQz0qK+KwHIefuT4cyUpUdg3rb7WbJKoAZUzQJdyrz
 QBZeTNx8UHnCxnXnhikSgdZRKLjhmq94wvbAWmFRb+3iCnYqCJtoG+uJ6UK7xI9Bonb2
 tiC72BnHq7BCNF7azQtsvJNyR07Ougk/BzrjKNh+JJhRt44OnOeK3O+0AUfAoUyGZZiW
 2P5kKYOxDplhlhCn5jViFqx0P2aPL1Tyb6Tn2Y3yRrzKcpP5lS6KhJtkkbwiZ83mcrdA
 vPxOWo5G5j9Dolgc9N3WjnVPwntTC3avPuACxQwK5+zPTTRC2gH6EvCinmNc1afV6P9Y
 znVQ==
X-Gm-Message-State: AOAM531JMIidZHvsnj3uCFusSXY6h8M76WxN6Zlrx1JFmIaTa6SLNW4B
 akVjVZ5dvyyVsafyu6AJCJiOkw==
X-Google-Smtp-Source: ABdhPJx/xjAnMu+Rb7akFLrfqyPr/eSHfEHi5h9E/VA8ngcsMwduwNALzs6RQ3CgyPlX3HHyPm0ipg==
X-Received: by 2002:a05:6638:1346:: with SMTP id
 u6mr7026020jad.126.1636476704450; 
 Tue, 09 Nov 2021 08:51:44 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id g10sm13261194ila.34.2021.11.09.08.51.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:51:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
In-Reply-To: <65f6b699-8db4-f216-d18b-6621cb79e82b@amsat.org>
Date: Tue, 9 Nov 2021 09:51:42 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E4F6358-37A1-4ED4-82A8-942EDD7B32C0@gmail.com>
References: <20211103203146.3630550-1-f4bug@amsat.org>
 <YYOirmDXpPq16ZMi@redhat.com>
 <891bd73d-771a-1463-ff2d-5885a6081cd4@amsat.org>
 <SN4PR0201MB880896CEC8C3B4F706E2F80BDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <65f6b699-8db4-f216-d18b-6621cb79e82b@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 4, 2021, at 4:14 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 11/4/21 16:17, Taylor Simpson wrote:
>>> -----Original Message-----
>>> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> =
On
>>> Behalf Of Philippe Mathieu-Daud=C3=A9
>>> Sent: Thursday, November 4, 2021 5:02 AM
>>> To: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>> Cc: Taylor Simpson <tsimpson@quicinc.com>; Richard Henderson
>>> <richard.henderson@linaro.org>; qemu-devel@nongnu.org; Laurent =
Vivier
>>> <laurent@vivier.eu>
>>> Subject: Re: [PATCH] linux-user: Add GPL-2.0+ SPDX license =
identifier
>>>=20
>>> On 11/4/21 10:06, Daniel P. Berrang=C3=A9 wrote:
>>>>=20
>>>> When you say  "manually add", can you confirm that you explicitly
>>>> inspected every license header yourself to validate that the =
reported
>>>> match truely is GPL-2.0+, before adding the SPDX tag.
>>>>=20
>>>> Adding licenses tags based merely on a 60% match, without doing =
human
>>>> inspection would be questionable.
>>>=20
>>> Yes I explicitly inspected every license error before manually add =
the tag, but
>>> I am human, so prone to errors, which is why peer review is =
important :)
>>=20
>> This seems like more of a question for a lawyer to review than =
technical reviewers.
>>=20
>> I remember discussing this when I made the initial submission.  At =
that time, there wasn't a broad policy on this.  Has that changed?
>=20
> On the policy side, nothing changed.
>=20
> In an earlier version I posted I was replacing the license text by the
> equivalent SPDX tag, but I've been told I can not *remove* a license
> text without an Ack from all the contributors who modified a file;
> however simply *adding* (although duplicating the information) would
> be OK.
> This is what I'm doing here (what 'technically' changed from earlier
> patch).

The Linux Kernel=E2=80=99s rules for this are a little more relaxed for =
=E2=80=98variants=E2=80=99 that the SPDX tool identifies. There=E2=80=99s =
over a hundred of the =E2=80=9Cthis is GPL 2.0 or later=E2=80=9D text =
that has been identified. As long as the SPDX tool matched, they were =
replaced.

On the other hand, FreeBSD has taken the approach of only adding SPDX =
tags for the last few years. We=E2=80=99re only now starting to allow =
files with only SPDX tags and are taking a hard look at what we need to =
do to start replacement.

Regardless of where qemu winds up between these extremes (the law is a =
series of grey issues, risk assessments, etc so there=E2=80=99s no one =
right answer), it would likely be best to explicitly document what the =
policy is in the future.

Warner


