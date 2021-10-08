Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AE942684B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 12:51:43 +0200 (CEST)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYnTa-00075h-PX
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 06:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYnRg-0005k2-R7
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:49:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYnRf-0004U0-3T
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:49:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r10so28472616wra.12
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KomL0vATO0KWTCb9Asr/HKi0QnGnEjCHTaoy2mPsYM4=;
 b=grFpIwTOdJM/v0pNkD0M9YzJj7OYmz45QzRL56mRTM8D4stuDgQydEHeawElG6CcYs
 HTI85trCHDIyOHk5ytjj0i5GooCW7L3DtuACRtFUTieLUA27BcHwuk12eoXmMienO2YG
 QKc57k9Ew64vBzOfQNVYdpPFwzaBvbwPa19haQSTn/ttaSRfWOz4QNat3nT5ZPAdvp5g
 rx5jFi+TT5phw3rUUyiT8VMwDi3zaip3MYAH0tfSpDEfZ5YlPl/W2HxrMxr3GT2WZuof
 qhMQOfdSN/EpKqXNIu46boQUQny6pag4UOlyCAhZA7qoMc8w1HKv1LCqsxlhLckU1sM6
 S+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KomL0vATO0KWTCb9Asr/HKi0QnGnEjCHTaoy2mPsYM4=;
 b=ysGb0NriWV33hIQmbjbRaWxADZy56+0BDnT0ioALzDyHtxBJI7GP1QjqPXKuIJOOfp
 xDEvun0lazSsmCtzwr3tCPjIcKhszyG0cKFDjbxJfvULMPFgO3pM+j5tAjw613uD4mwa
 ihDpe/otSsTE6c34Bm3BtmKktqMe+GCp0jqjJ0uyMcgocPUmhwg/cduNYPqlI5wZHW42
 PQilhXVzE1cm2+vhuoiVL1VAlwYhq8rgDi/UXVJy4Zchug+Kt2gDcfTk5D37cfkSfvc7
 k5k3c2xcpCM/t8H8TsvoVh+p4MwmKrRDNPMuxRtQmRvv02QP3s6DDq6yLjOX+Cu8gSWO
 UKQg==
X-Gm-Message-State: AOAM532w2A/aRJfPBlfzXtboNQnOi4wSftV/RnHUZ8ImRpJ9npnaKIbz
 +P0HXsNVlQVnvcU9DHItb+XEmQ==
X-Google-Smtp-Source: ABdhPJxR8ZpJAu/H/g5K3wlnMkH7jp0x1fhon5bYMt2dVthVUtfa5l9FVSm4osvwom0PWtj+83jvRg==
X-Received: by 2002:adf:b31d:: with SMTP id j29mr3104145wrd.429.1633690181214; 
 Fri, 08 Oct 2021 03:49:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q12sm2068247wmj.6.2021.10.08.03.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 03:49:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98B7C1FF96;
 Fri,  8 Oct 2021 11:49:39 +0100 (BST)
References: <877deoevj8.fsf@linaro.org>
 <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Approaches for same-on-same linux-user execve?
Date: Fri, 08 Oct 2021 11:44:20 +0100
In-reply-to: <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
Message-ID: <87lf33dc58.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: assad.hashmi@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Eric W.
 Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Arnd Bergmann <arnd@arndb.de> writes:

> On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> I came across a use-case this week for ARM although this may be also
>> applicable to architectures where QEMU's emulation is ahead of the
>> hardware currently widely available - for example if you want to
>> exercise SVE code on AArch64. When the linux-user architecture is not
>> the same as the host architecture then binfmt_misc works perfectly fine.
>>
>> However in the case you are running same-on-same you can't use
>> binfmt_misc to redirect execution to using QEMU because any attempt to
>> trap native binaries will cause your userspace to hang as binfmt_misc
>> will be invoked to run the QEMU binary needed to run your application
>> and a deadlock ensues.
>
> Can you clarify how the code would run in this case? Does qemu-user
> still emulate every single instruction, both the compatible and the incom=
patible
> ones, or is the idea here to run as much as possible natively and only
> emulate the instructions that are not available natively, using either
> SIGILL or searching through the object code for those instructions?

qemu-user only every does a complete translation. The hope is of course
our translator is "fairly efficient" so for example integer SVE
operations should get unrolled into a series of AdvSIMD instructions on
the backend.

ARM's armie takes a different approach with the trap and emulate of
SIGILL instructions. This works well for the occasional "new"
instruction but will be less efficient overall if your instruction
stream is entirely novel.

>> Trap execve in QEMU linux-user
>> ------------------------------
>>
>> We could add a flag to QEMU so at the point of execve it manually
>> invokes the new process with QEMU, passing on the flag to persist this
>> behaviour.
>
> This sounds like the obvious approach if you already do a full
> instruction emulation. You'd still need to run the parent process
> by calling qemu-user manually, but I suppose you need to do
> something like this in any case.
>
>> Add path mask to binfmt_misc
>> ----------------------------
>>
>> The other option would be to extend binfmt_misc to have a path mask so
>> it only applies it's alternative execution scheme to binaries in a
>> particular section of the file-system (or maybe some sort of pattern?).
>
> The main downside I see here is that it requires kernel modification, so
> it would not work for old kernels.
>
>> Are there any other approaches you could take? Which do you think has
>> the most merit?
>
> If we modify binfmt_misc in the kernel, it might be helpful to do it
> by extending it with namespace support, so it could be constrained
> to a single container without having to do the emulation outside.
> Unfortunately that does not solve the problem of preventing the
> qemu-user binary from triggering the binfmt_misc lookup.

I wonder how that would interact with the persistent ("P") mode of
binfmt_misc. The backend is identified at the start and gets re-used
rather than looked up each time.

>
>        Arnd


--=20
Alex Benn=C3=A9e

