Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F3E5EA2D0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:14:49 +0200 (CEST)
Received: from localhost ([::1]:60414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocm4W-00005M-AA
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oclwg-0000yn-T1
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:06:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oclwd-0006fl-Iu
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:06:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y5so9652745wrh.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 04:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=BqpC3tv3ht7JiC4biPpZpaKLE/ZIlUOvVbqsxQl4924=;
 b=bYaH4klDYlJVy8j4PnM1Emp5xXWG7i0QXzeH6FxwzkN0ACNbhjWav0gnhnAMFPhLNw
 jIPCgqom6J6KiBLMR24NtgYniUAg+jnuN4GvR4K8aPEO4ggX2ELLKl+21hgepEgzWLX3
 xFRbChe78B6VA8Bokq7ajC6qr00ZXhM9i9/sCioWe2vHQks+6p0DfRUq1wmD8jFJ+PyT
 cDvqAlJa715ceqbJGxW8Jf5jaoai/N0jyBeBKJrOTsW84caUVLfpAVlKUI1xs/Rrf6tv
 iVxM0b0YI+ySnIglkJ58ecqiMB8ekgaWdcyfYmZPkslvnF6SULrMjUJf7xY9pGBZwac9
 As/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=BqpC3tv3ht7JiC4biPpZpaKLE/ZIlUOvVbqsxQl4924=;
 b=UM+LgtZZ8tiC27eUDUGI1dMes8rJ8g0P2fJ2jJsuNlp7oZ6xY7CB1L6LTY7ykTfkaD
 sUDy8AH9fwUM4YcICms0A2yPL2j5gNeVE526T552an/mrh1efMkj3WREwQ6+6hk1SiVO
 EaENBmN29mBJn72eeU3eX+L2j2KQHpVHWcy803lN2fGKcZIzpTFbmtb+T73rf4QtNnSo
 F4dA1O7177Od1ehyVo3L0gAIQ1jn24vpI0q0hG5nXjv30s5mvSGxe6BBYaRE8kkO3nUQ
 Tbs1gyN752y5/7prQmD2/RkOfbpSTqelfNtTK1NW9EKKwKNAk8asDQ1kVZ109V0iXtUX
 uRlQ==
X-Gm-Message-State: ACrzQf3QI3AiOEh6QAZ0ab27VPcKyAL1LACBIjXGNb3IQLpbGvVOz0bH
 sG/9FZICvO/c6DY3Yy8sStpwzA==
X-Google-Smtp-Source: AMsMyM5NX/9J4n7lseI1PC2sELl8ne1LwRzvA3m1musqk8ftL+WbvK7+p6vIfpswIRFvb3hWLFOHNQ==
X-Received: by 2002:a5d:64c3:0:b0:22a:e650:d3d7 with SMTP id
 f3-20020a5d64c3000000b0022ae650d3d7mr13163820wri.674.1664190397895; 
 Mon, 26 Sep 2022 04:06:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc17-20020a05600c525100b003b435c41103sm11416542wmb.0.2022.09.26.04.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 04:06:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F1F11FFB7;
 Mon, 26 Sep 2022 12:06:36 +0100 (BST)
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-4-alex.bennee@linaro.org>
 <85155F4E-0FFF-4DE6-A336-3F9C5B561CDC@ynddal.dk>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mads@ynddal.dk
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/9] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Mon, 26 Sep 2022 12:01:12 +0100
In-reply-to: <85155F4E-0FFF-4DE6-A336-3F9C5B561CDC@ynddal.dk>
Message-ID: <87tu4u4coz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


mads@ynddal.dk writes:

>> On 22 Sep 2022, at 16.58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>>=20
>> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
>> This solves edge cases like accessing via gdbstub or qtest.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>>=20
>> ---
>> v2
>>  - update for new field
>>  - bool asserts
>> ---
>> hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>> 1 file changed, 22 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 492b2421ab..b58d3c4a95 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>>     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0x=
b1
>> };
>>=20
>> -static inline int gic_get_current_cpu(GICState *s)
>> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>> {
>> -    if (!qtest_enabled() && s->num_cpu > 1) {
>> -        return current_cpu->cpu_index;
>> -    }
>> -    return 0;
>> +    /*
>> +     * Something other than a CPU accessing the GIC would be a bug as
>> +     * would a CPU index higher than the GICState expects to be
>> +     * handling
>> +     */
>> +    g_assert(attrs.requester_is_cpu);
>> +    g_assert(attrs.cpu_index < s->num_cpu);
>> +
>> +    return attrs.requester_id;
>> }
>
> The asserts here abort on macOS, with HVF accelerator:
>
> ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion failed: (att=
rs.requester_is_cpu)
> Bail out! ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion fa=
iled: (attrs.requester_is_cpu)
>
> If I revert the changes inside this function, it seemingly works
> again.

Thanks for testing.

I guess this is because the we have a soft GIC for HVF. Somewhere in the
hvf code path we must encode up an MemTxAttrs when the gic is accessed.

Could you try in the EC_DATAABORT path in
target/arm/hvf/hvf.c:hvf_vcpu_exec:

        if (iswrite) {
            val =3D hvf_get_reg(cpu, srt);
            address_space_write(&address_space_memory,
                                hvf_exit->exception.physical_address,
                                MEMTXATTRS_CPU(cpu->cpu_index), &val, len);
        } else {
            address_space_read(&address_space_memory,
                               hvf_exit->exception.physical_address,
                               MEMTXATTRS_CPU(cpu->cpu_index), &val, len);
            hvf_set_reg(cpu, srt, val);
        }

if that works I'll cook up a proper patch.

--=20
Alex Benn=C3=A9e

