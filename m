Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2129E3B01A1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:42:42 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdrd-0000Y8-6H
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvdkN-00065R-Au
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:35:11 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvdkJ-00089U-Cs
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:35:10 -0400
Received: by mail-wr1-x436.google.com with SMTP id h11so5547907wrx.5
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:message-id
 :in-reply-to:mime-version:content-transfer-encoding;
 bh=N6/7Sb/XRbFSQUER1TXS53KQTORmXTcFJxkgP/h/w3U=;
 b=pEA+NJvJ4vw8hRHwPZbEKZdEDrbZHCPU/ob91UhOpOOSKjYrlOHo2W0ss4J5eKJFJd
 HiA33uTwMiPgzrGGMEJkevndOCd8OhH5llr2ACG27Zgbl3PsT5rHO7LC1o0pRkzxLjEJ
 qqfQrdSkhEy2cth/7umgy5+QhkhR8bf1RMSTllHUCHo+9PZ7XC4YSULSeenWjdlSGJSe
 WJBmY1MrR0yOsvkNoE1nLO40CUwNChR/cLYZk3vzmQf8WQQ95tesfpEdwXM7HRLMIJX0
 bXU++A4tnciolyE+wRXn3UkfPRPSSHdMsrH+obLRlCzDkfIr2NbbWb0neMFL0GXkvkoF
 mmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :message-id:in-reply-to:mime-version:content-transfer-encoding;
 bh=N6/7Sb/XRbFSQUER1TXS53KQTORmXTcFJxkgP/h/w3U=;
 b=m45eyAd89Md7C6NDYz+G2J2goumooFO1b0uHbXf/AwJI7Fg1A1gG42AU910slFhk0B
 nvWSRtpnHR2gywgqpbH/1SbXyPYViJj0JgPf8Sdlvwvqh58eHJJtmCWol7rF+fvEDUVH
 ieiHftIC8kcqDlKVBOYtQl93Os03aBe1TED184hPmhCMtEefmjxwJfF4H/w4yvXLp1aj
 QUEXNjeNsh0Ep8T8rSu1uE9uHjfPZ236+PowVEYG/s5y8ahbD+ZofND8TGjWLGaOIYti
 ng3H3pxyE6eY1a9qNCRZUgIjyb2c5M1gTr/2Hg4L78nxdDnwAV6EjQEEeaY88OhhDR1z
 WyvA==
X-Gm-Message-State: AOAM532tj5c5jyQ4sTqebmPyAhUnzQBJmLVF6LD3vrq4OUUQEfJyUlyC
 w46X5v9jvjrTMvXcCxVTfPSKdA==
X-Google-Smtp-Source: ABdhPJxoeZ/yVlLeGCi65lfvkywEXmriI6/6H/pV2XAiBI4yci+4ywwmRutaJHrk5+UdOwxKBBAeCA==
X-Received: by 2002:adf:de87:: with SMTP id w7mr3858890wrl.333.1624358105161; 
 Tue, 22 Jun 2021 03:35:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm2029840wmn.10.2021.06.22.03.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:35:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D3091FF7E;
 Tue, 22 Jun 2021 11:35:03 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-2-erdnaxe@crans.org> <871r8uthe1.fsf@linaro.org>
 <a4798470-76ea-0241-b154-0820e6c0518c@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre IOOSS <erdnaxe@crans.org>
Subject: Re: [PATCH v2 1/2] contrib/plugins: add execlog to log instruction
 execution and memory access
Date: Tue, 22 Jun 2021 11:33:11 +0100
Message-ID: <8735tatcfm.fsf@linaro.org>
In-reply-to: <a4798470-76ea-0241-b154-0820e6c0518c@crans.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
> On 6/22/21 10:37 AM, Alex Benn=C3=A9e wrote:
>> We only allocate last_exec for system.max_vcpus here. You need to check
>> the system_emulation bool before using that information and error out if
>> it's not system emulation.
>
> My bad, I did not test user mode emulation after converting last_exec
> to an array. Should I consider only one vCPU in user mode emulation?

It's up to you. The cpuid is essentially unbounded for linux-user so you
could either dynamically assign new entries as they come up or just not
load for non system emulation cases. If you attempt to run
multi-threaded programs with a single entry in the array you will get
weird interleaving issues.

>
> -- Alexandre
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

