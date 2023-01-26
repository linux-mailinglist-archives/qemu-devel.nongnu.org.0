Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB667CD15
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL2n2-0007kk-VM; Thu, 26 Jan 2023 08:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL2n1-0007kQ-Ej
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:59:43 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL2mz-0001KY-Q2
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:59:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z5so1860584wrt.6
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 05:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HhrKYTiL5fjb/b/u9TFFmf63Lfa6hLeFQkshp+FuWE=;
 b=dQTJei5dnLtBPdpjI3ApjPXJdqfMEtpEzytsruwihPhN766ojAozrQuq7nK5nh/AzC
 KMLK5+yoIRXrX4vCSMFA9a/Ic81MiGiKDWJOR/V/NMRhYUpN8mFiMxm3sPzbyvFO7/n0
 F+MEyfnutl31LNKCpj5dTPurgcCAhzKvHy+NWtD9skeaqZvbHUZIUa2f4c+mD9ACdzW9
 +BA4YzxuJwRWe0leAso1K2a3EyIGAPxExUPmIy8ZRZA999Tvr+1sxr5ojsCncbZJcYEI
 CKyhnTXO3EvUotml7q9mN0S/WvDmVxLlRxYY1lgNVviduAEpgLWEqLxBnTIHRGjuX4sf
 xWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2HhrKYTiL5fjb/b/u9TFFmf63Lfa6hLeFQkshp+FuWE=;
 b=KiSN/Ykz2DW2BTrzEDcfZ+QrZVXEaFU3Q7403PhuhkDY4SIGUugD1frRIEeCm4U4vl
 kpSMbcSXtkxX5Qrr++iBkL8B3RZqrIzkFS7EAA/vVqaHH7lJEi9mZILRydnbwH/LX17O
 LaXDvJwiK1a2viqwwo0Mv3N49ZtWstgvlOvfLC+wZ9/wclXdQComKUFLK3NkSscZSLjw
 2Fv4y1UVCNXsjhTVCWva7hbUVFTSPJUuFo0zk+r+EY5CeTvpAvkwaAzl3ti42rzPXnW/
 qrFyB/sI7AmUeLcf4SBtUQGZ4qMaiiSuu//EWzlrXkXF5H5XCrftsV/qcwme1xM+ToEM
 qioA==
X-Gm-Message-State: AFqh2kqB+TOMgNFM/ckbNcTDg+Hfv2WS1j/yiEF+MFNbqwmkHCdxLJ5B
 KmMLZbpChirLeLfMEo/H3lHopw==
X-Google-Smtp-Source: AMrXdXvGO3lZXg537C8hHQMHahpVbVH0K2bf6SGueG7QjSZ7z0FR0MHIUClefuaNNJXyGdjSJ95QQQ==
X-Received: by 2002:a5d:59c3:0:b0:2be:1535:e5b3 with SMTP id
 v3-20020a5d59c3000000b002be1535e5b3mr36843863wry.41.1674741579907; 
 Thu, 26 Jan 2023 05:59:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h1-20020adfe981000000b002bfb02153d1sm1668177wrm.45.2023.01.26.05.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 05:59:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EC7E1FFB7;
 Thu, 26 Jan 2023 13:59:39 +0000 (GMT)
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Kevin Wolf <kwolf@redhat.com>, John Snow
 <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: no more pullreq processing til February
Date: Thu, 26 Jan 2023 13:57:02 +0000
In-reply-to: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
Message-ID: <87pmb1pfas.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> Hi; we've run out of gitlab CI pipeline minutes for this month.
> This leaves us the choice of:
>  (a) don't process any more pullreqs til we get more minutes in Feb
>  (b) merge pullreqs blindly without CI testing
>  (c) buy more minutes
>
> For the moment I propose to take option (a). My mail filter will
> continue to track pullreqs that get sent to the list, but I won't
> do anything with them.
>
> If anybody has a better suggestion feel free :-)

I've submitted a support request (#366644) to GitLab to see if they will
give us more minutes for this month. Longer term ideas:

 * Reduce compile time by reducing number of identical object files we
   build for specific_ss
 * Move more tests over to custom runners (don't we have an x86 box
   somewhere?)
 * Carry out an audit of code coverage for different test sets and
   rationalise our CI set

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

