Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D806885C3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdnO-0002Xs-Ql; Thu, 02 Feb 2023 12:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdnN-0002XW-4T
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:54:49 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdnL-00011E-KC
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:54:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id v23so2667444plo.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mqn3NpZa5tHS+Nc9Z2WDd3scfM2ROaY8zfZ2BoELDSk=;
 b=Lq69CVyHQU/BMy8ppikIrlnQA17NPjJIsUO3yRIpRm/qbe4u1Syi0oHFHH8BkOfE68
 2tFLdbsWIPMOcUkw4/QQumMkOgH3XRXjeNWjWHkmGsDwSZlo90xdAUrbOjWJX2E38in1
 P+B89iHeNIQk2pv4gX7BTWnT3d+dwYwi3yeJkk7w7upXqUBbxL4faNqF6WJAk5RP6qBt
 CucpWoaeyD3m6k6MWoGHnM6W6Pqo9Pwoo75JFuqyRyOfSRZ0Tj6hw0NexUqmIPGZCd5/
 8rWV1tk1HZ8uSkZmT+sF6h4D+JPKuTYWnu3AwWpPVOo0bPKgpmUqt4Y53QXvLCy1gAOh
 jWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mqn3NpZa5tHS+Nc9Z2WDd3scfM2ROaY8zfZ2BoELDSk=;
 b=qdTerRbemNRGM198larUlNls6TGeFyn0MrzMeu0AI3bVbX1j4n4lVpsC9ebagqGvGT
 t61uW6msYi6DcCMa9SMIcIvm5a9vRiKFbp9sTAs5Lq7I4zfSU0HL4T6McONN2smviK+V
 omt1mZoOvDfFcXSpMaqw+DTRCPV+nR+KKFjhiMc4PBkLtTv6AXsA4Z610TP3p8k7n/Z6
 u80Y1ePuSzvpdi/1m+zuZ6apKsskhhxZLKUFDz/OCRc1bh4Mhoy7LNXG0UiwiFflc44R
 Guzo+GkuPRdNpel6ftxqO3GKbFrA3LjIxW0y3lEy4N10iUSVhGLb9gKPVePeIIKTHpNB
 RsQA==
X-Gm-Message-State: AO0yUKX0sBvhY3seQeEkVw+Asdsu053r4k8yhvsps9BD735yuqr1d40c
 BG2H0IQqg1a5j72CGPunY9i4wfyQvuYdY9tBDGg5dA==
X-Google-Smtp-Source: AK7set8+mhqJNx8mu16jgN85xLz9sKjquWoBDm0mmYaFwmp23wR8tgF9S58xyjGdIsXf77I8nmi6/p8oFWzNrMp1Cns=
X-Received: by 2002:a17:903:1c8:b0:196:3b96:6a1a with SMTP id
 e8-20020a17090301c800b001963b966a1amr1804253plh.28.1675360486048; Thu, 02 Feb
 2023 09:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 17:54:34 +0000
Message-ID: <CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0xr5WquR213mBUBg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Series of fixes for PL011 char device
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 23 Jan 2023 at 16:23, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> v4:
> * Fixed post_load hook to be backwards-migratable
> * Refactored some code in 5/5 as per review comments
>
> v3:
> * Introduced a post_load hook for PL011State migration for
>   backwards-compatibility due to some input state fragility.
> * No longer touching irq lines in reset method
> * Minor changes based on review feedback.
>
> v2:
> * Moved FIFO depth refactoring part of FIFO flags change into its own
>   commit.
> * Added a reset method for PL011

Patch 5 in this series breaks "make check" for both the
boot-serial-test and the migration-test (both of which
have some simple code that writes to the serial port).
I suspect in both cases that the guest code is just not
bothering to set the UART control register correctly,
because it's never needed to do so in the past.

(This does make me wonder about the utility of making
this change -- it seems likely that we're going to break
naive bare-metal intended-to-work-on-QEMU code and not
really benefit any real-world runs-on-real-hardware
code, which is presumably just enabling TX and RX and
leaving it that way.)

I've taken patches 1-4 into target-arm.next.

thanks
-- PMM

