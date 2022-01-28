Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAC4A0015
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:28:08 +0100 (CET)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVyh-0004cV-Vd
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVu9-0000Fe-28
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:23:25 -0500
Received: from [2a00:1450:4864:20::432] (port=41569
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVty-0007hp-OW
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:23:15 -0500
Received: by mail-wr1-x432.google.com with SMTP id h21so12452315wrb.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 10:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AZiHwMgynZ1xLiodGvWZFRzNlNs9o7JBbafyGRrfwZw=;
 b=MCUKMCiFoYVB60li82opb6khxmL3gILe3oVQSh4adia4nvvJCnKU0HIrH6r4jmsn6b
 0chgJyccGYvcv8etjswl+TDMQgTVFGByOxt2BWvRmg9XucHV/0Yjbe9JsHXlwkPGLt2A
 ZpDUhJeDnBe5CFgyqvMn/uidQU0bXkWx3nARuFK99xuDs34hySgJvV+0MBFYI0JAP7WM
 vpoVXtqKEt67BvTvwtOnShgG2EaYG7aaPO2hjnDElmtUQ76v77bhJ5HDJ86SvfDcTdwd
 a3eqXztJN6kg3nQROEc9kBFqS/cobyL8/XDbPt0zVSKgF5wpyEWz2WgXm9ZgQPHcBL5H
 ixkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZiHwMgynZ1xLiodGvWZFRzNlNs9o7JBbafyGRrfwZw=;
 b=pXej50ktyqDT5eXGb7bVkBoamu1bAJFICeYIhbBwxZoUQyHRpDcNUWCaQZujRvWTXA
 FCvtmaXsqIWNc//jsNei9i9Lh6Pk0K5EEDNzg6j3nP3YNPT01+P0xT0gOGNg91S5042z
 hRXLf9lTrx0cQeA8cwQLHXQ7zG/XT8LhDjZHO3DeGJWc1LycRzGHcsmVGiJlGb7BUUUk
 MU7WkOVHUz90xKjmHVt3ASLknduZNiBWdAgYeu5HKMkpwmoRhiLqD+ZEDDe98R7Ru8E7
 0hCEwjQLndvyhFyZzKneuZLX/rvSo+nSaDhztd9jOD/S+ZTnlgeYwwzg6Rk6Eu2KQIHz
 5UWA==
X-Gm-Message-State: AOAM530YNBH75LUNo4gYDIiz1rOFXkoaafS3qDlFjnvUuzAmNCPC/+zD
 9UUzprDz1tdqgAHAB++cpRdSXnDUnHkhjBzymb5Shg==
X-Google-Smtp-Source: ABdhPJzHMpJN9RNFWJvqhjZzLp6+zZJ9pN8kNjwBJSZV1xaNvn2SoYCmRZiJVULEputRdwn4R26atSnP8WcekPUnLt4=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr8277724wrv.521.1643394193071; 
 Fri, 28 Jan 2022 10:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20220127063428.30212-1-richard.henderson@linaro.org>
 <20220127063428.30212-4-richard.henderson@linaro.org>
In-Reply-To: <20220127063428.30212-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 18:23:02 +0000
Message-ID: <CAFEAcA9pn3aAtS4SPcN-TtTGjcXexqvj_+SKz3jUDAKBJJ=L3g@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Fix {fp,
 sve}_exception_el for VHE mode running
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: yuzenghui@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 06:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When HCR_EL2.E2H is set, the format of CPTR_EL2 changes to
> look more like CPACR_EL1, with ZEN and FPEN fields instead
> of TZ and TFP fields.
>
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 77 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 60 insertions(+), 17 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

