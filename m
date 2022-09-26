Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD05EAA08
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:16:22 +0200 (CEST)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpqH-0007us-9Z
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpiQ-0007aj-OL
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:08:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpiO-0002Nf-V5
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:08:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id e18so4725518wmq.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=MKk/DYY54wfv2Kbe4P8PnaHG/KcQ6lyY4r+vgbgeQTE=;
 b=OzKjsb91LJYmnfLQSkLV8sNMg0dhfMWfLOexFsX/AM38oEIEncLTxtkaRtQ+ZYy6/m
 3Yf4OdKUq0sbx1Wx+RlqVBm2k+M9gBWK4kj8qvpK832Cw3U0iozf/HmcV2VR4ExqPfKR
 gbb6g+XHTysiOpveIyBCyQpQ91LmBZYcwtH85LfJMDKfK+8Mu5qMqkcGkCzusxEE6bCY
 2qTaVG0puoUtIgXyVAPDRMj+VyzlPDJE3vhfhpLarsM2ecHTUsjPM3m2oOqbuGZx27f9
 s0eU5eaKygT0j4r647tmvgGkzIMutCdPI+2dIk/0DyEVKVepi3aEk3NS0o/lMnBHdssx
 XD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=MKk/DYY54wfv2Kbe4P8PnaHG/KcQ6lyY4r+vgbgeQTE=;
 b=C7sRQhvZFBZN80Cc1WJDTkRqS++GBh2SFoImn5ggL8GRw/YUv/T687h/dg7hBw2qCB
 fYHrt0Z/2iM9tShxzZEweo7Ydl90rQx2f3KRir9L2YH3i0SCqCPJZXSCIZGPcwiIpeAB
 UZUe1uJKSTaPRwMWbxP1rc95b3QRxGxbAR8V4ryTuFE6M1xsWo06YHBCWvMgHGj9J8QW
 EtsaYXO5B2G589zaPaISoHGREMqY26Lu0M294THHfC99ur5n7l/9Rp/3l0ds47rl3ypH
 149o5Qz1wm0K33qrqu1xbYppqlb6QdRwFMvCC/WOzSiyt6P3Oxag5S/9vn6k2PsFAOBm
 soxA==
X-Gm-Message-State: ACrzQf0lIb8Z+QE20ZQ5iwvwKKNuP/kYZEDtHlSqBpB51zFdd1y8zgOk
 ZytqeS/dBOCUVMIYmgkIbkwAUw==
X-Google-Smtp-Source: AMsMyM7m08CU5HuTUNm3N7eNAwOQiWRTAYXe+UNvhot0rLHqi1DPku/8SrXd3XK1Nf3WcOUwEGcmlg==
X-Received: by 2002:a05:600c:3483:b0:3b4:99f4:1191 with SMTP id
 a3-20020a05600c348300b003b499f41191mr15078117wmq.147.1664204891454; 
 Mon, 26 Sep 2022 08:08:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c27d200b003b4868eb6bbsm13450608wmb.23.2022.09.26.08.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:08:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3939E1FFB7;
 Mon, 26 Sep 2022 16:08:10 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org>
 <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Date: Mon, 26 Sep 2022 16:06:34 +0100
In-reply-to: <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
Message-ID: <87leq641id.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
>> This solves edge cases like accessing via gdbstub or qtest.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>>
>> ---
>> v2
>>   - update for new field
>>   - bool asserts
>> ---
>>  hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>>  1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 492b2421ab..d907df3884 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>>      0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0=
xb1
>>  };
>>
>> -static inline int gic_get_current_cpu(GICState *s)
>> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>>  {
>> -    if (!qtest_enabled() && s->num_cpu > 1) {
>> -        return current_cpu->cpu_index;
>> -    }
>> -    return 0;
>> +    /*
>> +     * Something other than a CPU accessing the GIC would be a bug as
>> +     * would a CPU index higher than the GICState expects to be
>> +     * handling
>> +     */
>> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
>> +    g_assert(attrs.requester_id < s->num_cpu);
>
> Would it be a QEMU bug, or a guest code bug ? If it's possible
> for the guest to mis-program a DMA controller to do a read that
> goes through this function, we shouldn't assert. (Whether that
> can happen will depend on how the board/SoC code puts together
> the MemoryRegion hierarchy, I think.)

Most likely a QEMU bug - how would a DMA master even access the GIC?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

