Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C731CA26
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:50:30 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBys9-0008Fk-RJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByq8-0006xl-ID
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:48:24 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByq7-00088e-0J
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:48:24 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z22so11666628edb.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v533qzhEK5fVDDmpqwF3OicINBYKkbZfi2Vudhdxi6g=;
 b=EaEme5p5ceO/D98p+STTZnDJn4ahUCmY3yTPvUwDL4tkkdOuT9BFuMTHh1asNop0XH
 CULbLNBxQ4NtCux/El+U9MVLlNE5ZqZm0DB+B0MSSiG9Hs+ISWCwPEQJgdzqheiXmb8f
 lA0uRfSlzp3OmCmOQQzX9W47wHpALomytJ824Emxlb2Dn4IV0RRljVbHBimxfdadr9SN
 WL7ZDeEepzd8iCFQyqVjNOLmcWPwVXuZ3eKRSH1Xz+kNKMZNAHXK/hO03r0ajqgvoEPU
 htwkXC3QYxIRUc6wuvOWsrxDn9AorXZms0pC9cQ6ijMS1BW2akSdkEzKk7nejtvGuWrP
 81gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v533qzhEK5fVDDmpqwF3OicINBYKkbZfi2Vudhdxi6g=;
 b=kf6BpeTK7mscDyCpHNVlGQ/RnfBK7iplDqHHJFYO5wU61iQ5GDlWjiaeQOLKBvXPID
 GGntz7+pBYHdoKCzlJ2p9QWwHeLHx3giod979m6/joP1cbj253PKRYFev0cCJ83tAKvN
 pnjfDdapTdWT2ZAEKxTlp+tcO2UOTIfIlfAOgmGiU7nQ8Mr2reS58URgfB0P3vY5qvXl
 L8IfPLg6VnHgWsesrmSTdzD4u6IJcwUR0rekwwmDL5hzcy0XUtZUAzMhevA4C03C7vCY
 PF6/jTmZF2P9i6ng+MbvUOxE/4hjEKZ9jb8GOHEAmm93+18LxIoAPgTWMq2jpy+ivYni
 W7cg==
X-Gm-Message-State: AOAM532Soux9ne9W1WX8qqm1CbH6ZDRymwy51zucYncsHymXEnIHkYP+
 i5xOyR9jG4JBNnzpRRNy2+dEOwXs/4Cp8sGReCGsiw==
X-Google-Smtp-Source: ABdhPJyLCIhndEYLtSmL3K8iwGpi9dO94eM/o+5qFX4QHvG2rVe2Sagco/6d/Vmr2L7IU/nlOhEuJzgBNw18Q2YyIIQ=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr21076484edc.146.1613476101521; 
 Tue, 16 Feb 2021 03:48:21 -0800 (PST)
MIME-Version: 1.0
References: <E1B16679-A55E-479C-9EAC-BE7BA9D71235@icloud.com>
In-Reply-To: <E1B16679-A55E-479C-9EAC-BE7BA9D71235@icloud.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 11:48:10 +0000
Message-ID: <CAFEAcA-OE+NGfbgjEuydjCfpiR_kuFVsSxYwE-PfvQSX-rzHLQ@mail.gmail.com>
Subject: Re: Fill tlb for data and io address
To: =?UTF-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 11:28, =E6=B2=88=E6=A2=A6=E5=A7=A3 <shen.mengjiao3@i=
cloud.com> wrote:
> Look at the store/load helper, it will use the tlb entry to do the addres=
s translation(from guest virtual address to host virtual address) but where=
 the tlb is filled for the data ram and io address, I know where the code r=
am is filled(tb_find->tb_lookup__cpu_state...)

The common QEMU code calls the target CPU tlb_fill function, which tries
to translate the guest virtual address to a physical address (usually by
walking the guest page tables). If it succeeds then will update the QEMU
TLB by calling either tlb_set_page() or tlb_set_page_with_attrs(). If it
fails then it arranges to deliver a suitable exception to the guest.

thanks
-- PMM

