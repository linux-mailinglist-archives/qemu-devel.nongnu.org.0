Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20267948A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 10:52:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKFyL-0001GD-NK; Tue, 24 Jan 2023 04:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKFyG-0001FT-Qv
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:52:05 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKFyF-0005B1-4q
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:52:04 -0500
Received: by mail-pl1-x633.google.com with SMTP id a18so1648734plm.2
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=61HFkIAi7XPzYJ3+cbxhG0j/N6HP4KtHnqpSvo0/Yrw=;
 b=koljb1FxQFbwHinblogie9g1L1cHKPGQR2hYytZmpWPFw1sgAWMBo4f53IbXFD7EwB
 hxCItRZLAKBv6E1bBwWYm7RJeIootZ0ScdSBCnJJz4RrCHqM6oenB42fbdCCupv/jKxR
 5Uf8BgYXTUYS2EF13YvVB7BvW0Lgrn0YMF5FFXl+dEbHV7E+CIhi0voGNC6NCkr9p4hs
 QOG8IPUzxPUuYtJRcj9gNL7zpfi7yeFLa0KZQ9ap1hk65uw5BgQcxXuWBl1YSidx5Ous
 1SVrm2JaIyv6rsCN+D2UaFRab8VOkx6pcKypOYI1JX7BAMyrgVdpjULt8hx4ZfG4tsFH
 GsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61HFkIAi7XPzYJ3+cbxhG0j/N6HP4KtHnqpSvo0/Yrw=;
 b=hBCTufT0KS+H/fAHkqR031L5hvb8p30bEWHFOH61AfZXWTi1Z9DDraS3x8R2I95uLA
 lGOBZGXRZDLiNUnFn7IXyCcFIvLPHBzT1Y9Df5Drcrr1JTxhkvpitLGTD0Vff3arv3g4
 /X9raQ1nzsU9GY5QMyVTyb1DeqybsflKf5hG0XIw127Jrr0mUwKrVYynp7e+eYMNk4sn
 UFx7AR//h+2yov4W8u5590gncgrFbm13LW0INeZH4GrtVtgS5dqTgqySIr8+9CjQ6gW+
 j3RR8iPTQDivM6DAerlIoL1u2bmnWl7yDvNrwjHCWNMD23rBtjquJ8wxAMeeafDx0R6U
 I3LA==
X-Gm-Message-State: AFqh2kqIfN5y40w1+3xdvOXPr7Z1d4/ZN5raz2hlAfV4pCTR5IIiHapm
 Eyt88+H9kK5yrDIYoyUhg9KP0Gk8gBoUnBuczAHBSQ==
X-Google-Smtp-Source: AMrXdXtcrPXhpe5YH8Oju7j8V0tsIgHiZzP3PCpDsSYX7txhbezXa4TxtHlPFjQ55EPMeRot07W4GTUJVm95lF+H36w=
X-Received: by 2002:a17:903:1053:b0:194:5066:2630 with SMTP id
 f19-20020a170903105300b0019450662630mr2917051plc.28.1674553921770; Tue, 24
 Jan 2023 01:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20230123201431.23118-1-anjo@rev.ng>
In-Reply-To: <20230123201431.23118-1-anjo@rev.ng>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 09:51:50 +0000
Message-ID: <CAFEAcA8MtUy_xugp6zPQaUuq6sSU6+VgCyb1eUUDK1xPngN_Pw@mail.gmail.com>
Subject: Re: [PATCH] block: Handle curl 7.55.0, 7.85.0 version changes
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, ale@rev.ng, kwolf@redhat.com, hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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

On Mon, 23 Jan 2023 at 20:15, Anton Johansson via <qemu-devel@nongnu.org> wrote:
>
> * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
>   version, which returns curl_off_t instead of a double.
> * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
>   favour of *_STR variants, specifying the desired protocols via a
>   string.
>
> Signed-off-by: Anton Johansson <anjo@rev.ng>

We should note that this
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1440

There also seems to be a different set of patches that
somebody attached to that bug report, but yours wins
since you actually submitted it :-)

thanks
-- PMM

