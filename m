Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16175F2377
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 15:59:42 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oezVN-0005Jw-Oq
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 09:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oezTP-0003FZ-BZ
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 09:57:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oezTN-0001d7-N1
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 09:57:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so4518941wms.4
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=EnpVKHQ8us4re3zQwACarhym1pVA582lVUjm1eEDnW8=;
 b=ymkAiJWPTrtV0XZMLqk3/94v9tFFpq9tuO3422Vr7+9mLe0FYr0NDVTqExd8n+ore3
 sac05d/PNoEJvtPozE+O+LtTzcffs0q+5tARaaBXZnR8YyLBoQujLMNPeB+VcazYFEEg
 Pf5OdkyhxKpTBqoNW/GOcpRSFi9VkNAoINp+7kiomfT8Q3Udul+GnXfV+sypGEfwpUM6
 r1oFGYRgpv459YoRsa1l56m2Gi1S4B7+zjTOgn7BjYW7O7LYouDn8u1yEbqikKIr4zt8
 pX15R2vLufcY8wElbrjYz5BmTaHhz7E3vGFhfDU/9J2q5ZvQt2cNL2gGUhzWMIlw4vdj
 YrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=EnpVKHQ8us4re3zQwACarhym1pVA582lVUjm1eEDnW8=;
 b=qQ53hv0LAKYA5DNgSC6A8MXKTUK4R+GWbYlk6V/QuDsQl/1GKSROrlE1So39JVt+8T
 RJK1ToarMdhQ2MdKX6fjwqG7THg64x4rCx2NubMxuqXzfl0vSsm2Gz82UlMfYVQ/cm/g
 84exW/TUNw/dqR5Gv11IKQQmDCcAdDYbhXWdkHPMGPC54nHVmZFZASSZwdpPJehE+XLd
 7dJooyCwdPsX5t0nr5VvvpmRIpQFhx3ffg3p3/HUCmO1ARo2tWV3cNRKBIJY+nZNC4IC
 0FPUf5rDL3wJjyckN80ggf3EM9JbbgVlpxJmFBNk9Amts9Byjcr4Nx8mxnXiYOsdv6QJ
 7t3g==
X-Gm-Message-State: ACrzQf1g+NJISsO4ahFZLjc6AFzlfStnmVtHewLvCCk+VkysvJKknMCl
 hxhJVBiHspIRVCd5XU/jUlGp+g==
X-Google-Smtp-Source: AMsMyM4tg4CYh/X0gzK0SucIpn2P7t0+eMwpuTrnSyCTrx6+WeLxD8wFRJ6Da8vH3yRLOJbHv6eb8w==
X-Received: by 2002:a7b:cd96:0:b0:3b4:856a:28f7 with SMTP id
 y22-20020a7bcd96000000b003b4856a28f7mr4371862wmj.117.1664719055362; 
 Sun, 02 Oct 2022 06:57:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d6a43000000b0022cc0a2cbecsm7349015wrw.15.2022.10.02.06.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 06:57:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 984781FFB7;
 Sun,  2 Oct 2022 14:57:33 +0100 (BST)
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BitFriends <commandspider12@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: access guest address from within instruction
Date: Sun, 02 Oct 2022 14:56:52 +0100
In-reply-to: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
Message-ID: <87lepywcoi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


BitFriends <commandspider12@gmail.com> writes:

> Hello,
>
> I am trying to create a custom instruction that accesses guest memory spe=
cified by an address in a register. I specifically
> want to read from that address. So I tried to do that using "tcg_gen_qemu=
_ld_i64(&res, env->regs[R_EDI], 0,
> MO_LEUQ);", but that doesn't save any result in res. So either my call is=
 wrong, or I need to translate that guest address
> to a usable host address. I can't find much about this stuff in the
> docs. Could anyone help me out with that?

I still think you could solve your problem using semihosting (which
exactly exposes a "fake" instruction to make semihosting calls to save
data on the host system).

>
> Cheers
>
> BitFriends


--=20
Alex Benn=C3=A9e

