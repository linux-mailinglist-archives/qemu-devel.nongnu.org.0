Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF568BEF2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1ve-00055J-Gi; Mon, 06 Feb 2023 08:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP1va-00054A-Kt
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:53:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP1vY-0007gN-Vg
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:53:02 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so10827889wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RsdX47KrLu9aZuhQEk9NdfiFSEoiJFsCrkPUJVtEShI=;
 b=bFI3c4yrDS57BGk9G6WzkrPYg64U3fwYXmyhfGFP3DEMsYm7qsBvy1WCBaJ9LMqzFE
 hNoirnCOam1hHtJk+fobmCrskmBJx0RempO2C0QSc1+yvJ/wly4V6Ee1wXIt7u+49iZr
 l9qzDapxjUDRUcdYTzeP3PDKILGsO/RhHbXBiFmFR4GoHwPlpIqHPHTl7tpO1D55KZ2r
 pdxobBfbiSfeJBnLVy7MSJFMNyv0z6p4OBGgeadKtg4nqWLfMQk+Z1Ti/stmBD1BUhKM
 PdSaaJoU08n4lRz4Y1X6F/hTCqBnsquVkz0Gs5kYHtfVktmxiveP5Uk28NLChYcWMSXj
 0szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RsdX47KrLu9aZuhQEk9NdfiFSEoiJFsCrkPUJVtEShI=;
 b=kokOqABzUb18dHWUrIQcVHnJOirC5hcQKmtVt49Er3Wya5PBoCVA4ebiiADxW+t/tj
 maRwse2lPHxJITyYSW4nPtQCj1mmhB4YcByIW9v21SRSbG6OBgYeZ/yHT+NpcJpQF9gu
 Ir8xKhHVzTh2nstz3NMAm5ScrJkrKSUcFnl16SvkPg21GkECuP2SO0xJgTOfVluKzLW6
 uaPJwzSnrnjb6oQSc+OYRxi3+TU+fQPJlcgbd4qjRPXtooAYLZ3uIfZCDtNbd0gqn/7Y
 93xPfq8n6SmTgmyBUfjFKT5I2JcwBK5xanI9cUMNsiw1uBxhtU2sVhf/TE26i/VrrKQs
 bJcw==
X-Gm-Message-State: AO0yUKVbFAPUFYTSeNuk/kVMukxoiExN0uGG2aM5Fw/fVynxgkCAtfL/
 qbIMonyUEBe/DkekR8Ndgr8V9A==
X-Google-Smtp-Source: AK7set+GW6CPHMtbg5T7jnEo+q3qaHqZpOQtjGmlqO7qVUpjjWodto9wcUKJUtxXdXpRXQg2izTY2Q==
X-Received: by 2002:a05:600c:54c5:b0:3dc:9ecc:22a with SMTP id
 iw5-20020a05600c54c500b003dc9ecc022amr19173436wmb.8.1675691578333; 
 Mon, 06 Feb 2023 05:52:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003dc4480df80sm16262136wmj.34.2023.02.06.05.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 05:52:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C16B1FFB7;
 Mon,  6 Feb 2023 13:52:57 +0000 (GMT)
References: <20221123121712.72817-1-mads@ynddal.dk>
 <af92080f-e708-f593-7ff5-81b7b264d587@linaro.org>
 <C8BC6E24-F98D-428D-80F8-98BDA40C7B15@ynddal.dk>
 <87h6xyjcdh.fsf@linaro.org>
 <4B19094C-63DC-4A81-A008-886504256D5D@ynddal.dk>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, "open list:Overall KVM CPUs"
 <kvm@vger.kernel.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
Date: Mon, 06 Feb 2023 13:52:26 +0000
In-reply-to: <4B19094C-63DC-4A81-A008-886504256D5D@ynddal.dk>
Message-ID: <871qn2rjd2.fsf@linaro.org>
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


Mads Ynddal <mads@ynddal.dk> writes:

>> It will do. You could just call it update_guest_debug as it is an
>> internal static function although I guess that makes grepping a bit of a
>> pain.
>
> I agree. It should preferably be something unique, to ease grep'ing.
>
>> Is something being accidentally linked with linux-user and softmmu?
>
> Good question. I'm not familiar enough with the code base to know.
>
> I experimented with enabling/disabling linux-user when configuring, and i=
t does
> affect whether it compiles or not.
>
> The following seems to fix it, and I can see the same approach is taken o=
ther
> places in cpu.c. Would this be an acceptable solution?
>
> diff --git a/cpu.c b/cpu.c
> index 6effa5acc9..c9e8700691 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -386,6 +386,7 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int mas=
k)
>  void cpu_single_step(CPUState *cpu, int enabled)
>  {
>      if (cpu->singlestep_enabled !=3D enabled) {
> +#if !defined(CONFIG_USER_ONLY)
>          const AccelOpsClass *ops =3D cpus_get_accel();
>
>          cpu->singlestep_enabled =3D enabled;
> @@ -393,6 +394,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
>          if (ops->update_guest_debug) {
>              ops->update_guest_debug(cpu, 0);
>          }
> +#endif
>
>          trace_breakpoint_singlestep(cpu->cpu_index, enabled);
>      }

Sorry this dropped of my radar. Yes I think the ifdef will do. Are you
going to post a v2 with all the various updates?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

