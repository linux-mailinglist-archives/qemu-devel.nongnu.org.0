Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B684209ECE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:44:46 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRFF-00053B-8L
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joREC-0004W3-7q
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:43:40 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joREA-0006kI-9j
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:43:39 -0400
Received: by mail-oi1-x243.google.com with SMTP id k4so4828502oik.2
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucXa/fHU6DiFEEbNhRSXqiFoOHUZuHvUhyc6Vr1UKlo=;
 b=sJ7tfrxFQxvv+wBgXK/9EHxfZ6UVYL3+R7kJi2EbEUOG1D9Qq7PmaQrYRd1R0OdqKH
 YPOdR3K9lD9+ESjwBGdwHYE28Blx5fbeeOP/LxcQWgO5F3vOYp81S/spVPy+Ml2saKbX
 EjPTVCmTXwndXAK2egSNFmLaEMo+wWPAJYxlgCh9Z5rh0Djui2P5OP7Kiu8D/QqjyU53
 W2N7aetaGSgKEIjYhHdDd/wypoarCEKcoczYxVqNwrocdAq0Evzx/c8hZoFclQLkA3cv
 6XIRrln4JWoxLi8/8vYnFzMYHmIrsYJFVOa5wgUhgnZZhjr1iQ3R3jiBGkqQeRuLJo2z
 92Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucXa/fHU6DiFEEbNhRSXqiFoOHUZuHvUhyc6Vr1UKlo=;
 b=mUqMppiUgDszzVU3ywdbuS/F+AlSLAMAhFm4hgshJlR0I433E/Tx3UaKKVGaQeXf+4
 jwO33kFO6Y+A7yG+qz9xxDoXWSSKhMqXsXnpButdtLbbOwlIw0MpEzJGOXpLkHSQCUyM
 vCyY4Cp/eJRUSOGsoDyEr8wl1PYtbuBw/rJXxABhdjGCwmxoKKBQlHyiX3ARQkl5nWPG
 mpuBLuLMD+KQlFqSekicUzcIsyqnHvQieElXJly6FY0alSqrwQ7Tvthxzczng+MWQtGG
 yH86vJhuOoYFOVahdEtl6zSfo9El5yu1y31EHOseGqEN8lGTn4bMXxMOmfE2vo0iGXVf
 BQFw==
X-Gm-Message-State: AOAM531XokFzp9VfnGguJ2y0+l4I2ki30feg/V1vbDkNepVJDBPdPE2K
 c6M+kIVriOxaqoh4N1itcCjT2MLmp1KCcV/btzcRbg==
X-Google-Smtp-Source: ABdhPJwgiG9dUwIoEm7Sj+zlMS35JcpVxmHtgu9z3PrwSMT5BH8klqYKmUxWpfS1uVNb8n3Ucoqxnj+RMQAlZNVD6Wo=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr1986810oia.163.1593089017154; 
 Thu, 25 Jun 2020 05:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-38-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:43:26 +0100
Message-ID: <CAFEAcA8XbHpi_Pt--4rvAzouLiFXuiGrV+mC4eyQ2PrG32+_6g@mail.gmail.com>
Subject: Re: [PATCH v8 37/45] target/arm: Add mte helpers for sve
 scatter/gather memory ops
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
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
> Because the elements are non-sequential, we cannot eliminate many
> tests straight away like we can for sequential operations.  But
> we often have the PTE details handy, so we can test for Tagged.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

