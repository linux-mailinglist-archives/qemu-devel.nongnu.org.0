Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24C5EAC6D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:26:26 +0200 (CEST)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqw5-0001e2-Af
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocqFs-0000NF-Qj
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:42:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocqFr-0007ZX-2F
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:42:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so3936974wms.4
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=Z9M8kpCCEXQMkyQuj2A6VTXklhpGRnJww1HdvGFFKog=;
 b=XB3My4t4l5HmokYp8pU1c35ymahikF9RDi+EKdIlu9qnZFYVkkhJzhikggeb9QoMMg
 HaSDciZMg8ZRsiZhfuYl97QBofihfIMwadWZwSP+2xavsPLq+6VLMV50EPYTB8aEQ1WQ
 IClwpzW3D4l5wm0PutFKa+aZpBWI05C+Q1ThAZLyCD7y+Evwg2mR1i8ENwNLMYg0xckj
 spdN/EMyiIwuEnKcR11MDZXTc4pGLGVp+c/04PtYDwUFm9dsVy7//9w8X+o4guCNqKSm
 7jmoF701Qibgka4jd/PGlLNWe/pUh206pkVpT0+5h2TJOp1p17IshYQGJheO4EEkFwVv
 GZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=Z9M8kpCCEXQMkyQuj2A6VTXklhpGRnJww1HdvGFFKog=;
 b=FYZQTIG/Q68kmou1/itUHlYuOjsHZRYI5XKQI8UNL1ejLA32l538r/LBXwD2OI2oZJ
 mGz9b91lqSfty4Sff3rq0owayidoxPjHYjL+8ZYAudZokGDWY+vCG7XQgdi0k5zdoyxW
 VU6EGAWf1IM2sjZ5p3P4l/6WvouhufbTj10h7D3smBWaEsL2XZSw6GVNj0joIeHSAuYg
 zZhGs3VawcrsCIpiP8b167uWvWOKA04B/1DDLK6WCD4oft/F+R2Lte6j2FtNf0maex3Q
 0x4/lQzdPbBiHYOmgY+Ekp8OAItYdQbo5xPW+puO63VSraOajUTnnt623KS6FvdOR2bE
 m+JA==
X-Gm-Message-State: ACrzQf0r9yJlVTuyXleSvin201nCv7h3QnlEYMt1k3odz9uBSgno1SQZ
 0VPDh0xN8felPVciXQFmlVnvYw==
X-Google-Smtp-Source: AMsMyM7jwTa8xevYi2sBy2xSSTMOuRlt/3+zg3pydwjdQPARS2i6/iJx/nLmHTd/gI6oq5+57ttoVA==
X-Received: by 2002:a05:600c:221a:b0:3b4:75b8:3f7f with SMTP id
 z26-20020a05600c221a00b003b475b83f7fmr15278190wml.175.1664206965546; 
 Mon, 26 Sep 2022 08:42:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0022b0214cfa6sm17840508wrb.45.2022.09.26.08.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:42:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 617BE1FFB7;
 Mon, 26 Sep 2022 16:42:44 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org>
 <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
 <87leq641id.fsf@linaro.org>
 <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Date: Mon, 26 Sep 2022 16:41:55 +0100
In-reply-to: <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
Message-ID: <874jwu3zwr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> On Mon, 26 Sept 2022 at 16:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>> >> -static inline int gic_get_current_cpu(GICState *s)
>> >> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>> >>  {
>> >> -    if (!qtest_enabled() && s->num_cpu > 1) {
>> >> -        return current_cpu->cpu_index;
>> >> -    }
>> >> -    return 0;
>> >> +    /*
>> >> +     * Something other than a CPU accessing the GIC would be a bug as
>> >> +     * would a CPU index higher than the GICState expects to be
>> >> +     * handling
>> >> +     */
>> >> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
>> >> +    g_assert(attrs.requester_id < s->num_cpu);
>> >
>> > Would it be a QEMU bug, or a guest code bug ? If it's possible
>> > for the guest to mis-program a DMA controller to do a read that
>> > goes through this function, we shouldn't assert. (Whether that
>> > can happen will depend on how the board/SoC code puts together
>> > the MemoryRegion hierarchy, I think.)
>>
>> Most likely a QEMU bug - how would a DMA master even access the GIC?
>
> If it's mapped into the system address space, the same way
> as it does any memory access. For instance on the virt board
> we just map the distributor MemoryRegion straight into the
> system address space, and any DMA master can talk to it.
> This is of course not how the hardware really works (where
> the GIC is part of the CPU itself), but, as noted in previous
> threads, up-ending the MemoryRegion handling in order to be
> able to put the GIC only in the address space(s) that the CPU
> sees would be a lot of work, which is why we didn't try to
> solve the "how do you figure out which CPU is writing to the
> GIC" problem that way.

So hw_error?

I don't think there is a way we can safely continue unless we just want
to fallback to "it was vCPU 0 what did it".

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

