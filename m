Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2063D39A389
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:42:47 +0200 (CEST)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looYX-0005YD-QA
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1looXj-0004qz-AB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:41:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1looXe-00012p-Bz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:41:54 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t3so7405211edc.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbegFykiL2qgSu2sGn48GYV0OurznEH6Hxx/RKMdFz8=;
 b=qZHHIVi8k9dkAlRNiDNEHd3+7dagYRBSm3r88uqiZlCwlYU0J+/eKPN+5SPsO/F7rg
 ytdhw9Qmq3TsZHYdPJnxGboA7MqzUvaRBFRtbqy0hR/+AD2V3Ml8+aK/eby9mXVWMDsw
 Wp0Dsxj5JRj1iFUZ34DD8XWETTy78+92faAFCyNs8yl+N7JsQ0hY0JDZSbw0TlIEa4f7
 ylIqrHjIfEmBGitND9KOBg/vHAZUvNqxhtpyXGwW6fzPHxSOnlswd3NPr7XT/ct+UuOi
 mvY7oiTcSE4+8E/dw/oscMPUyO5BBIF/jrZs+67Nl+Koaye0aQeUJpKwMS3spJ0rHo/9
 MnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbegFykiL2qgSu2sGn48GYV0OurznEH6Hxx/RKMdFz8=;
 b=hPz9FgElUMlJag/5pW5qyKgI/Zn8j96XStYU1l5wt4PQ4G5b6CJqlxigpFgQu+N9s4
 koc6YEYu46M0H4bDYIzeZg1FKJvnEEJureCqeBaAX0a3e5X+TbPecHt8Ogiev24AbACy
 8jw/07VpSv1UMKw1p7m0m+Tuv2PSnheflfLaOZCVtS7SpwzEC08ZSOCCQuV5N4HIOXkY
 LIfzwl3yFOTwSHObsMjx5GW3XrYDjSrHsAy57svs8gGxUfB0irIOc2uCoLOrMTB7q68G
 IrhdgKZZb9SPQeh11W9NHWLBm4LxWLvFiPi/sbmnZjCfjcgFyZ5GWbwoslH2DuN5axJZ
 Jmhg==
X-Gm-Message-State: AOAM5338uXJym25VuLTcPie1flUyzuxzYN5bYJ2RxujIniITAaX7K/w6
 k3psijjJk7g9PQFTmvbOu9PZPgr7h5zNFexg6AEhSg==
X-Google-Smtp-Source: ABdhPJyYLYUlNw5o9cilKFDMqCAt1+MWncWbs4nVXCPBWTaj9ehRnIgUn16fuzXd1TIr4kmLWqLtwCE1gUB+EINfuPM=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr181432eds.146.1622731308635; 
 Thu, 03 Jun 2021 07:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210603142714.224210-1-pbonzini@redhat.com>
 <20210603142714.224210-2-pbonzini@redhat.com>
In-Reply-To: <20210603142714.224210-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 15:41:15 +0100
Message-ID: <CAFEAcA-93So3_2S=Gvg1n713u6_M34yydWXAPTEBcL3zbRbUrA@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/i386: tcg: fix segment register offsets for
 16-bit TSS
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 3 Jun 2021 at 15:27, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The TSS offsets in the manuals have only 2-byte slots for the
> segment registers.  QEMU incorrectly uses 4-byte slots, so
> that SS overlaps the LDT selector.
>
> Resolves: #382
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

