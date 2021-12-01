Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4F464C94
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 12:29:44 +0100 (CET)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msNny-0007fe-Rb
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 06:29:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1msNlQ-0006be-Sp
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 06:27:07 -0500
Received: from [2a00:1450:4864:20::42a] (port=34708
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1msNlP-0000Q1-2S
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 06:27:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j3so51485434wrp.1
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VDjeZsKOVUB3xge3INCQLsi9iErTS1JXT7n9v53fHw4=;
 b=W7EkV/Q5r2OdftJlrvvdSTlJfeq9rg/D8OacR6xHzQKojU1h9lhHlQBgDcQXXH2Sxo
 R/tVVIlEvIn2H/FLPzoEeRf0DixUOqMlg1s8sjySRYjKxdhw7qXM2dXy0Kn/I7oh8k+C
 prMwS/EB7my0DK+QItBrYA7EV/VKJUL2M8Vwm7Yn1/KJ1qsvIOVLM7nrYQBaOVR7MFTq
 Q0AroHJ/Oa/htY4mZdW+efcLVEo1p3vq0D5AZfq+8BGXK7evCipYQOKQ0763SWMMjndt
 LXRSbIUgwmBeDWuhwkfwPWKIHiTZ0F90aJOWQX1jyM09qWiTJhmz4lwbB1iWYvlA0bx6
 9Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VDjeZsKOVUB3xge3INCQLsi9iErTS1JXT7n9v53fHw4=;
 b=VgRRlSbHcaNDprpZp+sLYl7g5Rfad8J/W0y63DoS1ku1ZkZH6mhtrFwioFlNsH6T2S
 aG33DDcvihZWW/S/cfoohAmEY3RuY8v2LmKYLcBZnN6nugPNDky9zDRQuA/FvSk+D+KI
 gZL5tQD9LrtlPDjwWM0cmG6oKiSh6xqToAeV26dkNvK1AULm7LmKG9EfBrckEIovcpC9
 j27yFTx2RUlUaV8co++x4oHY3bYjFxBBJkwg6C1Y8UlLy4PJECyhVy5dUYoBaE6UtBJv
 HqSCv1g0IWM5wypDsefya7PywJGvXgAiFV69yGh2gHBU0kLfYaF3r6vTYacDa/nkR01h
 wJWA==
X-Gm-Message-State: AOAM532mvX6EfIAzVBP68eWEPyiRPHBkKFU8urJZ7H3QiJ2QffDIX7R4
 bYjZ4ArVS8NZrB4+pMBwHJ/sUw==
X-Google-Smtp-Source: ABdhPJyzxK6YO+Orbz6WZdY4/IM04Ylu/9HPOioDab7szc8Ti2Hq0TWucMBXti7TVJpcuufQzUllbA==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr5960330wra.185.1638358021478; 
 Wed, 01 Dec 2021 03:27:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t4sm693414wmi.48.2021.12.01.03.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 03:27:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91EFD1FF96;
 Wed,  1 Dec 2021 11:26:59 +0000 (GMT)
References: <20211117173201.00002513@Huawei.com>
 <OF164E5BA6.E927FE73-ON00258791.0078E206-88258791.007ABBAD@ibm.com>
 <BY5PR12MB4179A47F68A9A15E5888D074E89B9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119014822.j247ayrsdve4yxyu@intel.com>
 <BY5PR12MB4179AA1B062AEA75098E15D8E89C9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119032541.gr6berwu2ve4tkax@intel.com> <8735njf6f7.fsf@linaro.org>
 <20211129171631.ytixckw2gz3rya25@intel.com> <87mtlmzu3w.fsf@linaro.org>
 <20211130130956.00000ccd@Huawei.com>
 <20211130172158.kzuptl2pxlcgvzft@intel.com>
 <20211201095532.000035d8@Huawei.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: Re: Follow-up on the CXL discussion at OFTC
Date: Wed, 01 Dec 2021 10:29:53 +0000
In-reply-to: <20211201095532.000035d8@Huawei.com>
Message-ID: <871r2wzhto.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, qemu-devel@nongnu.org,
 Saransh Gupta1 <saransh@ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Shreyas Shah <shreyas.shah@elastics.cloud>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:

> On Tue, 30 Nov 2021 09:21:58 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
>
>> On 21-11-30 13:09:56, Jonathan Cameron wrote:
>> > On Mon, 29 Nov 2021 18:28:43 +0000
>> > Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>> >=20=20=20
>> > > Ben Widawsky <ben.widawsky@intel.com> writes:
>> > >=20=20=20
>> > > > On 21-11-26 12:08:08, Alex Benn=C3=A9e wrote:=20=20=20=20
>> > > >>=20
>> > > >> Ben Widawsky <ben.widawsky@intel.com> writes:
>> > > >>=20=20=20=20=20
<snip>
>> > >=20=20=20
>> > > >> * Some means at least ensuring qtest can instantiate the device a=
nd not
>> > > >>   fall over. Obviously more testing is better but it can always be
>> > > >>   expanded on in later series.=20=20=20=20
>> > > >
>> > > > This was in the patch series. It could use more testing for sure, =
but I had
>> > > > basic functional testing in place via qtest.=20=20=20=20
>> > >=20
>> > > More is always better but the basic qtest does ensure a device doesn=
't
>> > > segfault if it's instantiated.=20=20
>> >=20
>> > I'll confess this is a bit I haven't looked at yet. Will get Shameer t=
o give
>> > me a hand.
>> >=20
>> > Thanks=20=20
>>=20
>> I'd certainly feel better if we had more tests. I also suspect the qtest=
 I wrote
>> originally no longer works. The biggest challenge I had was getting gitl=
ab CI
>> working for me.
>
> Looks like it'll be tests that slow things down. *sigh*.

Hopefully the GitLab stuff has stabilised over the last year as we've
aggressively pushed out stuff that times out and also limited some test
to only run on upstream staging branches.

The biggest hole is properly exercising KVM stuff (due to the
limitations of GitLab runners). As a result you fall back to TCG which
can get slow if your booting full distros with it.

> Why are there not enough days in the week?

"oh it's softfreeze already?" - a regular occurrence for me ;-)

>
> Jonathan

--=20
Alex Benn=C3=A9e

