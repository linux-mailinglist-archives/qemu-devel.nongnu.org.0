Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D860B5F45CC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:41:29 +0200 (CEST)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofj6u-0006TP-Tj
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofi34-0001Ut-JE
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:33:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofi32-0001AH-Sd
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:33:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id bq9so21356618wrb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=fUsWM0F2RZwMC7/m5LNFaa4MnGnHgn83OTM1RrqS+fQ=;
 b=HJrB3ruTgjuA6NxZiFR3nqXwvzwlwU8PmbxvxHdb/Fsmp8xRNgt+3bPeTN1Fk9I8br
 Vpzb4obfHEqqvKMtlfuTrlYLzslzTsD1tSwUoXQSAUBMpgoOkmdXbukoXed2b5+4Df+8
 oSziIbsHf0pggYtl94+J1nao84zGht/V09vM/GrXXv/p7T99fb+NGjbDtN12+G6GTqwH
 eyPkh6HqKJ3nHM+kmK1557SNJgdZ1F4jPWiG8eI/w9KTd9QCGNB0PmYro8qPVw5DkVdR
 GxeC1zJq1RGqMsiB3807hNzpZOWYT+ISiNBV5e7Iet7uGFQoLNgz0fMiNRFmRqAQVh2z
 HGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=fUsWM0F2RZwMC7/m5LNFaa4MnGnHgn83OTM1RrqS+fQ=;
 b=Fu/G1FJC/BKcBiydI3PG2vGsXul9Rk/1CzLmDpLF3VAOaDTMBOMptbyvvfIX1ACkmE
 OO7I3idJ0OHrlXK34PgdKQ5JeRY8a5e6LZQfZmg0vNUNug2cnNvu5yUoXvVwl2iz0v5K
 w/C5BLZCvmhznJX5miZW15xZfq7Kc8ultewvohu9+0JFWzIXVl22Gv7NYV/ExHQjP8Mp
 QNPjbGA6NgaYlVuiK/hdPDBhROjbyzd4WD1yRLH+c/ncU98cIf59osX8sa3k4e4Eg7np
 kuYVRX6H8bDELP/KU9NR62SoT344wKPFYKdHZsIqfPHpvY1sVr3LKqjXJap92bsNKyG8
 c/Lw==
X-Gm-Message-State: ACrzQf3ZmlcmDMVAinTE/gy57akDUunS6XppzQuG6pZ8dxelGQKTnXbY
 08yBY0VC/Tza1tcwvhQmXGSRVQ==
X-Google-Smtp-Source: AMsMyM5kjANVUmPp1OVarrETwAQZFBtDPkN8W++LoqLrkyCF2s7kJjAIkuw4jGI4yWMp9ybuYYOBKw==
X-Received: by 2002:a5d:6483:0:b0:22e:4804:8be4 with SMTP id
 o3-20020a5d6483000000b0022e48048be4mr3848721wri.528.1664890402959; 
 Tue, 04 Oct 2022 06:33:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h17-20020adff191000000b0022cd0c8c696sm12207965wro.103.2022.10.04.06.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:33:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B48E1FFBA;
 Tue,  4 Oct 2022 14:33:21 +0100 (BST)
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Date: Tue, 04 Oct 2022 14:32:12 +0100
In-reply-to: <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
Message-ID: <87r0znlnmm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 28 Sept 2022 at 17:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/27/22 07:14, Alex Benn=C3=A9e wrote:
>> > --- a/hw/misc/tz-msc.c
>> > +++ b/hw/misc/tz-msc.c
>> > @@ -137,11 +137,11 @@ static MemTxResult tz_msc_read(void *opaque, hwa=
ddr addr, uint64_t *pdata,
>> >           return MEMTX_OK;
>> >       case MSCAllowSecure:
>> >           attrs.secure =3D 1;
>> > -        attrs.unspecified =3D 0;
>> > +        attrs.requester_type =3D MTRT_CPU;
>> >           break;
>> >       case MSCAllowNonSecure:
>> >           attrs.secure =3D 0;
>> > -        attrs.unspecified =3D 0;
>> > +        attrs.requester_type =3D MTRT_CPU;
>> >           break;
>>
>> This is surely incomplete.  You can't just set "cpu" without saying wher=
e it's from.
>>
>> Since this device is only used by the ARMSSE machine, I would hope that =
attrs.unspecified
>> should never be set before the patch, and thus MTRT_CPU should be set af=
terward.
>
> The MSC is in the address map like most other stuff, and thus there is
> no restriction on whether it can be accessed by other things than CPUs
> (DMAing to it would be silly but is perfectly possible).
>
> The intent of the code is "pass this transaction through, but force
> it to be Secure/NonSecure regardless of what it was before". That
> should not involve a change of the requester type.

Should we assert (or warn) when the requester_type is unspecified?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

