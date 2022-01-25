Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A130049BF31
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:57:15 +0100 (CET)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCUkU-0000zq-5u
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCUhr-0008L4-Cy
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:54:31 -0500
Received: from [2a00:1450:4864:20::62d] (port=45699
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCUhp-00032P-Fp
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:54:31 -0500
Received: by mail-ej1-x62d.google.com with SMTP id me13so34276515ejb.12
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 14:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gkppOC4VY2xWuXqxRaYvfe6Vvnw7Z11qsylHLooU/Bo=;
 b=ac1y6DrH/JtZyB3SiPmBbvbwAV4v1AR1G4oyGFpDD+UOJsJfi3PGhKL96RzSBKo+A7
 f+9SA1CBgeOQXTFLcE/lemZjIPsvrkuzxHQWnuC/9/fZ+H3EJmOYc+zYtK4n5DFwtwYX
 +qcymtj/KoPXPC6P1ZDKZdmoqrM0zgyqqCddMawLyGnmzYZVFIHOlV9svDmXhPM3qCej
 G8aaYreuf168zZIwo46tNr+rCiCvbSin93K7Ir/i/mCeWyg8F3TiJa0Q9gw/3/j/8iKw
 O7+d33n47LX3eLZqo2JlVDJrK9Pyt0VJANZdOKitAn8t45JzTTyrX7twTPG/7Nj/BXcU
 curw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gkppOC4VY2xWuXqxRaYvfe6Vvnw7Z11qsylHLooU/Bo=;
 b=maAm+X8lmqTIWkb7UcFGnN6tSoqJLQBrHo6ob0YBM+F4isC7Xza65B2AIq0y+gSVb8
 vm2ni7Q7PtFStSNDTOot8Dag21rf/YUyV8hfpdDg4Gh4rn9Ps5UDhY+mbPJrudSPt3dg
 QfhipYBEWw2ASqxQL8SOF1HLUOzofeBktLq5GbDIWXC8NGuv8ssjhtBgR5Qh+7WIXOSH
 ePTIHtuJfTzWIzpdmwCWjDWktYTSrk4hNA52ti0im9cFn7SBgIe80n7LTPG1/lbcWX70
 dWckY7f3a64yQpqkLnBjZZ2avpupjvx5V/4Guk6Yd/oawDjv2D61cOPYA4bmYRk7SyZP
 ahig==
X-Gm-Message-State: AOAM532X8HkCpXRwh5gCQpsDUnEWXvStM2dZB4689nEGN0IrQ9WnzFlY
 HhkiID43C88+ItTUWxsxld4dQA==
X-Google-Smtp-Source: ABdhPJwgf3YpmTqsgDZdqAnbslFXTyWqRikz8rtdK9ZfCVF9FXlrZeDTC/0HogSFW6Dfkn+ah7MF/Q==
X-Received: by 2002:a17:907:2d90:: with SMTP id
 gt16mr17111390ejc.581.1643151267708; 
 Tue, 25 Jan 2022 14:54:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm6656797eja.20.2022.01.25.14.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 14:54:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37F7D1FFB7;
 Tue, 25 Jan 2022 22:54:26 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-30-Jonathan.Cameron@huawei.com>
 <87sftbd9y9.fsf@linaro.org> <20220125175130.00005a46@Huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: Re: [PATCH v4 29/42] hw/cxl/host: Add support for CXL Fixed Memory
 Windows.
Date: Tue, 25 Jan 2022 22:53:06 +0000
In-reply-to: <20220125175130.00005a46@Huawei.com>
Message-ID: <87k0enctp9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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


Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:

> On Tue, 25 Jan 2022 17:02:32 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>>=20
>> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
>> >
>> > The concept of these is introduced in [1] in terms of the
>> > description the CEDT ACPI table. The principal is more general.
>> > Unlike once traffic hits the CXL root bridges, the host system
>> > memory address routing is implementation defined and effectively
>> > static once observable by standard / generic system software.
>> > Each CXL Fixed Memory Windows (CFMW) is a region of PA space
>> > which has fixed system dependent routing configured so that
>> > accesses can be routed to the CXL devices below a set of target
>> > root bridges. The accesses may be interleaved across multiple
>> > root bridges.=20=20
>>=20
>> This breaks the linux-user builds...
>> > diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
>> > index 0eca715d10..27dff3868b 100644
>> > --- a/hw/cxl/meson.build
>> > +++ b/hw/cxl/meson.build
>> > @@ -1,5 +1,9 @@
>> > -softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
>> > -  'cxl-component-utils.c',
>> > -  'cxl-device-utils.c',
>> > -  'cxl-mailbox-utils.c',
>> > +specific_ss.add(when: 'CONFIG_CXL', if_true: files(
>> > +      'cxl-component-utils.c',
>> > +      'cxl-device-utils.c',
>> > +      'cxl-mailbox-utils.c',
>> > +      'cxl-host.c',
>> > +))
>> > +specific_ss.add(when: 'CONFIG_CXL', if_false: files(
>> > +      'cxl-host-stubs.c',
>> >  ))=20=20
>>=20
>> I think you want this:
>>=20
>>   softmmu_ss.add(when: 'CONFIG_CXL',
>>                  if_true: files(
>>                    'cxl-component-utils.c',
>>                    'cxl-device-utils.c',
>>                    'cxl-mailbox-utils.c',
>>                    'cxl-host.c'),
>>                  if_false: files(
>>                    'cxl-host-stubs.c',
>>                  ))
>>=20
>>   # This is required as well:
>>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl-host-stubs.c'))
>
> Ah.  I'd started with the first block and got incomprehensible error
> message.  Second block fixes it.

  https://qemu.readthedocs.io/en/latest/devel/build-system.html#stage-2-mes=
on

documents some of this although we could probably do a better job of
sign posting the bits in the root meson file.

>
> I'll not pretend to understand the 'why' :)
>
> Thanks,
>
> Jonathan
>
>>=20
>>=20


--=20
Alex Benn=C3=A9e

