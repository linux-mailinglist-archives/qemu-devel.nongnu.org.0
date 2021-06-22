Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8003AFFB9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:58:07 +0200 (CEST)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcEQ-0000nT-4W
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvcBx-00057t-85
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:55:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvcBv-0002Xi-CA
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:55:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so1717840wmb.3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=h7Prj85gOBX5Ce2haoNmVyRUVSx+TVdDjBumyGpV+r4=;
 b=PvkRNND3p9UVXfOMfVGb3fBtcea4dFG3l866JSSTRduMuzG5d8FjA6iGgP2ZbKYUAq
 LZosjjgq/iPXgXIJsj6Qtf7zJzHhjrCyLGWYA++zUiokhILa4bHI62vaKlmGIZszkGme
 bCk9rMKB3dUzEC9WtfiRFrXiA2OwyxoymeksI/MEFJc1dGW+6bEQ8gtcH1rlxuRu1i6i
 EWs3hvLds8IDUNdZZOsdFtNVWe7qYjJWXZgATiZaSX/lx5q5gV2vihdZ0qCUAWcLHOPx
 nMvFqYK/IjMdonUdKkXL3d7IqTd4f/A7XboKriSJbqkvCSgb43yug1cmj4kj/lkSfEKZ
 742A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=h7Prj85gOBX5Ce2haoNmVyRUVSx+TVdDjBumyGpV+r4=;
 b=jaIjoqH80rWzrrS7XGmTuVYWJBgG5IhCAnZsERT3VKecTafvQixhkJGWt6SLcsnGHO
 iXbN0enFDev/P/tDTaahuhsARNtpm/p7VmlRVEo+d/CSRLvZNeREFZEWOkplhXPBM4wf
 yVyhQim/Fwd+pRZ+iGjpVmH3Qukq7cKE98i9DDb8BLhVhJvZX6NLs1nTGotdZqu4Xt7k
 7LLa2VObu8tKo7xUvbQzsUclRkMCTIQv3ZxAOwxi2aPXkc+1lirXxAbXBgc+MNqkXVRR
 gviQWZMXPAIziybALivhZBv6iyLlVhneYyPe/ERNaCv7EHAxtiE5LdBwqAxr6fYlVcV0
 8ulg==
X-Gm-Message-State: AOAM532IW3KPq3oO4RFlCAzuFD6friyz11PcEyPVG4rQvR3T+cgXM9Vj
 uplhvpI3wCAinatXAvXyPniZBw==
X-Google-Smtp-Source: ABdhPJyBDFiDSDqkKBZqKf25ew+qQZvyHxy8tfDsSDDFyvufBE4m74CdtRlBUrHluE7OfQpS7xZauw==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr3358213wmq.14.1624352129496; 
 Tue, 22 Jun 2021 01:55:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm1624214wmq.28.2021.06.22.01.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:55:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F09E81FF7E;
 Tue, 22 Jun 2021 09:55:27 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
Date: Tue, 22 Jun 2021 09:48:08 +0100
In-reply-to: <20210618091101.2802534-3-erdnaxe@crans.org>
Message-ID: <87y2b2s2gw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Alexandre Iooss <erdnaxe@crans.org> writes:

> This adds description of the execlog TCG plugin with an example.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>  docs/devel/tcg-plugins.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 18c6581d85..02818a3327 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -319,3 +319,25 @@ the user to see what hardware is accessed how often.=
 It has a number of options:
>        off:0000001c, 1, 2
>        off:00000020, 1, 2
>        ...
> +
> +- contrib/plugins/execlog.c
> +
> +The execlog tool traces executed instructions with memory access. It can=
 be used
> +for debugging and security analysis purposes.

We should probably mention that this will generate a lot of output.
Running the admittedly memory heavy softmmu memory test:

  ./aarch64-softmmu/qemu-system-aarch64 -D test.out -d plugin \
    -plugin contrib/plugins/libexeclog.so  \
    -cpu max -serial mon:stdio -M virt \
    -display none -semihosting-config chardev=3Dserial0 \
    -kernel ./tests/tcg/aarch64-softmmu/memory

generates a 8.6Gb text file. I suspect once this is merged you might
want to look at options to target the instrumentation at areas of
specific interest or abbreviate information.=20

> +The plugin takes no argument::
> +
> +  qemu-system-arm $(QEMU_ARGS) \
> +    -plugin ./contrib/plugins/libexeclog.so -d plugin
> +
> +which will output an execution trace following this structure::
> +
> +  # vCPU, vAddr, opcode, disassembly[, load/store, memory addr, device].=
..
> +  0, 0xa12, 0xf8012400, "movs r4, #0"
> +  0, 0xa14, 0xf87f42b4, "cmp r4, r6"
> +  0, 0xa16, 0xd206, "bhs #0xa26"
> +  0, 0xa18, 0xfff94803, "ldr r0, [pc, #0xc]", load, 0x00010a28, RAM
> +  0, 0xa1a, 0xf989f000, "bl #0xd30"
> +  0, 0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee0, RAM, store, =
0x20003ee4, RAM
> +  0, 0xd32, 0xf9893014, "adds r0, #0x14"
> +  0, 0xd34, 0xf9c8f000, "bl #0x10c8"
> +  0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM


--=20
Alex Benn=C3=A9e

