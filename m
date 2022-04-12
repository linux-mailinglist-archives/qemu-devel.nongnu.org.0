Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231244FCDC3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 06:25:14 +0200 (CEST)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne85Z-0004xR-8O
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 00:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne83K-0003EE-Vg
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 00:22:55 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne83J-0005pI-6T
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 00:22:54 -0400
Received: by mail-il1-x136.google.com with SMTP id h4so4529349ilq.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 21:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+1cvHotY82ok8W4bfsqcBJJnjG2A7y/ixgIVyiCIw5E=;
 b=LP6piRLwdOiRMgFvPkE8EMtnmFhPbWgpd5JlxwkZD+U4oQvSgyPj1spUwR2pS7OurL
 f3RPsBAhSnDHanwfAti1cVmdEReeHvEMW1Cgb/5JPCqrww8PtqI11AknI3WVZPDsWvOx
 ajNz6RtlPjOiosWoiECriaKEBegt0GF+DoDL7e0UkVD1sPAat8pRY5FrQfzMpJAJMNOS
 qXznZm4h8l50SXATuRfmqLcoBR2m/j3/WhrfFAdeUIQYtvHxQP7IJIRSZxABsSgUs9B8
 XmaTNMU8IPNtyp+BMaanEred2UPFGq7/yPi9TdJhI3NfaNykWp63YtFyFoI92Msl0SsN
 0qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+1cvHotY82ok8W4bfsqcBJJnjG2A7y/ixgIVyiCIw5E=;
 b=ofKea3AFuYFAZwhsDjOIcrN1d8Qixab4jNCzmh7Dz7NsbkWxE/SGtlLPH0FNCtwOD9
 Id5oXkNzyndA/T6iLeEkp8V0/0WRjKd/qU7AL4UasQ1A8iUxzGhCrtJTTFg9QpIGNc0U
 TafaPCXL48Q32gahbtYDLKFUV0YjiSo4fF1qkNJ33oYZNS7cr9xoPCzojOEZSagUyCCm
 2aZodgFr2c3uc5uACeE/6RGbNKGGUJSNyyW8af+kSgZ3WD7Z20SealOH64GakhEv2WA2
 NPGdJFf4v2x3KvMek0E6nkEt78+wR3E+bDbIR92ayRdOJKAWrzzUNEW+U3WfzqhMUfEU
 n8UQ==
X-Gm-Message-State: AOAM533rEQauCtY3v0upeeXLx/O4JoOwnEnxRqcnG0W0Eyf/dZyH27jj
 oe33PGhcMXXwK23PfvgqlDWzL8fMI1HNkBzKnjs=
X-Google-Smtp-Source: ABdhPJwffi86mFRbDle8hMjYGFKm5szdo3bVw0+S/yXuHOsZS49KKF4JbFUWwoqffZqb0Kmgl5xOhl4+o+rMh8GOUjs=
X-Received: by 2002:a05:6e02:19cc:b0:2ca:b72:1547 with SMTP id
 r12-20020a056e0219cc00b002ca0b721547mr15622706ill.113.1649737370274; Mon, 11
 Apr 2022 21:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Apr 2022 14:22:24 +1000
Message-ID: <CAKmqyKOFEheM1SeVuEt9o0G2FWeDyzhHM0NF5p9c550v_FVyJA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Exit if the user provided -bios in
 combination with KVM
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 10:18 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> The -bios option is silently ignored if used in combination with -enable-kvm.
> The reason is that the machine starts in S-Mode, and the bios typically runs in
> M-Mode.
>
> Better exit in that case to not confuse the user.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/virt.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..09609c96e8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1308,12 +1308,18 @@ static void virt_machine_init(MachineState *machine)
>
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
> -     * so the "-bios" parameter is ignored and treated like "-bios none"
> -     * when KVM is enabled.
> +     * so the "-bios" parameter is not supported when KVM is enabled.
>       */
>      if (kvm_enabled()) {
> -        g_free(machine->firmware);
> -        machine->firmware = g_strdup("none");
> +        if (machine->firmware) {
> +            if (strcmp(machine->firmware, "none")) {
> +                error_report("Machine mode firmware is not supported in "
> +                             "combination with KVM.");
> +                exit(1);
> +            }
> +        } else {
> +            machine->firmware = g_strdup("none");
> +        }
>      }
>
>      if (riscv_is_32bit(&s->soc[0])) {
> --
> 2.32.0
>

