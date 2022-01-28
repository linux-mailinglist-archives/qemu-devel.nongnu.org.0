Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F4A4A00BB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 20:16:35 +0100 (CET)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDWjZ-0004FQ-AF
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 14:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nDW6Y-0007Oj-Ez
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:36:14 -0500
Received: from [2a00:1450:4864:20::330] (port=35427
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nDW6P-0001Op-4U
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:36:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f22-20020a1c1f16000000b003525bf08b1eso142870wmf.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 10:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DH9MJLfbsqAgkpSYjEYYm76W7i2dSAdVQ+Nt2JwiGEE=;
 b=orrTiYmwbS3sTTcXz2j5S9dfDKhb5R4MwvLOOObQzAIN9kxHO1ckoWNUFR69NXiCFh
 gTZX7TMvQeRG8RUV+qWVc1Ayu69nUnaERPdtH9tnVaZcjLgEbTtRJxx4y6uWp0sAtXsD
 2XfRGQl8SbxXMHm33tvCbFkdH7XRgMI86nzWKRfNw8tcVZbgEGhIWrWl0kS8qC3DYJw7
 fp9HZTfG7ZE9cUzu1z/SzZphsNywwq1gX3kvA+aF/xAiLy5g3wlqz91+lUFPYpY9rJEO
 wPhXLisd/tbcNVPIj/pBWm4Ji1dYvOTfQyPJo+ygOjVdAd5qqbcEayBeExyOzAzzfJys
 u75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DH9MJLfbsqAgkpSYjEYYm76W7i2dSAdVQ+Nt2JwiGEE=;
 b=XHWWouBl/On9O4x/jAeQ5sq6TOMoq4pLWyZyIuiWB/IU8uFMr2AJZ7JoGwBMDl8hH2
 Xu41segO60ZD9Qe2IdUkEAx65WSohn/86H5wfHICm2lhLjNt9weBE0taTMyXmEevM5HD
 FP5K+isZ9Pd/W4IbeUMnpRKRMewbeUlWt3HR2orQtSB9Yy0EFxKn8JDJJ5ISuG2fTovw
 DLcS1j9JmAa/y/FXeruoLN3r4bQ3/htsfCk6ZYq+Gk9UmLNU4/XrhV1TprJpOfedTRqD
 AQkSD/PWX2FXWcWtG8v37pb99Yfadm7fcLIvIlvVtd/vb3JH4uXnjrEnxeuhweAPx39n
 vlaA==
X-Gm-Message-State: AOAM5339grUOiN+lE2A2J8GpAAw7h/8rw3Bwzao8fIHHT1lIEoshEO4C
 NR/CtWPfLCiZV7vdx0wyfBXc+Q==
X-Google-Smtp-Source: ABdhPJzcu/Ss/9RgwPPJg93YQ7JubBa0Zh0691y5Zmny6DTl8TfzhEyt4JKFN6lUZKmLaaMEQaKLjA==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr11309608wmb.169.1643394959987; 
 Fri, 28 Jan 2022 10:35:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z1sm2463750wmk.32.2022.01.28.10.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 10:35:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8CD41FFB7;
 Fri, 28 Jan 2022 18:35:57 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-15-Jonathan.Cameron@huawei.com>
 <87a6fh9sry.fsf@linaro.org> <20220128182637.0000188a@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 14/42] tests/acpi: allow DSDT.viot table changes.
Date: Fri, 28 Jan 2022 18:34:59 +0000
In-reply-to: <20220128182637.0000188a@huawei.com>
Message-ID: <87zgnf7lo2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> On Thu, 27 Jan 2022 14:06:42 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>>=20
>> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
>> >
>> > The next patch unifies some of the PCI host bridge DSDT
>> > generation code and results in some minor changes to this file.=20=20
>>=20
>> I'd just squash this in with the patch that makes the change...
>> otherwise you risk breaking bisectablility.
> Hi Alex,
>
> This sequence of 3 patches is as described in
> tests/qtest/bios-tables-test.c
>
> According to description there the point is to allow
> whoever picks these patches up to just change the 3rd patch
> if the tables need updating to reflect some other change.
>
> It would be a lot easier obviously to just squash it, but
> given the process is laid out in that file, I'd rather
> leave it like this.

Hmm I shall defer to the maintainer here. I assume this process is to
deal with complex changes over several commits. So ignore that comment
for now.

>
> Or am I missing a reason this particular one is better
> squashed?=20
>
> Thanks,
>
> Jonathan
>
>
>>=20
>> >
>> > Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> > ---
>> >  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest=
/bios-tables-test-allowed-diff.h
>> > index dfb8523c8b..08a8095432 100644
>> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> > @@ -1 +1,2 @@
>> >  /* List of comma-separated changed AML files to ignore */
>> > +"tests/data/acpi/q35/DSDT.viot",=20=20
>>=20
>>=20


--=20
Alex Benn=C3=A9e

