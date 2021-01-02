Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A672E8875
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:21:34 +0100 (CET)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnP3-0002xe-BV
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnMo-0001wu-DS
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:19:14 -0500
Received: from mail-io1-f47.google.com ([209.85.166.47]:40987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnMm-00045S-Vc
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:19:14 -0500
Received: by mail-io1-f47.google.com with SMTP id t8so21468262iov.8
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fcg7LJ3jU4Kt8YWV1BII3oPIbK7oqw3j1JCTYtfWcJs=;
 b=fBrR0x82C/xDD3SE6RMTQc8JrPWstFJUkZPDd91GlWoVItTKmwVtyv0fP8gdYyHZOp
 61n6+en+ZY9qRQBVhsFN0qY+7T8pEclbzrsJT7qe8+49AYt4sbWoyn6+ObXm3V/vjFwN
 NNO/xlpdIUmCFpeubCbl991qr9bQoVBVM8eBib4tiIJ309pnMJOPFpiUY3dxgtwixotL
 wsS9NRP0fTOyTGn24R693O/1kZNiK6GNxxyQjsdTR767ML4DACWQHHleEcvWEYz89C3e
 VrofyDMKRJWblyub9h0whi6QtrkNEhkt4VxOJHVDPk/xTCymU96v5qZkWiXyoGv2Hhm3
 4bNw==
X-Gm-Message-State: AOAM530whTk4MLJM91f7ybgwXjn6ue53h0q0/P1qMADQCOvOsph3pg/J
 30gNCyqJ04rbwbaYHuDpQjXokhTymuU=
X-Google-Smtp-Source: ABdhPJw0l0qVhlE7udNNM6vAb3C6ZV8w/U2mdv7kaL2Dgzxf5M6dXr87uRmK6ByARwQF4GP/fsoksw==
X-Received: by 2002:a5e:8e05:: with SMTP id a5mr53585697ion.133.1609618752084; 
 Sat, 02 Jan 2021 12:19:12 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id v66sm34935686iod.34.2021.01.02.12.19.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:19:12 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id r9so21468471ioo.7
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:19:11 -0800 (PST)
X-Received: by 2002:a5d:939a:: with SMTP id c26mr54829212iol.63.1609618751833; 
 Sat, 02 Jan 2021 12:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-26-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-26-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:19:00 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCfo8Z-GUF6R6GjxYtCfrZ34jyKAPk5rrfAh8OU09MSsw@mail.gmail.com>
Message-ID: <CA+E+eSCfo8Z-GUF6R6GjxYtCfrZ34jyKAPk5rrfAh8OU09MSsw@mail.gmail.com>
Subject: Re: [PATCH v4 25/43] tcg/tci: Push const down through bytecode reading
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.47; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 60 +++++++++++++++++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 26 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

