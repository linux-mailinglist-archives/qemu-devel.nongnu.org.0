Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7944765A6CA
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 21:11:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBiAm-0000yX-Kf; Sat, 31 Dec 2022 15:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pBiAk-0000yA-4T
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 15:09:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pBiAi-0006qX-Gr
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 15:09:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id l26so16131657wme.5
 for <qemu-devel@nongnu.org>; Sat, 31 Dec 2022 12:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YuKBpvNs9nb+EvWaUpqSWLsIQmwRATYjMAk+LY9mqfU=;
 b=HcRHr7F+Jp/bytnZJ8G1Bpa0iQszrHVasJvUzDLu5Tv9pU7h9CBTTWwVaEmrD/H8JY
 sCoGiYwaR9eC3S9OFb6RET06lqqTeBhAZKo4bDgUOWxOrUm2M0gHMJADY7ZuKEbl+ofC
 3PVjt/NJ0wApERpIcdonQxAQkEp1L/bgn+V5D0LtNb0a56B15Q8LU7YIv5ZHgKM3TZAi
 fXnUGibv6q4PsiWFa4TA8CX5bcdeuMdCFHjd0u1xekU6biz5cyOA9GNP83jBckk1dL84
 bucsG9YQ4jw/tm8cdvZRzloGzpa7Wv9VAZET8m3no7Jk/xehmK7u1RoojRIgnNUUQT6N
 zY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YuKBpvNs9nb+EvWaUpqSWLsIQmwRATYjMAk+LY9mqfU=;
 b=Lj2lgy1OZ1KPNZiC3Qs9PrClVKP6nGPTuY98ERjCsYdYPH3TzqKwtNS6k7vaqJWgbJ
 mGRGrZT7tVvYzLtsPezq8LUh/sJHV9RDPyKX6LXHhfkbKRT3YJ++hn7xJF9BkhdoUwq0
 T2GB1JaU4M9YAibq4wucS3F5oLf0F1WVIcsbgyy3ne5ckOumBOmRsl3excarPlO0Acnl
 ioQkXQ+bq4PWOgXYaZIV+4PunVJFBeXurJ6N5FLvbdj1Zr8TPnur8Dg1zDlhI9lGlDTz
 e/x2JztOav9MU3zdU7R+/dxbhJwLf6R22y6/73FSccnizhmY9jYi3L0niftMKPoaWWvd
 VHMg==
X-Gm-Message-State: AFqh2kokN80RKo0EtKdOqXPZMZ2Xmd+M4nJlVQZ4D5i5SUkX4DiokN8P
 Pdaf6dngqj7VfZsONfE1GNA/nA==
X-Google-Smtp-Source: AMrXdXsfWK9ph4QwyeCKCgHHaUHgAu4rSnSD80opJLvDGfB+brKU2+3TLzA3xxTqTA1gmzDhw9OCsA==
X-Received: by 2002:a05:600c:34d4:b0:3cf:a39f:eb2a with SMTP id
 d20-20020a05600c34d400b003cfa39feb2amr25427502wmq.11.1672517374457; 
 Sat, 31 Dec 2022 12:09:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c310f00b003b47e75b401sm40558204wmo.37.2022.12.31.12.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 12:09:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D91C1FFB7;
 Sat, 31 Dec 2022 20:09:33 +0000 (GMT)
References: <C2E99F08-5683-4332-B4F6-E3BACFAB6423@umich.edu>
User-agent: mu4e 1.9.10; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Nada Lachtar <nlachtar@umich.edu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Question about TLBs
Date: Sat, 31 Dec 2022 20:04:08 +0000
In-reply-to: <C2E99F08-5683-4332-B4F6-E3BACFAB6423@umich.edu>
Message-ID: <87zgb3qqrm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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


Nada Lachtar <nlachtar@umich.edu> writes:

> [[S/MIME Signed Part:Undecided]]
> Hello,
>
> Does Qemu maintain two TLB for the x86_64 system (i.e iTLB and dTLB)?
> If yes, can you please point me to how to access the dTLB and what
> data structure maintains this information!

Qemu's internal softmmu TLB is unified and holds information for code
loads, memory accesses and re-directions for io access. See CPUTLBEntry
and CPUTLBEntryFull. They do not directly map onto any target specific
structures (although targets can use TARGET_PAGE_ENTRY_EXTRA to store
extra information in the table).

These entries are filled by target specific code via
cpu->cc->tcg_ops->tlb_fill() which in the x86 case takes you to
x86_cpu_tlb_fill(). This is the code responsible to walking the target
page tables and filling in the details of the mappings.

>
> I would appreciate any help,
>
>
> Thanks,
>
>
>
>
> [[End of S/MIME Signed Part]]


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

