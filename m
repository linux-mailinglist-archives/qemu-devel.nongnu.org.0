Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E86994C8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:50:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdiD-0008Ob-Iw; Thu, 16 Feb 2023 07:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSdi9-0008Nr-Od
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:50:06 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSdi7-00049O-Dt
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:50:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id z13so1497787wmp.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0+nLEz/QBnRriyRSjfP0kl6eY/xLe9VpegP9fUr59M=;
 b=yyvd4uYOcZW9sAGDdVTaVHAwSjWJUXqyeLel0MfK2d4e4XtlT7RtHyXcMSKX6wE+Vv
 FY1+ZDe+/X0eCcM9dnYL2imHFiAap+8pzbVXYzEA184JUDjX4HwBU+OBj1mlkgYqBSs2
 7oQNwiQbpOjGDY6CR3t33v3sDdiygo7lUwtEaKIrhhoOha81no9Noqf4Mx3zOJ1fdU0+
 cSgWeC0F2igo79tyi2/YVCtvHI76w3KPC4iN/uuqj++ymnPY+5oq8b0/e6k40ta/D0ZX
 IqY9LKya4wZxurbflxiefJFwGLZm/u+7pd0i8hYto7GSU0ae9rFtuGK93Q3sEpV0s5AD
 hdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O0+nLEz/QBnRriyRSjfP0kl6eY/xLe9VpegP9fUr59M=;
 b=gRIKJ5xn1zSUhe5/RThbMSWGJXBToelxbVYJP4/n80XvhUv/ckuVgZ0RkwYJxkvmch
 iSlAlZXQBnqfMwl/iiqfkcsmh1+Q0gx5u+h0ijtmK7RBO4UMwHLLtr99c+09GIpydgAI
 bMjBnHaPXWsE1ybt9u66s9QUbIGNRmjL5MTWznTk0NEhT8FRw87VvmtlthC8qd5bPzyo
 38/xC1kZq4DWz1aNtmQCtESrFg7bCjxRviUhIeR7IbUAbRaaV5J49nJO/l96Ct0xURlP
 4uVvwihREYDt0xhgCbRsnYsXH8I50Uj4GsYnftFnBfFv+r8l5eHfI+QfoFNxQrtqaUQR
 VvBA==
X-Gm-Message-State: AO0yUKURjyFzWOcbkyIedAE499eSB51YjsGVLK/tPUMgnb2yNQix7o13
 /uoJAY8rvJ+4a5DsDC+JV3HxzQ==
X-Google-Smtp-Source: AK7set/SctGMyqKlVH4+diYneLhY18gRXcEl1M5Yfx+47/CbDdmkVhJiQQYw8SRBZoiAyK1jcJaNww==
X-Received: by 2002:a05:600c:1818:b0:3dc:4313:fd1e with SMTP id
 n24-20020a05600c181800b003dc4313fd1emr4653979wmp.34.1676551800831; 
 Thu, 16 Feb 2023 04:50:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a05600011c300b002c4061a687bsm1408957wrx.31.2023.02.16.04.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:50:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC43C1FFB7;
 Thu, 16 Feb 2023 12:49:59 +0000 (GMT)
References: <87bklt9alc.fsf@linaro.org>
 <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
 <87lekxkhes.fsf@secure.mitica> <87bkltredr.fsf@pond.sub.org>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Mark Burton <mburton@qti.qualcomm.com>,
 Bill Mills <bill.mills@linaro.org>, Marco Liebel
 <mliebel@qti.qualcomm.com>, Alexandre Iooss <erdnaxe@crans.org>, Mahmoud
 Mandour <ma.mandourr@gmail.com>, Emilio Cota <cota@braap.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wei W. Wang"
 <wei.w.wang@intel.com>
Subject: Re: Future of icount discussion for next KVM call?
Date: Thu, 16 Feb 2023 12:46:46 +0000
In-reply-to: <87bkltredr.fsf@pond.sub.org>
Message-ID: <877cwh93m0.fsf@linaro.org>
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


Markus Armbruster <armbru@redhat.com> writes:

> Juan Quintela <quintela@redhat.com> writes:
>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>>> (replying all because qemu-devel rejected my email again)
>>>
>>> On Thu, 16 Feb 2023 at 10:19, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>
>>>> Hi Juan,
>>>>
>>>> Do we have an agenda for next weeks KVM call yet? If there is space I'd
>>>> like to take some time to discuss the future direction of icount.
>>
>> For next week we have:
>> - more single binary qemu (philippe?)
>> - TDX migration from intel.
>>   We asked them on the previous call to change their design to transfer
>>   stuff through migration channels and not create a new channel.  But I
>>   haven't heard from intel. (wei?)
>>   They agreed to send the slides and post the code before continue
>>   discussion.
>>
>> And now I like the title of you topic
>>
>> - Future Direction of icount
>>
>> O:-)
>>
>> So, I will recommend 20 minutes each if Wei shows up, or 30/30 for the
>> rest.
>>
>> What do the rest of the people think.
>
> I think we either need fewer topics per call (ideally one), or strictly
> enforced time limits per topic.  I don't fancy meetings where the topic
> that made me attend falls off the end.

I'm happy to push this out to the next KVM meeting if you want. The main
driver for posting this now was to ensure availability for interested
participants and maybe get some pre-discussion on the list.

> The former may necessitate more frequent calls.

Maybe - the number of agenda items tends to ebb and flow and we seem to
be making good use of the slot now to discuss a wide array of topics.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

