Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AF667C66
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:17:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1Bu-0003JU-L3; Thu, 12 Jan 2023 12:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG1Bq-0003J0-Sv
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:16:36 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG1Bp-00072l-96
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:16:34 -0500
Received: by mail-pf1-x436.google.com with SMTP id g20so14281897pfb.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQyVx0IdRWpHLbGelfrUjYulJdp6Ei5FE5FnSXaI8gk=;
 b=gIpNYediTeq7GhERuTD1gvFh6pzqleYpNfGaQz9vrxFdwajW4u2sCHewBEESdu01kT
 H2cFbMoBVDRYFNoSAXB7MtHSxYr4169ocxIx3Nu4CY2yCWSualx03LOst/Re94QJwwgA
 /OX/N3leeGq43rd7iZSAka+q1+hYcoMkRwB59YfvlJzSGuWdJMz4hIqJakA7+5wrmlH9
 kSEf0ImxEorO1AUdnoprdN5/kmKvUjBYZ/AvhtSrFe7yH0fIcVf88yFvNoCUTnWPwhtN
 CHSFrJse4U3Tgqh4DtEzb+paFkVHTFfHN8h4HSd8jm1h9At85IsrTyUVZMJDlvpOv07m
 1Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQyVx0IdRWpHLbGelfrUjYulJdp6Ei5FE5FnSXaI8gk=;
 b=c7h5e+SjDqiEkbUaWmOGqk6KATqQXAGaYDJA4aQTEpRx9d08qb2eYNm7cq862CXSLO
 +Mkq55/hbWY4R+R3VBWfu/9pDZkJU3/RA62Ts8/2+tJdK8k6dH5w70yiFnzcbfIwqNmp
 WmdIe77Jn2foh6qj0zEyl0HLHT0PuXqZQT5Wli32LFm+fZafEYl18gzKOYdoxtY3E4TT
 A+k20lORqEcv4EFrfm+/IaZDXywwvtIhx1XogIw/q7xEQslkTfAc/Hy248okr1RDdVxZ
 By2n5Z5TfeXt3Ouj9HP+4Bd22ryyrG6o/HleyW2bUpfxQc5I4WWA9tKoHOb8Qwj34wnW
 ZJhA==
X-Gm-Message-State: AFqh2kocVKsV6wfuDi9+LL38zNfDlO1WAU6as+vaY99EeLvTIVZvpl9g
 i2eGngG90rEwopVGk0d1hrPyuUWCkVwphYS9K7+KQg==
X-Google-Smtp-Source: AMrXdXsOUTcSV6UJCB7dFD52oYccYI/s3ciZwjf1CDmxicqzj47Fcolm1oRaHq+8pbJmYCihCvusw2D0ohX6W1fkypM=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1217956pgd.192.1673543787989; Thu, 12
 Jan 2023 09:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20230109140306.23161-1-philmd@linaro.org>
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 17:16:16 +0000
Message-ID: <CAFEAcA_wwb4fG88w6z1MwJ=K-eaH=_furD+abqMsDiVNmUHzLw@mail.gmail.com>
Subject: Re: [PATCH 00/14] hw/arm: QOM OBJECT_DECLARE_SIMPLE_TYPE cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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

On Mon, 9 Jan 2023 at 14:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> These patches certainly look as churn, but they are required to
> be able to update the OBJECT_DECLARE_SIMPLE_TYPE() macro...
>
> Except the OMAP related files, the rest seems to have been
> merged shortly after automatic script conversion from commit
> 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")
> was run, so missed the QOM cleanup.
>
> So here we go with yet another boring cleanup series.
>



Applied to target-arm.next, thanks.

-- PMM

