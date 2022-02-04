Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005084A9E43
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:47:35 +0100 (CET)
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2gI-0001fB-Rz
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:47:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2Yu-0004qQ-5r
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:39:57 -0500
Received: from [2a00:1450:4864:20::42f] (port=33327
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2Ys-00025f-KH
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:39:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e8so12777648wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y464Re/uOaT5p24M+iX3mX9x4gSQiPvy3Ty0gLDSmv4=;
 b=REoOgrk3Wbh1wfojV+6a6Ezkr4u0mnQKclOQl7lpQGw8fi33DZWLIG0p2TvBdF+hg2
 q3RV/2TlSfYAI4KY61Lx2XYcqtyAFXtKkbdzNq1CrRkU6rLlvCvsso15V8olU2I63KOM
 IbtWjMMP2jvMLgBAwsB3LFLjiN+tS5ZB/zGxxkHei4fJ8OsTn+QevzT9qYGy3XsUqEP3
 a/UKhxXz0lA4rvvOuM8HFqvVxz07deJjt7Q1LR/BKULXehLi1r+7PabFQ0Z/eBumTmin
 7+X4RLobm83X4oXoVdYSNLMM95W6OydMHhz7vFWW6/raazQ8fruNlJl9jn42bSbmt0bY
 zI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y464Re/uOaT5p24M+iX3mX9x4gSQiPvy3Ty0gLDSmv4=;
 b=bzDWI4HFrqqfSk0qUjNwns4jZsWvxGgHm+7KAy5ddjdIjn7c4upLLXkdUK3+NZ2aa5
 UauvOkqE8FMEuiGZ5RKGcAk/ran+TQJh5ndw0th94MsY+7rPRNTT3s5YQArFqYyZxwJy
 46dxz8w9pCOO97UqyXv+Sno90Wd32zpxZ1WyD8muOSimRQznmZC8wEn91M8zPooTIEQ+
 9Oszyjs+MSJQDmOmhLpXNJ5JoHwpxZD1ofZx/z8EIBIuGCFec21VCOsIXoyLR8AC8q67
 nyt0U/E/RSbJXmdivkyvlu2EOQx+Z1wIgScYCdJiEDk+Qms1WDFWD+Iw1yT9YOk6i8/j
 dpHQ==
X-Gm-Message-State: AOAM5301CSWWzeQCIIgbLPJy6HKjQjEHnpuOhY/+D7u0IZxJEezXTjsN
 HJqFL4JAxrERDnMfjyVDzTUiNI9QUp1BuC5ZFVswoQ==
X-Google-Smtp-Source: ABdhPJwkk+x+Z40xRvxstdFOnQNU0wuT+LI6rHrt8lr/YAgQJPbow0g/Oo3opU2J0ye29uJ1635ptE55BDaSx29JoGg=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr3414024wry.319.1643996393140; 
 Fri, 04 Feb 2022 09:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-3-richard.henderson@linaro.org>
In-Reply-To: <20220204070011.573941-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 17:39:42 +0000
Message-ID: <CAFEAcA8g0GNNx2X3S6uftwymH_6KZHj1=2-eWu9_KKJMYLXr0A@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] tcg/sparc: Improve code gen for shifted 32-bit
 constants
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 07:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had code for checking for 13 and 21-bit shifted constants,
> but we can do better and allow 32-bit shifted constants.
> This is still 2 insns shorter than the full 64-bit sequence.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

