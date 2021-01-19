Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C166F2FBD35
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:10:16 +0100 (CET)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uWF-0006Ie-PP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uML-00072o-ET
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:00:04 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uMF-0002ri-Jn
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:59:59 -0500
Received: by mail-ej1-x62f.google.com with SMTP id w1so29467995ejf.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=71iHg5shNAX3ohyNLymKI5rSBykLw+1hENhzaZlYkqI=;
 b=lGIHkpbNBCbIz35KqIF0wemr0QbiW5VtRY7ACMMwDXWh7ociIHryFHeAqd0KBRFwgH
 IomRUBFjMGFwGt6T5O/u27pT6dya9I2q+2YpzLdJmbtZkRB/Nu0rCAK5T0tHJDxJkMzT
 kJUrqK16p40iRnGja9gKsTLQQLuPcD5N/f3eesH6v7mycE27gbz6bqUI8G3qJw4YcjaV
 nYGNjpQ1QZDIlrLVsW7cyurVP0aC9ncUi6p8Mo36YY0MVt4SWsbQ3fXiEwweexzSzfAr
 ROPTEPzxXVb81TlSHmH3qrNOpLg4s6vXLhFfKlERVoRDLgo/oqaUNTX0wlSaBT4Lm+Tl
 4aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=71iHg5shNAX3ohyNLymKI5rSBykLw+1hENhzaZlYkqI=;
 b=OwBlzV+rbry3iWVdYQjht29F+R8WAqOXG8Yqr74FDQKQt8W8JoWU+MEfh9SUStWec0
 4NqJMvMCWJr638AYTT8mDf1lNZpYvG/RUy5sc2GXrfq368unTGhSCo00JaUbnI5nIYVH
 vSpnnWKaE9mw/LA7CEhvCLL3H+W5JOpo2JgHC7JnqgjnaPozUPZhsnUCLAY8xhEu2kHu
 pfO5lHcnmwiZNLhXaiVzM9VFVScy+Ue/qpx3XfBIIjSSq0o0aFfg0XoH7pkxKT3C1xPK
 4MgoSxPGntKAUhhtDdLu1zWCVyilhugKmltXFlVUqLlnvSdk0VaqqQp9Z0b/KkykrHgy
 T6+w==
X-Gm-Message-State: AOAM531UeTG8nB0/BsaSUvRCClRzkHaeVhVq6fsqNPKYU5lausLUknkD
 n5qky3jWJjKqoIwyM1IcmyZZ8pTs3MQx+Y8uabBrkmWKWlw=
X-Google-Smtp-Source: ABdhPJwCZZ4KjNTFtfMWuwpdwCcp59NHqLLX+cYK3+es3E2ZJgRRawNbGoDYTV0m3U4ufJUaBpJ+5wgZU0iGCsBMULQ=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3523065ejv.4.1611075594276; 
 Tue, 19 Jan 2021 08:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-10-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:59:43 +0000
Message-ID: <CAFEAcA-hUK0ys8MU+uy1LQVqc4-zFU95sBawir17jgOBKsDOQg@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] linux-user: Do not use guest_addr_valid for
 h2g_valid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the only use of guest_addr_valid that does not begin
> with a guest address, but a host address being transformed to
> a guest address.
>
> We will shortly adjust guest_addr_valid to handle guest memory
> tags, and the host address should not be subjected to that.
>
> Move h2g_valid adjacent to the other h2g macros.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Ditch type changes; retain true for HLB <= GAM (pmm).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

