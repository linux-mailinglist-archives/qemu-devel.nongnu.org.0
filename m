Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB006B35C9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 05:57:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paUn4-0005QN-Qu; Thu, 09 Mar 2023 23:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1paUn2-0005Pi-DI; Thu, 09 Mar 2023 23:55:36 -0500
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1paUmx-0004Xy-OQ; Thu, 09 Mar 2023 23:55:36 -0500
Received: by mail-pj1-f50.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so4101048pjz.1; 
 Thu, 09 Mar 2023 20:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678424129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FF09gYyMDdb8XAyWRjco+ErOFe8wJLj2ky7wFjX9Jfs=;
 b=LOrjRG0dY1ejUQROGPCWhe/npIq06vKPl9Zv5M4ZerRl15EaNEiKAFfTeTZeFYzcwe
 AeNsitV1zPbEbbAyDezaJ0EcJ/5U5IvKd0nqB6E9ylwE3L3eb4V4m/34s5YvGTa1Aeez
 o/4NvPtFeeGvYY4vegrZL9xo/qcm9T3/DM+O9MyXX8Eb8zZNs/spUGkXkybi7HJeXY6D
 KklKtvWP+9oqmMzeHNUSE9JA7BJk6ZKguUpJmmLl7WW+vJ1R8BbQ4TsY77nYV4kCkZyH
 FbQeqP0W8xgkNjSFOUZcs7y3mLcycSGIU6RpUfXYV/n4iS6yVM9CWPxSDVyuG8tADeMv
 0Wpw==
X-Gm-Message-State: AO0yUKWzQi6Z6Th6S1sd+1ixV+LR9ei2PVZZJ2qdWn3rZ2WzQYgadP31
 PX/WBf5NxRr51dxB7DQeVvRpHgIvLms=
X-Google-Smtp-Source: AK7set+bpHxp4gA3ys22+wKB1Q8tkULQYLQZhTprWieDbXPInJEleLv4m19anfNrrlL6oDk7xyD0+w==
X-Received: by 2002:a17:902:dac8:b0:19c:a5dd:fadb with SMTP id
 q8-20020a170902dac800b0019ca5ddfadbmr27349765plx.54.1678424129049; 
 Thu, 09 Mar 2023 20:55:29 -0800 (PST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com.
 [209.85.214.173]) by smtp.gmail.com with ESMTPSA id
 x129-20020a633187000000b00502fd12bc9bsm447000pgx.8.2023.03.09.20.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 20:55:28 -0800 (PST)
Received: by mail-pl1-f173.google.com with SMTP id i3so4381704plg.6;
 Thu, 09 Mar 2023 20:55:28 -0800 (PST)
X-Received: by 2002:a17:902:a3c4:b0:19a:82a2:fcf9 with SMTP id
 q4-20020a170902a3c400b0019a82a2fcf9mr9219012plb.2.1678424128461; Thu, 09 Mar
 2023 20:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20221219220808.26392-1-agraf@csgraf.de>
In-Reply-To: <20221219220808.26392-1-agraf@csgraf.de>
From: Joelle van Dyne <j@getutm.app>
Date: Thu, 9 Mar 2023 20:55:17 -0800
X-Gmail-Original-Message-ID: <CA+E+eSC-Q9SvTR29qbYRMPfo10xhM9OtaXZNO6iJp0UAA96kCg@mail.gmail.com>
Message-ID: <CA+E+eSC-Q9SvTR29qbYRMPfo10xhM9OtaXZNO6iJp0UAA96kCg@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.50; envelope-from=osy86dev@gmail.com;
 helo=mail-pj1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 2:08=E2=80=AFPM Alexander Graf <agraf@csgraf.de> wr=
ote:
>
> We currently only support GICv2 emulation. To also support GICv3, we will
> need to pass a few system registers into their respective handler functio=
ns.
>
> This patch adds support for HVF to call into the TCG callbacks for GICv3
> system register handlers. This is safe because the GICv3 TCG code is gene=
ric
> as long as we limit ourselves to EL0 and EL1 - which are the only modes
> supported by HVF.
>
> To make sure nobody trips over that, we also annotate callbacks that don'=
t
> work in HVF mode, such as EL state change hooks.
>
> With GICv3 support in place, we can run with more than 8 vCPUs.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---

Tested-by: Joelle van Dyne <j@getutm.app>

