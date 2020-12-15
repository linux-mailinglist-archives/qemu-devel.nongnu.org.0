Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACE22DA5DC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 02:58:04 +0100 (CET)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kozbH-00044V-Mo
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 20:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozY5-0003Va-2P
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:54:45 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozY3-0005cx-GT
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:54:44 -0500
Received: by mail-il1-f196.google.com with SMTP id q1so17773003ilt.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TfYmIM1uzBB/G8KOhdeU9RhkTvdK7y6e2jl55b7uF5g=;
 b=G3B9MJwdVefzrRT4TxI2kOA/1gqGd0Xt2evXDEU6WcYvJFupxzQA3FGzEwHHoY4Cws
 Mw3cr/ccLafsLGWtgRblALe7wtF664A0L1sncOnwmhLIuS9QZVV51L8xA4pysbTRuntI
 fmp20PJGtmRbaxqwhljb//fBcBBt/tT8nbuQjUHrdJLGnOMai1grUmmhVXzYzHaH+9m2
 Yehk6LFe8Q83rRi+4wrHt6V75VLi1G16N0ujFCOG246aeRLQcJSDucVDFueFlEJgPM/d
 SK9cKujBQdx1pCIB++Hq31IUDl9pgfSVBn3uGEcjTB5dO6CiHDaj/QdUBIb5aGDI4BS4
 cu8Q==
X-Gm-Message-State: AOAM532tbLqAOdY5Sdn/SqdxPRHbXU3ts6PIFObaxyO3+G/sCzMQMWcs
 AJEiOlnPnmbJS5FFIzO2QPQf/LZQBaE=
X-Google-Smtp-Source: ABdhPJzR3oHez53PQ5WIJ4Af66qZfT39d3Xod/OQdL5t3uK59y4er6O4pMfwXrcnsa1ZKqQmgxckFQ==
X-Received: by 2002:a92:410b:: with SMTP id o11mr25980718ila.306.1607997282489; 
 Mon, 14 Dec 2020 17:54:42 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id c6sm10561794iof.29.2020.12.14.17.54.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 17:54:42 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id z136so18937313iof.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:54:42 -0800 (PST)
X-Received: by 2002:a5d:939a:: with SMTP id c26mr36735350iol.63.1607997282121; 
 Mon, 14 Dec 2020 17:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-7-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-7-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 14 Dec 2020 17:54:31 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAu9qY1G8YWwn33-=0sK8o5uaeX+xMmxGErwC_YWENbgQ@mail.gmail.com>
Message-ID: <CA+E+eSAu9qY1G8YWwn33-=0sK8o5uaeX+xMmxGErwC_YWENbgQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/43] tcg: Move tcg epilogue pointer out of TCGContext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.196; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f196.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This value is constant across all thread-local copies of TCGContext,
> so we might as well move it out of thread-local storage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h            | 2 +-
>  accel/tcg/tcg-runtime.c      | 2 +-
>  tcg/tcg.c                    | 3 ++-
>  tcg/aarch64/tcg-target.c.inc | 4 ++--
>  tcg/arm/tcg-target.c.inc     | 2 +-
>  tcg/i386/tcg-target.c.inc    | 4 ++--
>  tcg/mips/tcg-target.c.inc    | 2 +-
>  tcg/ppc/tcg-target.c.inc     | 2 +-
>  tcg/riscv/tcg-target.c.inc   | 4 ++--
>  tcg/s390/tcg-target.c.inc    | 4 ++--
>  tcg/sparc/tcg-target.c.inc   | 2 +-
>  11 files changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

