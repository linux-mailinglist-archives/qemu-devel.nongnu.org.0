Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C43D042B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:01:14 +0200 (CEST)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xnd-0000tP-Mw
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5xlx-0008MG-Id
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:59:29 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:35496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5xlw-0005xf-4y
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:59:29 -0400
Received: by mail-il1-x131.google.com with SMTP id a11so639825ilf.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxkyS2z1nF4flTEQiZoZ2cZP25iv7to8KiTSHNURKNY=;
 b=p1F43tfRZcIKt6lFakubFxtvLhZfGB4Pj6gtTidYvdb7bZRHuTZUSrYO6L7XIoAQ0Q
 pTnSvazUXlL5U4v6nCbvDxXSmiwlevFxCYwZzTuCV+IYZCr9gqxKuUJZ+Fle07snfx9q
 Okc0xS2jirtSRg1ojjj6omFnWQ579T32fCPQelTmofhjuMxa0odMYWMMNApVMs51jbrY
 gl6JkQ9wPXLd9pl2lfY1SSh6d99yfDKfYkvGiRuVOaoGZXJBXCtLQjf0HKsjsaFPVoOh
 9Gz+p9Ymy87CnABT5IYSPf+O9gbCXAofDMrNGzzKLXxSeVTi5JOYE5dhN3CT5bzYEqDE
 REkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxkyS2z1nF4flTEQiZoZ2cZP25iv7to8KiTSHNURKNY=;
 b=httfLXSL6m/s1Qm+JJsJ0mjZ1Qf8QQOytUVxdC4mgEl7n4uSpf2FUj6pA7d5qLhqoC
 +OrV/k/F27uydYFpn2lsx9Ze0CGq/OjVa2hWvWdNJHeglvVwd9izOGkPoU4A6DAJczXh
 WGBlD2JV8m4Uwk3tdsv14P9qJKuQBpMQpjpkRUQnG3d8O8KDGvO5ddn4OVAD+mLjjK+Z
 7oZSnrVtQ8Qq8OGZyRNlAGmMZSfybE/aBJeDUStbKMEbtczdKa9I7LGeOHZfq4NrHLue
 22vpI0EYYy+Y9z5Av7Wi4tqudkcbgH9exG9YXQmwihLKSiiJQ40KxC28eyIdaQRM01cr
 mbVQ==
X-Gm-Message-State: AOAM532fuT1Rikk+S12kbuoClpu7ZXCokMP5Dwv+82ItgM6JT5WI86N3
 VW+fldr8r/EJ6kz5nA805TyvCwWifPzT4o+tIGt+B0I+qoQ=
X-Google-Smtp-Source: ABdhPJxW+yNaeNNVCjo0Z3h2Ua6LHwesNQ88cvpr8FxHSw7qj7jRdbfD0AVGpcFTMgqg8QppNkOfHNykOxIDdMpfsAg=
X-Received: by 2002:a05:6e02:1529:: with SMTP id
 i9mr21619459ilu.163.1626818366896; 
 Tue, 20 Jul 2021 14:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-12-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-12-armbru@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 20 Jul 2021 23:59:16 +0200
Message-ID: <CAM9Jb+iWnSQH9NfPtC5Q21-2Z8B2P6qh=Saty+24rOj23DQpew@mail.gmail.com>
Subject: Re: [PATCH 11/16] microvm: Drop dead error handling in
 microvm_machine_state_init()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Qemu Developers <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Stillborn in commit 0ebf007dda "hw/i386: Introduce the microvm machine
> type".
>
> Cc: Sergio Lopez <slp@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/i386/microvm.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index aba0c83219..f257ec5a0b 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -458,15 +458,10 @@ static void microvm_machine_state_init(MachineState *machine)
>  {
>      MicrovmMachineState *mms = MICROVM_MACHINE(machine);
>      X86MachineState *x86ms = X86_MACHINE(machine);
> -    Error *local_err = NULL;
>
>      microvm_memory_init(mms);
>
>      x86_cpus_init(x86ms, CPU_VERSION_LATEST);
> -    if (local_err) {
> -        error_report_err(local_err);
> -        exit(1);
> -    }
>
>      microvm_devices_init(mms);
>  }
> --
> 2.31.1

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

