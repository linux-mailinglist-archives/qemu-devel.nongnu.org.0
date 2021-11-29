Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B48461686
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:33:56 +0100 (CET)
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgn5-0000jy-Vr
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:33:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgce-00060r-PN
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:23:09 -0500
Received: from [2a00:1450:4864:20::434] (port=43629
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgcb-0006Rx-V7
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:23:08 -0500
Received: by mail-wr1-x434.google.com with SMTP id v11so36759779wrw.10
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=am/rBPgdiqjACXbdhmAI6DImIEUyhaAKNXARnrWXYok=;
 b=Rwpv8//dPHzD0FOZ5fN+TQF+Z2gXNdW1km6J/L2MbRespAcNxYpCLDfnI01YUY5/YJ
 ZHGNFSlZ+r+qfIU54GJBarEwgQNjZJ6j4VM4IPXa0KVuxV1c7kfhRSq6HC00V8dqod8e
 w5xa8fhIAs8GuB5aApTJkWpp3uLfBd65XwYokzNBgMc+V8gnZDXgT9gx/AHFpLS1OKxi
 AoJ8PrvrkiRH5t/VvoKAyL4h4KhlztE5mpltjHJ2YuNL9EkDpO1UXoKV5Qf1yMOq2+D7
 s+R5HEEONDuPrh+HJC8VV7b/+35l+7W0M3zXQwFZCo9fUayUHAu2yr3phCk1rEVDP+o3
 QWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=am/rBPgdiqjACXbdhmAI6DImIEUyhaAKNXARnrWXYok=;
 b=vzud1Q7dF6smy67lbvkfNIcpqs1oBbrdrlYhCRWaNzPiM9iriVrJ0tDdUnwqE26a5Y
 PpFpl38DLXzKvGt9cT8/KVM6sxPjXTY17CMJh0FETzaGO9tjIdBgJQShWjZFAJQRqQDV
 v4GiAhoJdY+gjKmf+HVrwMbxGrgt7qsUnRaw8EziM4grsr3lnLtGrbB03O8cx9nsCijY
 IiDm+nxzJBf2P6SVkZwB2LI4XVQYDLys9nA/U7nQ2kZsBcWjiGYDvhIHC/dpUHdC7BHJ
 g7e7XTWeooStj4kxgL3LKTS0KsBNvlzxhSGl7wr1GyI5xNBv7TIuyKzgJ5gxXAwuDDTZ
 hWhQ==
X-Gm-Message-State: AOAM533tZHrNMl7vHA3YaNC4sPXMMv3iVQPXsM21o5cXVJO5PgXdquZs
 bIA1cGK5O+cHy6X8GhH1p/xNiX6lsxvbgWaIzMt4WSKsj84=
X-Google-Smtp-Source: ABdhPJzT7uQyH6f7KLayq3rZqnkY01WxqXYjgQdQ4ie/GfwPK9uHY0Vulj/W613qzBzkcdTOhZhBlG0NGMXG129Kf2c=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr32987086wrp.528.1638192182402; 
 Mon, 29 Nov 2021 05:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-7-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-7-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:22:51 +0000
Message-ID: <CAFEAcA9kFEWFdL2TnPPY8Z0aFmKx4miSGqxLBxq6ix6DAVamJQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/arm/mcimx6ul-evk: Replace drive_get_next() by
 drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Nov 2021 at 16:34, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Machine "mcimx6ul-evk" connects backends with drive_get_next() in a
> counting loop.  Change it to use drive_get() directly.  This makes the
> unit numbers explicit in the code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

