Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCED3B734A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:34:32 +0200 (CEST)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDsl-000345-UV
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDpf-0000pC-Um
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:31:19 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDpd-0007Li-Lz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:31:19 -0400
Received: by mail-ej1-x630.google.com with SMTP id b2so5072282ejg.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FyTAxVgxJGO1CtR6lMZoiFRFV3qxNMOpLntBBmJ3x6U=;
 b=sGWP759nv3kqawf76tXUzAZk35sFkVothzYbnuuZyiZCtP1txOQ4WqWrIBER21+vOF
 xiYAHst+TLYjULCgQzqoHyteKz2rsoU6tcyYV136gcyNmWZP1fg+x1bkCxOHLC+9dx8S
 Fmdt11EIYiCwG/L4+IBbaagYmCT+bJdEzv4s8q8AOUwwGz4MXSpa8NqIed+KpncAty9C
 /VESUNLRKnozrdxH2DbEUmzREy6o5FwcST4E7SdC4PGY3PGSu3jdUT7wtZlZlJ4ih7Zy
 4OVZnnsPEbKMkKxe6LoKT7xgYglwrsT2REloIB1wkECoEX3EvhFj4xTikkP9tWZG9Gr7
 ZmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FyTAxVgxJGO1CtR6lMZoiFRFV3qxNMOpLntBBmJ3x6U=;
 b=TzTrQH5Cl+bpNC396b9+9mjNL3uREx+MTdkfPpQt+CHCzhIJHtcsJvoRa7QUMd2Xtp
 IkjRMiYyW+hV01ZZeFzMgwZPgI+aoWh0vEAsSQGfRW+H5AJoeAI2gABkrWpuIvoye9TD
 mi8YigYBdZ9BshV3qmZ3zCRFrijZPx3ucASQYwjTirEKlRs/02WsLc0DY8R4/VzSNup7
 vM1v09pVF0O928o5XrMuHfDuQCovLEc5h9gXqNH7fxzH7Qd81gah+G5M30VzFrxWM+wU
 hAZxsslSXOXd0oIEeiEBiS+D5Prx+a+IBsJ5TeLaFncy3No/M1N7Am9TZ2igbX0GZ6c3
 BuQA==
X-Gm-Message-State: AOAM533FJZ/9XFavs0KPZILwAKTJdlhvOdOA8R0N6bAYS04g7fXVlp/G
 Ob1wpY2LrbWk7/TBbQOX89Hnv2t6dks0BUtJUb9TwQ==
X-Google-Smtp-Source: ABdhPJx+ymKRyXpE6Ea/FvI7WVwiT8NaifnVKWHgfB4cEXVXLyFI/r3y2ZU6dNMXRdqHaP0hbiU3lfd5lhTt8RzbL9g=
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr29712104ejs.4.1624973476023; 
 Tue, 29 Jun 2021 06:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-2-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:30:38 +0100
Message-ID: <CAFEAcA_DWXVXJnHyB8TKGY_rHTEmNFboRv6O7NBT9XJ=Cz1UAw@mail.gmail.com>
Subject: Re: [PATCH v2 01/23] linux-user: Add infrastructure for a signal
 trampoline page
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allocate a page to hold the signal trampoline(s).
> Invoke a guest-specific hook to fill in the contents
> of the page before marking it read-execute again.
>
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h    |  7 +++++++
>  linux-user/elfload.c | 17 +++++++++++++++++
>  linux-user/signal.c  |  3 +++
>  3 files changed, 27 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

