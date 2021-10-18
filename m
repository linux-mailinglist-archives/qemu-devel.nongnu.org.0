Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607243173E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:27:07 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQnK-0006Ww-AV
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQkx-0004Fp-3f
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 07:24:39 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQku-0001QT-HG
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 07:24:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t2so40771213wrb.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 04:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7s4kowO60/pDu/2UrpnKiMiz11sy7qpAN5Ws0Xp5kek=;
 b=M4ct4S1JWnndU6RhWU56jnJ+ooJEw+FD5ho8H77dsb/4TfC8/9JZA4AAtZAg4ix9UH
 z91GcPT3W5j+3CX/1JNuACujaPIN1WJJW7gcy4kIrDrsmKighpScefo22MwryI9cbMX/
 6C6ewtNVIL4fLj00gmhLUIvy/ZTVQFcAX9wEmpHyK2l0SNwQM8OxRX3WczB0TjWU+m10
 DAXHs33bIUbE7K01BsrEcIJmEeQn46fykcRF0qb/Ch4Yo68jE1yn2vlrTRs/CKeoanWi
 hRpA2SQEYxKWw0FTllkSdqFOvWIWg6Tykxk+nNY+eleC49G6BX9WV706DDX140T4lZbi
 a8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7s4kowO60/pDu/2UrpnKiMiz11sy7qpAN5Ws0Xp5kek=;
 b=ERtZWiuGoC8CIdZd1tcGHXI61Llrh2QPMyoSINDLExAz4FvKSXL7uH5CIW6F+BfAxd
 Vp+nLF1nV7k3c2khzHxLH8vaVF6Gi9ZJZZgKv8Q6pbAqxQ60oWGzYoA5DQYjGqX/BAV8
 LSOvHlQWB0nx/BIXS4frkKoze0TzMdGanMRQ9vyl3cKAwSAHx3QNV2vNQPs1az5NJGex
 zncFv82hZ94FXFr9jFXNeRTm+VmFfgDdybsyb3D5w0Ze9wecNQ94FuKAWl04pgCoBQ4E
 JlHEEUWnGMuCXGHAbn7WSF94ZVh6w1A/Y2W/SthlvMYp8RjLG0zOXinj68lpH1K30XfO
 LhJA==
X-Gm-Message-State: AOAM531o6AEtsHsjcYom+On0qbvvNQo+IkAJ8l7PJcJ3v/IpStlLT8JV
 S7mHRjFliBcOqbhHLmV9ueg68Q==
X-Google-Smtp-Source: ABdhPJwErTzVaNGYRoroDXhjK/w14TOLM4oeoQv8d+bIt9ELKcEM9YDkvUUjYJHOSGzb9yhvDZYMBg==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr36635739wrq.6.1634556273941;
 Mon, 18 Oct 2021 04:24:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m14sm1633133wms.25.2021.10.18.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 04:24:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD91F1FF96;
 Mon, 18 Oct 2021 12:24:31 +0100 (BST)
References: <20210905140939.638928-1-lukas.junger@greensocs.com>
 <87ilzcy593.fsf@linaro.org>
 <2cf6222a-7c66-cbbc-a9a2-66c037c62918@greensocs.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lukas =?utf-8?Q?J=C3=BCnger?= <lukas.junger@greensocs.com>
Subject: Re: [PATCH 0/1] Add missing function names to symbol list
Date: Mon, 18 Oct 2021 12:18:11 +0100
In-reply-to: <2cf6222a-7c66-cbbc-a9a2-66c037c62918@greensocs.com>
Message-ID: <875ytu1spc.fsf@linaro.org>
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
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Lukas J=C3=BCnger <lukas.junger@greensocs.com> writes:

> On 9/7/21 13:43, Alex Benn=C3=A9e wrote:
>> Lukas J=C3=BCnger <lukas.junger@greensocs.com> writes:
>>
>>> Hi all,
>>>
>>> I have been trying to use the hwprofile and cache plugin on
>>> qemu-system-riscv64. They failed to load with an undefined
>>> symbol error. It looks like some of the plugin API functions
>>> are missing from the symbol list, so I added them.
>> Heh I had a similar patch in plugins/next but yours includes more
>> symbols so queued to plugins/next, thanks. Not sure how I missed it
>> before - I think we might not have been honouring the symbol list
>> before.
>>
>>> Afterwards
>>> the plugins worked (eventhough the cache plugin is segfaulting
>>> on shutdown, but that is a separate, unrelated issue).
>> Has this been tracked down yet? There is a fix f7e68c9c99 (tcg/plugins:
>> implement a qemu_plugin_user_exit helper) which was for user mode. At
>> the time I didn't think system mode would be affected due to the atexit
>> callback only being called once vCPUs had shutdown.
>
> It seems like there is a race condition with the tcg threads.
> The plugin exit handler is run with atexit(). While the exit callback
> is freeing memory, tcg is still running and memory callbacks write
> to the already freed data structures in the plugin causing the segfault.
> I tested this with the current master branch and this cmdline:

We fixed a bug in linux-user that was leading to the exit callbacks
being called (see qemu_plugin_user_exit).

> bin/qemu-system-riscv64 -machine virt -nographic -bios fw_jump.elf
> =C2=A0=C2=A0=C2=A0 -kernel Image -plugin path/to/libcache.so -d plugin -D=
 log.txt
>
> I wonder if we could somehow wait for the tcg to exit before executing
> plugin exit cb. Do you have an idea?

It should be because I don't see how TCG would still be running when we
run the atexit handler. It literally shouldn't be called until QEMU
itself calls exit which should be well after the TCG has stopped running
(see pause_all_vcpus).

Any chance you could replicate and generate a backtrace that shows this
happening?

--=20
Alex Benn=C3=A9e

