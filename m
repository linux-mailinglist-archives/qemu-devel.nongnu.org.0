Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09247209EAC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:42:55 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRDR-0003zI-If
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRBS-0001lL-Ta
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:40:50 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRBQ-0005bn-6d
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:40:50 -0400
Received: by mail-oi1-x242.google.com with SMTP id k6so934981oij.11
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I5yiG2YU4YSGOf5U80G+4i+r3hM5kcmgLvlozrOrOSs=;
 b=SSVkk4FjfOSKFm1bwoLIOLUTWBDn1e4g5l4WF+DCAmissDuizscqckC3QHsp2WqZwz
 3753vgt1DG/tOx4nkbszygEV8ycL0bO4FREwBmX0TI9OUrXOiMiY2xu0EYYAl9ZmIM9U
 sR60SdSYD4llJIrNq72XT/1q/ZNy7gjEasbwsA5D3ys+twQm7Aref3z0ZjPx5tQAOyFg
 uFVqjM6q04TIEhyc+Q+76EIq32/NQspXrq+M0HT8Q+v80x6fqmS/WyVJlEAQQCFDcLTE
 RS/SXvSleefQXJEE2oq2hUmHHWeyd8VxNwmZx7f1XXfYXwsN9qkm7Yo+nWd6t8jWXwMT
 MZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5yiG2YU4YSGOf5U80G+4i+r3hM5kcmgLvlozrOrOSs=;
 b=hzP/yiL8LBUxQmJGf74mMJ8RRNVZ6kL56a3vaUz0vDo+JWpAMJ178tNO1bEdbPt3sM
 IQBgYI4HDzl7c8HIs8o+DqEBl8jnJNGT1isFo2yHNUfGPpyOdBoGXFqKU022Z368bR00
 5wXJl0H2GQxWbGE8rGqpJ0cv1KoX+T3zG86Y2+RfQ4O9/uRF/4v82UmhWyGWzked4YLW
 IWy3kzCX8UY7DObBwpyHTqXCvgGsnW3vtHXmjQAw88I2RSOj02z6s9IT+lUvjTJYGMZ8
 IKb3zhYC2lk/CDzypJl8hIcb4bbH5vmVqb4+6WpHIdxAb+RKjROTFi9Dx4QanHzaH7f2
 dxvA==
X-Gm-Message-State: AOAM531jHvcmoQuFTfVArEajFes4zESwcZAndIL1jhRMG6VfCZnoW/LS
 5jOp04qDC3pdjzSPZVTEWbLBrMkk4gNHtUGpuALKGA==
X-Google-Smtp-Source: ABdhPJwaYXkY9s5iri9TnG44OuSZc2j3vj4stcxcYbdpeynsr/yJp2P9Tu2B/sBzyYGJplxcwG084T3q0h94w1+D2LI=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr1980296oia.163.1593088847282; 
 Thu, 25 Jun 2020 05:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-37-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:40:36 +0100
Message-ID: <CAFEAcA-t=SPUWG2oPrmRz-yK+g7rpTwtJt2cATUgp0AT2VwZrQ@mail.gmail.com>
Subject: Re: [PATCH v8 36/45] target/arm: Handle TBI for sve scalar + int
 memory ops
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We still need to handle tbi for user-only when mte is inactive.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

