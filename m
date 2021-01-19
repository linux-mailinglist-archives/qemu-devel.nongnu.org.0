Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9282FBD2A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:05:57 +0100 (CET)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uS4-0001ZD-7w
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uJY-0002ny-Ft
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:57:08 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uJU-0002cC-7K
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:57:08 -0500
Received: by mail-ej1-x632.google.com with SMTP id 6so29501163ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
 b=tUIfihmc1flp94UqJZfsCna0dWXCIKwDDPd/6COPKD4cpYdWVkNLZWD3ETXdP/A7p4
 uwWwZ8zpQNoEGOxGgEuFIdZWDlpb69NeGF6aXWMGAG5/szt1MIfO7T8r2T7ojTaYZjze
 EQAtX6K4U4bzv5F0unWrkOmGVo36xaXF/dTX2f9vJ+6hqDdhWdo3OWg4w5vig9sZDh4z
 5/zJ8zxkYj9H9CsfvD7Ql4jQqzt2wsBpOZJMpbVlGJSSe2UiWVqk8KfX1E7vnFYyPJ6K
 VimVNpxXu3UzsZu8Wj/tSxxnyXqYed1o9FBjTVs2XkTCGjfWWvXmonWWfaD8qtLlq1On
 9ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
 b=fH7I3J2UUPJ6yE780ZMUQlJakjD8Jbv2FujqbvYgqwHRG98aF6mkQCkxrTjAbRcPzC
 kkI6ieD99MDaKDCcKUiDAcCbpHQT408pgwhVmhGZwmzz9MgzDnEp2NVSZR+ThegT4jTs
 9d4r2hVH6N/zhiFrLzFSvhgIuM6JLaWshRmwemX6xiM4paWq4pMhZza8z7djHUXxisiC
 SLikT5xbGyK1d6YbM2643c8HNSLhW22Yj4HMKTGo5IjUnt5lJC9m0aNV7k4Naf0C8R5D
 buym9xgD+nbh79FcHliw0AdE47lW2DcQUWIYotE9nFzAW2DoWGVLJLitOG+uxnLaBfqb
 Rvbw==
X-Gm-Message-State: AOAM531mq8go2DxXBMLsKQhf0RYQ7Ib5YXgmt4Kyq7AVa0/zvFLzzmND
 S9FOjpfDZi5hV5WEmrhzU0aZ/1SvCyzyjvdWPJ/5mA==
X-Google-Smtp-Source: ABdhPJydr0SEcFOcRrGONfKvNELpe0X35ahaYR5q5B2uBCLX2cyL7dOfwJ1uRsnWFS0QXCFVBm+Y2sr9LiRb5MNwgTw=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3679461ejd.250.1611075422833; 
 Tue, 19 Jan 2021 08:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-5-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:56:51 +0000
Message-ID: <CAFEAcA8mO4A4OVtsuVv15CXGABEZNY5euTfLsRd9ZvM1a_0D7g@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] exec: Use uintptr_t in cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 15 Jan 2021 at 22:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

