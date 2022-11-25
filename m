Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284106383A0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 06:51:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyRaK-0008BX-N4; Fri, 25 Nov 2022 00:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oyRaI-0008B0-17; Fri, 25 Nov 2022 00:49:10 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oyRaF-0006nm-LH; Fri, 25 Nov 2022 00:49:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p16so2664128wmc.3;
 Thu, 24 Nov 2022 21:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zhwVHiOtpnVqVljLdJ3xbieIoCoeaZBKEIPuap/SjmY=;
 b=bdunAp17BzBH7HxdikEtxVBcYxDpIEXY4DXgjLJvWijFTXJKvu0CiUY44kaVpRG5Ga
 PS5Y0dexwD3hwUXCsMPaUQVxyAlSWDM6GOrFZfar8BntFRJASEXiJnP4BkX9qKsezegD
 GvCIE6KEQCd3892VqFBhitDORwa2ANev8IO1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zhwVHiOtpnVqVljLdJ3xbieIoCoeaZBKEIPuap/SjmY=;
 b=6ywRnVgPBJuKwFeot+xZrrGgARwdWPRp0ZBKTsMMtGZrlZ4YkKAcsymlxs8DZJ+cEj
 llifcnLWJ6p6xKD4a67Flgbb7lGXSfHt4V7sOAqlgQ2xvZGNkwOYhwGhf/1RR+K+s5c2
 ykMUg42t7XSJ7aeY/3oIvFDhppaRuwuVgf3kGpoHx+d6UQDsxjLqYQ2WebXt6wyxPYUh
 VvJS6gbIcKQA+rBZ4QKSrPjCShIPxoMwwFn51mJfIC8bPPDcEfBEkP7RjETVWNlkvf8Q
 4ajpfTUaN92XVfQY+hL2DYBN6O2fvoZ8Psmn6jNsYoP7YdIoSKa3tLAIzA6Dv4VpVAjA
 XjpA==
X-Gm-Message-State: ANoB5pm/DbV0JDgSWDehRiqCLHXJPhdU001axwFvu2o7W+Kkaj3Gtswd
 N7utE37VWMvEO9mgeqQLqcP8sENcJkpyjcZpT6c=
X-Google-Smtp-Source: AA0mqf4uRrG8CGxv7RMGOOMEpNJ3PqLWEUtJ3xwx5vjzrSPek1+5iXHOXRSapdrMje+QMV0hRavMpugA7Fo/OXMU76Y=
X-Received: by 2002:a05:600c:3495:b0:3cf:a258:99b with SMTP id
 a21-20020a05600c349500b003cfa258099bmr25602384wmq.34.1669355345216; Thu, 24
 Nov 2022 21:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20221124055143.752601-1-nicholas@linux.ibm.com>
In-Reply-To: <20221124055143.752601-1-nicholas@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Nov 2022 05:48:53 +0000
Message-ID: <CACPK8XfvqyC2ykur9xP_ha4aut9ZqCqtpXmYnF8x2RZM83xBbg@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/ppc: Implement Dynamic Execution Control
 Registers
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, danielhb413@gmail.com, 
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org, 
 victor.colombo@eldorado.org.br
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.209,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Nick,

On Thu, 24 Nov 2022 at 05:53, Nicholas Miehlbradt
<nicholas@linux.ibm.com> wrote:
>
> Implements the Dynamic Execution Control Register (DEXCR) and the
> Hypervisor Dynamic Execution Control Register (HDEXCR) in TCG as
> defined in Power ISA 3.1B. Only aspects 5 (Non-privileged hash instruction
> enable) and 6 (Privileged hash instruction enable) have architectural
> effects. Other aspects can be manipulated but have no effect on execution.
>
> Adds checks to these registers in the hashst and hashchk instructions so
> that they are executed as nops when not enabled.

I had a look at these and they appear to follow the style of the
existing code. I am no expert on the target code though!

It might be worth mentioning to reviewers that these registers will be
exercised by the Linux kernel with some upcoming patches that you're
developing.

Cheers,

Joel

>
> Nicholas Miehlbradt (2):
>   target/ppc: Implement the DEXCR and HDEXCR
>   target/ppc: Check DEXCR on hash{st, chk} instructions
>
>  target/ppc/cpu.h         | 19 +++++++++++++
>  target/ppc/cpu_init.c    | 25 +++++++++++++++++
>  target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
>  target/ppc/spr_common.h  |  1 +
>  target/ppc/translate.c   |  9 +++++++
>  5 files changed, 97 insertions(+), 15 deletions(-)
>
> --
> 2.34.1
>
>

