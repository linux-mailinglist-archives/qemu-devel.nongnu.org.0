Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E23B01A4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:43:41 +0200 (CEST)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdsa-0002pm-1J
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvdqk-0000oP-PL
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:41:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvdqi-0003jM-Mq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:41:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id b3so12791192wrm.6
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IvhS7bAckHDqGVPCibJLL0J6PPOQghZNnRndgkM7ovg=;
 b=oe/J2ry4oZLwY/ICMNCWmPne/DjcVdqAic30kCGqX3NIXxIDMfBlfmWCSfh8aR+LEU
 0PmDpzLuw2z3Th/xs0k6wze4QNmY31bhsQla2uV7c2SbibrNi81qCLb7AhtMpG/5eDQR
 E6gaEqptvUNdrYOjHa+z0e/UX2vZofNSsZQCG262Ez3LKrame5M+qZajzGCln5d6NVzY
 QaaqDKCCxyO+wRhuQNKTSemtuC0NQY2SAAzw0p9ihzAP4AnWZo/j8mdR6Xn2UvR7dOnm
 Lty8xCqs73Qk1tETAjagK//9ZRxtFVoqwqquujKU/xTNmHl8aNmwY+uIl1q07TCTXmTB
 0ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IvhS7bAckHDqGVPCibJLL0J6PPOQghZNnRndgkM7ovg=;
 b=LRl1PPWiMavGedpkOukyo5nnvz+5GYnujTLwYPC5Km07CZ3ujvRKGGX6fOy94pMk3A
 B2tGHJFELoB6ym588yvdHWcU9RtayipKKIIZnSmzFxz6rpRY69beTFT4BA80gawKF0Qg
 egSmamP1AjCJx818k9oQWsTfSHvYdG6+zyQBHOjwSacqQiBdmhW+f9jn4oa2T5aoUfJY
 EuZnLTh17ICNwMzOAyjUh+8+gtzWv519hBDJ+0hcSmLAEdMTo8/B91OfX4pWQhj7DUOv
 +UWHgbM+qD/3GF9HNmO7WqvuLRAAr//Q8hUhY+e1xppUmO5WmeBRXqnEZFy4G1tizNaM
 NoQQ==
X-Gm-Message-State: AOAM532JxbDqL/sEpUQagPMKBn5LO3/xqEQ+JvVKSvyILkmmWTXy+6Tg
 JgVDDHQ03JdWOvIVbRwvfEd6gw==
X-Google-Smtp-Source: ABdhPJzjzgaVGwJmIFeDd6Wh+AqGrlEpIuINaqQXdSupyJbt1btDPG7C1Ijm45Ugdd3wvakc5yqSjw==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr3804826wry.175.1624358503127; 
 Tue, 22 Jun 2021 03:41:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x81sm2461657wmg.36.2021.06.22.03.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:41:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3299F1FF7E;
 Tue, 22 Jun 2021 11:41:41 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org> <87y2b2s2gw.fsf@linaro.org>
 <49027cc2-f89e-cbd6-cfc0-e59ce7dd4b17@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre IOOSS <erdnaxe@crans.org>
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
Date: Tue, 22 Jun 2021 11:37:07 +0100
In-reply-to: <49027cc2-f89e-cbd6-cfc0-e59ce7dd4b17@crans.org>
Message-ID: <87y2b2rxju.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre IOOSS <erdnaxe@crans.org> writes:

> [[PGP Signed Part:Undecided]]
> On 6/22/21 10:48 AM, Alex Benn=C3=A9e wrote:
>> Alexandre Iooss<erdnaxe@crans.org>  writes:
>>> [...]
>>> +
>>> +The execlog tool traces executed instructions with memory access. It c=
an be used
>>> +for debugging and security analysis purposes.
>> We should probably mention that this will generate a lot of output.
>> Running the admittedly memory heavy softmmu memory test:
>>    ./aarch64-softmmu/qemu-system-aarch64 -D test.out -d plugin \
>>      -plugin contrib/plugins/libexeclog.so  \
>>      -cpu max -serial mon:stdio -M virt \
>>      -display none -semihosting-config chardev=3Dserial0 \
>>      -kernel ./tests/tcg/aarch64-softmmu/memory
>> generates a 8.6Gb text file. I suspect once this is merged you might
>> want to look at options to target the instrumentation at areas of
>> specific interest or abbreviate information.
>
> Yes! In my downstream version I am triggering the beginning and the
> end of trace acquisition by matching two virtual addresses of GPIO
> device access. This works in my case because I'm also using the same
> GPIO for triggering an oscilloscope, but maybe we would like to
> upstream something more generic.
>
> I'm still thinking about this (maybe for a later patch) but I believe
> it would be nice to have the following:
>  - If no argument is given to the plugin, log everything.
>  - Allow the user to specify either a memory address, an instruction
>    virtual address or an opcode that would start the acquisition.
>  - Same to stop the acquisition.

Sounds reasonable to me.

> This would look like this to start/stop acquisition using GPIO PA8 on
> STM32VLDISCOVERY:
>
>   ./arm-softmmu/qemu-system-arm -M stm32vldiscovery \
>     -kernel ./firmware.elf -d plugin \
>     -plugin libexeclog.so,arg=3Dmem:1073809424,arg=3Dmem:1073809424

I quite like the formats you can use for -dfilter, for example:

  0x1000+0x100,0x2100-0x100,0x3000..0x3100

it might even be worth exposing qemu_set_dfilter_ranges as a helper
function to plugins to avoid copy and paste.

So what would your above command trigger? A write to 1073809424 would
start the trace and the next write to the same address would stop it?

> I would like to hear other users opinion on this, because I fear I
> might implement something too specific.
>
> Thanks,
> -- Alexandre
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

