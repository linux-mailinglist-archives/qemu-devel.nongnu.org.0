Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C64622D20
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 15:04:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oslfd-00046l-Gj; Wed, 09 Nov 2022 09:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oslfb-00046Z-QH
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 09:03:11 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oslfT-0008RN-56
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 09:03:11 -0500
Received: by mail-pf1-x435.google.com with SMTP id 130so16769684pfu.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 06:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UNXjrRtkEp7TNBn8iKA7DfH8iwn8nN6TAUHuRgSlY6o=;
 b=BDp8i2sc62kNhTTCosDFW3PRGQDMLD3zbUPgW+p+QxILeJ7UIvuJkT0utc4QbksmJM
 kRFuaN7mI5ub5vse2NVugjUwGGovGkv8bynRf5VLD+r7POQM735m2aFu3QnnYB+CEm2t
 7LfK9wf5b7FDB4Bwi08b2HgXDyGdgiyLayYlBSEGXdGBoR5GJ6xs9OoATqQEeX8O03dZ
 IVFAVPXgQl8LtaUEieK4oGXUcxyg4YftsIXCbRk4r7fmu1OeeZq7sq+uRuYeiTAQE3z0
 20n0tO3sOqliljyi4n3WfV04QtlATXJBrRLavYCDfMvhGvwF1ceV2tH9WKSc9CcImObR
 BGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNXjrRtkEp7TNBn8iKA7DfH8iwn8nN6TAUHuRgSlY6o=;
 b=xGSeIONZonwQR67N7S9sYdB6Sf/j7Gj8bk99fL2VsaPSwdA6Dtuyqrpm+jy64aboL+
 cmfsSKQ7OPzEfU4LGb7NjGk/bcrLDxj4CfaJJoSGUFbgCDtXJvvTddYwcBOlLXDmtxsX
 WuLgXKgbjUcmt6BViECDRFB5GL2iDaL6mTHodROow27cQ+dWrLVqCztYTjIz8SiwFkjv
 L21PUjJNzUyEfqVubZfv3YRVLVObeJGj3/P9N889ZK9GTX1jPy5hOJl0OMm9YXlMEpBO
 ihAYEpQ0JXesRj4kFSqy8/bauPc9zI0iiz0/zQW7CZbj+LWe6+W2KaWAbBuoWySDAdff
 AFwg==
X-Gm-Message-State: ANoB5plRJ8l03lfu1tKvPTSaKua3Oh181dXSNm/bqHvKvvdYJA9qJRLN
 o0JJ0zNpnYXbz90i805FvQMRvmqfut1raO6mO9MZmA==
X-Google-Smtp-Source: AA0mqf7HghSWmojeyFf3XCbJY+TkJ6l920/YVI1r/Blxiv8rX/e1p8NGmxm5Bi7QXxEipOvtQuQ8zDxXbIeY5LyYBIU=
X-Received: by 2002:a63:81c6:0:b0:470:537b:9afc with SMTP id
 t189-20020a6381c6000000b00470537b9afcmr19376937pgd.231.1668002580943; Wed, 09
 Nov 2022 06:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20221109133525.762667-1-quic_llindhol@quicinc.com>
In-Reply-To: <20221109133525.762667-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Nov 2022 14:02:49 +0000
Message-ID: <CAFEAcA9Yvr01s=4FAiutLi=Owtt5RhUGAoV-3vREStTyB-UL8A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] hw/arm: use -cpu max by default on sbsa-ref
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <LeifLindholmquic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, 
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 9 Nov 2022 at 13:35, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> From: Leif Lindholm <Leif Lindholm quic_llindhol@quicinc.com>
>
> We have mainly (well, as will become clear, in fact "exclusively") been using
> sbsa-ref with the "max" CPU. But sbsa-ref was created with a default CPU of
> Cortex-A57, which we have not updated along the way.

So, I don't have a strong opinion on what sbsa-ref's CPU type
should be: if 'max' works better for the use case we should
change to it.

> However, the "max" cpu has seen a bug where Linux boot fails around UEFI
> ExitBootServices. Marcin Juszkiewicz has found the cause for that, but that
> requires a patch to TF-A. (Has that been submitted upstream?)
>
> Turns out that due to a change in upstream TF-A last year, all supported cpus
> other than "max" fail to even boot UEFI fully, due to the top-level (TF-A)
> Makefile defaulting to enabling the maximum ARM architectural version
> (currently 8.6), in combination with not verifying all features at runtime
> using the ID registers.

This seems to me straightforwardly to be a problem that should be
fixed in TF-A. "Default to the newest possible architecture version
and don't check ID registers" is a recipe for "can't boot on
anything". Many *hardware* CPUs aren't that new yet!

Part of the purpose of sbsa-ref is to find problems with the
software stack -- so we should expect that sometimes the answer
is "fix the software stack", not "change the model's behaviour".

> Since the *point* of sbsa-ref is to serve as a continuously evolving platform
> tracking (with some obvious lag) the evolution of the ARM architecture and the
> SystemReady specifications, I don't really want to restrict the enabled
> feature set in TF-A to the Cortex-A57 one.
>
> My preferred course of action would be to change the default cpu to max -
> maybe even dropping support for other cpus. I would then step the version
> field that was added to the DT. *But* this would break existing boots with
> old TF-A that can currently boot Linux.

An intermediate option would be to move forward to for instance
the neoverse-n1 CPU type.

If you want to use 'max' for sbsa-ref then you probably also want to
look at making sure that TF-A is doing the same thing Linux does
where it checks ID registers for feature presence before enabling
feature use, because 'max' is a moving target and relies on the
guest code doing the right thing with feature checks. In particular
it does not honour the nominal architectural requirements about
v8.x/v9.x levels, but may implement features from further in the
"future" than is strictly permitted given the absence of some
other older features.

thanks
-- PMM

