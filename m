Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCC3B64FF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:16:36 +0200 (CEST)
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxszz-0001YY-1O
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsyN-0000Md-5x
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:14:55 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsyL-0000SF-Nt
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:14:54 -0400
Received: by mail-ed1-x531.google.com with SMTP id n20so26461013edv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CLBqapnLz6LITEuIky+AG1685Qs+0CAU5gWBkpiZh9k=;
 b=hRGVtD1b+bA4Few6Taq8wU1MnNyVuOJ05/6Sd2GZExjDIDbDTL5CCfvlk2dlO9/toU
 if3tZyYfvOQ0ORaqUw38PN7w5Rx4KpMuZUwpo8T72aEDHvoWkfKl7MJzCFJ55oGZpwll
 6JKqGe18+ZnzTFrVfzhHlTa7wluBhGcuU8md1g8+QvLqmlv69iOoxK7rz/wCQH2Mutkh
 4OB12s67chJC5nMuN+LUhvtH5epc7rp2Nsvex5Id2grJVY+WNeOdm4C51XwwinxE8bA1
 4FtJS/C7ISBmVgz2wYdy52YbQNGMRs/xvFSgB0ig2fAbwc5NCtg9/31wkOFxaSGa79n3
 kQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CLBqapnLz6LITEuIky+AG1685Qs+0CAU5gWBkpiZh9k=;
 b=bzAPfboRb++Jy8gtnJ0J/BLXwJ32pCdJLTM6e/3lagGrHNyF8E2e+Ip5hl04vQMCtg
 CQaEreP7u4ntKzd2r6xySll2PNMXwszLhc4SsnWr57toYM12C+MAxPuWGmrJUCsAnxTJ
 WX2fQCMjHex7POKfw9FCmW73UgfBJY+1BzNM8cvHZmINxlw+Enj0UYHezBhSG6wW8g8D
 Vb47sTfm9UVh6UcpBvhKfaaSrkz/rxcYqYdxl8+mRHIXzVMRrwL5breBURdABfkxHALn
 Gua2yGTuRVaBZAiHyzuX51YXMbVfz3v5AhGkYn8lZn1EibkZo5QMF8kn1cKK/AN1VhQ1
 5QAg==
X-Gm-Message-State: AOAM531xrhv4QOeEuqSoe3Rd9uLyKHaKRwwsYd647gdVYwFi3CDoFs31
 TcyVnPCJlEbDTc8xkJ+XioQmijq06e2DXDK/UCxguw==
X-Google-Smtp-Source: ABdhPJwl2aHYZHAk942HYAHzFK9eV4hFtS7erHAZHFsKiuzyIqgizf/bOxbV1O3QgFByhsSlgHLWF5ojnZJ5/k9QQ1g=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr33239320edr.204.1624893292223; 
 Mon, 28 Jun 2021 08:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-2-richard.henderson@linaro.org>
In-Reply-To: <20210620221046.1526418-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:14:15 +0100
Message-ID: <CAFEAcA_stA8gXZ_pxf2tgQm5L=1+HBK_+Uuepgy=Rh+DmzqZfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] target/nios2: Replace DISAS_TB_JUMP with
 DISAS_NORETURN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 23:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
> which is the same as DISAS_NORETURN -- we've exited the tb.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

