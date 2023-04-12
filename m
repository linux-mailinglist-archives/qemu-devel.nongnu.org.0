Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16306DF4D7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:17:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZPU-0000FK-Uq; Wed, 12 Apr 2023 08:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmZPT-0000Ef-8X
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:17:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmZPR-0000v8-Nf
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:17:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so7156967wmb.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681301828; x=1683893828;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WL0swXW2uuFwZJEaphFZGDXgpi+ZDCFyxMy0n0jFs+w=;
 b=xtDTPVxYnpxWpHqxPpLhboJXXs78cd4ldoPX1JPdLH4pA7tLwHAyg12FNy4l/7kCe3
 pKVfCr8QVv5rp+wpeN+yzoAuMy8V7QhL6xuGCduOGcRIXl8ce+QuApFe3vVIgmqKyKLo
 soytxSkPTa7zrBLValasi6PBOW8UHv4zZ/Kwf3ezdNuv7sOgEWSwsEnKJZxJmGPYRWkE
 OOU0YsCtagjVvEIxZ0+aeK4MrqCU6sIEO1D3PvzNn6OPurOBctOaflttzQEvGStcegdQ
 5ypZOzpzrL6P8ZC1+vafqjKt6rUVF/7mfE6vCrY81NGTruW+Bhz5bNfi/dStjkAByq9d
 QEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681301828; x=1683893828;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WL0swXW2uuFwZJEaphFZGDXgpi+ZDCFyxMy0n0jFs+w=;
 b=x8zQ8d+kSsSo+gaxJLaHYSoU4QDmHYKhS31jejsXnvTOUPmMux8U56zBJ50iKk/E2R
 K1NVoJia3ROwylB7MUU7OMLQaHUAJ3O+D3zKYeXnUTJDU7pNM5AQgTi7GVT1UMoxluFg
 To+bt65pdaGWUJQgPxGo3fo9eKK9Z5ynwMmUqCziDLfvcN3PpGze/hlk1ocx6ftIdao+
 dS7z2RSYNVKD0scox2J5lvY4ALA0kdqeyxbxG0OK/OHnrJB0C/Eu8kVC+bLNoQE50EJe
 uT/cYtgXhEYRCUSsudPUWpF6/ggdKcPS9aovF6dWbvJ7Yi1CxrZTU/JLbgxN/DwY4flY
 oF/w==
X-Gm-Message-State: AAQBX9fMUojvl6OKM2uQXk4FwsPBdw6bkqYc7pm7MVoTFaODa0xs1Pmc
 k4qpPB4YeO3KzpU+SPnDsNoFEQ==
X-Google-Smtp-Source: AKy350biM40B5U8XFuwYphC8o6Co/55+vOv7XQxwVoZtKMVkWvR/kfIaG34X57qyVgRCE/mo0CqJsQ==
X-Received: by 2002:a7b:cd0a:0:b0:3ed:5a12:5641 with SMTP id
 f10-20020a7bcd0a000000b003ed5a125641mr12485055wmj.36.1681301828162; 
 Wed, 12 Apr 2023 05:17:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003f072b22dbbsm2175867wma.16.2023.04.12.05.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 05:17:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D68D1FFB7;
 Wed, 12 Apr 2023 13:17:07 +0100 (BST)
References: <CAEQMSUtx73GosLwzMLERTMkJ=eLiU5NbwZY1K0eOmFbJ-M=4Kw@mail.gmail.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Walid Ghandour <waleedjghandour@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: AVX-512 instruction set
Date: Wed, 12 Apr 2023 13:13:25 +0100
In-reply-to: <CAEQMSUtx73GosLwzMLERTMkJ=eLiU5NbwZY1K0eOmFbJ-M=4Kw@mail.gmail.com>
Message-ID: <87y1mxnvlo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


Walid Ghandour <waleedjghandour@gmail.com> writes:

> Hello,
>
> I am interested in adding AVX512 to qemu.

(add x86 TCG maintainers to CC)

> Is anyone currently working on this ?
>
> If yes, when is it expected to be done ?

I don't think there is currently any active effort to add AVX512
support. There have been various GSoC projects to improve the x86 SIMD
emulation but I don't think they got merged.

There has been some updates to improve the SSE emulation in the last few
releases and make the instruction decoder a little easier to work wit.

>
> I was trying to run a C program and failed with the following error at th=
is instruction:
>
> 62 f2 7d 48 18 0d fa 0c 00 00 vbroadcastss 0xcfa(%rip),%zmm1
>
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>
> I like to add support for broadcast and fmadd avx 512 instructions such a=
s the following one:=20
>
> 62 e2 7d 48 b8 c9     vfmadd231ps %zmm1,%zmm0,%zmm17
>
> Thanks,
> Walid


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

