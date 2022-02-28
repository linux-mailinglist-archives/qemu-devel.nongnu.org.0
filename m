Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B3D4C71AE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:27:36 +0100 (CET)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOis3-0003Pi-Uh
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOiqS-0002W8-2z
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:25:56 -0500
Received: from [2607:f8b0:4864:20::1134] (port=42292
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOiqN-0002K5-EU
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:25:55 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2d6923bca1aso114573567b3.9
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UtmoPfY14gyLzpaS2ZlX1hn8t0Iapwg850tKuUZJPm0=;
 b=btovMQEEB82IuKUDGArTBd9l/ZyjWi7TK5zJgvtRzunNoFPcaqiQEAOKimdHPff23S
 vbvo1K3rsNA9SzdAWkVxanyol4rS+lgZxTlqM1DyK1vmJGDwsFdvF6RmXRv7kWAXf/A/
 HZbtrQ5ALUQ1apj4n5zeiV7Qr8ump1H0MR1uJxzu/Ub9RJUIzoOPzWbcnSkitNuvXqGm
 oF+wIQaOntbyNC3WxbyCpS/CAJXKyNq38Pt9RpWVWjiHfUdE4abjFgWBUZGb2MHKdRPm
 SjCqNbz+waXm2PQgPCbbiJfu3yxg2GA1CMfJ924IRvC3QTSz/+Xs/JEa7UJYmohqCdaF
 qigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UtmoPfY14gyLzpaS2ZlX1hn8t0Iapwg850tKuUZJPm0=;
 b=RWqSYV7lShbQHH/V7gyeJ6EgOa68zJM8/tyM6yQrRmLqx1cKv5qkkUTN2bPGECS67x
 OA+0DKkls4gN9WSG83qbmoa/Hc6RNizjRvadz1IAmnmyI6q8AdQwjI9l0PTGzkv0iaFb
 mj3e7ygVzGncLcBNFCpdKvr4dGISv0bQeouypUf6ta/kN9i2FjISxaRiuoG2X8BT1CEZ
 N5x+r5fvWxyHvkr9E9Q+FE3rZBARODe/WzwRq0bNHwqO1Ts8kYuKdp6PyJ/DLgbEG2sp
 EzKA7D6j7FinpdeXYsTYG34wTJPtx67pn2HV8SCvAAlt/69N7CoxcMPfTT6CmlPGFtp/
 o4iA==
X-Gm-Message-State: AOAM531iJRJw704m18X3AhX03puXHJ8pXx2r7lMWltJ5xpWYJmnUszuG
 bd74gSlbKxed11i/j9wnC6YwHBTOUfp4VOQR0C7vkQ==
X-Google-Smtp-Source: ABdhPJxBghsHVocqojhsnsY8teoXIqtQBGoJduo2LmnGIvKsZBEBA0RKMWX6ZJJYdRs7FI+1moYfXZR1WNnZsazyvYg=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr20749798ywh.329.1646065550454; Mon, 28
 Feb 2022 08:25:50 -0800 (PST)
MIME-Version: 1.0
References: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
 <CAFEAcA_jsunyeYOqu0aPtC3XrdD30b1Fk-6QsiDCTs=AJcvYVQ@mail.gmail.com>
 <006d618a-07d5-f58c-fdce-18914c7c7625@mit.edu>
In-Reply-To: <006d618a-07d5-f58c-fdce-18914c7c7625@mit.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:25:39 +0000
Message-ID: <CAFEAcA_ps901W=Cwu0ev39B2+6YyWZtERfuGjCsDTz=G=iA9fQ@mail.gmail.com>
Subject: Re: [PATCH] allow disabling tests
To: Simeon Schaub <schaub@mit.edu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 16:22, Simeon Schaub <schaub@mit.edu> wrote:
>
> Ah, yes, sorry, I didn't check whether the tests were actually run. I
> can rename this to something more like `build-tests` if you think that's
> more informative.

What problem are you trying to solve here ? It shouldn't
matter whether we build the test binaries or not...

-- PMM

