Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67B6ACAC5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:38:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZElh-0003cQ-Vf; Mon, 06 Mar 2023 12:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZElc-0003bQ-Rx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:36:58 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZEla-0004bC-PJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:36:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so5867521wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 09:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678124212;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTMEryfBI9v7U5KdIDwXmVrJoPnoH+VPpcXIQQmDQn8=;
 b=DxZHwjUn24aT8JMnp3HgiZCl8p1iJSQm9/rSpVMTA8aHxh3UizRQWhfmmroqiLMM9S
 41YhpIpCCCGQwjaGfCyGDnXEEVisvb5c6eIvc/692cCPnJa3d48kev67oMgj7STMvabB
 3LZdyU3uoaaBu7/f66lpQLrR/u9rts0STUcfNkNVap3Iz8MfkyOlE82MF49DlX7x2bQP
 ZOn0O7hzlJPmSe4gMkoZarowGgNrGxyJmoIVVdEasfgvXNdf5D2WlSbp16ABB3vhDFnv
 wOxW2RYn+i/jjUHhN4WKISvJtvrB4C7sweEWVG5eAM0Hyi8nRNt4PQ0Sf/dwLphiq8+m
 NX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678124212;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pTMEryfBI9v7U5KdIDwXmVrJoPnoH+VPpcXIQQmDQn8=;
 b=rMZqCOHo2YXK71eBbJggZptpVjuB7YG9xJVfSnNoo+tuxTzONcP2BBK5ANL5KXIfpE
 faa2KIl+GsQMSOAAvSbck/G9C5Oy97A3qwc4GIAC8foxlbwKsIOkM3If7g3sG2TOe4Nj
 GFAU7203Sa31CCRWY1a5qjqky32OMvvgBPdQ0AHjb+AKAmP7utzPUbqDOXEaubzn2/03
 y5qfgQ/ufUcmGRVceKcBTyY7Gv6EoAnIbCvunR5LHSMD5nTvIaq3JFzV48ZtzlQ0/q88
 BLpvqhJcN4UsxFwhEj89/m9O/OsdU2LlNYEZ2uf9755qxX7y4uAjkmIelAx2p26CBpKS
 Yamw==
X-Gm-Message-State: AO0yUKUWlmFsme7oLi0cC6c/5d8U/pHklKyioGKvXIr325KkIQUPun3Q
 gZnNVAANPfjimOY7lGetZKEEqg==
X-Google-Smtp-Source: AK7set+czts0Yo9pN7BwqElfCJ3YsNhoA22OnzTHxIM/p6Yj/XxgOQpvskXp3bgTd43Dt6EKEh0j7Q==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:f883:180 with SMTP id
 k30-20020a05600c1c9e00b003eaf8830180mr9749624wms.7.1678124212264; 
 Mon, 06 Mar 2023 09:36:52 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003db0ad636d1sm15799239wms.28.2023.03.06.09.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 09:36:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 847FD1FFB7;
 Mon,  6 Mar 2023 17:36:51 +0000 (GMT)
References: <5c50db42136d4a908b261c66b132b043@yadro.com>
 <87cz5p98ms.fsf@linaro.org> <65ac5ab41cf74b109d0298c1fd777f63@yadro.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mikhail Tyutin <m.tyutin@yadro.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "erdnaxe@crans.org" <erdnaxe@crans.org>,
 "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [PATCH v2] TCG plugin API extension to read guest memory
 content by an address
Date: Mon, 06 Mar 2023 17:35:01 +0000
In-reply-to: <65ac5ab41cf74b109d0298c1fd777f63@yadro.com>
Message-ID: <87ttyxrdcc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


Mikhail Tyutin <m.tyutin@yadro.com> writes:

>> Not sure what happened with the formatting of this patch, I think there
>> is an html part getting in the way.
> I guess line ends were messed up somewhere on my side. Will try to figure=
 out the root cause.
>
>
>> > +    qemu_plugin_vcpu_read_phys_mem(vcpuIndex, vaddr, memContent,
>> > size);
>>=20
>> So the problem with this approach is the memory value you read here may =
not be
>> the same as the value that was read by the instruction. This could
>> because of a few reasons:
>>=20
>>   - an mmio write changes underlying memory layout
>>   - another thread changes memory after the access
>>=20
>> I think a better way to get this information would be to register a new
>> type of call-back which can duplicate the value in the store/load and
>> pass it directly to the callback. It might even be worth just fixing up
>> the existing callback and breaking compatibility rather than having two
>> callback types?
>>=20
>> We didn't do this originally as we were being cautious about any
>> attempts to use plugins to workaround the GPL for doing HW emulation -
>> however I don't think adding the memory values to the callbacks greatly
>> increases that risk.
>>=20
>> --
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>
> Do you mean concurrent access to the same memory block by multiple
> threads?

Yes - although we also see MMU changes updating a mapping for a given
vaddr -> phys address.

>
> I think , for guest threads/cores if we observe mismatch of memory conten=
t read by a plugin and instruction
> itself, then it should clearly indicate that guest software has true data=
 race problem sitting somewhere
> in its code. Otherwise other threads would wait on a synchronization obje=
ct to let current thread
> perform both memory operations (plugin callback + instruction).

Other threads don't pause at all (unless you do something in the plugin
to force that)

> On the other hand, concurrent access
> using atomic operation will indeed cause either plugin or instruction to =
read invalid memory content.
>
> Isn=E2=80=99t it the same problem as we face in case of GDB attached to r=
unning Qemu instance (gdbserver) and
> asking it to read some memory? How is it solved there?

Yes and it's not solved except usually most interactions with the guest
during debugging are while the system is paused.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

