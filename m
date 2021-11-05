Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C497B44679D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:12:08 +0100 (CET)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2l5-0007vO-Ko
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2ie-0005dH-0M
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:09:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2ib-00042w-HA
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:09:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o29so3810381wms.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PDddDKSiMid+mGy/vrWAQvj3HVpGJ4Wy/QtQOrSdvYw=;
 b=up7TfK1AVbVbEE6YKaaT7cPHzo5osbYWioQj7HvwRT1oK8JETAYbfTdPAXnQXvTE8Z
 hCOzCuejPXFAfGVRwDKgjESLI+lgsHdZ5yiCRmlybLQR8x6/lPBRbp+62HoD7Ozf92Ky
 zFLU7PYHof0PSWTxI5pmnGHeZMADX3DZecqHep5dTuwVv//3GCDccRXSBvEgVp052PO1
 TT2FpBsci2BwRDtMtD/uYNMR9rz/6CVMSmjb6CrQFjWfVoMD2NrwRk9VtM2Nq2I2rjqO
 lv6MX0kLJ1kHvlo0X8DN4hoJXy0gVIRw7bNZtq3Rz1EN8yZ0n0LbpMbPDQG/BHeJpa7I
 HIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PDddDKSiMid+mGy/vrWAQvj3HVpGJ4Wy/QtQOrSdvYw=;
 b=gDt8VEsN7DmwdUxw/2MTCtFjGQptQqnwoCbExcGDlZp+5nrUMoNShEjKbwQwtWe4Qb
 nnYhN0AzcxjfVc10eq2z7HssbAKG2YIn5OsT01yYHvW9bN6Cx4GLn1pSXabWHMh6QKry
 75jLiU+HDW/EmptobJ+2P/VggU9DT9Kpk0pYszUxjL17LNwD0re98IY3ogalH9nFOw5y
 gdwnQyO+XoPsbEItm9CM0wO9rqx2SkxDJbGpaPgevpacvLiwMSlveRJTYqW6by4bWPfP
 36a5gAz4svAoOQCyDFH4R6EiXqlSYcZ+6lv2H0SpnvyXfmDM+4j4UMmMs2gjrfRYf6jV
 QJXA==
X-Gm-Message-State: AOAM5302FahND+aNNH59hQgdMtxpHVtXL+QvctZEfZb4Qwi5wfIO3FBV
 Em/B3LpcgRcvViEFMi5ipW0Ea4NBDQeW582jBMJQDg==
X-Google-Smtp-Source: ABdhPJxNVDnKAlK2xmbZJsgXuxrhBgzlTvqAxNJ6uJByMuGMykd+iph6i2AiQiidA8uQM5C4Snx8UvGg4cYIZr7E1O8=
X-Received: by 2002:a1c:f712:: with SMTP id v18mr32176395wmh.37.1636132171068; 
 Fri, 05 Nov 2021 10:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-7-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:09:20 +0000
Message-ID: <CAFEAcA9_3s3yVE8=cjcUt9uFNpxhzuigUeXKVS0bVC91zfFmcQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] target/arm: Split compute_fsr_fsc out of
 arm_deliver_fault
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 04:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will reuse this section of arm_deliver_fault for
> raising pc alignment faults.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

