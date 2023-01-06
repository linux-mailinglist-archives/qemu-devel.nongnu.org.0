Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184236603F9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 17:09:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDpG6-0002gy-DQ; Fri, 06 Jan 2023 11:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpG4-0002gU-IT
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:07:52 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpG2-0002uf-QN
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:07:52 -0500
Received: by mail-pg1-x52a.google.com with SMTP id e10so1425345pgc.9
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4dlax77H4uvXVWqLO9PEEXMPFfDkYTs2ZfQKRtkiG7w=;
 b=BQplH//ZFRL5mE/x1XPDjWOYk+WhSGI9YbzXa18/ASGw6T6zXlDyO/TdJJ63wdDwWL
 7Ubqj/KhKxdBrrZJWpm6lrMP+whypHb4puPuvKW5zia0m23yQUD8BEtC6TdD+lu2y+P2
 +QOCteUKAqgePk983oakwmeqyUJXM7LiupEpoHJaPquG11Q3vCg23vvoiIawcsYHPDe1
 NmhAUSB8EzGkP7ZI6XgJZ0pG6tTv7YbceqKIqOrYWq5QcA+niIdPo+XutxFgLtH9RDI1
 rBTmdydV+bcysR2ogV/5tQnqxR9F4cE7WiF3V4V4aP/0m8HhDMJoXZmrEZBNf1tXfkzT
 kd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4dlax77H4uvXVWqLO9PEEXMPFfDkYTs2ZfQKRtkiG7w=;
 b=Q0v2PfQjJi+1tao0pHdFKAtVJmuH+Mdp0ltR87Dq3u3OytegCI6XefH6x/E8QqShqx
 3c0fRqvRFcHLGkwI6EloN/C1LavYZEn5hjJnROq6wcone/0LHZt55kdLYR6g8aPgtu1r
 o4NoXTEX4mfEzStwpmoqsA34kHZUZaU1agph/Q5RzsyL61gKX0jx40RJsL2OoOt/bmb5
 qkgmJqNqI4ml9yk9d5h8/UBA0oKX01B6mZTwmhcZgb4ICqna5d1jwYfnYbnmDXWZR2/f
 jTxfBTeIVaXXxC2af1IcrCd2udjxCD6ftJryDIarkgYHoEbIfjSEwMOro3/4e4Jgkj4a
 i+0g==
X-Gm-Message-State: AFqh2kpzNctJ0yAoAy9Ib6for5aEbUovaisWViGBOMWsnl3Y5dAKQ9kw
 RaKX48zGAHJu0FhFNlCaUZ9nde4v4cIavh40MnlIRA==
X-Google-Smtp-Source: AMrXdXs7CYxV9upsmxO1DUZA4WAulsZo5Sx7vKzGzp7tYu3jkE4khCPGfJjFlkuW3cwh6RHYE9zSR+KLjsXt0dtEgzg=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr3553633pgh.105.1673021269424; Fri, 06
 Jan 2023 08:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20230104190056.305143-1-richard.henderson@linaro.org>
In-Reply-To: <20230104190056.305143-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 16:07:38 +0000
Message-ID: <CAFEAcA8xvToadDqUd6hLJNF8QdCyXBN5dj4hoRaBCyUN3SsEWQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve_probe_page
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, idan.horowitz@gmail.com, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Wed, 4 Jan 2023 at 19:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Don't dereference CPUTLBEntryFull until we verify that
> the page is valid.  Move the other user-only info field
> updates after the valid check to match.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 14 +++++++++-----



Applied to target-arm.next, thanks.

-- PMM

