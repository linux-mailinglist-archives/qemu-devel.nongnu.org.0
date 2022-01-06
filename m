Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0703C48663E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:43:33 +0100 (CET)
Received: from localhost ([::1]:34946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TzH-00026d-TS
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5TjL-0000xG-4o
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:27:04 -0500
Received: from [2a00:1450:4864:20::532] (port=45727
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5TjJ-0004cP-Cz
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:27:02 -0500
Received: by mail-ed1-x532.google.com with SMTP id j6so9971185edw.12
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 06:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YwAhqYMhbnTIDvg7NycAUu/mVi0C+wfJWRSTWyjaHkU=;
 b=oOahdwTXhfSwAhsVcMVhPL39frKj3+c7WuJ8x3eXw/gK2SpZcM/jc3Ql7ZfGJ+VEY5
 LHaotZZKCu0no21gYbFAHlpIqSTtXYU+ocFykoWKHoRiCXvPU4JKp4z0ch0mqPd+Comx
 QKuecQ+S6zBhrHTFQ3OK2N2Vbo94LHZqaMwIJRXx34x+Ph/WRqf6ObxKLhfJgcc/VvgD
 6wiG7+68cusHosTVTlZt7GwYQr1Z7GijlghXPd5Xw1aUtJbEIZkQ+jc38fSkB2Iuzh0L
 RH+d/XeH2MEaznZIVWMyV/FbUn+ku6CseNSvCc1JfvzpKJ1pAZZybNPB1vZPZQogAYWB
 uLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YwAhqYMhbnTIDvg7NycAUu/mVi0C+wfJWRSTWyjaHkU=;
 b=usn7dnRZRlQ7K+LaknHx4smtDrR5Q9YsbWhQV4yyDzQpVxDYvr/0GY58OwMtqtOPGE
 qjMRC/TqlGpgX2lg8vYulZdLhmtswR8yLl/qY5So+aV1s1QNBqK7QzBWaYxT23iPciva
 WNZGukHGAskCD2a0SfRScW6ODZzE+j5JcqA/HurCLyyKhmxaZ75yPzq8bMjBP/CLPHjL
 uY/l3IAW+CRHwt+KGExunrE4IChALtgAjJzECLsDJ1iqf8r4mHMH+wgf3b+wLI5Wa/BG
 Xw+8QtpfJLwU6vf3itkjOUSY9vViXhfoqAML7f9O3HdWf/4Q9zXVFEEp6nHdYFn6su3l
 YZ7A==
X-Gm-Message-State: AOAM533Q5gZC2iQRDUkf43BIqTR9430dMvvmDbUfGawBjtLiDmjqSK2x
 tNgX3OCW15suopHXWxZQvjMRww==
X-Google-Smtp-Source: ABdhPJxWwGC9FiOcJlCxwtZy88oo3i1VUzWP/gePUKtQ8/yenet6vqOkbRhxrzz18ttda8zlinsBQQ==
X-Received: by 2002:a05:6402:1755:: with SMTP id
 v21mr441058edx.202.1641479217106; 
 Thu, 06 Jan 2022 06:26:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y12sm781747edd.31.2022.01.06.06.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 06:26:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B10F11FFB7;
 Thu,  6 Jan 2022 14:26:55 +0000 (GMT)
References: <87czl6jb79.fsf@linaro.org>
 <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
 <87r19lj3l3.fsf@linaro.org>
 <CAFEAcA9XX26RHmNM59Zc13dwvhv83bAnomLp7Yj45Wmf16W66w@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Trying to understand QOM object creation and property linking
Date: Thu, 06 Jan 2022 14:20:32 +0000
In-reply-to: <CAFEAcA9XX26RHmNM59Zc13dwvhv83bAnomLp7Yj45Wmf16W66w@mail.gmail.com>
Message-ID: <87iluxhrdc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 5 Jan 2022 at 21:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> Can't be added as a subregion to the container...
>>
>>   qemu-system-arm: ../../softmmu/memory.c:2538: memory_region_add_subreg=
ion_common: Assertion `!subregion->container' failed.
>
> This assert means you tried to add the same MemoryRegion
> as a subregion of more than one parent MR.

Right - that is probably something we should make (more?) explicitly
clear in the Memory API docs.

> You can either:
>  * pass all the CPUs the same container as their "memory" link,
>    if they all see the same view of the world

This should be the case - I don't think the different cores have any
particular different view of the world. The use of the two 4kb banks I
think is purely convention.

However trying for a single container shared between both cores fails
because armv7m_realize adds it's board_memory to another container:

    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, =
-1);

So I guess I just have to repeat the creation of the aliases for each
core. This seems needlessly messy...

>  * if they have different views of the world, you need to
>    create a container for each CPU to be the "memory" link,
>    and to populate that container you need to create N-1 alias MRs
>    of the board_memory MR (CPU 0's container can use the original
>    board_memory MR; CPU 1, ... use the aliases).
>
> Example of option 1: virt board
> Example of option 2: hw/arm/armsse.c (look at what it does with
> the s->cpu_container[] and s->container_alias[] arrays)
>
> -- PMM


--=20
Alex Benn=C3=A9e

