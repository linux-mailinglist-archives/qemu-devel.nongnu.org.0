Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18876A21F5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:02:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdJu-0001mE-SI; Fri, 24 Feb 2023 14:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pVdJs-0001kJ-EK
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:24 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pVdJq-0002zK-Dr
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:24 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 z20-20020a17090a8b9400b002372d7f823eso3795066pjn.4
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ShjyYknpZBgikU6kFzLYlXFFiRHhYaME9vcyABJklaM=;
 b=JzEraNptISdosbKOmxgesbr3nuUb8AY+DSeBwrk4nep2uVj5CULi2lJYGcoXdX277z
 w78pjfkyELBtJ+FWhUy1SKYFka1fRJbLwlrtSm1wKgsTooSBVYdC8QIMDJM0TAhOT/og
 RfhLp8RsEn25j+G+8r1nrTCLqnpaz8OSdMGJ2vUO6bv2J3MioArubMJttNfYN8rjYi7E
 p0gtOsDHAIJgcAxu7OCjswDxJbheTD76jqevYa86XDirKbob/DrpOGheIqlLIpW3KWnE
 t0HZITr6GcKCYmZZNfKP1hZccjxld0mXUNZjd+XANUrq/NGoXSZ4ScwJ899W5eyrRP7V
 tDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShjyYknpZBgikU6kFzLYlXFFiRHhYaME9vcyABJklaM=;
 b=jakTlnqkmXcoRZUq5yy8PfRRSv6h4VTymZXFGxqGfZ6reN1r6MusVrWM3iRFnQxZsl
 sS9ESzsobpkqumofgHAy8a4qNGPgSnLGuYlwWy5XXrBNI9CSXUZ+DiMOlYVaUPdEf0/t
 KkgKhzmfmKBbFuOrkyy6y7R/NBLYNb+5Q7utDGvo8fyUOTeICjpIXLEtI326JAb06yOF
 gaTrn3sHbqT7gzQC3DvB6RYOflYZZPgW3ozKMfa5WJxC2f6TVgFw7vqA5df2V74XOdPs
 xJmYSAEm5e/ZjZhGgu1o4+Ho8lFCZ4lQgIXlXMjwhgN2pWtnOr/H9cWJnon51m+6h/7g
 ovKA==
X-Gm-Message-State: AO0yUKXbfN+Y6FXfUVt3NpB4eDBhgrnD7QE29U2QcpPa42yXLhyhoHKr
 IeQyZ5cunOxDrRlrrYgqykpuWQ==
X-Google-Smtp-Source: AK7set82IvJzVNXf5hZX19hMVkbSSzH/HUpyypKnuFLMFGH0ZdPL9wSLHCNn/VSXPumTa9hScAGbTQ==
X-Received: by 2002:a17:902:e74a:b0:19b:107b:69ab with SMTP id
 p10-20020a170902e74a00b0019b107b69abmr20046336plf.9.1677265280540; 
 Fri, 24 Feb 2023 11:01:20 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 c24-20020a170902d91800b00183c6784704sm10794337plz.291.2023.02.24.11.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:11 -0800 (PST)
Date: Fri, 24 Feb 2023 11:01:11 -0800 (PST)
X-Google-Original-Date: Fri, 24 Feb 2023 11:00:43 PST (-0800)
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
In-Reply-To: <CAFEAcA_OYJFTXxVjmKs8WAHosnqUzu4o4uN3WU21w29O2=tzjg@mail.gmail.com>
CC: thuth@redhat.com, alex.bennee@linaro.org, bmeng@tinylab.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-14c23baa-c0f0-4ca3-9e1b-08ec26c49be3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 24 Feb 2023 10:52:34 PST (-0800), Peter Maydell wrote:
> On Fri, 24 Feb 2023 at 06:56, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi!
>>
>> On 23/02/2023 23.49, Palmer Dabbelt wrote:
>> > Nobody's replied, so I'm inclined to just drop the OpenSBI bump and re-send
>> > the PR.  At least that way we can avoid getting blocked on the CI issues.
>> > There's some more in flight so there'll probably be a 5th round before the
>> > freeze either way, at least this way the stuff that works can avoid getting
>> > blocked.
>>
>> Please note that pull requests are currently not processed
>> anyway ('til March 1st), see:
>>
>>   https://lore.kernel.org/qemu-devel/CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com/
>
> I've been able to do some pullreq processing with a combination
> of the private CI runners, my personal gitlab account's CI minute
> allowance, and local ad-hoc jobs. So probably best not to wait
> til March 1st before sending.

Ok, I'm just going to send a v2 with the OpenSBI bump removed.  No big 
deal if it doesn't get merged, there's more to do in RISC-V land either 
way.

I'll also poke aroun with the CI some and try to see if I can get local 
stuff working to debug the OpenSBI issue.

Thanks!

